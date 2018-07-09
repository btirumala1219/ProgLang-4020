test3Problem1 <- function()
{
  MyData <- read.csv(file="test3data.csv", header=TRUE, sep=",")
  june <- subset(MyData, Month == 6)
  even <- subset(june, Day%%2 == 0)
  wind <- subset(even, Wind>9)
  ans <- mean(wind$Wind,na.rm = TRUE)
  ans
}

test3Problem2 <- function()
{
  MyData <- read.csv(file="test3data.csv", header=TRUE, sep=",")
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

test3Problem3 <- function()
{
  fin <- read.csv("Future-500.csv", na.strings = c(""))

  fin$Expenses <- gsub("[,]", "", fin$Expenses)
  fin$Expenses <- as.numeric(gsub(" Dollars", "", fin$Expenses))
  fin$Revenue <- as.numeric(gsub("[$,]", "", fin$Revenue))
  fin$Growth <- as.character(fin$Growth)
  fin$Growth <- as.numeric(gsub("[%]", "", fin$Growth))

  expensesMean <- mean(fin$Expenses, na.rm = TRUE)
  fin[is.na(fin$Expenses), "Expenses"] <- expensesMean

  revMean <- mean(fin$Revenue, na.rm = TRUE)
  fin[is.na(fin$Revenue), "Revenue"] <- revMean

  profMean <- mean(fin$Profit, na.rm = TRUE)
  fin[is.na(fin$Profit), "Profit"] <- profMean

  finans <- fin[order(fin$Profit),]

  fin
}

test3Problem4 <- function()
{
  data <- read.csv(file="cherry.csv", header=TRUE, sep=",")
  x <- data$Height
  y <- data$Volume
  relation <- lm(y~x)

  plot(y,x,col = "blue",main = "Height & Volume Regression",
  abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Volume",ylab = "Height")

  relation
}

test3Problem1()
test3Problem2()
test3Problem3()
test3Problem4()
