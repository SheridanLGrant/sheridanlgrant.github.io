# Sheridan Grant
# STAT 302 SPR2020
# 4/14/2020
# HW 2 Graded Solution


# 1

## a
tScore <- function(x, mu0) (mean(x)-mu0)/(sd(x)/sqrt(length(x)))

## b
tTest1 <- function(x, mu0, side) {
  tVal <- tScore(x, mu0)
  pLow <- pt(tVal, length(x)-1)
  if (side == 'greater') {
    return(pLow)
  } else if (side == 'less') {
    return(1-pLow)
  } else if (side == 'equal') {
    return(2*min(pLow, 1-pLow))
  } else {
    print('WHOOOOOOOPS, invalid input')
    return(NA)
  }
}

## c
tTest1better <- function(x, mu0, side, alpha) {
  tValue <- tScore(x, mu0)
  pValue <- tTest1(x, mu0, side)
  rejPhrase <- ifelse(pValue < alpha, 'rejected', 'not rejected')
  cat('The null hypothesis is', rejPhrase, 'at level', alpha, '\n\n')
  # '\n' is the "newline" character
  return(list(pVal = pValue, tScore = tValue, reject = (pValue < alpha)))
}

## Testing
testVec <- rnorm(100)
testVec <- (testVec - mean(testVec))/sd(testVec)  # mean 0, sd 1
testVec <- testVec + 0.2  # mean 0.2, tValue 2
tScore(testVec, 0)
tTest1(testVec, 0, 'less')
tTest1(testVec, 0, 'greater')
tTest1(testVec, 0, 'equal')
tTest1(testVec, 0, 'poop')
tTest1better(testVec, 0, 'equal', 0.05)


# 2
testMatSquare <- matrix((1:9) * (-1)^(1:9), 3, 3)
testMat <- matrix((1:8) * (-1)^(1:8), 4, 2)
testMatSquare
testMat

## a
matrixSum <- function(x) {
  runSum <- 0
  for (i in 1:dim(x)[1]) {
    for (j in 1:dim(x)[2]) {
      runSum <- runSum + x[i,j]
    }
  }
  return(runSum)
}
matrixSum(testMatSquare)
sum(testMatSquare)
matrixSum(testMat)
sum(testMat)

## b
## doesn't use hint
triangleSum <- function(x, upper, diagonal) {
  m <- dim(x)[1]
  n <- dim(x)[2]
  runSum <- 0
  for (i in 1:m) {
    for (j in 1:n) {
      if (upper & diagonal) {
        if (j >= i) {
          runSum <- runSum + x[i,j]
        }
      } else if (upper & !diagonal) {
        if (j > i) {
          runSum <- runSum + x[i,j]
        }
      } else if (!upper & diagonal) {
        if (j <= i) {
          runSum <- runSum + x[i,j]
        }
      } else {
        if (j < i) {
          runSum <- runSum + x[i,j]
        }
      }
    }
  }
  return(runSum)
}
triangleSum(testMat, T, T)
triangleSum(testMat, T, F)
triangleSum(testMat, F, T)
triangleSum(testMat, F, F)

## square matrices only, hint used
triangleSumSquare <- function(x, upper, diagonal) {
  n <- dim(x)[1]
  if (dim(x)[2] != n) return('Error, matrix assumed to be square')
  runSum <- 0
  if (upper) {
    for (i in 1:n) {
      for (j in i:n) {
        runSum <- runSum + x[i,j]
      }
    }
  } else {
    for (i in 1:n) {
      for (j in 1:i) {
        runSum <- runSum + x[i,j]
      }
    }
  }
  if (!diagonal) runSum <- runSum - sum(diag(x))
  return(runSum)
}
triangleSumSquare(testMatSquare, T, T)
triangleSumSquare(testMatSquare, T, F)
triangleSumSquare(testMatSquare, F, T)
triangleSumSquare(testMatSquare, F, F)


# 3

## a
quadform <- function(x, A) t(x) %*% A %*% x
x <- c(1,1,1)
A0 <- matrix(1, 3, 3)
quadform(x, A0)

## b
x <- c(1,4,7)
A1 <- matrix(c(147, rep(0,8)), 3, 3)
A2 <- matrix(c(143, 1, rep(0,7)), 3, 3)
A1
A2
quadform(x, A1)
quadform(x, A2)

## c
A = matrix(c(1,1,1,1,2,1,1,1,3), 3, 3)
A
b = c(1,2,3)
x <- solve(A)%*%b
x <- solve(A, b)  # same thing
A%*%x  # yep, outputs b