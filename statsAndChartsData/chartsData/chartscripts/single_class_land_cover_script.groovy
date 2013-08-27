import groovy.text.SimpleTemplateEngine
import java.util.Map
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.io.IOUtils
import it.geosolutions.unredd.geostore.model.UNREDDStatsData
import it.geosolutions.unredd.geostore.model.UNREDDChartData
import it.geosolutions.unredd.geostore.UNREDDGeostoreManager
import it.geosolutions.geostore.services.rest.model.RESTResource
import it.geosolutions.geostore.services.rest.GeoStoreClient
import it.geosolutions.geostore.services.rest.model.RESTStoredData
import it.geosolutions.geostore.core.model.Resource
import it.geosolutions.geostore.core.model.Attribute


log = LoggerFactory.getLogger("land_usage.groovy");

/**
 *   The path of the HTML template that the script uses for generate the final HTML charts
 */
htmlTemplateFilePath = '/home/geosolutions/Desktop/ZambiaPrototype/nfms-zambia-config/statsAndChartsData/chartsData/chartscripts/single_class_land_cover_chart_template.html'

/**
 *   The file used to store the localization.
 */
langFilePath         = '/home/geosolutions/Desktop/ZambiaPrototype/nfms-zambia-config/statsAndChartsData/chartsData/chartscripts/lang.csv'

/**
 *   Separator used in the csv data stored as stat resource into geostore
 */
csvSeparator = ';'

/**
 *   Attribute name for the script resources in geostore
 */
geostoreScriptName = "landcover_deforestation_scripts";

/**
 *  The resolution of a pixel in Hectares
 */
pixelResolutionHA = 0.09

/**
 *   the key in localization file to obtain the class name localized
 */
className = "forest"

/**
 * This method is the entry point for the land_usage script (it is called by the GB scripting action) and implements the main loop of charts generation.
 * It depends to all the other methods in this file and to UNREDDGeostoreManager class and the related UNREDDGeostoreModel classes.
 *
 * Basically it takes as input the connection parameters for a geostore instances and the name of the statsData resource that hold the values computed by the stats engine.
 * Once the values are retrieved from geostore they are placed into a html template page that uses a js charts library to draw the chart.
 * Note that will be N different list of the same value where n is the number of different polygon that made the classification layer (f.e. provinnces or natural parks)
 *
 * The process is repeated for all M language stored in the lang.csv file
 * The type of the chart (pie, histogram...) is defined into that template.
 * The final html page will be stored into geostore as blob data, replacing the old one.
 *
 * Once the script is terminated will be stored N*M different chartData resources.
 *
 * This script has been developed to generate land usages charts during time, so it expects to find into the geostore stat reosource
 * a list of [year;value] that represents the number of pixels counted by the stat engine that represent a land cover class (forest, waterland ecc...)
 *
 * In this script are hardcoded the class name of the pixel and the value of the area (in ha) that the pixel represents.
 * This information are important to the chart generation because are useful to display a descriptive title/legend and for translate the pixel number into ha (that multiplication is made in html template)
 *
 * TODO: externalize the class name and the pixel size as chartDef attributes in the geostore resources
 *
 * @param argsMap
 * @return
 */
def execute(Map argsMap)
{
    log.info "Starting land usage chart script..."

    GeoStoreClient client = createGeoStore(argsMap)
    UNREDDGeostoreManager manager = new UNREDDGeostoreManager(client)

    chartScriptName = argsMap.get("configuration").getProperties().get("chartscript_name")
    log.info ("Chart script name " + chartScriptName)

    // Load forest change forest data
    forestData = importData(manager, chartScriptName, true)
    log.info("forestData: " + forestData)

    // Load localized data
    loc = loadLangData(langFilePath)

    def engine = new SimpleTemplateEngine()
    def htmlTemplate = engine.createTemplate(new File(htmlTemplateFilePath));

    def lastYear  = null;
    def firstYear = null;

    deletePreviousChartData(client, chartScriptName);

    // Iterate through the languages
    loc.each { langKey, loc ->
        // Create one HTML per row in the land usage stats data
        forestData.each() { featureId, row ->
            try {
                def years = row.keySet();

                if (lastYear  == null) lastYear  = years.max()
                if (firstYear == null) firstYear = years.min()

                def binding = ['loc': loc, 'forest': row, 'lastYear': lastYear, 'firstYear': firstYear, 'pixelResolutionHA': pixelResolutionHA]

                html = htmlTemplate.make(binding)

                // Save in GeoStore
                def resourceName = chartScriptName + "_" + featureId + "_" + langKey

                log.debug("forest    -> " + row)
                log.debug("loc       -> " + loc)
                log.debug("lastyear  -> " + lastYear)
                log.debug("firstyear -> " + firstYear)

                id = saveOnGeoStore(client, featureId, resourceName, html.toString(), geostoreScriptName, false, langKey, "html")
                log.info "GeoStore resource saved: Resource Name = " + resourceName + " - ID = " + id
            } catch (Exception e) {
                log.info("Problem encountered in creating chart for featureId = " + featureId)
                e.printStackTrace();
            }
        }
    }

    return ["return": []]
}

