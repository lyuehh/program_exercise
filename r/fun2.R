con = url('http://pastebin.com/raw.php?i=ZaQiHU1m', encoding = 'UTF-8')
x = readLines(con, warn = FALSE)
close(con)
# 去掉注音，在奇数行
x = x[seq(2, length(x), 2)]
# 去掉空格
x = gsub('\\s+', '', x)
# 去掉标点
x = gsub('，|。', '', x)
# 数数一共多少字
sum(nchar(x))

# 拆分成单字，作频数表
y = table(unlist(strsplit(x, '')))
# 哪些字的频数大于1
names(y[y > 1])
