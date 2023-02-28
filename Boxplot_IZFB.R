library(openxlsx)
library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(magrittr)


rm(list=ls())
getwd()

data <- read.xlsx("RCF4 boxplot.xlsx")
name<- data$names
value<- data$values
data<- data.frame(name, value)

data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_manual(values=c("pink", "purple")) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  scale_y_continuous(minor_breaks = seq(0, 15, 2.5), limits=c(0,15))+
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("RCF4 boxplot") +
  xlab("")
#dev.off()
