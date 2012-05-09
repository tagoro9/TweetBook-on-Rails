// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	
	$('.dropdown-toggle').dropdown()
	
	$("#micropost_content").on("keyup", function(){
		valor = 140 - $("#micropost_content").val().length
		$("#charactersLeft").html(valor)
		if (($("#micropost_content").val().length) > 140) {
			$("#micropost_submit").attr('disabled','disabled')
			
		}
		else {
			$("#micropost_submit").removeAttr('disabled')
		}
	})
})




