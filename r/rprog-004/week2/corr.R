source('./complete.R')
corr <- function(directory, threshold = 0) {
	id <- 332
	result <- numeric()
	for (i in 1:id) {
		comp <- complete(directory, i)
		# print(comp[1,2])
		if (comp[1,2] > threshold) {

			if (i < 10) {
				i <- paste('00', i, sep="")
			} else if (i < 100) {
				i <- paste('0', i, sep="")
			}
			# print(i)
			f <- paste(directory, '/', i, '.csv', sep="")
			# print(f)
			content <- read.csv(f)
			content <- subset(content, !is.na(sulfate))
			content <- subset(content, !is.na(nitrate))
			# print(content$sulfate)
			# print(content$nitrate)
			result <- append(result, cor(content$sulfate, content$nitrate))
		}
	}
	result
}
