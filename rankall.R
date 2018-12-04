
rankall <- function(outcome, num = "best") {
        
        ## Read outcome data
        # Working directory on my local github lib
        # setwd("/Users/ruisantos/Git/ProgAssignment3")
        
        outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that outcome and num are valid
        if (!(is.element(outcome, list("heart attack", "heart failure", "pneumonia"))))
                stop("Invalid paraemter setting for variable outcome!")        
        
        if (!(is.element(num, list("best", "worst")))) {
                if (!(is.numeric(num))) stop("Invalid parameter setting for variable num!")
        }
        
        
        ## Generate indexes to access the outcome variables:
        # heart attack = col11; heart failure = col17; pneumonia = col23
        outc <- numeric()
        if (outcome == "heart attack") outc <- 11
        else if (outcome == "heart failure") outc <- 17
        else outc <- 23
        
        ## For each state, find the hospital of the given rank
        mylist <- NULL
        mylist <- lapply(split.data.frame(outcomet[,c(2,7,outc)],outcomet$State),
                         function(x) { 
                                 x <- x[order(suppressWarnings(as.numeric(x[,3])), x[,1], na.last = NA),]
                                 # Best, worst, etc
                                 x[20,c(1,2)]
                         })
        
        
        ## Return data frome with hospital names and abreviated state name
        myframe <- NULL
        myframe  <- do.call(rbind,mylist)
}