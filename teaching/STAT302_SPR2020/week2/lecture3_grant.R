# Sheridan Grant
# STAT 302 SPR2020
# 4/6/2020
# Lecture 3: functions, control flow, loops


# Data types cont'd
is.numeric(8)
is.numeric(7/4)
is.numeric(c(1,2,2.4))
is.character(1)
is.character('a')
is.character('sheridan')
is.logical(TRUE)
is.logical(1)
is.vector(c(1,2,3))
is.vector(1)

## logicals as numerics
TRUE + 2
FALSE - 1
betas <- rbeta(1000, 4, 8)
hist(betas)
betas > 0.5
sum(betas > 0.5)
mean(betas > 0.5)


# Functions
f <- function(x, y) {
  s <- x + y
  return(s)
}

fSmart <- function(x, y) {
  return(x + y)
}

# centerRange: compute a 100alpha% central interval from a vector
centerRange <- function(vec, alpha = 0.95) {
  sVec <- sort(vec)
  n <- length(vec)
  bottomIndex <- round((1-alpha)/2*100)
  topIndex <- round((alpha+(1-alpha)/2)*100)
  return(c(sVec[bottomIndex], sVec[topIndex]))
}


# Control flow

# indicator: returns 1 if x in ran, 0 otherwise
indicator <- function(x, ran) {
  if (length(ran) != 2) {
    print('ran must be length 2')
    return(NA)
  }
  if (ran[1] >= ran[2]) {
    print('first element of ran must be less than second element')
    return(NA)
  }
  if (x >= ran[1] & x <= ran[2]) {
    return(1)
  } else {
    return(0)
  }
}


# Loops

mySum <- function(vec) {
  runningSum <- 0
  for (i in 1:length(vec)) {
    runningSum <- runningSum + vec[i]
  }
  return(runningSum)
}
## End lecture 4/6






isUniqueWhile <- function(x, vec) {
  i <- 1
  flag <- TRUE
  while(flag & i <= length(vec)) {
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

# Printing