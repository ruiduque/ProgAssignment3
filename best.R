# 
# best function
#
# -- this function reads the outcome-of-care-measures.csv file and returns a character
# -- vector with the name of the hospital that has the best (lowest) 30-day mortality
# -- rate for the specified outcome in that state.

best <- function(state, outcome) {
        
        ## Read outcome data
        
        # Working directory on my local github lib
        # setwd("/Users/ruisantos/Git/ProgAssignment3")
        
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        
        if (!(state %in% outcome$State)) stop("Invalid parameter setting for variable state!")
        
        if (!(outcome %in% c("heart attack", "heart failure", "pneumonia")))
                stop("Invalid paraemter setting for variable outcome!")
        
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        # First, convert "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" to numeric
        outcome[,11] <- as.numeric(outcome[,11]) 
        
        
}