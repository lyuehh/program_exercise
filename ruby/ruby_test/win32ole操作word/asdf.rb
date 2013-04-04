require 'rubygems'
require 'win32ole'
require 'iconv'
# 调用word的进程，这句执行完毕后，会在进程中出现WINWORD.EXE
word = WIN32OLE.new('word.application')
# 设置在操作过程中，word的界面是否可见
word.visible = false
# 在word中，添加一个文档
doc = word.Documents.Add()
# 将当前文档设为活动状态
doc.Activate
# 设置字体大小
doc.Content.Font.Size = 24
# 为文档写入内容，这里需要注意为要写入的字符串转换编码
doc.Content.Text = Iconv.conv("gb2312", 'utf-8', '内容')
# 保存并关闭文档
# 所以可以保存为的文档格式 
# wdFormatDocument = 0 (no conversion)
# wdFormatTemplate = 1 
# wdFormatText = 2 
# wdFormatTextLineBreaks = 3
# wdFormatDOSText = 4 
# wdFormatDOSTextLineBreaks = 5
# wdFormatRTF = 6
# wdFormatUnicodeText = 7 
# it repeats! # wdFormatEncodedText = 7 # wdFormatHTML = 8 # wdFormatWebArchive = 9 # wdFormatFilteredHTML = 10 # wdFormatXML = 11
doc.SaveAs("d:\\a.doc", 0)
doc.close# => 注意，此时word进程并没有关闭，只是文档关闭



# 打开一个word文档，貌似这里一定要写绝对路径
doc = word.Documents.Open("c:\\b.doc")
doc.Activate
# 打印文档的全部内容
puts doc.Content.Text
# => 这是一段完整的文档# 选择所有文本。查找时 范围是选中的内容，所以如果没有执行这句话是查找不到任何内容的
word.Selection.WholeStory
# 打印选中的内容，此时是文档的全部，但执行查找成功后，选中的内容将是查找到的内容
puts word.Selection.Text
# 查找
word.Selection.Find.Text = Iconv.conv("gbk", 'utf-8', "完整")
p word.Selection.Find.Execute # => true
puts word.Selection.Text# => 完整# 文档目前的"指针"，替换，插入的操作根据这个"指针"来进行
puts word.Selection.Start# => 4
puts word.Selection.End# => 6# 插入，在完整前面插入"非常"
doc.Range(word.Selection.Start, word.Selection.Start).Text = Iconv.conv("gbk", 'utf-8', "非常")
puts doc.Content.Text# => 这是一段非常完整的文档
# 当出现文档修改后，记得要执行这句话
doc.Save# 替换，和插入类似，不同的是doc.Range的开始位置和结束位置有距离就可以了，这里不做说明
# 删除操作
word.Selection.Start = 5
word.Selection.End = 7
word.Selection.Delete
# 或者是 doc.Range(5, 7).Delete
doc.Save
doc.close

word.quit# 实际使用的时候，别忘了用begin ensure end 把word.quit包起来，不然发生异常后资源可就释放不了了