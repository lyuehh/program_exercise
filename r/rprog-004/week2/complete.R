complete <- function(directory, id = 1:332) {
	nobs <- numeric()
	for (i in id) {
		data <- 0
		if (i < 10) {
			i <- paste('00', i, sep="")
		} else if (i < 100) {
			i <- paste('0', i, sep="")
		}
		# print(i)
		f <- paste(directory, '/', i, '.csv', sep="")
		content <- read.csv(f)

		content <- subset(content, !is.na(sulfate))
		content <- subset(content, !is.na(nitrate))
		data <- nrow(content)



		# this works too, but too slow
		# nw <- nrow(content)
		# for (j in 1:nw) {
		# 	# print(content[j,])
		# 	if (!is.na(content[j,][2][1,1])
		# 		&& !is.na(content[j,][3][1,1])) {
		# 		data <- data + 1
		# 	}
		# }
        #
		nobs = append(nobs, data)
		# nobs <- c(nobs, data)
		# print(data)
	}
	df = data.frame(id, nobs)
	df
}
