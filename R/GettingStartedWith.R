RAssignment1Problem1 <- function()
{
  MyData <- read.csv(file="Rdata.csv", header=TRUE, sep=",")
  june <- subset(MyData, Month == 6)
  div2 <- subset(june, Day%%2 == 0)
  wind <- subset(div2, Wind>9)
  ans <- mean(wind$Wind,na.rm = TRUE)
  ans
}

RAssignment1Problem2 <- function()
{
  MyData <- read.csv(file="Rdata.csv", header=TRUE, sep=",")
  exist <- complete.cases(MyData)
  fin <- MyData[exist, ]

  minO <- min(fin$Ozone)
  maxO <- max(fin$Ozone)

  minS <- min(fin$Solar.R)
  maxS <- max(fin$Solar.R)

  minW <- min(fin$Wind)
  maxW <- max(fin$Wind)

  minT <- min(fin$Temp)
  maxT <- max(fin$Temp)

  x <- 300

  Ozone <- c(minO, maxO)
  Solar.R <- c(minS, maxS)
  Wind <- c(minW, maxW)
  Temp <- c(minT, maxT)

  ans <- data.frame(Ozone, Solar.R, Wind, Temp)

  ans
}
