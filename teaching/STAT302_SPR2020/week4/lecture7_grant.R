# Sheridan Grant
# STAT 302 SPR2020
# 4/15/2020
# Lecture 6: Data Wranglin'


# Sourcing
source('primes.R')
isPrime(20000000089)


# Plotting
head(faithful)

## Points
plot(faithful$waiting, faithful$eruptions)
# plot(faithful)  # Don't do this! Show us what you did with your code

plot(faithful$waiting, faithful$eruptions,
     main = 'Old Faithful Eruption Lengths',
     xlab = 'Wait Time to Eruption, min.', ylab = 'Eruption Duration, min.')

plot(faithful$waiting, faithful$eruptions,
     main = 'Old Faithful Eruption Lengths',
     xlab = 'Wait Time to Eruption, min.', ylab = 'Eruption Duration, min.',
     col = 'blue', pch = 10)

points(c(rnorm(100, 53, 3), rnorm(100, 82, 4)),
       c(rnorm(100, 2, 0.3), rnorm(100, 4.5, 0.4)),
       col = 'red', pch = 20)

## Lines
plot(faithful$eruptions,
     main = 'Old Faithful Eruption Lengths Over Time',
     xlab = 'Eruption Number', ylab = 'Eruption Duration, min.',
     type = 'l')

ma <- function(x, window = 10) {
  sapply((window):length(x), function(i) mean(x[(i-window+1):i]))
}

plot(ma(faithful$eruptions),
     main = 'Old Faithful Eruption Lengths Over Time',
     sub = '10-day moving average',
     xlab = 'Eruption Number', ylab = 'Eruption Duration, min.',
     type = 'l')

lines(ma(faithful$waiting/20),
      col = 'red')

par(mfrow=c(2,2))

for (w in c(3, 6, 12, 24)) {
  plot(ma(faithful$eruptions, w),
       main = 'Old Faithful Eruption Lengths Over Time',
       sub = paste0(w, '-day moving average'),
       xlab = 'Eruption Number', ylab = 'Eruption Duration, min.',
       type = 'l')
}
