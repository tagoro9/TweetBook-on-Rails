// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function scrollTo(element) {
	$('html,body').scrollTop($(element).offset().top -200)
     /*$('html, body').animate({
         scrollTop: $(element).offset().top -200
     }, 500);	*/
}

$(document).ready(function(){
	
	//Activar scripts sobre dropdowns
	$('.dropdown-toggle').dropdown()
	
	$('.publish #micropost_submit').attr('disabled','disabled')
	
	//Contador de caracteres al escribir un tweet (140 maximo)
	$("#postContent > #micropost_content").on("keyup", function(){
		valor = 140 - $(this).val().length
		$("#charactersLeft").html(valor)
		if (($(this).val().length) > 140 || $(this).val().length == 0) {
			$("#micropost_submit").attr('disabled','disabled')
			
		}
		else {
			$("#micropost_submit").removeAttr('disabled')
		}
	})
	
	$("#modalPostContent > textarea").on("keyup", function(){
		valor = 140 - $(this).val().length
		$(".modalActions #modalCharactersLeft").html(valor)
		if (($(this).val().length) > 140 || $(this).val().length == 0) {
			$(this).parent().parent().find('#micropost_submit').attr('disabled','disabled')	
		}
		else {
			$(this).parent().parent().find('#micropost_submit').removeAttr('disabled')
		}
	})
	
	//Cambiar tamaño de textarea de micropost al escribir
	$('#postContent > #micropost_content').focus(function(){
		$(this).css('height','90px')
		$(this).css('min-height','90px')
		$('.actions').show();
	})
	
	$('#postContent > #micropost_content').blur(function(){
		if(($(this).val().length == 0) && (1)) {
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
		$(this).find('textarea').attr('value','@'+data['identity']+ ' ')
		$(this).find('.modal-footer').html(
			'<div class="span1 avatar"><img class="gravatar" src="'+data['image']+'" alt="profileImage"/></div>' +
			'<div class="span4">' +
			'<strong>'+data['name']+'</strong><br/>'+
			data['content'] + 
			"</div>"
		)
		$(this).find('textarea').focus()
	});
	
	$('body').on('click','a.reply',function(e) {
	  e.preventDefault();
	  $('#reply').data('data',{name: $(this).data('name'),content: $(this).data('content'),identity: $(this).data('identity'), image: $(this).data('image') }).modal('show');
	});		
	
	//Modal para escribir nuevo tweet (al pulsar n)
	$(document).bind('keydown','n',function(){
		$('#newTweet').modal('show')
		$('#newTweet textarea').focus()
		setTimeout("$('#newTweet textarea').val('')",10)
	})
	
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
	
	//Navegacion entre los tweets
	$(document).bind('keydown','j',function(){
		activo = $('.post.active')
		//No hay ningun tweet activo
		if (activo['length'] == 0) {
			$('.post:first').addClass('active')
			scrollTo($('.post:first'))
		}
		else {
			siguiente = $(activo).next('.post')
			$(activo).removeClass('active')
			//Si es el ultimo ir a la siguiente pagina
			if (siguiente['length'] == 0) {
				href = $('a[rel="next"]').first().attr('href')
				if (href != undefined) {
					window.location.href = href
				}
				else {
					$(activo).addClass('active')
				}
			}
			else {
				$(activo).next('.post').addClass('active')
				scrollTo($(activo).next('.post'))
			}
		}
	})
	
	$(document).bind('keydown','k',function(){
		activo = $('.post.active')
		//No hay ningun tweet activo
		if (activo['length'] == 0) {
			href = $('a[rel~="prev"]').last().attr('href')
			if (href != undefined) {
				window.location.href = href
			}
		}
		else {
			anterior = $(activo).prev('.post')
			$(activo).removeClass('active')
			//Si es el primero ir a la pagina anterior
			if (anterior['length'] == 0) {
				href = $('a[rel~="prev"]').last().attr('href')
				if (href != undefined) {
					window.location.href = href
				}
				else {
					$(activo).addClass('active')
				}
			}
			else {
				$(activo).prev('.post').addClass('active')
				scrollTo($(activo).prev('.post'))
			}
		}
	})	
	
	//Expandir imagenes
	$('a.imageTweet').bind('click', function(e){
		e.preventDefault();
		if ($(this).is('.active')) {
			$(this).removeClass('active')
			$(this).html("Ver imagen")
			imagen = $(this).parent().parent().parent().find('.imagen')
			$(imagen).css('visibility','hidden')
			$(imagen).hide(150)
		}
		else {
			$(this).addClass('active')
			$(this).html("Ocultar imagen")
			url = $(this).data('url')
			hueco = $(this).parent().parent()
			imagen = $(hueco).next('.imagen')
			if (imagen['length'] == 0) {
				imagen = $('<div>').addClass("imagen").html('<img class="tweetImage" src="'+ url +'" />')
				$(this).parent().parent().after(imagen);
			}
			else {
				//Mostrar imagen
				$(imagen).show()
				$(imagen).css('visibility','visible')
			}
		}
	})
	
	//Expandir videos
	$('a.videoTweet').bind('click',function(e){
		e.preventDefault()
		if ($(this).is('.active')) {
			$(this).removeClass('active')
			$(this).html("Ver vídeo")
			video = $(this).parent().parent().parent().find('.video')
			$(video).css('visibility','hidden')
			$(video).hide(150)
		}
		else {
			$(this).addClass('active')
			$(this).html("Ocultar vídeo")	
			url = $(this).data('url')
			urlVideo = url.match("[\\?&]v=([^&#]*)")[1]
			hueco = $(this).parent().parent()
			video = $(hueco).next('.video')
			if (video['length'] == 0) {
				//Crear video
				video = $('<div>').addClass("video").html('<iframe width="380" height="285" src="http://www.youtube.com/embed/'+urlVideo+'" frameborder="0" allowfullscreen></iframe>')
				$(this).parent().parent().after(video);
			}
			else {
				//Mostrar video
				$(video).show()
				$(video).css('visibility','visible')
				
			}
		}
	})	
	
})




