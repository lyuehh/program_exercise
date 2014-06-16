rankhospital <- function(state, outcome, num = "best") {
	content <- read.csv('./outcome-of-care-measures.csv', colClass="character")

	# check state
	if (is.na(match(state, content$State))) {
		stop('invalid state')
	}
	cs <- c('heart attack'=11, 'heart failure'=17, 'pneumonia'=23)
	col <- cs[outcome]

	# check outcome
	if (is.na(col)) {
		stop('invalid outcome')
	}

	content[,11] <- as.numeric(content[,11])
	content[,17] <- as.numeric(content[,17])
	content[,23] <- as.numeric(content[,23])
	# print(head(content))

	a <- content[content$State==state, c(2,col)]
	a <- a[!is.na(a[,2]),]
	a <- a[order(a[,2], a[,1]), ]
	
	# print(head(a)[,1][1])
	if (num == 'best') {
		return(a[,1][1])
	} else if (num == 'worst') {
		return(a[,1][nrow(a)])
	} else {
		return(a[,1][num])
	}
}

# test
# print(rankhospital("TX", "heart failure", 4) == 'DETAR HOSPITAL NAVARRO')
# print(rankhospital("MD", "heart attack", "worst") == 'HARFORD MEMORIAL HOSPITAL')
# print(is.na(rankhospital("MN", "heart attack", 5000)))
