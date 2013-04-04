$.selectbox = function(options) {
  var defaults = {
    el: 'body',
    all_selecter: '.checkbox_all',
    target_el: 'input',
    btn: {
      "1": [],
      "n": []
    },
    disabled_class: 'disabled'
  };
  var setting = $.extend({}, defaults, options);
};

$.selectbox({
  el: ''
});
