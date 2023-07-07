library(ggplot2)

filename = "regrex1.csv"

dataset = read.csv(filename)
dataset

model = lm(formula = y ~ x,
               data = dataset)

png("r_orig.png")
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +  ggtitle('Raw y vs. x') +
  xlab('x') +
  ylab('y')
dev.off()

ggplot() + geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Linear Model of y vs. x') +
  xlab('x') +
  ylab('y')

png("r_lm.png")
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Linear Regression y vs. x') +
  xlab('x') +
  ylab('y')
dev.off()