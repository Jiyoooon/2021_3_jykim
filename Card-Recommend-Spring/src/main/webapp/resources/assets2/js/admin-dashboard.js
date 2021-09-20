

(function ($) {
  'use strict';

  /* ========================================================================= */
  /*	Page Preloader
  /* ========================================================================= */

  // window.load = function () {
  // 	document.getElementById('preloader').style.display = 'none';
  // }
	
})(jQuery);

/*function headerNavActive(e, nextPage){
  //$(".header-nav .nav-item.active").removeClass("active")
  $(".header-nav .nav-item.active")[0].classList.toggle("active")
  //$(e.parentElement).addClass("active");
  
  location.href = nextPage; 	
}*/


function changeDashboard(pageId, idx){
  $('.dashboard-child').each(function(idx, e){
  	console.log(e);
  	e.style.display = 'none';
  });
  
  $(".sidenav .nav-link.active").removeClass("active");
  $($(".sidenav .nav-link")[idx]).addClass("active");
 
  let page = $('#'+pageId).show();
}
