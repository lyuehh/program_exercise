require 'rubygems'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new
browser.goto 'http://mail.sohu.com'

browser.text_field(:name => 'username').set 'user101@sohu.com'
browser.text_field(:name => 'password').set '111111'

browser.button(:id => 'login_img').click
sleep 2

browser.div(:class => 's_writemail').click

sleep 2

browser.a(:id => 'folder_1').click # 这个在 ie 下有问题，不知道why
sleep 3
browser.tr(:id => 'tr_2927').click
sleep 2
browser.a(:class => 's_bar_note_add').click
sleep 2
browser.text_field(:class => 'note-textarea').set 'xxxxxx'

=begin
sleep 2
browser.a(:class => 's_config').click
sleep 1


browser.a(:class => 's_cfg_set').click
sleep 1
browser.radio(:id => 'cfg_httpsfiltersrc', :value => "true").set
browser.radio(:id => 'cfg_autosavesendmail', :value => "true").set


browser.a(:class => 's_cfg_sign').click
sleep 1
browser.checkbox(:id => 'cfg_image_signature', :value => "false").set
=end