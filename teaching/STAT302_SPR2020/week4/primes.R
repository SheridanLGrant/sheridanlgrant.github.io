# Sheridan Grant
# STAT 302 SPR2020
# 4/20/2020
# Prime Functions


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
print('Testing isPrime on 1:10:')
print(sapply(1:10, isPrime))
print(paste('Sourcing runs all code in the source file,',
            'including print statements,',
            'things that will crash your server, etc.'))