var page = require('webpage').create();
page.open('http://github.com', function() {
  page.render('github.com.png');
  phantom.exit();
});
