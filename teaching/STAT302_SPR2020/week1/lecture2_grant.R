# Sheridan Grant
# STAT 302 SPR 2020
# 4/1/2020


# HW 1 Completion (Optional)
c(1,4,7,10)
c(1,4,7,10) %% 2
(c(1,4,7,10) %% 2) == 0
which((c(1,4,7,10) %% 2) == 0)
c(1,4,7,10)[which((c(1,4,7,10) %% 2) == 0)]
sum(c(1,4,7,10)[which((c(1,4,7,10) %% 2) == 0)])


# Functions
sum(1:100)
sd(1:100)

?pnorm
pnorm(0)
pnorm(0, 1)

?cor
cor(c(1,2,3,4,5), c(1,2,3,4,5))
rev(c(1,2,3,4,5))
cor(c(1,2,3,4,5), rev(c(1,2,3,4,5)))


# Variable assignment
rick <- 4
rick
rick + 7
rick + morty
morty <- 7
rick * morty
rick <- 47
rick - morty

rick <- morty
rick + morty

x <- c(1,2,3,4,5)
y <- x
y <- rev(y)
cor(x,x)
cor(x,y)
cor(x, rev(x))


# Data types
x1 <- 4
x2 <- c(3,4,5)
x3 <- 4.5

meeseeks + 4
meeseeks <- 7
meeseeks + 4