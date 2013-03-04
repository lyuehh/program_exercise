(function($) {

  $.fn.extend({
    name: function(options) {
      this.defaults = {};
      var setting = $.extend({}, this.defaults, options);
      return this.each(function() {
        var $this = $(this);
      });
    }
  });
})(jQuery);
