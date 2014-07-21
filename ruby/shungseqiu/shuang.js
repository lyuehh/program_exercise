a = _.reduce($("tr"), function(memo, v, i) {
    var $el = $(v);
    var str = "";

    var obj = {};
    obj.id = $.trim($el.find('.end').text());
    obj.date = $el.find('td').eq(1).text();
    obj.red = $el.find('.STYLE13').html() && $el.find('.STYLE13').html().replace(/&nbsp;/g, ' ');
    obj.blue = $el.find('.STYLE12').text();
    if (obj.id !== '') {
        // memo.push(obj);
    }
    obj.red || (obj.red = "");
    var r = obj.red && obj.red.split(' ');
    var r1 = r[0];
    var r2 = r[1];
    var r3 = r[2];
    var r4 = r[3];
    var r5 = r[4];
    var r6 = r[5];

    if (obj.id) {

        str = obj.id + ',' + obj.date + ',' + r1 +
        ',' + r2 + ',' + r3 + ',' + r4 + ',' + r5 + ',' + r6 + ',' + obj.blue + '\n';
    }

    memo  = memo + str;
    return memo;
}, "");

'id,date,red1,red2,red3,red4,red5,red6,blue1' + '\n' + a
