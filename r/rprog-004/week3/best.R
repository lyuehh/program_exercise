best <- function(state, outcome) {
	content <- read.csv('./outcome-of-care-measures.csv', colClasses = "character")

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

	a <- content[content$State==state, c(2, col)]
	print(head(a[,2]))
	sort(subset(a,select=c(1), a[,2]==min(a[,2], na.rm=TRUE)))[[1]]

	# a <- content[content$State==state, c(2, col)]
	# sort(subset(content,select=c(2), subset=(State==state && content[col]==min(content[col], na.rm=T))))[[1]]
}

# test
print(best("TX", "heart attack") == "CYPRESS FAIRBANKS MEDICAL CENTER")
print(best("TX", "heart failure") == "FORT DUNCAN MEDICAL CENTER")
print(best("MD", "heart attack") == "JOHNS HOPKINS HOSPITAL, THE")
print(best("MD", "pneumonia") == "GREATER BALTIMORE MEDICAL CENTER")
