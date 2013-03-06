var page = require('webpage').create();
page.open('http://mail.sohu.net', function () {
    page.render('mail.sohu.net.png');
    phantom.exit();
});
