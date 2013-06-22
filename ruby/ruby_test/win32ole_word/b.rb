require "win32ole"


#print "Enter the filename to print: "
#docfile = gets

word = WIN32OLE.new "Word.Application"
word.visible = true
word.documents.open "a.doc"
#word.options.printBackground = false

=begin
word.write("asdfs")
word.save()
# We could also set printBackground to true, but we
# would have to sleep until the file all got sent to
# the printer buffer before we quit...

word.activeDocument.printOut
word.quit
=end