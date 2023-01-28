
# getwd()
# list.files()
# pf <- read.csv('R/pseudo_facebook.tsv', sep ='\t')
# names(pf)

# library(ggplot2)


# names(pf)
# qplot(x = dob_day, data = pf) +
#  scale_x_continuous(breaks = 1:31) +
#  facet_wrap(~dob_month, ncol = 3)

qplot(x = friend_count, data = subset(pf, !is.na(gender)), xlim = c(0, 1000))

qplot(x = friend_count, data = subset(pf, !is.na(gender)), binwidth = 10) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender) # dividindo o grafico por genero

# statistics 'by' Gender
table(pf$gender)
by(pf$friend_count, pf$gender)

## Tenure

qplot(x = tenure, data = pf, binwidth = 30, 
      color = I('black'), fill = I('#099DD9'))

qplot(x = tenure/365, data = pf,
      xlab = 'Number of years using Facebook',
      ylab = 'Number of users in sample',
      color = I('black'), fill = I('#F79420')) +
  scale_x_continuous(breaks = seq(1,7,1), lim = c(0, 7))

install.packages('gridExtra')
library(gridExtra)

qplot(x = friend_count, data = pf)

summary(pf$friend_count)

summary(log10(pf$friend_count + 1))

# add a scaling layer

logScale <- qplot(x = log10(friend_count), data = pf)

countScale <- ggplot(aes(x = friend_count), data = pf) +
  geom_histogram() +
  scale_x_log10()

grid.arrange(logScale, countScale, ncol = 2)

ggplot(aes(x = friend_count), data = pf) + scale_x_log10()


## frequency polygons (before we had histogram)
ggplot(aes(x = friend_count, y = ..count../sum(..count..)), data = subset(pf, !is.na(gender))) +
  geom_freqpoly(aes(color = gender), binwidth=10) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  xlab('Friend Count') +
  ylab('Percentage of users with that friend count')

## Likes on the web solution

by(pf$www_likes, pf$gender, sum) # soma


# box plots
qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)), 
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1000))

by(pf$friend_count, pf$gender, summary)

## Getting Logical Solution

summary(pf$mobile_check_in)
sum(pf$mobile_check_in == 1)/length(pf$mobile_check_ind)
