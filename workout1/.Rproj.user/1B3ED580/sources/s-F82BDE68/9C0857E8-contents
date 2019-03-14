#Title: Make shots Script
#Description: This script unifies the data from the separate player .csv's into a master shots-data.csv. 
#  Also cleans data fields to be more readable for a user.
#Input: this script requires stephen-curry.csv, andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv
#  in the /data directory of the working directory
#Output: The script outputs a summary.txt file for each of the inputs as well as a consolidated csv file for all the player data in /outputs.


curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)

library('dplyr')
curry <- mutate(curry, name="Stephen Curry")
iguodala <- mutate(iguodala, name="Andre Iguodala")
green <- mutate(green, name="Draymond Green")
durant <- mutate(durant, name="Kevin Durant")
thompson <- mutate(thompson, name="Klay Thompson")

curry[which(curry$shot_made_flag == 'n'),]['shot_made_flag'] = 'shot_no'
curry[which(curry$shot_made_flag == 'y'),]['shot_made_flag'] = 'shot_yes'
iguodala[which(iguodala$shot_made_flag == 'n'),]['shot_made_flag'] = 'shot_no'
iguodala[which(iguodala$shot_made_flag == 'y'),]['shot_made_flag'] = 'shot_yes'
green[which(green$shot_made_flag == 'n'),]['shot_made_flag'] = 'shot_no'
green[which(green$shot_made_flag == 'y'),]['shot_made_flag'] = 'shot_yes'
durant[which(durant$shot_made_flag == 'n'),]['shot_made_flag'] = 'shot_no'
durant[which(durant$shot_made_flag == 'y'),]['shot_made_flag'] = 'shot_yes'
thompson[which(thompson$shot_made_flag == 'n'),]['shot_made_flag'] = 'shot_no'
thompson[which(thompson$shot_made_flag == 'y'),]['shot_made_flag'] = 'shot_yes'

curry <- mutate(curry, minute=12*period - minutes_remaining)
iguodala <- mutate(iguodala, minute=12*period - minutes_remaining)
green <- mutate(green, minute=12*period - minutes_remaining)
durant <- mutate(durant, minute=12*period - minutes_remaining)
thompson <- mutate(thompson, minute=12*period - minutes_remaining)

sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)
sink()

all <- rbind(curry, iguodala, green, durant, thompson)
write.csv(all, file = 'data/shots-data.csv')
sink(file = 'output/shots-data-summary.txt')
summary(all)
sink()
