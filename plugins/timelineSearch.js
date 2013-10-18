(function( $ ) {
function installSearch(){
	window.addTimelineSearch = function( timeline ) {
			Ssearchbox = $('<div class="timeline-search" style="width:220px;position:relative;"><span class="ui-icon-search ui-icon" style="position:absolute; left:5px; top:5px;"></span><input title="Search" style="padding-left:15px;width:215px;" /></div>');
			Ssearchbox.css('float', VMM.Language.right_to_left? 'left' : 'right');
			if (VMM.Language.right_to_left) {
				Ssearchbox.css('direction', 'rtl');
			}
			Ssearchbox.find('input').autocomplete({
				source: function( request, response ) {
						var results = [];
						$.each(timeline.getDates(), function(i,date){
							if (date.title.indexOf(request.term) == 0) {
								results.push({ value:date.title, slideId:i });
							}
						});
						response(results);
					},
				minLength: 0,
				select: function( event, ui ) {
					timeline.goToEvent(ui.item.slideId);
					return false;
				}
			});
			$(timeline.getTimelineID()).before(Ssearchbox);
	};
}
//load jquery-ui in case it wasn't loaded
if (!($.ui)) {
	$.getScript( 'http://code.jquery.com/ui/1.10.3/jquery-ui.js' ).done( installSearch );
	$( 'head' ).append( $( '<link rel="stylesheet" type="text/css" />' ).attr( 'href', 'http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css' ) );
} else {
	installSearch();
}
	
}( jQuery ));
