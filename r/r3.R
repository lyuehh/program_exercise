library(RCurl)
library(XML)
library(RJSONIO)
movieScoreapi <- function(x) {
    api <- "https://api.douban.com/v2/movie/search?q={"
    url <- paste(api, x, "}", sep = "")
    res <- getURL(url)
    reslist <- fromJSON(res)
    name <- reslist$subjects[[1]]$title
    score <- reslist$subjects[[1]]$rating$average
    return(list(name = name, score = score))
}
movieScoreapi("僵尸世界大战")