def loadLangData(langFilePath)
{
    langFile = new File(langFilePath)
    lines = langFile.readLines()
    headerLine = lines.head().split("\t")
    languages = headerLine.tail() // remove first column from first line (it's not a language code nor a label id)

    // fill the loc hash map
    loc = [:]
    lines = lines.tail()
    lines.each { row ->
        splitRow = row.split("\t")
        key = splitRow.head()
        splitRow = splitRow.tail()
        splitRow.eachWithIndex { column, i ->
            values = loc[languages[i]]
            if (values == null) {
                loc[languages[i]] = [:]
                loc[languages[i]][key] = column
            } else {
                values[key] = column //.strip()
            }
        }
    }

    return loc
}

def deletePreviousChartData(client, chartScriptName) {
    log.info("deleting old chart script resources...")
    UNREDDGeostoreManager manager = new UNREDDGeostoreManager(client)

    log.info("search all old data...")

    // Search all chart data for the given chart script
    List data = manager.searchChartDataByChartScript(chartScriptName)

    // Delete the chart data found
    for (chartData in data)
    {
        log.info("data -> " + chartData.getId())
        def id = chartData.getId();
        log.info("Resource deleted - id = " + id)

        client.deleteResource(id);
    }
}

def saveOnGeoStore(client, featureId, name, html, chartScriptName, published, language, format)
{
    // Create the UNREDDChartData object and fill the atributes
    unreddChartData = new UNREDDChartData()
    unreddChartData.setAttribute(UNREDDChartData.Attributes.CHARTSCRIPT, chartScriptName)
    unreddChartData.setAttribute(UNREDDChartData.Attributes.PUBLISHED, published ? "true" : "false")
    unreddChartData.setAttribute(UNREDDChartData.Attributes.FEATUREID, featureId + "")
    RESTResource chartDataRestResource = unreddChartData.createRESTResource()
    chartDataRestResource.setName(name)
    // Set the data to be stored
    RESTStoredData rsd = new RESTStoredData()
    rsd.setData(html)
    chartDataRestResource.setStore(rsd)
    // Insert in GeoStore
    int id = client.insert(chartDataRestResource)
    log.info("charts for feature id " + featureId + " inserted succesfully!")
    return id
}

// Loads the stats data from GeoStore
def importData(manager, dataId, forest)
{
    List resources = manager.searchStatsDataByStatsDef2('landcover_stats'); // dataId)
    Map output = new HashMap()

    for (Resource resource : resources)
    {
        data = resource.getData()
        int year  = (Float.parseFloat(getAttribute(resource.getAttribute(), UNREDDStatsData.Attributes.YEAR).getValue())).trunc()
        def lines = parseTable(data.getData(), forest)
        lines.each { id, line ->
            temp = output[id]
            if (temp == null) {
                output[id] = new TreeMap()
                output[id][year] = line
            } else {
                temp[year] = line
            }
        }
    }
    return output
}

// Parses a CSV table - returns a HashMap where the key is the polygon ID (first column in the CSV)
// and the value is the full parsed row (stored as an array)
def parseTable(table, forest)
{
    HashMap lines = new HashMap()

    table.eachLine { line ->
        parsedArr = []
        arr = line.tokenize(csvSeparator)

        polygonId = Integer.parseInt(arr[0])
        // Values for each administrative regions are split in two rows (forest and non-forest) - join them together again
        for (i in 1..<arr.size) // first element in array is the polygon id, don't need it
        {
            parsedArr[i - 1] = Double.parseDouble(arr[i])
        }
        lines.put(polygonId, parsedArr)
    }
    log.debug("lines" + lines)
    return lines
}

def getAttribute(List attributeList, attribute)
{
    for (Attribute attr : attributeList) {
        if (attr.getName().equals(attribute.getName())) {
            return attr
        }
    }

    return null
}

def saveAsFile(html, outputFilePath)
{
    log.info("Saving output to file: " + outputFilePath);
    out = new File(outputFilePath)
    out.write(html.toString(), "UTF-8")
}

GeoStoreClient createGeoStore(Map argsMap) {
    Map props = argsMap.get("configuration").getProperties();

    log.info("geostore url: " + props.get("geostore_url"));

    String gurl  = props.get("geostore_url");
    String guser = props.get("geostore_username");
    String gpw   = props.get("geostore_password");

    GeoStoreClient client = new GeoStoreClient();
    client.setGeostoreRestUrl(gurl);
    client.setUsername(guser);
    client.setPassword(gpw);
    return client;
}
