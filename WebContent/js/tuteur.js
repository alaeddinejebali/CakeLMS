jQuery(document).ready(function(){
	jQuery("#btnShowRessources_tous").click(function(){
		jQuery( "#btnShowRessources_text" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_audio" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_video" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_tous" ).addClass('tuteurRessourcesFilter_active');
		jQuery( ".row_ressource" ).fadeIn(600);
	});
	jQuery("#btnShowRessources_text").click(function(){
		jQuery( "#btnShowRessources_text" ).addClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_audio" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_video" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_tous" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( ".row_ressource" ).hide();
		jQuery( ".type_text" ).fadeIn(600);
	});
	jQuery("#btnShowRessources_audio").click(function(){
		jQuery( "#btnShowRessources_text" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_audio" ).addClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_video" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_tous" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( ".row_ressource" ).hide();
		jQuery( ".type_audio" ).fadeIn(600);
	});
	jQuery("#btnShowRessources_video").click(function(){
		jQuery( "#btnShowRessources_text" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_audio" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_video" ).addClass('tuteurRessourcesFilter_active');
		jQuery( "#btnShowRessources_tous" ).removeClass('tuteurRessourcesFilter_active');
		jQuery( ".row_ressource" ).hide();
		jQuery( ".type_video" ).fadeIn(600);
	});
});