#puts here
f.puts '<?xml version="1.0" encoding="utf-8"?>'									   \n
f.puts '<mx:TitleWindow xmlns:mx="http://www.adobe.com/2006/mxml" showCloseButton="true"'			   \n
f.puts 'close="PopUpManager.removePopUp(this);" creationComplete="PopUpManager.centerPopUp(this)"'	           \n 
f.puts 'layout="absolute" width="866" height="546" creationCompleteEffect="{myFade}"'				   \n
f.puts 'paddingBottom="0" paddingLeft="0" paddingRight="0" paddingTop="0">'					   \n
f.puts '<mx:Script>'												   \n

#�˴�������
f.puts '	<![CDATA['											   \n


f.puts '		import mx.controls.TextArea;'							  	   \n
f.puts '		import mx.managers.PopUpManager;'						           \n
f.puts '		import mx.controls.Alert;'								   \n
f.puts '		import mx.rpc.http.HTTPService;'                                                           \n
            
f.puts '           //���͹��̵���Ҫ����'									   \n
f.puts '           //�г�����'											   \n
f.puts '	private function list():void {'									   \n
			
f.puts "	    list#{c2}s.url = 'http://localhost:3000/topics.xml';"					   \n

#������

f.puts '		    list#{c2}s.send();'									   \n
f.puts '		}'											   \n
		            
f.puts '		//ɾ������'										   \n
f.puts '		private  function destroy():void {'							   \n
			
f.puts "delete#{c2}.url = 'http://localhost:3000/#{c2.downcase}s/' + #{c2.downcase}_list.selectedItem.id + '.xml';"\n
		            	
f.puts '		    var param:Object = new Object();'							   \n
f.puts "		    param['_method'] = 'DELETE';"							   \n
		            	
f.puts '		    deleteTopic.send(param);'								   \n
f.puts '		}'											   \n

#here
f.puts '		//�޸ķ���'										   \n
f.puts '		private function update():void {'							   \n
				   	
f.puts '		    var #{c2.downcase}:Object = new Object();'						   \n

a.c_names.each do |n|												   \n
  f.puts     "#{c2.downcase}['#{c2.downcase}['" + "+" + "'" + n + "'" + "+" + "']'] " + "= " + n + ".text"         \n
end														   \n

f.puts '		    #{c2.downcase}['_method'] = 'PUT';'							   \n
		
f.puts '		    updateTopic.url = "http://localhost:3000/topics/" '					   \n
f.puts '		        + topic_list.selectedItem.id + ".xml";'						   \n
f.puts '		    trace(updateTopic.url);'								   \n
		
f.puts '		    updateTopic.send(topic);'								   \n
f.puts '		}'											   \n

#now here
f.puts '		//��������'										   \n
f.puts '		private function create():void {'							   \n
			
f.puts '			var #{c2.downcase}:Object = new Object();'					   \n

a.c_names.each do |n|												   \n
  f.puts     "#{c2.downcase}['#{c2.downcase}['" + "+" + "'" + n + "'" + "+" + "']'] " + "= " + n + ".text"         \n
end														   \n

			
f.puts "			create#{c2}.url = 'http://localhost:3000/#{c2.downcase}s.xml';"			   \n
			
f.puts "			create#{c2}.send(#{c2.downcase});"						   \n
f.puts '		}'										           \n	

#now here
f.puts '		private function clearForm():void {'							   \n
f.puts '		    title2.text = "";'									   \n
f.puts '		    content.text = "";'									   \n
f.puts '		}'										           \n
f.puts '		]]>'											   \n
f.puts '	</mx:Script>'											   \n

f.puts '<!--Ч�������-->'
f.puts '<mx:Fade id="myFade" duration="1000" />'

f.puts '<!--������HTTPService-->'
f.puts ' <!--�õ�����-->'
f.puts "<mx:HTTPService id='list#{c2}s' method=GET' />"
f.puts ' <!--�޸ĵ���-->'

#һ���д�
f.puts " <mx:HTTPService id='update#{c2}' method='POST' result='Alert.show("�޸ĳɹ�");list()' fault='Alert.show("�޸�ʧ��")'/>"
f.puts ' <!--ɾ��һ��-->'
f.puts " <mx:HTTPService id='delete#{c2}' method='POST' result='Alert.show("ɾ���ɹ�");list()' fault='Alert.show("ɾ��ʧ��")'/>"
f.puts ' <!--�½�-->'
f.puts " <mx:HTTPService id='create#{c2}' method='POST' result='Alert.show("�½��ɹ�");list()' fault='Alert.show("�½��ɹ�");list()'/>"
#����

#here now
f.puts '<!--�����ǲ���-->'
f.puts '<mx:VDividedBox height="100%" width="100%">'
f.puts "  <mx:Panel width='100%' height='222' layout='absolute' title='Create/Update #{c2}s'>"
f.puts '   <mx:Form width="930" height="100">'

a.c_names do |n|
  f.puts "    <mx:FormItem label=" + n.capitalize + ">"
  f.puts "      <mx:TextInput width='220' id=" + n + " text='{#{c2.downcase}_list.selectedItem." + n + "}'/>"
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

a.c_names do |n|
  f.puts "<mx:DataGridColumn headerText=" + n.capitalize + " dataField=" + n + "/>"
end
f.puts '     <mx:DataGridColumn headerText="ID" dataField="id"/>
f.puts '     <mx:DataGridColumn headerText="Title" dataField="title"/>
f.puts '     <mx:DataGridColumn headerText="Content" dataField="content"/>
f.puts '     <mx:DataGridColumn headerText="Created_at" dataField="created-at" />
f.puts '     <mx:DataGridColumn headerText="Updated_at" dataField="updated-at" />


f.puts '    </mx:columns>'
f.puts '   </mx:DataGrid>'
f.puts '   <mx:ControlBar horizontalAlign="right">'
f.puts '    <mx:Button label="Delete" click="destroy()"/>'
f.puts '   </mx:ControlBar>'
f.puts '  </mx:Panel>'
f.puts ' </mx:VDividedBox>'
f.puts '</mx:TitleWindow>'