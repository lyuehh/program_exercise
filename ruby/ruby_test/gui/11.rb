#puts here
require "rubygems"
require "fox16"

include Fox
theApp = FXApp.new
theMainWindow = FXMainWindow.new(theApp,"Hello")
theButton = FXButton.new(theMainWindow,"Hello,World")
theButton.tipText = "Push Me!"

iconFile = File.open("11.jpg","rb")
theButton.icon = FXJPGIcon.new(theApp,iconFile.read)
theButton.iconPosition = ICON_ABOVE_TEXT
theButton.icon.options = IMAGE_ALPHACOLOR | IMAGE_ALPHAGUESS
iconFile.close

theButton.connect(SEL_COMMAND) do |sender,selector,data|
	exit
end
FXToolTip.new(theApp)
theApp.create
theMainWindow.show(PLACEMENT_OWNER)
theApp.run