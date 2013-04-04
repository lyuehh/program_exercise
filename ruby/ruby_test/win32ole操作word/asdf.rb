require 'rubygems'
require 'win32ole'
require 'iconv'
# ����word�Ľ��̣����ִ����Ϻ󣬻��ڽ����г���WINWORD.EXE
word = WIN32OLE.new('word.application')
# �����ڲ��������У�word�Ľ����Ƿ�ɼ�
word.visible = false
# ��word�У����һ���ĵ�
doc = word.Documents.Add()
# ����ǰ�ĵ���Ϊ�״̬
doc.Activate
# ���������С
doc.Content.Font.Size = 24
# Ϊ�ĵ�д�����ݣ�������Ҫע��ΪҪд����ַ���ת������
doc.Content.Text = Iconv.conv("gb2312", 'utf-8', '����')
# ���沢�ر��ĵ�
# ���Կ��Ա���Ϊ���ĵ���ʽ 
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
doc.close# => ע�⣬��ʱword���̲�û�йرգ�ֻ���ĵ��ر�



# ��һ��word�ĵ���ò������һ��Ҫд����·��
doc = word.Documents.Open("c:\\b.doc")
doc.Activate
# ��ӡ�ĵ���ȫ������
puts doc.Content.Text
# => ����һ���������ĵ�# ѡ�������ı�������ʱ ��Χ��ѡ�е����ݣ��������û��ִ����仰�ǲ��Ҳ����κ����ݵ�
word.Selection.WholeStory
# ��ӡѡ�е����ݣ���ʱ���ĵ���ȫ������ִ�в��ҳɹ���ѡ�е����ݽ��ǲ��ҵ�������
puts word.Selection.Text
# ����
word.Selection.Find.Text = Iconv.conv("gbk", 'utf-8', "����")
p word.Selection.Find.Execute # => true
puts word.Selection.Text# => ����# �ĵ�Ŀǰ��"ָ��"���滻������Ĳ����������"ָ��"������
puts word.Selection.Start# => 4
puts word.Selection.End# => 6# ���룬������ǰ�����"�ǳ�"
doc.Range(word.Selection.Start, word.Selection.Start).Text = Iconv.conv("gbk", 'utf-8', "�ǳ�")
puts doc.Content.Text# => ����һ�ηǳ��������ĵ�
# �������ĵ��޸ĺ󣬼ǵ�Ҫִ����仰
doc.Save# �滻���Ͳ������ƣ���ͬ����doc.Range�Ŀ�ʼλ�úͽ���λ���о���Ϳ����ˣ����ﲻ��˵��
# ɾ������
word.Selection.Start = 5
word.Selection.End = 7
word.Selection.Delete
# ������ doc.Range(5, 7).Delete
doc.Save
doc.close

word.quit# ʵ��ʹ�õ�ʱ�򣬱�������begin ensure end ��word.quit����������Ȼ�����쳣����Դ�ɾ��ͷŲ�����