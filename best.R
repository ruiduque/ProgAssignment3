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
        
        outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        
        if (!(is.element(state, outcome_file$State))) stop("Invalid parameter setting for variable state!")
        
        if (!(is.element(outcome, list("heart attack", "heart failure", "pneumonia"))))
                stop("Invalid paraemter setting for variable outcome!")
        
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        # Create new data frame with only hospitals and mortality stats for the given state & outcome
        outcome_state <- NULL
        
        # heart attack = col11; heart failure = col17; pneumonia = col23
        if (outcome == "heart attack") 
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,11)]
        else if (outcome == "heart failure")
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,17)]
        else # Pneumonia
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,23)]
        
        # Convert to numeric and sort variable mortality rate... 
        outcome_state[,2] <- suppressWarnings(as.numeric(outcome_state[,2]))
        outcome_state <- outcome_state[order(outcome_state[,2], outcome_state[,1], na.last = NA),]
        
        outcome_state[1,1]
}