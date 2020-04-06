(function($) {
  function equalHeights (minHeight, maxHeight) {
    tallest = (minHeight) ? minHeight : 0;
    this
    .height('auto')
    .each(function() {
      if($(this).height() > tallest) {
        tallest = $(this).height();
      }
    });
    if((maxHeight) && tallest > maxHeight) tallest = maxHeight;
    return this.each(function() {
      $(this).height(tallest).css("overflow","auto");
    });
  }
  $.fn.equalHeights = function(minHeight, maxHeight) {
    var $this = this;
    $(window).resize(function(){
      equalHeights.call($this, minHeight, maxHeight);
    });
    equalHeights.call($this, minHeight, maxHeight);
    return this;
  };
})(jQuery);

function GetHeight2() {
  var hh2 = $('.home-header').height();
  var total = $(window).height();
  var height2 = parseInt(total - hh2)
  $('.set-scroll').css('height', height2 - 260 + 'px');
}

function GetHeight3() {
  var hh3 = $('.common-header').height();
  var total3 = $('body').height();
  var height3 = parseInt(total3 - hh3)
  $('.appointment-view').css('min-height', height3 - 140 + 'px');
}

function GetHeight4() {
  var hh4 = $('.common-header').height();
  var hhh4 = $('.at-tabs-bnts').height();
  var total4 = $('body').height();
  var height4 = parseInt(total4 - hh4 - hhh4)
  $('#appointmentTabContent').css('min-height', height4 - 240 + 'px');
}

(function($){
  $(window).on("load",function(){
    $(".content").mCustomScrollbar();
  });
})(jQuery);

$(document).ready(function() {

  $(".min-arrow").click( function() {
    if ($("#dashboard").hasClass("sidebar-off")) {
      $("#dashboard").removeClass("sidebar-off");
      $("#dashboard").addClass("  sidebar-on");
    } else {
      $("#dashboard").addClass("sidebar-off");
      $("#dashboard").removeClass("sidebar-on");
    }
  });

  $(".hamburger").click( function() {
    if ($("#dashboard").hasClass("mobilebar-on")) {
      $("#dashboard").removeClass("mobilebar-on");
      $("#dashboard").addClass("  mobilebar-off");
    } else {
      $("#dashboard").addClass("mobilebar-on");
      $("#dashboard").removeClass("mobilebar-off");
    }
  });

  $('.appointments-card').equalHeights();

  GetHeight2();

  GetHeight3();

  GetHeight4();

  var url = window.location;
  $('.sidebar-nav li[href="' + url + '"]').parent().addClass('active');
  $('.sidebar-nav li a').filter(function() {
    return this.href == url;
  }).parent().addClass('active');
});


$(window).resize( function() {
  $('.appointments-card').equalHeights();

  GetHeight2();
});
