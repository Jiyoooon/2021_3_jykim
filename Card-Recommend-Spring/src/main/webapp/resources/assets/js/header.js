
(function ($) {
  'use strict';

  /* ========================================================================= */
  /*	Page Preloader
  /* ========================================================================= */

  // window.load = function () {
  // 	document.getElementById('preloader').style.display = 'none';
  // }

  $(window).on('load', function () {
    $('#preloader').fadeOut('slow', function () {
      $(this).remove();
    });
  });

})(jQuery);


function checkId(){
  let id = document.loginForm.id.value;
  if(id == ''){
  	$("#id").focus();
  }
  
  if($("#password").val() == ''){
  	$("#password").focus();
  	return false;
  }
  
  /*let auth = $("#auth").val();
  document.loginForm.id.value = auth+'_'+id;*/
  return true;
}

function changeAuth(btn){
	$('#auth')[0].value = btn.name;

	$(".auth-filter button[name=ADMIN]")[0].classList.toggle('clicked');
	$(".auth-filter button[name=USER]")[0].classList.toggle('clicked');
}