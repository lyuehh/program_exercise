'use strict';

angular.module('todoApp').controller('RenRen2', function() {

  var getHtml = function(type, title, content, val) {
    var base = '' +
   ' <div class="template '+ type +'">' +
   ' <div class="title">' + title + '</div>' +
   ' <div class="content">' + content + '</div>' +
   ((type === 'prompt') ?
   ' <div class="form">' +
   '   <input type="text" name="val" value="' + val + '" />' +
   ' </div>' : '') +
   ' <div class="btn">' +
   '   <a href="javascript:;" class="y">确定</a>' +
   ((type !== 'alert') ?
   '   <a href="javascript:;" class="n">取消</a>' : '') +
   ' </div>' +
   '</div>';
    return base;
  };
  var setBg = function() {
    var tpl = '<div class="bg"></div>';
    $('body').append(tpl);
  };
  //setBg();

  var dialog = {};
  dialog.alert = function(t, c) {
    var tpl = getHtml('alert', t, c);
    setBg();
    $('body').append(tpl);

    $('body').on('click', '.y', function() {
      $('.template').remove();
      $('.bg').remove();
    });
    drag($('.template')[0], $('.title')[0]);
  };

  $('.alert').click(function() {
    dialog.alert('标题', '内容');
  });

  dialog.confirm = function(t, c, okFun, celFun) {
    var tpl = getHtml('confirm', t, c);
    setBg();
    $('body').append(tpl);
    $('body').on('click', '.y', function() {
      okFun();
      $('.template').remove();
      $('.bg').remove();
    });
    $('body').on('click', '.n', function() {
      celFun();
      $('.template').remove();
      $('.bg').remove();
    });
    drag($('.template')[0], $('.title')[0]);
  };

  $('.confirm').on('click', function() {
    dialog.confirm('标题','内容', function() {
      alert('你点了确定');
    }, function() {
      alert('你点了取消');
    });
  });

  dialog.prompt = function(t, c, okFun, celFun, val) {
    var tpl = getHtml('prompt', t,c,val);
    setBg();
    $('body').append(tpl);
    $('.y').click(function() {
      var val = $('.template input').val();
      okFun(val);
      $('.template').remove();
      $('.bg').remove();
    });
    $('.n').click(function() {
      var val = $('.template input').val();
      celFun(val);
      $('.template').remove();
      $('.bg').remove();
    });
    drag($('.template')[0], $('.title')[0]);
  };
  $('.prompt').click(function() {
    dialog.prompt('标题','内容', function(val) {
      alert(val);
    },function() {
      alert('取消');
    },'111');
  });

  function drag(dialog, titleBar) {
    var onDrag, pos = {}, dialogbg = $('html')[0];
    console.log(titleBar);
    console.log(dialog);

    titleBar.addEventListener('mousedown', function(e) {
      console.log('offsetLeft: ' + dialog.offsetLeft);
      console.log('offsetTop: ' + dialog.offsetTop);

      console.log('clientLeft: ' + dialog.clientLeft);
      console.log('clientTop: ' + dialog.clientTop);

      console.log('pageX: ' + e.pageX);
      console.log('pageY: ' + e.pageY);
      console.log('');
      pos.left = dialog.offsetLeft;
      pos.top = dialog.offsetTop;
      pos.x  = e.pageX;
      pos.y = e.pageY;
      onDrag = true;
    }, false);

    dialogbg.addEventListener('mousemove', function(e) {
      if(onDrag) {
        dialog.style.left = (pos.left + e.pageX - pos.x) + 'px';
        dialog.style.top = (pos.top + e.pageY - pos.y) + 'px';
      }
    }, false);

    titleBar.onselectstart = function() {
      return false;
    };

    titleBar.onmouseup = function() {
      onDrag = false;
    };

  }
});
