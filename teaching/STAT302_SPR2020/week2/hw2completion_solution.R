# Sheridan Grant
# STAT 302 SPR2020
# HW 2 Completion


# 1
meSaying <- "Sheridan says:"

## a
quote_me <- function(phrase) paste(meSaying, phrase)

quote_me('sup')

## b
funkyQuote <- function(phrase, groovy) {
  if (groovy) {
    paste(meSaying, 'Groovy!')
  } else {
    paste(meSaying, phrase)
  }
}

funkyQuote('sup', T)
funkyQuote('sup', F)

## c
funkyQuoteSmart <- function(phrase, groovy) {
  if (!is.character(phrase)) {
    return("Error! Input must be a character string.")
  } else{
    return(funkyQuote(phrase, groovy))
  }
}

funkyQuoteSmart('sup', F)
funkyQuoteSmart(47, F)

## d
mySD <- function(x) {
  m <- mean(x)
  ssq <- 0
  for (i in 1:length(x)) {
    ssq <- ssq + (x[i] - m)^2
  }
  return(sqrt(ssq/(length(x)-1)))
}

testVec <- rnorm(100)
sd(testVec)
mySD(testVec)