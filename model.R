# vi estimerer en  model 

message("load dataset")

library(datasets)

# regression
model <- lm(cars$speed ~ cars$dist)

message("resultater")
print(model)

save(model, file = "model.rda")