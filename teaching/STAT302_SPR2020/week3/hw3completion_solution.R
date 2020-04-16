# Sheridan Grant
# STAT 302 SPR2020
# 4/15/2020
# HW 3 Completion Solutions


# 1

## a
## Point in time snapshot of to-date totals (i.e., Mar 22 is inclusive of all prior dates)

## b

## c
covid <- read.csv("COVID-19 Cases.csv")
colnames(covid)
colnames(covid)[1] <- 'Case_Type'
colnames(covid)

## d
max(covid[covid$Province_State == 'Hubei' & covid$Case_Type == 'Confirmed', 'Cases'])