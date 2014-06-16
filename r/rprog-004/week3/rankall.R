rankall <- function(outcome, num="best") {
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
	
	states <- content$State
	states <- sort(unique(states))
	hospital <- rep("", length(states))

	for (i in 1:length(states)) {
		a <- content[content$State==states[i], ]
		a <- a[c(2,col,7)]
		a <- a[order(a[,2], a[,1]), ]

		if (num == 'best') {
			hospital[i] <- a[,1][1]
		} else if (num == 'worst') {
			hospital[i] <- a[,1][nrow(a)]
		} else {
			hospital[i]<- a[,1][num]
		}
	}
	data.frame(hospital=hospital, state=states)
}

# test
# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
# tail(rankall("heart failure"), 10)
