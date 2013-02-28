jQuery.ajaxSetup({
  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$(document).ready(function(){

	$('#make_id').change(function(){
		var makeId = $('#make_id :selected').attr('value');
		$.ajax({
			type: "POST",
			url: "http://"+location.host+"/get_model_data/"+makeId,
			data: makeId,
		});
	});		

	


});