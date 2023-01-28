install.packages('reshape2')
library(reshape2)

pf.fc_by_age_gender.wide <- dcast(pf.fc_by_age_gender,
                                  age ~ gender, 
                                  value.var = 'median_friend_count')
head(pf.fc_by_age_gender.wide)

pf.fc_by_age_gender.wide <-subset(pf.fc_by_age_gender[c('age', 'gender', 'median_friend_count')],                   !is.na(gender)) %>%
  spread(gender, median_friend_count) %>%
  mutate(ratio = male / female)

head(pf.fc_by_age_gender.wide)

# gráfico com tudo junto
ggplot(aes(x = age, y = friend_count),
       data = subset(pf, !is.na(gender))) +
  geom_line(aes(color = gender), stat = 'summary', fun.y = median)


# Friending Rate Solution

with(subset(pf, tenure >= 1), summary(friend_count/tenure))

ggplot(aes(x = 7 * round(tenure / 7), y = friendships_initiated / tenure),
       data = subset(pf, tenure > 0)) +
  geom_line(aes(color = year_joined.bucket),
            stat = "summary",
            fun.y = mean)

# Yogurt

## Histograms Revisited
yo <- read.csv('R/yogurt.csv')
str(yo)

yo$id <- factor(yo$id)
str(yo)

## Looking at samples of houdeholds
set.seed(4230)
sample.ids <- sample(levels(yo$id), 16)

ggplot(aes(x = time, y = price),
       data = subset(yo, id %in% sample.ids)) +
  facet_wrap( ~ id) +
  geom_line() +
  geom_point(aes(size = all.purchases), pch = 1)
