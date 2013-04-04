require "rubygems"
require "fox16"

include Fox

class MyWindow < FXMainWindow
	def initialize(app)
		super (app,"MyWindow",nil,nil,DECOR_ALL,
		       0,0,850,600,0,0)
		#创建一个tooltip
		FXToolTip.new(self.getApp())
		#状态栏
		statusbar = FXStatusBar.new(self,
					    LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|STATUSBAR_WITH_DRAGCORE

