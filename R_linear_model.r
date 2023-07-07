# Import needed libraries
library(ggplot2)

# Set notebook variables

filename = "regrex1.csv"

# Read regrex1.csv file
dataset = read.csv(filename)
dataset

# Fitting Linear Regression to the Dataset
model = lm(formula = y ~ x,
               data = dataset)

# Scatter plot of original dataset
png("r_orig.png")
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'red') +  ggtitle('Raw y vs. x') +
  xlab('x') +
  ylab('y')
dev.off()

# Linear model of data set
ggplot() + geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Linear Model of y vs. x') +
  xlab('x') +
  ylab('y')

# Visualize the Linear Regression

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