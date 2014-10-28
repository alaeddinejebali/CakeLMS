jQuery(document).ready(function(){
	jQuery('#dyntable').dataTable({
		"sPaginationType": "full_numbers",
		"aaSortingFixed": [[0,'asc']],
		"fnDrawCallback": function(oSettings) {
		jQuery.uniform.update();
		}
		});
});