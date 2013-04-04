require "rubygems"
require "fox16"
include Fox
application = FXApp.new

main = FXMainWindow.new(application,"Simple Menu")
menubar = FXMenuBar.new(main,LAYOUT_SIDE_TOP |
			LAYOUT_FILL_X)
filemenu = FXMenuPane.new(main)
quit_cmd = FXMenuCommand.new(filemenu,"&Quit\tCtrl-Q")
quit_cmd.connect(SEL_COMMAND) { application.exit }
FXMenuTitle.new(menubar,"&File",nil,filemenu)
application.create
main.show(PLACEMENT_SCREEN)
application.run

