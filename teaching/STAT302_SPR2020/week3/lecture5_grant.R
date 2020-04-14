# Sheridan Grant
# STAT 302 SPR2020
# 4/13/2020
# Lecture 5: Working with Data


# Lists

## Vectors (review)
vec <- c(1,4,7)
vec <- c(1, 4, 'hi')

## Lists
myList <- list(1, 4, 'hi', TRUE, c(1,4,7))
myList[[5]][3]
myList[2]
myList[2:3]

is.list(myList[2])
is.list(myList[[2]])

namedList <- list(int = 47, char = 'groovy!', logic = FALSE)

## Naming vectors
vec <- c(one = 1, two = 2, three = 3)


# Data Frames

## Old Faithful
faithful
head(faithful)
faithful$waiting

### Indexing
faithful[3,]
faithful[1:5,]
faithful[1:5,2]
faithful[1:5,'waiting']
faithful$waiting[1:5]

for (i in 1:2) {
  print(mean(faithful[,i]))
}

colnames(faithful)
for (column in colnames(faithful)) {
  print(mean(faithful[,column]))
}

#### Waiting Times
sd(faithful[,2])
sd(faithful$waiting)
hist(faithful$waiting)

#### Logicals
faithful$waiting[1:5][c(T, F, T, F, T)]

##### How many waiting times shorter than an hour?
mean(faithful$waiting < 60)

##### Histogram of waiting times shorter than an hour
hist(faithful[faithful$waiting < 60, 'waiting'])

#### Eruption length for short waiting times
mean(faithful[faithful$waiting < 60, 'eruption'])
mean(faithful$eruptions[faithful$waiting < 60])


## Coronavirus
covid <- read.csv("COVID-19 Cases.csv")
head(covid)
dim(covid)
levels(covid$Province_State)
head(covid[covid$Province_State == 'Washington',])
colnames(covid)
colnames(covid)[1] <- 'Case_Type'
colnames(covid)
covid[covid$Province_State == 'Washington' & covid$Case_Type == 'Confirmed', 'Cases']
head(covid[covid$Province_State == 'Washington' & covid$Case_Type == 'Confirmed' & covid$Date == '3/15/2020' & covid$Admin2 == 'King',])
covid[covid$Province_State == 'Washington' & covid$Case_Type == 'Confirmed' & covid$Admin2 == 'King', c('Cases', 'Date')]
kingCases <- covid[covid$Province_State == 'Washington' & covid$Case_Type == 'Confirmed' & covid$Admin2 == 'King', 'Cases']
sort(kingCases)
plot(sort(kingCases))


