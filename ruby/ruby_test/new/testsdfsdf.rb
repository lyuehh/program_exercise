attr_withs = attr.split("")
attr_withs[-1] = nil
attr_type = attr_withs.to_s.capitalize
string.each_with_index do |s,i|
	#puts s[0] + "---" + attr_type
	#puts s[1].include?("Set<#{file_name}>")
	#puts "..............."

	#puts "#{i}...#{s[0] == attr_type}..Set<#{file_name}>...#{s[1].include?('Set<#{file_name}>')}"

	if(s[0] == attr_type)&&(s[1].include?("Set<#{file_name}>")) #��ʾ��Զ�
		if is_many_to_many_many1 #���ط�
			f.puts "    <set name='#{attr}' cascade='save-update' table='#{file_name.downcase}s_#{attr}' inverse='true'>"
			f.puts "      <key column='#{file_name.downcase}_id'/>"
			f.puts "      <many-to-many class='#{attr_type}' column='#{attr_type.downcase}_id'/>"
			f.puts "    </set>"
			is_many_to_many_many1 = false
		else
			f.puts "    <set name='#{attr}' table='#{attr}_#{file_name.downcase}s'>"
			f.puts "      <key column='#{file_name.downcase}_id'/>"
			f.puts "      <many-to-many class='#{attr_type}' column='#{attr_type.downcase}_id'/>"
			f.puts "    </set>"
		end
	elsif (s[0] == attr_type)&&(s[1].include?("#{file_name}"))      #��ʾһ�Զ�
		if is_one_to_many_one   #1��һ����һ��Set����
			f.puts "    <set name='#{attr}' cascade='save-update'  inverse='true'>"
			f.puts "      <key column='#{file_name.downcase}_id'/>"
			f.puts "      <one-to-many class='#{attr_type}'/>"
			f.puts "    </set>"
			is_one_to_many_one = false
			#else #�����ѭ�������һ����һ��many_to_one
			#  f.puts "<many-to-one name='#{attr}' column='#{attr}_id'-------------/>"
		end
	end
end