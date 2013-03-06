seajs.config({
    alias: { 
        /* basic */
        'json': 'mm_third/json-1.0.1.js',
		'underscore': 'mm_third/underscore-1.3.3',
        'jquery': 'mm_third/jquery-1.7.2',
        'backbone': 'mm_third/backbone-0.9.2',
        'jqueryui': 'mm_third/jqueryui-1.8.16',
        
        'base_address' : 'mm_mail/base_address',
        'base_folder'  : 'mm_mail/base_folder',
        'base_proxy_mail'   : 'mm_mail/base_proxy_mail',
        'profile': 'mm_mail/base_profile',
        'util': 'mm_mail/base_util.js',
        'cookie':'mm_mail/base_cookie_oplog',
        'flash_upload': 'mm_mail/plu_flash_upload',
        'mail_address_closure': 'mm_mail/plu_mailaddress_closure',
        'send_on_time':'mm_mail/plu_sot',
        'plu_base_address': 'mm_mail/plu_base_address',
        'city_select'  : 'mm_mail/plu_city_select',
        
        /* for biz */
        'biz_template': 'mm_mail/biz_template',
        'biz_main': "mm_mail/biz_main",
        'biz_main_page': 'mm_mail/biz_main_page',
        'biz_mail_write': 'mm_mail/biz_mail_write',
        'biz_mail_list': 'mm_mail/biz_mail_list',
        'biz_mail_read': 'mm_mail/biz_mail_read',
        'biz_config': 'mm_mail/biz_config',
       
        
        /********	added	*******/
        'biz_push_mail': 'mm_mail/biz_push_mail',
		'cloud_ifax'   : 'mm_mail/biz_cloud_ifax',
		'cloud_pushmail'   : 'mm_mail/biz_cloud_pushmail',
		'cloud_edm'   : 'mm_mail/biz_cloud_edm',
		'biz_address'  : 'mm_mail/biz_address',
        'biz_im_chat':'mm_mail/biz_im_chat'
        
        
        /* for free*/
        /*'free_main': 'mm_mail/free_main',
        'free_mail_address': 'mm_mail/free_mail_address',
        'free_mail_write': 'mm_mail/free_mail_write',
        'free_template': 'mm_mail/free_template',*/
    },
    map: [
     //[ /^(.*\/webapp\/js\/(?!main).*\.(?:js))(?:.*)$/i, function(m){ return m.replace(/\.js/g,'') + '.xxx_time_xxx.js'} ]
    ],
    preload: [
      this.JSON ? '': 'json',
      'plugin-debug'
    ],
    mapfile: 'http://127.0.0.1/webapp/js/config.js',
    charset: 'utf-8',//,timeout: 1500 //
    // 线上debug为false,开发时,为true或2
    debug:false
});

define(function(require) {
  window.logError = function(info) {
    function b() {
      var rwebkit = /(webkit)[ \/]([\w.]+)/,
      ropera = /(opera)(?:.*version)?[ \/]([\w.]+)/,
      rmsie = /(msie) ([\w.]+)/,
      rmozilla = /(mozilla)(?:.*? rv:([\w.]+))?/;
      var ua = navigator.userAgent.toLowerCase();
      var match = rwebkit.exec( ua ) ||
        ropera.exec( ua ) ||
        rmsie.exec( ua ) ||
        ua.indexOf("compatible") < 0 && rmozilla.exec( ua ) || [];
      return { browser: match[1] || "", version: match[2] || "0" };
    }
    var url = window.location.href;
    var user = window.App.Global.UID;
    var bname = b().browser;
    var bver = b().version;
    var now = new Date();
    var time = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate() + ' ' + now.getHours() + ':' + ('00' + now.getMinutes()).slice(-2);
    var i = time + "|" + user + "|" + bname + "|" + bver + "|" + url + "|" + info;
    var ii = encodeURIComponent(i);
    console.log(ii);
    var img = new Image();
    var u = 'http://127.0.0.1:3000/log';
    img.src = u + '?info=' + ii;
  };

  if(!seajs.debug) {
    try {
      Profile = require("profile").profile;
      Profile.set( App.Global.PROFILE );
      require("biz_main").bizMain.initialize();
    } catch(e) {
      logError(e.message);
    }
    window.onerror = function(message, url, line) {
      alert(message);
      logError(message + '|' + url + '|' + line);
      return false;
    };
  } else {

    Profile = require("profile").profile;
    Profile.set( App.Global.PROFILE );
    require("biz_main").bizMain.initialize();
  }

});


