require "rubygems"
require "fox16"

include Fox
application = FXApp.new
main = FXMainWindow.new(application,"Today's Date")
str = Time.now.strftime("&Today is %B %d,%Y")
text = "&Hello,\n" +
	"Do you see lines in this ?"
button = FXButton.new(main,text)
application.create
main.show(PLACEMENT_SCREEN)
application.run
