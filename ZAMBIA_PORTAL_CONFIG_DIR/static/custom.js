UNREDD.maxExtent = new OpenLayers.Bounds(-20037508, -20037508, 20037508, 20037508);
UNREDD.restrictedExtent = new OpenLayers.Bounds(-20037508, -20037508, 20037508, 20037508);
UNREDD.maxResolution = 4891.969809375;
UNREDD.mapCenter = new OpenLayers.LonLat(3000000, -1500000);
UNREDD.defaultZoomLevel = 1;

UNREDD.wmsServers = [
	"http://192.168.88.136"
];

UNREDD.layerInfo = {

    Provinces_Boundaries: function genericInfoContent(feature) {
	//var ret = "<div><img src='/portal/static/img/charts.png' /></div>";

	var that = {};
	that.title = function() {
		return "Provinces Stats";
	};
	
	that.statsLink = function() {
            return "/geostore/rest/misc/category/name/ChartData/resource/name/landcover_deforestation_scripts_" + feature.attributes.col + "_en/data"
        };
	return that;
    }
}
