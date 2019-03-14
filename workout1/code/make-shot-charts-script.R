#Title: Make shots charts Script
#Description: This script creates shot charts mapped onto a half-court image to visualize where shots are taken.
#Input: this script requires a shot-data.csv file in /data with all 5 players' data within it.
#Output: The script outputs a shot chart for each player as well as a facetted shot chart for all playersinto the images/ directory.

library('dplyr')
library('ggplot2')
library('grid')
library('jpeg')

shots <- read.csv("data/shots-data.csv", stringsAsFactors = FALSE)
klay <- filter(shots, name=="Klay Thompson")
kevin <- filter(shots, name=="Kevin Durant")
steph <- filter(shots, name=="Stephen Curry")
dray <- filter(shots, name=="Draymond Green")
andre <- filter(shots, name=="Andre Iguodala")

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_plot <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
klay_plot
dev.off()

pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_plot <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
andre_plot
dev.off()

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
steph_plot <- ggplot(data = steph) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
steph_plot
dev.off()

pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
dray_plot <- ggplot(data = dray) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dray_plot
dev.off()

pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_plot <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
kevin_plot
dev.off()

pdf(file = "images/gsw-shot-chart.pdf", width = 8, height = 7)
gsw_plot <- ggplot(data = shots) +
  facet_wrap(~ name, ncol=3) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme(legend.position = "top")
gsw_plot
dev.off()

png("images/gsw-shot-charts.png", width = 8, height = 7, units="in", res=72)
gsw_plot
dev.off()
