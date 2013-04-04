#puts here
require "rubygems"
require "activerecord"
require "mysql"

#database_name = ARGV[0]
m = Mysql.new("localhost","root","root","note")
tables = m.list_tables
m.close

t2 = []

tables.each do |t|
  t = t.split("")
  t[-1] = nil
  t2 << t.join.capitalize
end

#得到处理后的数据库的表名
puts t2

#=begin
#生成相应的包结构
#生成后注释掉
Dir.mkdir("com")
Dir.chdir("com") 
Dir.mkdir("www")
Dir.chdir("..")
#=end


#根据表名输出文件index.mxml
index = File.new("index.mxml","w")
index.puts '<?xml version="1.0" encoding="utf-8"?>'
index.puts '<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml">'
index.puts '<!--下面是脚本-->'
index.puts '<mx:Script>'
index.puts '  <![CDATA['
index.puts '  import mx.managers.PopUpManager;'
t2.each do |c2|
  index.puts "  import com.www.#{c2};"
end
index.puts   '  import mx.containers.TitleWindow;'
t2.each do |c2|
  index.puts "  private function show#{c2}():void {"
  index.puts "    var #{c2.downcase}Window:#{c2} = #{c2}("
  index.puts "    PopUpManager.createPopUp(this, #{c2}, true));"
  index.puts "  }"
end
index.puts  ']]>'
index.puts '</mx:Script>'

index.puts '<!--下面是验证声明'
index.puts '<mx:StringValidator minLength="4" maxLength="16" source="{user_name}" property="string" id="SV" />'
index.puts '-->'


index.puts '<!--下面是特效声明-->'
index.puts '<mx:Dissolve id="dissolveIn" duration="1000" alphaFrom="0.0" alphaTo="1.0"/>'


index.puts '<!--下面是HTTPService-->'
index.puts 
index.puts '<!--下面是布局-->'
index.puts '<mx:HBox width="100%">'

t2.each do |c2|
  index.puts "<mx:LinkButton label='#{c2}' click='show#{c2}()'/>"
end

index.puts '</mx:HBox>'
index.puts '</mx:Application>'
#生成index.mxml到此为止 


ActiveRecord::Base.establish_connection(
  :adapter   => "mysql",
  :host      => "localhost",
  :username  => "root",
  :password  => "root",
  :database  => "note_development"
)

