
rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        # Working directory on my local github lib
        # setwd("/Users/ruisantos/Git/ProgAssignment3")
        
        outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state, outcome and num are valid
        
        if (!(is.element(state, outcome_file$State))) stop("Invalid parameter setting for variable state!")
        
        if (!(is.element(outcome, list("heart attack", "heart failure", "pneumonia"))))
                stop("Invalid paraemter setting for variable outcome!")        
        
        if (!(is.element(num, list("best", "worst")))) {
                if (!(is.numeric(num))) stop("Invalid parameter setting for variable num!")
        }
        
        
        
        ## Return hospital name in that state with the given rank
        
        # Create new data frame with only hospitals and mortality stats for the given state & outcome
        # heart attack = col11; heart failure = col17; pneumonia = col23
        outcome_state <- NULL
        
        if (outcome == "heart attack") 
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,11)]
        else if (outcome == "heart failure")
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,17)]
        else # Pneumonia
                outcome_state <- outcome_file[outcome_file$State == state,][,c(2,23)]
        
        # Convert to numeric and sort variable mortality rate... 
        outcome_state[,2] <- as.numeric(outcome_state[,2]) 
        outcome_state <- outcome_state[order(outcome_state[,2], outcome_state[,1], na.last = NA),]
        
        
        ## 30-day death rate        
        index <- NULL
        max_row <- nrow(outcome_state)
        if (num == "best") index <- 1
        else if (num == "worst") {
                index <- max_row
        }
        else index <- num
        
#        if (!(is.null(index))) {
#                if (num <= max_row) {
#                        outcome_state[num,1]
#                }
#                else NA
#        }
        
        outcome_state[index,1]
}