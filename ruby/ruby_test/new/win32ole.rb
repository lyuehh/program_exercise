require "rubygems"
require "win32ole"
require "iconv"

1.upto(2) do |f|
  word = WIN32OLE.new("word.application")
  word.visible = false
  doc = word.Documents.Add()
  doc.Activate()
  doc.Content.Font.Size = 14
  doc.Content.Text = Iconv.conv("gb2312","utf-8",
"                            问卷调查                                                                                                   ")
  doc.Content.Text += Iconv.conv("gb2312","utf-8",
"1.这是题目1，行吗？（#{['A','B','C','D'][rand(4)]}）
A.行，完全可以。  
B.不行，太懒了吧你。
C.随便，跟我没关系。
D.神经病。")   
  doc.SaveAs("d:\\wj\\wj#{f}.doc",0)
  doc.close
  word.quit
end