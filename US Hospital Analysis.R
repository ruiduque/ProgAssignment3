
# Working directory on my local github lib
setwd("/Users/ruisantos/Git/ProgAssignment3")

# Ploting the 30-day mortality rates for hearth attacks
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

# Convert "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" to numeric and show histogram
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11], main = names(outcome)[11])

# State analysis
states <- unique(outcome$State)
states    
