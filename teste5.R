library('ggplot2')

ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point(color='#F79420', alpha=1/4) +
  stat_smooth(method = 'lm') +
  scale_x_continuous(lim = c(0, quantile(diamonds$carat, 0.99))) +
  scale_y_continuous(lim = c(0, quantile(diamonds$price, 0.99)))

install.packages('GGally')
install.packages('scales')
install.packages('memisc')
