#在这一下输入你的代码
require 'tk'
root = TkRoot.new { title "Ex1" }
TkLabel.new(root) {
  text  'Hello, World!'
  pack  { padx 15 ; pady 15; side 'left' }
}
Tk.mainloop

