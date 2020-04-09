# Sheridan Grant
# STAT 302 SPR2020
# 4/6/2020
# Lecture 3: functions, control flow, loops


# HW 1 Graded Solutions

## 1d
x <- c(-23:23)
length(x)
mean(x)

x <- rnorm(47)
mean(x)
x <- x - mean(x)
mean(x)

a <- sd(x)
standardized <- x / a
sd(standardized)


## 3d
x <- rnorm(10^4)
dens <- dnorm(x)
maxIndex <- which(dens == max(dens))
min(abs(x))
x[maxIndex]


# Loops

mySum <- function(vec) {
  runningSum <- 0
  for (i in 1:length(vec)) {
    print(i)
    print(vec[i])
    runningSum <- runningSum + vec[i]
    print(runningSum)
  }
  return(runningSum)
}
## End lecture 4/6

# isPrime: returns TRUE if x is prime, FALSE if not
# expects a numeric as input
isPrime <- function(x) {
  if (x < 2) {
    return(FALSE)
  } else if (x %% 1 != 0) {
    return(FALSE)
  } else if (x < 4) {
    return(TRUE)
  } else {
    for (i in 2:(x-1)) {
      if (x %% i == 0) {
        return(FALSE)
      }
    }
    return(TRUE)
  }
}

dumbFunc <- function(x) {
  return(x[1])
}























isPrime <- function(x) {
  if (x < 2) {
    return(F)  # Note F is short for FALSE
  } else if (x == 3) {
    return(T)  # T short for TRUE
  } else {
    for (i in 2:floor(sqrt(x))) {
      if (x %% i == 0) {
        return(F)
      }
    }
  }
  return(T)
}

isPrime(47)

# returns TRUE if x is NOT in vec, FALSE otherwise
isUniqueWhile <- function(x, vec) {
  print(length(vec))
  i <- 1
  flag <- TRUE
  while (flag & i <= length(vec)) {
    print(flag)
    print(i)
    if (x == vec[i]) {
      flag <- FALSE
    }
    i <- i + 1
  }
  return(flag)
}

isUniqueForDumb <- function(x, vec) {
  flag <- TRUE
  for (i in 1:length(vec)) {
    if (x == vec[i]) {
      flag <- FALSE
    }
  }
  return(flag)
}

isUniqueForSmart <- function(x, vec) {
  for (i in 1:length(vec)) {
    if (x == vec[i]) {
      return(FALSE)
    }
  }
  return(TRUE)
}

vec <- 1:(5*10^8)
isUniqueWhile(10^7, vec)
isUniqueForDumb(10^7, vec)
isUniqueForSmart(10^7, vec)


# Nested loops
clusteredData <- c(rnorm(100, 0, 1),
                   rnorm(200, 3, 1),
                   rnorm(100, 8, 2))
hist(clusteredData)


# Advanced Data Types

## Matrices

integerMatrix <- matrix(1:4, 2, 2)
integerMatrix

integerMatrixT <- matrix(1:4, 2, 2, byrow = T)
integerMatrixT
t(integerMatrix)
t(integerMatrix) == integerMatrixT
integerMatrix == integerMatrixT

integerMatrix[1,2]

integerMatrix[1,]
integerMatrix[,2]

integerMatrix[1,1] <- 100
integerMatrix[1,1] <- 'boundless'
integerMatrix  # UH OH

## Lists

UW <- list('Boundless', 4.0, T)
UW
UW[[2]]

UWnamed <- list(motto = 'Boundless', gpa = 4.0, graduating = T)
UWnamed
UWnamed$gpa
UWnamed[[2]]

## Data Frames


# Applys
isPrime(c(47, 74))  # Oops! Weird behavior
sapply(c(47, 74), isPrime)
lapply(c(47, 74), isPrime)
