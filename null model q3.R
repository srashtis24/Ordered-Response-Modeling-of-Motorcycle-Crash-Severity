setwd("C:/Users/Hp/Downloads/CE687_Lab_Ordered_Response_52bc21f3-b49e-4afc-9c77-09d21dac5835")
library(tidyverse)
library(MASS)



######crash data#########
dat<-read.csv("Michigan_Motorcycle_Non_Intersection_Data_Subset.csv",stringsAsFactors = T)

# Define Injury_Severity based on Worst.Injury.in.Crash
dat$Injury_Severity <- 0  # Initialize with 0
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Possible Injury (C)"] <- 1
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Suspected Minor Injury (B)"] <- 2
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Suspected Serious Injury (A)"] <- 3
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Fatal Injury (K)"] <- 4
dat$Injury_Severity <- as.factor(dat$Injury_Severity)  # Convert to factor for ordered model

# Fit the intercept-only (null) model
null_probit <- polr(Injury_Severity ~ 1, data = dat, method = "probit")

# Display summary
summary(null_probit)
# Fit the intercept-only (null) model
null_logit <- polr(Injury_Severity ~ 1, data = dat, method = "logistic")

# Display summary
summary(null_logit)
