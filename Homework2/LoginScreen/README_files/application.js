// Put your application scripts here


$(function(){ // document ready
  // Sidebar Sticky
  var sidebarEl = $(".markdown-toc");
  if (!!$(sidebarEl).offset()) {
    $(window).scroll(function(){
      var windowTop = $(window).scrollTop() - $(".header").height();
      sidebarEl.css({ top: Math.max(windowTop, 0) }, 600);
    });
  }

  // Smooth Scroll
  $(document).on('click', 'a[href^="#"]', function(e) {
    e.preventDefault();
    SmoothScroll.toTarget(this.hash);
  });

  // Anchor Links
  $(document).on('click', "h2, h3, h4", function(e) {
    var anchor = $(this).find("a");
    if (anchor.length == 0) { return; }
    SmoothScroll.toTarget(anchor.attr("href"));
  });
}); // onready end

// Smooth scrolling
// SmoothScroll.toTarget("some-hash");
SmoothScroll = {
  toTarget : function(target) {
    var scrollOffset = 8;
    var sidebarEl = $(".markdown-toc");
    $target = $(target);
    var currentOffset = $(window).scrollTop();
    var targetOffset = $target.offset().top - scrollOffset;
    if (Math.abs(currentOffset - targetOffset) < 10) { return false; }
    sidebarEl.css("visibility", "hidden"); // hide to avoid glitchy animation
    $('html, body').stop().animate({
        'scrollTop': targetOffset
    }, 900, 'swing', function () {
        window.location.hash = target;
        sidebarEl.css("visibility", "visible"); // show toc again
    });
  }
}