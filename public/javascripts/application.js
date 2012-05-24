// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	
	//Activar scripts sobre dropdowns
	$('.dropdown-toggle').dropdown()
	
	//Contador de caracteres al escribir un tweet (140 maximo)
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
	
	//Cambiar tamaño de textarea de micropost al escribir
	$('#micropost_content').focus(function(){
		$(this).css('height','90px')
		$(this).css('min-height','90px')
		$('.actions').show();
	})
	
	$('#micropost_content').blur(function(){
		if($(this).val().length == 0) {
			$(this).css('height','20px')
			$(this).css('min-height','20px')
			$('.actions').hide();			
		}
	})
	
	// Delete confirmation modals
	$('#delete-confirm').on('show', function() {
	  var $submit = $(this).find('.btn-danger'),
	      href = $submit.attr('href');
	  $submit.attr('href', href.replace('id', $(this).data('id')));
	});
	
	$('a.delete-confirm').click(function(e) {
	  e.preventDefault();
	  $('#delete-confirm').data('id', $(this).data('id')).modal('show');
	  //$('#delete-confirm').modal('show');
	});	
	
})




