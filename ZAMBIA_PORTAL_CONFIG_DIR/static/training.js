
jQuery(document).ready(function() {
alert("<a id=\"training\" href=\"#inline1\" title=\"it works!\">yo!</a>");

function formatTitle(title, currentArray, currentIndex, currentOpts) {
    return '<div id="tip7-title"><span><a href="javascript:;" onclick="$.fancybox.close();"><img src="/data/closelabel.gif" /></a></span>' + (title && title.length ? '<b>' + title + '</b>' : '' ) + 'Image ' + (currentIndex + 1) + ' of ' + currentArray.length + '</div>';
}

$("#training").fancybox({
	'showCloseButton'	: false,
	'titlePosition' 		: 'inside',
	'titleFormat'		: formatTitle,
	'width':5
});

setTimeout($("#training").trigger('click'),8000);
    
});
