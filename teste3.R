## gráficos de dispersão

library(ggplot2)
pf <- read.csv('R/pseudo_facebook.tsv', sep = '\t')

qplot(x = age, y = friend_count, data = pf)
qplot(age, friend_count, data = pf)

## ggplot Syntax
library(ggplot2)
qplot(x = age, y = friend_count, data = pf) + geom_point()

summary(pf$age)

## Overplotting

library(ggplot2)
ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(alpha = 1/20) +
  xlim(13, 90) 

## coord_trans
library(ggplot2)
ggplot(aes(x = age, y = friend_count), data = pf) +
  geom_point(alpha = 1/20) +
  xlim(13, 90) +
  coord_trans(y = 'sqrt')

## Overlaying 

ggplot(aes(x = age, y = friend_count), data = pf) +
xlim(13, 90) + 
  geom_point(alpha = 0.05,
             position = position_jitter(h = 0),
             color = 'orange') +
  geom_line(stat = 'summary', fun.y = mean) +
  geom_line(start = 'summary', fun.y = quantile, probs = .1,
            linetype = 2, color = 'blue') + 
  geom_line(start = 'summary', fun.y = quantile, probs = .9,
            linetype = 2, color = 'blue')


## Correlation

with(subset(pf, age < 70), cor.test(age, friend_count))


## strong correlations
library(ggplot2)
ggplot(aes( x = www.likes_received, y = likes_received), data = pf) +
  geom_point() +
  xlim(0, quantile(pf$www.likes_received, 0.95)) +
  ylim(0, quantile(pf$likes_receid, 0.95)) +
  geom_smooth(method = 'lm', color = 'red')


## Smoothing Conditional Means

ggplot(data = diamonds, aes(x = depth, y = price)) + 
  geom_point()


ggplot(aes(x = age, y = friend_count),
    data = subset(pf, !is.na(gender))) + 
    geom_line(aes(color = gender), stat = 'summary', fun.y = median)

