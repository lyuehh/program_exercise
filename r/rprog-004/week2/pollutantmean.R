pollutantmean <- function(directory, pollutant, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating the location of the CSV files
	sum <- numeric()
	for (i in id) {
		if (i < 10) {
			i <- paste('00', i, sep="")
		} else if (i < 100) {
			i <- paste('0', i, sep="")
		}
		# print(i)
		f <- paste(directory, '/', i, '.csv', sep="")
		content <- read.csv(f)
		poll <- content[pollutant]
		# print(poll)
		noNA <- is.na(poll)
		# print(poll[!noNA])
		sum <- append(sum, poll[!noNA])
	}
	mean(sum)
}
