library(jpeg)
library(grid)
library(dplyr)
library(ggplot2)
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
# for klay thompson
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson <- mutate(thompson, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
klay_short_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
pdf("../images/klay-thompson-shot-chart.pdf",width=6.5,height=5)
klay_short_chart
dev.off()

# for andre-iguodala
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala <- mutate(iguodala, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
andre_short_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart:Aandre Iguodala (2016 season)') +
  theme_minimal()
pdf("../images/andre-iguodala-shot-chart.pdf",width=6.5,height=5)
andre_short_chart
dev.off()

# for draymond-green
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
green <- mutate(green, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
green_short_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart:Graymond Green (2016 season)') +
  theme_minimal()
pdf("../images/draymond-green-shot-chart.pdf",width=6.5,height=5)
green_short_chart
dev.off()

# for kevin-durant
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
durant <- mutate(durant, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
durant_short_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart:Kevin Durant (2016 season)') +
  theme_minimal()
pdf("../images/kevin-durant.pdf",width=6.5,height=5)
durant_short_chart
dev.off()

# for stephen-curry
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
curry <- mutate(curry, shot_made_flag = ifelse(shot_made_flag == "y", "shot_yes", "shot_no"))
curry_short_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart:Stephen Curry (2016 season)') +
  theme_minimal()
pdf("../images/curry-shot-chart.pdf",width=6.5,height=5)
curry_short_chart
dev.off()

#combined
shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
facetted <- ggplot(data = shots_data) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle('Shot Chart:GSW (2016 season)') + theme_minimal() + facet_wrap(~ name) + theme_minimal()
pdf("../images/gsw-shot-charts.pdf",width=8,height=7)
facetted
dev.off()
png("../images/gsw-shot-charts.jpg", 600, 500)
facetted
dev.off()

