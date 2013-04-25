require "watir"

b = Watir::Browser.new
b.goto("https://dynamic.12306.cn/otsweb")

sleep 5
begin

	b.text_field(:name => "loginUser.user_name").set("lyuehh")
	b.text_field(:name => "user.password").set("wazlr521521")
rescue 
	sleep 5
ensure
	b.text_field(:name => "loginUser.user_name").set("lyuehh")
	b.text_field(:name => "user.password").set("wazlr521521")
end

sleep 5