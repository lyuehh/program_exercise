$(function() {
  var $btn = $('.btn');
  var $modal = $('<div>弹出来啦~~~</div>')
  .attr('id', 'modal')
  .css({
    background: '#fff',
    zIndex: 3000,
    padding: '10px',
    width: '640px',
    height: '240px',
    margin: '0 auto',
    opacity: 1,
    position: 'absolute',
    top: '10%',
    left: '10%'
  });
  $('.btn').click(function(evt) {
    evt.preventDefault();
    $(this).overlay({
      effect: 'fade',
      opacity: 0.8,
      closeOnClick: true,
      onShow: function() {
        $('body').append($modal);
      },
      onHide: function() {
        $modal.remove();
      },
    });
  });
});
