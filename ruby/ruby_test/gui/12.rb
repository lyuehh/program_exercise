#puts here
require "rubygems"
require "fox16"
require "customer"

include Fox

class ClipMainWindow < FXMainWindow
  def initialize(anApp)
    super(anApp,"Clipboard Example", :opts => DECOR_ALL,
	 :width => 400, :height => 300)
    sunkenFrame = FXVerticalFrame.new(self,
	LAYOUT_FILL_X | LYOUT_FILL_Y | FRMAE_SUNKEN | FRAME_THICK,:padding => 0)

    customerList = FxList.new(sunkenFrame,:opts => LIST_BROWSESELECT | LAYOT_FILL_X|LAYOUT_FILL_Y)
    $customers.each do |customer|
	    customerList.appendItem(customer.name,nil,customer)
    end
    def create
	  super
	  show(PLACEMENT_SCREEN)
    end
  end
  if _FILE_ == $0
	  FXApp.new("ClipboardExample","FXRuby") do |theApp|
		  ClipMainWindow.new(theApp)
		  theApp.create
		  theApp.tun
  end
end
