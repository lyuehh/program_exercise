#puts here

index.puts '<?xml version="1.0" encoding="utf-8"?>'
index.puts '<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml">'
index.puts '<!--下面是脚本-->'
index.puts '<mx:Script>'
index.puts '	<![CDATA['
index.puts 'import mx.managers.PopUpManager;'

t2.each do |c2|
  index.puts "import com.www.#{c2};"
end

index.puts   'import mx.containers.TitleWindow;'

t2.each do |c2|
  index.puts "private function show#{c2}():void {"
  index.puts "var #{c2.downcase}Window:#{c2} = #{c2}("
  index.puts "PopUpManager.createPopUp(this, #{c2}, true));"
  index.puts "}"
end
index.puts	']]>'
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
  index.puts '<mx:LinkButton label="#{c2}" click="show#{c2}()"/>'
end

index.puts '</mx:HBox>'
index.puts '</mx:Application>'
