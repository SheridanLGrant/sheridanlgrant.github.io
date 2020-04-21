# Sheridan Grant
# STAT 302 SPR2020
# 4/15/2020
# Lecture 6: Data Wranglin'


# Preliminaries
library(dplyr)


# 1

## a
bobby <- list(char = c('sheridan', 'lloyd', 'grant'), vec = 1:10)
as.data.frame(bobby)  ## columns are relatively prime in length

## b
antoni <- matrix(1:6, 3, 2)
rownames(antoni) <- c('one', 'two', 'three')
colnames(antoni) <- c('one', 'two')
dim(antoni)
rownames(antoni)
colnames(antoni)

## c
karamo <- array(1:210, c(210, 1, 1, 1))  # technically correct
karamo <- array(1:210, c(2, 3, 5, 7))  # more interesting
length(karamo)

## d
jonathan <- apply(karamo, c(2,3), sum)
dim(jonathan)
jonathan

## e
tan <- bobby
is.atomic(tan)


# 2

## a
x <- matrix(runif(10^5), 10^2, 10^3)

## b
hist(apply(x, 2, median),
     xlab = 'Unif Sample Medians',
     main = 'Distribution of Uniform Sample Medians')

hist(apply(x, 2, function(y) quantile(y, 0.9)),
     xlab = 'Unif Sample 90th Quantiles',
     main = 'Distribution of Uniform Sample 90th Quantiles')

## c
skew <- function(x) mean(((x-mean(x))/sd(x))^3)
skew(1:100)
skew(c(4,4,7))
skew(c(4,7,7))

## d
qs <- (0:100)/100
weks <- sapply(qs, function(q) skew(apply(x, 2, function(y) quantile(y, q))))
plot(qs, weks, 'l')
# There is no skew of the median, but the skew becomes increasingly positive
# (right-skew) as the quantile gets closer to the min, and conversely for
# larger quantiles.

# 3
covid <- read.csv("COVID-19 Cases.csv")
head(covid)
dim(covid)
colnames(covid)
colnames(covid)[1] <- 'Case_Type'
colnames(covid)

## a
kingCases <- covid %>% 
  filter(Case_Type == "Confirmed",
         Province_State == 'Washington',
         Admin2 == 'King') %>% 
  select(Date, Cases) %>% 
  mutate(Date = as.Date(Date, format = '%m/%d/%Y')) %>% 
  arrange(Date)

plot(kingCases$Date, kingCases$Cases, type = 'l', col = 'blue',
     xlab = 'Date', ylab = 'Confirmed Cases',
     main = 'King Country COVID-19 Confirmed Cases')

## b
kingDeaths <- covid %>% 
  filter(Case_Type == "Deaths",
         Province_State == 'Washington',
         Admin2 == 'King') %>% 
  select(Date, Cases) %>% 
  mutate(Date = as.Date(Date, format = '%m/%d/%Y')) %>% 
  arrange(Date)

points(kingDeaths$Date, kingDeaths$Cases, type = 'l', col = 'red')

legend(18285, 4000, legend = c('Confirmed', 'Deaths'), fill = c('Blue', 'Red'))

## c

### Simplified version that assumes data for April 1 is available
covid %>% 
  mutate(Date = as.Date(Date, format = '%m/%d/%Y')) %>%
  filter(Date == '2020-04-01', Case_Type == 'Confirmed') %>% 
  group_by(Country_Region) %>% 
  summarize(totalCases = sum(Cases)) %>%
  arrange(desc(totalCases))

### Full version that uses the fact that confirmed cumulative cases
### increase over time so that you can find the max before April 1
covid %>% 
  mutate(Date = as.Date(Date, format = '%m/%d/%Y')) %>%
  filter(Date <= '2020-04-01', Case_Type == 'Confirmed') %>% 
  group_by(Country_Region, Province_State, Admin2) %>%
  summarize(maxCases = max(Cases)) %>%
  ungroup() %>%
  group_by(Country_Region) %>%
  summarize(totalCases = sum(maxCases)) %>%
  arrange(desc(totalCases))
