$.fn.feditor = function(opts){
        var self =  this;
        var ie = $.browser.msie;
        var options = {
              id:'',
              name:'',
              pluginid:'',
              toolbar: null,  // 编辑器工具栏
              layers: {                  // 编辑器中工具栏对象
                fontname: null,
                fontsize: null,
                forecolor: null,
                backcolor: null,
                face: null
              },
              tools:[
                "fontname","fontsize","forecolor","backcolor","insertlink","insertimage","insertface"
              ],
              domain            : App.Global.LOCAL_DOMAIN,
              htmlEditor        :null,
              iframeDoc         :null,
              loadAfterDo       :function(){

              }
        };
        options = $.extend(options,opts);
        var   id = options.id;
        var   pluginid = options.pluginid;
        var   setDomain         = options.domain ? 'document.domain=\'' + options.domain + '\';' : '';
        var   iframeStyle       ='height:100%;width:100%;border:0px;margin:0px;padding:0px;background-color:#FFFFFF';
        var   iframeHTMLStyle   = 'body{background-color:#fff;font-size:13px;font-family:宋体;padding:3px auto auto 5px;height:100%;line-height:2;cursor:text;}table{margin:0px;}table td{vertical-align:top;font-size:13px;}pre {white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;}p{margin:0px;}';
    
        //var icibaScript = _.include( options.tools,'iciba') ? '<script type=text/javascript charset=utf-8 src=http://open.iciba.com/huaci-sohu/ICB_HUACI_COM.js></script>':''; 
    var icibaScript = '';//pause remove
    var  iframeSrc          ='javascript:document.open();'+  setDomain + 'document.write(\'<html><head><style>' +  iframeHTMLStyle +'<\/style><\/head><body><\/body><\/html>\');document.close();';
        var editorIframe = '<iframe tabindex="5" id="' + id + '" style="'+ iframeStyle +'" frameborder=0 src="' + iframeSrc + '" name="' + id + '"></iframe>';
        this.init = function() {
            // 初始化编辑器的iframe
            $( self ).each(function(index,item){
                $(this).html( editorIframe );
                options.htmlEditor = this.firstChild;
                if( options.htmlEditor ){
                    $( options.htmlEditor ).load( self.ifronload );   
                    if( $.browser.webkit ){
                        setTimeout(function(){
                            self.ifronload();
                        },160);
                    }
                }
            }); 
        };
        this.ifronload =  function(event){ 
            // iframe载入完成之后将其设置为可编辑状态
            var win = options.htmlEditor.contentWindow;
            var doc = options.iframeDoc = win.document;
            if (ie){
                try{  
                    doc.body.contentEditable = true; 
                } catch(e){}
            } else{
                try{
                    //doc.designMode = 'on';
                    doc.body.contentEditable = true;
                    doc.execCommand('useCSS', false, false);
                    if( document.queryCommandEnabled('enableObjectResizing') ) {
                        document.execCommand('enableObjectResizing', false, 'false');
                    }
                } catch(e){}
                typeof win.ICIBA_KG !== 'undefined' && win.ICIBA_KG.turnOff();
            } 
      options.loadAfterDo(event); 
    };
        this.format =  function(type, para){ 
            var ifrd = options.iframeDoc;
            try{
            ! para ? (ie ? ifrd.execCommand(type) : ifrd.execCommand(type, false, false)) : ifrd.execCommand(type, false, para);
            }catch(e){}
        };
        this.hideLayers =  function() {
             // 注册控制层隐藏的事件
            var body = options.iframeDoc.body;
            var that = this;
            var hd = function(event) {
                  for(var p in options.layers){
                    $(options.layers[p]).hide();
                  }
                };
            $( document.body ).bind('click', hd);
            $( body ).bind('click', hd);
        };
        this.createOrderList =  function() {
            // 创建显示字体风格的层
            var body = options.iframeDoc.body;
            var that = this;
            if(!options.layers.orderList) {
                var div = document.createElement('div');
                div.style.cssText = 'position:absolute;z-index:100009;width:160px;height:70px;overflow-x:hidden;overflow-y:auto;background-color:white;top:30px;left:305px;display:none;';
                var orderList = [ 
                    {
                        name : App.I18n['mm_mailWrite']['numbered_list'],
                        action:'insertOrderedList'
                    },
                    {
                        name : App.I18n['mm_mailWrite']['bulleted_list'],
                        action:'insertUnorderedList'
                    } 
                ]
                var htmlArr = [];
                htmlArr.push( '<ul class="operate_bar_slist">');
                $.each( orderList, function(index, item) {
                    htmlArr.push('<li unselectable=on onmouseover="this.style.borderBottom=\'1px solid #E5E5E5\';this.style.borderTop=\'1px solid #E5E5E5\';" onmouseout="this.style.border=\'\';" onclick="' + pluginid + '.format(\'' + item.action + '\');return false;">' + item.name + '</li>');
                });
                htmlArr.push( '</ul>' );
                div.innerHTML = htmlArr.join('');
                options.$toolbar.append( $( div ) );
                options.layers.orderList = div;
                self.hideLayers();
            }
            $( options.layers.orderList ).show();
          };
          this.createTextAlign =  function() {
            // 创建显示字体风格的层
            var body = options.iframeDoc.body;
            var that = this;
            if(!options.layers.textAlign) {
                var div = document.createElement('div');
                div.style.cssText = 'position:absolute;z-index:100009;width:160px;height:auto;overflow-x:hidden;overflow-y:auto;background-color:white;top:30px;left:271px;display:none;';
                var alignList = [ 
                    {
                        name : App.I18n['mm_mailWrite']['align_left'],
                        action:'justifyLeft'
                    },
                    {
                        name : App.I18n['mm_mailWrite']['align_center'],
                        action:'justifyCenter'
                    },
                    {
                        name : App.I18n['mm_mailWrite']['align_right'],
                        action:'justifyRight'
                    } 
                ]
                var htmlArr = [];
                htmlArr.push( '<ul class="operate_bar_dlist">');
                $.each( alignList, function(index, item) {
                    htmlArr.push('<li unselectable=on onmouseover="this.style.borderBottom=\'1px solid #E5E5E5\';this.style.borderTop=\'1px solid #E5E5E5\';" onmouseout="this.style.border=\'\';" onclick="' + pluginid + '.format(\'' + item.action + '\');return false;">' + item.name + '</li>');
                });
                htmlArr.push( '</ul>' );
                div.innerHTML = htmlArr.join('');
                options.$toolbar.append( $( div ) );
                options.layers.textAlign = div;
                self.hideLayers();
            }
            $( options.layers.textAlign ).show();
          };
        this.createFontName =  function() {
            // 创建显示字体风格的层
            var body = options.iframeDoc.body;
            var that = this;
            if(!options.layers.fontname) {
                var div = document.createElement('div');
                div.style.cssText = 'position:absolute;z-index:100009;width:162px;height:240px;overflow-x:hidden;overflow-y:auto;background-color:white;top:30px;left:36px;display:none;';
                var fontface = ['宋体', '黑体', '楷体, 楷体_GB2312', '幼圆', 'Arial', 'Arial Black', 'Verdana', 'Times New Roman'];
                var htmlArr = [];
                htmlArr.push( '<ul class="operate_bar_fm">');
                $.each(fontface, function(index, item) {
                    htmlArr.push('<li unselectable=on onmouseover="this.style.backgroundColor=\'#E5E5E5\';" onmouseout="this.style.backgroundColor=\'\';" onclick="' + pluginid + '.format(\'fontname\', \''+ item +'\');return false;" style="font-family:' + item + ';">' + item.split(',')[0] + '</li>');
                });
                htmlArr.push( '</ul>' );
                div.innerHTML = htmlArr.join('');
                options.$toolbar.append( $( div ) );
                options.layers.fontname = div;
                self.hideLayers();
            }
            $( options.layers.fontname ).show();
          };
         // 创建显示字体大小的层
        this.createFontSize =  function() {
            if(!options.layers.fontsize) {
              var div = document.createElement('div');
              div.style.cssText = 'position:absolute;z-index:100008;width:160px;height:auto;background-color:white;top:30px;left:69px;display:none;';
              var fontsize = [{
                  name: '极小',
                  size: '9px', //8pt
                  font: 1
                }, {
                  name: '较小',
                  size: '12px',//10pt
                  font: 2
                }, {
                  name: '小',
                  size: '16px',//12pt
                  font: 3
                }, {
                  name: '中',
                  size: '18px',//14pt
                  font: 4
                }, {
                  name: '大',
                  size: '24px',//18pt
                  font: 5
                }, {
                  name: '较大',
                  size: '32px',//24pt
                  font: 6
                }, {
                  name: '极大',
                  size: '48px',//36pt
                  font: 7
                }
              ];
                var htmlArr = [];
                htmlArr.push('<ul class="operate_bar_fz">');
                $.each(fontsize, function(index, item) {
                    htmlArr.push('<li unselectable=on onmouseover="this.style.backgroundColor=\'#E5E5E5\';" onmouseout="this.style.backgroundColor=\'\';" onclick="' + pluginid + '.format(\'fontsize\', \''+ item.font +'\');return false;" style="font-size:'+ item.size +';">' + item.size + '</span>');
                });
                htmlArr.push('</li>');
                div.innerHTML = htmlArr.join('');
                options.$toolbar.append( $( div ) );
                options.layers.fontsize = div;
                self.hideLayers();
            }
            $(options.layers.fontsize).show();
      };
      this.createColor =  function( pos, format) {
        try {
          var div = document.createElement('div');
          div.style.cssText = 'position:absolute;z-index:100010;width:auto;height:auto;background-color:white;top:'+ pos.top +';left:'+ pos.left +';display:none;';
          var color = [['#000000', '#993300', '#333300', '#003300', '#003366', '#000080', '#333399', '#333333'], ['#800000', '#FF6600', '#808000', '#008000', '#008080', '#0000FF', '#666699', '#808080'], ['#FF0000', '#FF9900', '#99CC00', '#339966', '#33CCCC', '#3366FF', '#800080', '#999999'], ['#FF00FF', '#FFCC00', '#FFFF00', '#00FF00', '#00FFFF', '#00CCFF', '#993366', '#C0C0C0'], ['#FF99CC', '#FFCC99', '#FFFF99', '#CCFFCC', '#CCFFFF', '#99CCFF', '#CC99FF', '#FFFFFF']];
          var r = color.length;
          var c = color[0].length;
          var tr = [];
          $.each(color, function(index, item) {
            var td = [];
            $.each(item, function(index, _item) {
              td.push('<td><div unselectable=on  onclick="' + pluginid + '.format(\''+ format +'\', \''+ _item +'\');return false;" style="font-size:0;width:20px;height:21px;background:' + _item + ';border:1px solid #808080;cursor:pointer;"></div></td>');
            });
            tr.push('<tr>' + td.join("") + '</tr>');
          });
          div.innerHTML = '<table  width="100%" border="0" cellspacing="5" cellpadding="0" class="operate_bar_color"><tbody>' + tr.join('') + '</tbody></table>';
          return div;
        } catch(e) {}
      };
     this.createForeColor = function() {
          // 创建显示字体颜色的层
        if(!options.layers.forecolor) {
             var div = self.createColor({top:'31px', left:'200px'}, 'forecolor');
              options.$toolbar.append( $( div ) );
             options.layers.forecolor = div;
             self.hideLayers();
        }
        $( options.layers.forecolor ).show();
      };
      this.createBackColor =  function() {
        // 创建背景颜色的层
        if(!options.layers.backcolor) {
          var _f = '';
          if(!ie)_f = 'hiliteColor';
          else _f = 'backcolor';
          var div = self.createColor({top:'31px', left:'226px'}, _f);
          options.$toolbar.append( $( div ) );
          options.layers.backcolor = div;
          self.hideLayers();
        }
        $(options.layers.backcolor).show();
      };
       // 创建显示表情的层
      this.createFace = function() {
        if(!options.layers.face) {
          var div = document.createElement('div');
          div.style.cssText = 'position:absolute;z-index:100010;width:auto;height:auto;background-color:white;top:30px;left:482px;display:none;';
          var face = [
            [{name: 'cool', title: '冷酷'}, {name: 'cry', title: '哭泣'}, {name: 'embarassed', title: '尴尬'}, {name: 'foot-in-mouth', title: '咧嘴'}],
            [{name: 'frown', title: '皱眉'}, {name: 'innocent', title: '天真'}, {name: 'kiss', title: '吻'}, {name: 'laughing', title: '大笑'}],
            [{name: 'money-mouth', title: '发财'}, {name: 'sealed', title: '保密'}, {name: 'smile', title: '微笑'}, {name: 'surprised', title: '惊吓'}],
            [{name: 'tongue-out', title: '吐舌头'}, {name: 'undecided', title: '思考'}, {name: 'wink', title: '眨眼'}, {name: 'yell', title: '叫嚷'}]
          ];
          var r = face.length;
          var c = face[0].length;
          var tr = [];
          $.each(face, function(index, item) {
            var td = [];
            var imgURL = "http://js.mail.sohu.com/webapp/skin/all";
            $.each(item, function(index, _item) {
              td.push('<td style="padding:2px;"><a unselectable=on href="javascript:' + pluginid + '.setFocus();' + pluginid + '.format(\'insertimage\', \' '+ imgURL +'/images/face/smiley-'+ _item.name +'.gif\');"><img src="' + imgURL + '/images/face/smiley-' + _item.name +'.gif" title="'+ _item.title +'" style="width:18px;height:18px;border:0;margin:4px;" /></a></td>');
            });
            tr.push('<tr>' + td.join("") + '</tr>');
          });
          div.innerHTML = '<table  width="100%" border="0" cellspacing="5" cellpadding="0" class="operate_bar_color"><tbody>' + tr.join('') + '</tbody></table>';
           options.$toolbar.append( $( div ) );
          options.layers.face = div;
          self.hideLayers();
        }
        $(options.layers.face).show();
      };
     this.createImageLink = function(){
          // 添加图片
        var v = $.trim(window.prompt(App.I18n['mm_mailWrite']['import_pic'], 'http://'));
        if (!v || v == null || v == 'http://' || v == '')
            return;
        self.setFocus();
        self.format('insertimage', v);
      },

     this.createLink =  function(){
         // 创建超链接
        var v = $.trim(window.prompt( App.I18n['mm_mailWrite']['import_link'] +'http://www.sohu.com/)', 'http://'));
        if (!v || v == null || v == 'http://' || v == '')
            return;
        self.setFocus();
        self.format('createlink', v);
      };
      this.getContent =  function(){
          // 获取编辑器中的内容
          return options.iframeDoc.body.innerHTML;
      },
      this.setContent = function(content){
         // 设置编辑器中的内容 
         options.iframeDoc.body.innerHTML = content; 
      },
      this.setFocus = function(){
         // 设置编辑器焦点(for ie)
        options.iframeDoc.body.focus();
      }; 
      this.initEvent = function(){
        var toolbar = options.toolbar;
        options.$toolbar =  $('[id="' + toolbar + '"]');
        options.toolbar =  options.$toolbar.length && options.$toolbar.eq(0);
        var $lis = options.$toolbar.find('li'),
            self = this,
            hdly = function() {
              for(var p in options.layers){
                $( options.layers[p] ).hide();
              }
            },
            eventStop = function(e) { 
              e.stopPropagation();
              e.preventDefault();
            };
        $lis.click(function(e){
            var $li = $( this );
            var ename = $li.data('ename'); 
            hdly();
            switch( ename ){
                case 'fontname': 
                    self.createFontName();
                    break;
                case 'fontsize': 
                    self.createFontSize();
                    break;
                case 'fontcolor': 
                    self.createForeColor();
                    break;
                case 'backcolor': 
                    self.createBackColor();
                    break;
                case 'textalign': 
                    self.createTextAlign();
                    break;
                case 'orderlist': 
                    self.createOrderList();
                    break;
                case 'insertface': 
                    self.createFace();
                    break;
                case 'createlink': 
                    self.createLink();
                    break;
                case 'insertimage': 
                    self.createImageLink();
                    break;
                case 'sogoupinyin':
                case 'sogoumap':
                case 'iciba':
                    return;
                default:
                    self.format( ename );
            }
            eventStop(e);
           
        });
        $lis.each( function(){
            var $childLi = $( this );
            if( this.nodeType == 1 && this.nodeName.toLowerCase() == 'li') {
            var ename = $childLi.data('ename');
            if( options.tools.toString().indexOf( ename ) == -1 ){
                $childLi.remove();
                return true;
            };  
            this.onmouseover = function(event) {
              $(this).toggleClass('item-focus');
              return false;
            };
            this.onmouseout = function(event) {
              $(this).toggleClass('item-focus');
              return false;
            };
            this.onmousedown = (function(ename) {
              return function(event) {
                $(this).addClass('item-press ' + ename.toLowerCase() + '-press');
              };
            })(ename);
            this.onmouseup = (function(ename) {
              return function(event) {
                $(this).removeClass('item-press');
                $(this).removeClass(ename.toLowerCase() + '-press');
              };
            })(ename);
          }
        });
      };
      this.init();
      this.initEvent(); 
      return this;
   };
})(jQuery);