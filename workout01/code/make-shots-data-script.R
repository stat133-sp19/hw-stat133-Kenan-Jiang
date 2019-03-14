#title: make short datasets
#description: process the the five .csv files, give summary for each
#input: .csv files for five players
#output: .txt files as summary, .csv as a combined dataset

library(dplyr)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala <- mutate(iguodala, name = "Andre Iguodala")
iguodala$name <- as.factor(iguodala$name)
green <- mutate(green , name = "Draymond Green")
green$name <- as.factor(green$name)
durant <- mutate(durant, name = "Kevin Durant")
durant$name <- as.factor(durant$name)
thompson <- mutate(thompson, name = "Klay Thompson")
thompson$name  <- as.factor(thompson$name)
curry <- mutate(curry, name = "Stephen Curry")
curry$name <- as.factor(curry$name)

iguodala <- mutate(iguodala, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
green <- mutate(green, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
durant <- mutate(durant, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
thompson <- mutate(thompson, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
curry  <- mutate(curry, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))

iguodala <- mutate(iguodala, minute = 12*period + (12-minutes_remaining))
green <- mutate(green, minute = 12*period + (12-minutes_remaining))
durant <- mutate(durant, minute = 12*period + (12-minutes_remaining))
thompson <- mutate(thompson, minute = 12*period + (12-minutes_remaining))
curry <- mutate(curry, minute = 12*period + (12-minutes_remaining))

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = '../output/stephen-curry.txt')
summary(curry)
sink()

shots_data <- rbind(iguodala, green, durant, thompson, curry)
write.csv(shots_data, file = '../data/shots-data.csv')
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()

