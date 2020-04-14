# Sheridan Grant
# STAT 302 SPR2020
# 4/15/2020
# HW 3 Completion Solutions


# 1
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


