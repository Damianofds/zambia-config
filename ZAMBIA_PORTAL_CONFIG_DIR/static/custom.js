UNREDD.maxExtent = new OpenLayers.Bounds(-20037508, -20037508, 20037508, 20037508);
UNREDD.restrictedExtent = new OpenLayers.Bounds(-20037508, -20037508, 20037508, 20037508);
UNREDD.maxResolution = 4891.969809375;
UNREDD.mapCenter = new OpenLayers.LonLat(3000000, -1500000);
UNREDD.defaultZoomLevel = 1;

UNREDD.wmsServers = [
	"http://192.168.88.136"
];

/*
       Each function name declared into UNREDD.layerInfo is equal to the related Layer, the js portal code (unredd.js) checks, when a feature of a layer has been clicked, if there is a function into UNREDD.layerInfo with the layer name and, if there is, invoke that function instead of the standard getFeatureInfo.
    */
UNREDD.layerInfo = {

    /**
       The following 5 functions are used to retrieve the stats charts from geostore.
    */
    Provinces_Boundaries: function genericInfoContent(feature) {

	var that = {};
	that.title = function() {
		return "Provinces Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_landcover_stats_" + feature.attributes.col + "_en/data"
        };
	return that;
    },
	
    Country_Boundaries: function genericInfoContent(feature) {

	var that = {};
	that.title = function() {
		return "Country Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_country_stats_1_en/data"
        };
	return that;
    },

    District_boundaries_Zambia: function genericInfoContent(feature) {

	var that = {};
	that.title = function() {
		return "Districts Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_districts_stats_" + feature.attributes.ID_as_FID + "_en/data"
        };
	return that;
    },

    Forest_Reserves: function genericInfoContent(feature) {

	var that = {};
	that.title = function() {
		return "Forest Reserves Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_forestreserves_stats_" + feature.attributes.SITE_CODE + "_en/data"
        };
	return that;
    },

    Nat_Parks_GMAs: function genericInfoContent(feature) {

	var that = {};
	that.title = function() {
		return "Natural Parks Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_natparks_stats_" + feature.attributes.ID_as_FID + "_en/data"
        };
	return that;
    }
}