#得到每个表中的字段名称
t2.each do |c2|
  
  Dir.chdir("com")
  Dir.chdir("www")
  
  string = %[                         \n
    class #{c2} < ActiveRecord::Base    \n
      @@c = column_names                \n
      def c_names                       \n
        @@c.each do |n|     \n
         puts n     \n
        end                             \n
      end                               \n
     end                                \n

    File.open("#{c2}.mxml","w") do |f|  \n
      a = #{c2}.new                     \n
        f.puts '<?xml version="1.0" encoding="utf-8"?>'                    \n
        f.puts '<mx:TitleWindow xmlns:mx="http://www.adobe.com/2006/mxml" showCloseButton="true"'        \n
        f.puts 'close="PopUpManager.removePopUp(this);" creationComplete="list();PopUpManager.centerPopUp(this)"'            \n 
    f.puts 'layout="absolute" width="866" height="546" creationCompleteEffect="{myFade}"'          \n
    f.puts 'paddingBottom="0" paddingLeft="0" paddingRight="0" paddingTop="0">'            \n
    f.puts '<mx:Script>'                           \n
    f.puts '  <![CDATA['
    f.puts '    import mx.controls.TextArea;'                    \n
    f.puts '    import mx.managers.PopUpManager;'                      \n
    f.puts '    import mx.controls.Alert;'                   \n
    f.puts '    import mx.rpc.http.HTTPService;'                                                           \n
          
    f.puts '           //发送过程的主要函数'                    \n
    f.puts '           //列出所有'                         \n
    f.puts '  private function list():void {'                    \n 
    f.puts "      list#{c2}s.url = 'http://localhost:3000/#{c2.downcase}s.xml';"           \n
    
    f.puts '        list#{c2}s.send();'                    \n
    f.puts '    }'                         \n
              
    f.puts '    //删除方法'                      \n
    f.puts '    private  function destroy():void {'                \n
          
    f.puts "    delete#{c2}.url = 'http://localhost:3000/#{c2.downcase}s/' + #{c2.downcase}_list.selectedItem.id + '.xml';"\n
            
    f.puts '        var param:Object = new Object();'                \n
    f.puts "        param['_method'] = 'DELETE';"                \n
            
    f.puts "        delete#{c2}.send(param);"                  \n
    f.puts '    }'                         \n

    f.puts '    //修改方法'                      \n
    f.puts '    private function update():void {'                \n
              
    f.puts '        var #{c2.downcase}:Object = new Object();'               \n

    (a.c_names - ["id","created_at","updated_at"]).each do |n|                           \n
      f.puts     "    #{c2.downcase}['#{c2.downcase}['" + "+" + "'" + n + "'" + "+" + "']'] " + "= " + n + "1.text;"         \n
    end                              \n
    
    f.puts "        #{c2.downcase}['_method'] = 'PUT';"                \n
        
    f.puts "        update#{c2}.url = 'http://localhost:3000/#{c2.downcase}s/'"              \n
    f.puts "            + #{c2.downcase}_list.selectedItem.id + '.xml';"                 \n
    f.puts "        trace(update#{c2}.url);"                   \n
        
    f.puts "        update#{c2}.send(#{c2.downcase});"                   \n
    f.puts '    }'                         \n

    f.puts '    //新增方法'                      \n
    f.puts '    private function create():void {'                \n
          
    f.puts '      var #{c2.downcase}:Object = new Object();'             \n

    (a.c_names - ["id","created_at","updated_at"]).each do |n|                           \n
      f.puts     "    #{c2.downcase}['#{c2.downcase}['" + "+" + "'" + n + "'" + "+" + "']'] " + "= " + n + "1.text;"         \n
    end                              \n

          
    f.puts "      create#{c2}.url = 'http://localhost:3000/#{c2.downcase}s.xml';"        \n
          
    f.puts "      create#{c2}.send(#{c2.downcase});"               \n
    f.puts '    }'                               \n

    f.puts '    private function clearForm():void {'                 \n

    (a.c_names - ["id","created_at","updated_at"]).each do |n|                           \n
      f.puts "    " + n + "1.text = '';"         \n
    end                              \n

    f.puts '    }'                               \n
    f.puts  ']]>'

    f.puts '  </mx:Script>'                        \n

    f.puts '<!--效果放这儿-->'
    f.puts '<mx:Fade id="myFade" duration="1000" />'

    f.puts '<!--下面是HTTPService-->'
    f.puts ' <!--得到所有-->'
    f.puts "<mx:HTTPService id='list#{c2}s' method='GET' />"
    f.puts ' <!--修改单个-->'
    
    f.puts " <mx:HTTPService id='update#{c2}' method='POST' result='Alert.show();list()' fault='Alert.show()'/>"
    f.puts ' <!--删除一个-->'
    f.puts " <mx:HTTPService id='delete#{c2}' method='POST' result='Alert.show();list()' fault='Alert.show()'/>"
    f.puts ' <!--新建-->'
    f.puts " <mx:HTTPService id='create#{c2}' method='POST' result='Alert.show();list()' fault='Alert.show();list()'/>"

    f.puts '<!--下面是布局-->'
    f.puts '<mx:VDividedBox height="100%" width="100%">'
    f.puts "  <mx:Panel width='100%' height='222' layout='absolute' title='Create/Update #{c2}s'>"
    f.puts '   <mx:Form width="930" height="100">'

    (a.c_names - ["id","created_at","updated_at"]).each do |n|
      f.puts "    <mx:FormItem label=" + "'" + n.capitalize + "'" + ">"
      f.puts "      <mx:TextInput width='220' id=" + "'" + n + "1'" + " text='{#{c2.downcase}_list.selectedItem." + n + "}'/>"
      f.puts '    </mx:FormItem>'
    end

    f.puts '   </mx:Form>'
    f.puts '   <mx:ControlBar horizontalAlign="right">'
    f.puts '    <mx:Button label="Clear" click="clearForm()"/>'
    f.puts '    <mx:Button label="Update" click="update(); clearForm()"/>'
    f.puts '   <mx:Button label="Create" click="create(); clearForm()"/>'
    f.puts '   </mx:ControlBar>'
    f.puts '  </mx:Panel>'
    f.puts "  <mx:Panel width='100%' height='100' layout='absolute' title='#{c2}s'>"
    f.puts "   <mx:DataGrid width='100%' height='100%' id='#{c2.downcase}_list' dataProvider='{list#{c2}s.lastResult.#{c2.downcase}s.#{c2.downcase}}'>"
    f.puts '    <mx:columns>'

    (a.c_names - ["created_at","updated_at"] + ["created-at","created-at"]).each do |n|
      f.puts "  <mx:DataGridColumn headerText=" + "'" + n.capitalize + "'" + " dataField=" + "'" + n + "'" + "/>"
    end

    f.puts '    </mx:columns>'
    f.puts '   </mx:DataGrid>'
    f.puts '   <mx:ControlBar horizontalAlign="right">'
    f.puts '    <mx:Button label="Delete" click="destroy()"/>'
    f.puts '   </mx:ControlBar>'
    f.puts '  </mx:Panel>'
    f.puts ' </mx:VDividedBox>'
    f.puts '</mx:TitleWindow>'

    end                                 \n
    ]
  #puts string
  eval(string)
  
  Dir.chdir("..")
  Dir.chdir("..")
end


