// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	
	//Activar scripts sobre dropdowns
	$('.dropdown-toggle').dropdown()
	
	$('.publish #micropost_submit').attr('disabled','disabled')
	
	//Contador de caracteres al escribir un tweet (140 maximo)
	$("#postContent > #micropost_content").on("keyup", function(){
		valor = 140 - $(this).val().length
		$("#charactersLeft").html(valor)
		if (($(this).val().length) > 140) {
			$("#micropost_submit").attr('disabled','disabled')
			
		}
		else {
			$("#micropost_submit").removeAttr('disabled')
		}
	})
	
	//Cambiar tamaño de textarea de micropost al escribir
	$('#postContent > #micropost_content').focus(function(){
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
	
	$('body').on('click','a.delete-confirm',function(e) {
	  e.preventDefault();
	  $('#delete-confirm').data('id', $(this).data('id')).modal('show');
	});	
	
	//Reply to modal
	$('#reply').on('show', function() {
		data = $(this).data('data')
		$(this).find('h3').html($(this).find('h3').html()+data['name'])
		$(this).find('textarea').attr('value',data['name'])
		$(this).find('.modal-footer').html(data['content'])
	});
	
	$('body').on('click','a.reply',function(e) {
	  e.preventDefault();
	  $('#reply').data('data',{name: $(this).data('name'),content: $(this).data('content') }).modal('show');
	});		
	
	//Pills por ajax
	$('.nav-pills a').click(function(e){
		if ($(this).parent().hasClass("active")) {
			e.preventDefault();
		}
		else {
			$(this).parent().addClass("active")
			$(this).parent().siblings(".active").removeClass("active")
		}
	})
})




