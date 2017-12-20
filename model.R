# vi estimerer en  model 

message("load dataset")

library(datasets)

# regression
model <- lm(cars$speed ~ cars$dist)

message("resultater")
print(model)

# Vi gemmer
save(model, file = "model.rda")




message("hej hej")
 

what_a_function <- function(){



return(1)



}

message("nu er hotfix et rettet og vi prøver igen")
