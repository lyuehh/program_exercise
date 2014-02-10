a = _.reduce($("tr"), function(memo, v, i) {
    var $el = $(v);
    var obj = {};
    obj.id = $.trim($el.find('.end').text());
    obj.date = $el.find('td').eq(1).text();
    obj.red = $el.find('.STYLE13').html() && $el.find('.STYLE13').html().replace(/&nbsp;/g, ' ');
    obj.blue = $el.find('.STYLE12').text();
    if (obj.id !== '') {
        memo.push(obj);
    }
    return memo;
}, []);
console.log(JSON.stringify(a, null, 2));
