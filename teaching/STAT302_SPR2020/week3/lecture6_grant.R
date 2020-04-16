# Sheridan Grant
# STAT 302 SPR2020
# 4/15/2020
# Lecture 6: Data Wranglin'


# Apply()

## Identifying primes
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

primePrint <- function(x) ifelse(x, 'Prime!', 'Not prime :(')

primePrint(isPrime(1:100))  # :( vectorization didn't work

primeIndicators <- c()
for (i in 1:100) {
  primeIndicators <- c(primeIndicators, primePrint(isPrime(i)))
}
primeIndicators

sapply(1:100, function(x) primePrint(isPrime(x)))
lapply(1:100, function(x) primePrint(isPrime(x)))

## Distribution of the maximum
normals <- matrix(rnorm(10^7), 10^4, 10^3)
max(normals)

dim(normals)
maxs <- apply(normals, 2, max)
length(maxs)

means <- apply(normals, 2, mean)

hist(means)
hist(maxs)

# Packages
# Never write a script that might make others accidentally install
# install.packages('dplyr')
library(dplyr)
# require(dplyr)


# Coronavirus
covid <- read.csv("COVID-19 Cases.csv")
head(covid)
dim(covid)
colnames(covid)
colnames(covid)[1] <- 'Case_Type'
colnames(covid)
covid_original <- covid

## Filtering
levels(covid$Case_Type)
# covid <- covid[covid$Case_Type == 'Confirmed',]
covid <- covid %>% filter(Case_Type == 'Confirmed')
# covid <- filter(covid, Case_Type == 'Confirmed')

## Selecting
# covid <- covid[,c(2,4,5,6)]
covid <- covid %>% select(Cases,
                          Date,
                          Country_Region,
                          Province_State)

## New Variables
levels(covid$Date)
covid <- covid %>% mutate(Real_Date = as.Date(covid$Date,
                                              format = '%m/%d/%Y'))

## Summarize
max(covid$Cases)
covid %>% summarize(maxCount = max(Cases))
covid %>% 
  group_by(Country_Region) %>% 
  summarize(maxCount = max(Cases)) %>% 
  arrange(maxCount)

covid %>% 
  group_by(Province_State) %>% 
  summarize(maxCount = max(Cases)) %>%
  filter(Province_State == 'Hubei')

## All at once, from the top!
covid <- covid_original
covid %>% 
  filter(Case_Type == 'Confirmed') %>%
  select(Cases,
         Date,
         Country_Region,
         Province_State) %>%
  mutate(Real_Date = as.Date(Date,
                             format = '%m/%d/%Y')) %>%
  group_by(Province_State) %>% 
  summarize(maxCount = max(Cases))
