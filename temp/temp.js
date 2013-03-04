if(_.isArray(ret)) { // 批量操作的结果的返回是个数组
  var results = _.pluck(ret, 'result');
  if(_.all(results, function(r) {
    return r === 0;
  })) {
    Cookie.set('info','删除群组成功');
    window.location = url;
  } else {
    warnTip.show(Util.getAjaxErrorMuti(ret));
  }
} else {
  if(ret.result === 0) {
    Cookie.set('info','删除群组成功');
    window.location = url;
  }
}

var getResultFromMuti = function(ret, succ, err) {
  if(_.isArray(ret)) { // 批量操作的结果的返回是个数组
    var results = _.pluck(ret, 'result');
    if(_.all(results, function(r) {
      return r === 0;
    })) {
      succ();
    } else {
      warnTip.show(Util.getAjaxErrorMuti(ret));
    }
  } else {
    if(ret.result === 0) {
      succ();
    }
  }
};

var a = b = 1;
