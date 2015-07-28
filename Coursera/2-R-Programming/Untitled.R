outcome = "pneumonia"
num = "worst"
outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)     
## Keep only the variables we need for the analysis
outcomes <- outcomes[, c(2, 7, 11, 17, 23)]
## Rename them for convenience
colnames(outcomes) <- c("name", "State", "heart_attack", "heart_failure", "pneumonia")
outcome <- sub('\\ ', '_', outcome)
## Transform them to numeric
outcomes[,3]  = suppressWarnings(as.numeric(outcomes[,3]))
outcomes[,4]  = suppressWarnings(as.numeric(outcomes[,4]))
outcomes[,5]  = suppressWarnings(as.numeric(outcomes[,5]))

## Check that state and outcome are valid
if(!is.element(outcome, names(outcomes))) {
  stop("invalid outcome")
  
  ## If they are, proceed with the analysis ( ++ taking out the NAs form the ranking)
} else {
  if(outcome == "heart_attack") {
    ##c = 3
    outcomes <- outcomes[order(outcomes$heart_attack, outcomes$name, na.last = NA), ]
  } else if(outcome == "heart_failure") {
    ##c = 4
    outcomes <- outcomes[order(outcomes$heart_failure, outcomes$name, na.last = NA), ]
  } else{ 
    ##c= 5
    outcomes <- outcomes[order(outcomes$pneumonia, outcomes$name, na.last = NA), ]
    
  }
}
df <- data.frame(hospitals = character(0), states = character(0))
df$states <- as.factor(df$states)

hospitals = character(0)

for(s in sort(unique(outcomes$State))) {
  out <- outcomes[outcomes$State == s, ]  ## We need all states now
  if(num == "best") {
    num = 1
    print("BEST")
  } else if(num == "worst") {
    print("WORST")
    num <- nrow(out)
  } else if(length(out$name) < num){
    print("NA")
    ans <- NA
  } else {
    print("GOOD")
    ans <- out[num, 1]
  }
  ans <- out[num, 1]
  hospitals <- c(hospitals, ans)
}

final <- data.frame(hospital = hospitals, state = sort(unique(outcomes$State)))
final <- final[order(final$state), ]
