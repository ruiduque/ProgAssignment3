
# Working directory on my local github lib
setwd("/Users/ruisantos/Git/ProgAssignment3")

# Ploting the 30-day mortality rates for hearth attacks
outcomet <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

# Convert "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" to numeric and show histogram
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11], main = names(outcome)[11])

test_best <- function(statx) {
        
        # State analysis
        if ( !(is.element(statx, c("AZ","AP"))) )  stop("Invalid State")
        
         outcome[outcome$State == statx,][,c(2,11)]
         
}


my_outcome <- data.frame(index = c(11,17,23), outcome = c("heart attack", "heart failure", "pneumonia"))

my_outcome <- data.matrix(c("heart attack", "heart failure", "pneumonia"))
rownames(my_outcome) <- c(11,17,23)

t <- split.data.frame(outcomet[,c(2,7,11,17,23)],outcomet$State)
head(t)

# for heart attack
ts <- lapply(split.data.frame(outcomet[,c(2,7,11,17,23)],outcomet$State), function(x) { 
        x <- x[order(suppressWarnings(as.numeric(x[,3])), x[,1], na.last = NA),]
        x[20,c(1,2)]
        })


t1  <- do.call(rbind,ts)
class(t1)
