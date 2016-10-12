$(function() {
  $("form[validate]").validate({
    errorElement: "span",
    success: function($label) {
      $label.addClass("valid").text(" ");
    },
    onfocusout: function (element) {
      $(element).valid();
    }
  });
  $(document).on("ajax:success", 'a[data-remote],input[data-remote]', function (e, data) {
    var $this = $(this);
    if (data.success) {
      var text = data.message || "操作成功";
      noty({type: "success", text: text});
      var redirect = $this.attr("data-redirect");
      if (redirect) {
        setTimeout(function() {
          window.location.href = redirect;
        }, 2000);
      }
    } else {
      noty({type: "error", text: data.message});
    }
  });

  /* ---------- Uniform ---------- */
  $("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();

  /* ---------- Add class .active to current link  ---------- */
  $('#sidebar-left ul.main-menu li a').each(function() {
    var url = window.location.href;
    if ($(this).hasClass('submenu')) {
      if (url.indexOf($($(this))[0].href) === 0) {
        $(this).closest("ul").closest("li").addClass('active');
      }
    } else {
      if (url.indexOf($($(this))[0].href) === 0) {
        $(this).closest("li").addClass('active');
      }
    }
  });

  /* ---------- Submenu  ---------- */
  $('.dropmenu').click(function(e){
    e.preventDefault();
    $(this).parent().find('ul').slideToggle();
  });
});


//sidebar
$(function() {
  var path = window.location.pathname;
  var $matchedLink = null;

  $(".sidebar-nav .nav > li a").each(function() {
    var $a = $(this);
    var href = $a.attr("href");
    if (path.indexOf(href) == 0) {
      if ($matchedLink && $matchedLink.attr("href").length >= href.length) {
        return;
      }
      $matchedLink = $a;
    }
  });

  if ($matchedLink) {
    $(".sidebar-nav .nav > li").removeClass("active");
    $matchedLink.closest("li").addClass("active");
  }
});