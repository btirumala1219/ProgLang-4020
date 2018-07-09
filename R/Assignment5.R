dat <- read.csv(file="review.csv", header=TRUE)
ans <- subset(dat, (lengths(gregexpr("\\W+", dat$reviewText)) + 1) > 100)
finans <- ans[order(ans$overall),]
write.csv(finans, file = "A5output.csv")
