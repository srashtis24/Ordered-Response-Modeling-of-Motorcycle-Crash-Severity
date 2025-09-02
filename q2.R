# Load libraries
setwd("C:/Users/Hp/Downloads/CE687_Lab_Ordered_Response_52bc21f3-b49e-4afc-9c77-09d21dac5835")
library(tidyverse)
library(MASS)

# Load data
dat <- read.csv("Michigan_Motorcycle_Non_Intersection_Data_Subset.csv", stringsAsFactors = TRUE)

# Define Injury_Severity (ordered response variable)
dat$Injury_Severity <- 0
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Possible Injury (C)"] <- 1
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Suspected Minor Injury (B)"] <- 2
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Suspected Serious Injury (A)"] <- 3
dat$Injury_Severity[dat$Worst.Injury.in.Crash == "Fatal Injury (K)"] <- 4
dat$Injury_Severity <- as.factor(dat$Injury_Severity)

# Original explanatory variables
dat$Urban <- as.numeric(dat$Rural.Urban.Area == "Urban")
dat$Pedestrian <- as.numeric(dat$Crash..Pedestrian == "Pedestrian Involved")
dat$Late_Night <- as.numeric(dat$Time.of.Day %in% c("12:00 Midnight - 12:59 AM", "1:00 AM - 1:59 AM", 
                                                    "2:00 AM - 2:59 AM", "3:00 AM - 3:59 AM", 
                                                    "4:00 AM - 4:59 AM"))
dat$Parked_Vehicle <- as.numeric(dat$Crash..Lane.Departure == "Parked Vehicle")

#New explanatory variables from Question 1
dat$Wet_Road <- as.numeric(dat$Road.Conditions == "Wet")
dat$Young_Driver <- as.numeric(dat$Crash..Young.Driver %in% c("Driver Age 15-24", "Driver Age 16", 
                                                              "Driver Age 17", "Driver Age 18-20", 
                                                              "Driver Age 21-24"))
dat$Single_Vehicle <- as.numeric(dat$Crash.Type == "Single Motor Vehicle")

# Fit the updated ordered probit model
m1_probit <- polr(Injury_Severity ~ Speed.Limit.at.Crash.Site + Urban + Pedestrian + 
                    Parked_Vehicle + Late_Night + Wet_Road + Young_Driver + Single_Vehicle, 
                  data = dat, method = "probit")

# Display model summary
summary(m1_probit)
logLik(m1_probit)

#Logit Model
m2_logit <- polr(Injury_Severity ~ Speed.Limit.at.Crash.Site + Urban + Pedestrian + 
                   Parked_Vehicle + Late_Night + Wet_Road + Young_Driver + Single_Vehicle, 
                 data = dat, method = "logistic")
summary(m2_logit)
logLik(m2_logit)
