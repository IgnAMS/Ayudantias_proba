# Ayudantia catedra 4

# 1
pnorm(40, mean=30, sd=12, lower.tail=F)
qnorm(0.4, mean=30, sd=12)
pnorm(36, mean=30, sd=12) - pnorm(24, mean=30, sd=12)


# 2
library(rio)
data = import(file.choose(), dec=".")
head(data)

# a)
hist((data$Close - data$Open), freq=F, breaks=50)

# b)
X = data$Close - data$Open
mu = mean(X)
sigma = sd(X)
summary(X)

# c)
curve(dnorm(x, mean=mu, sd=sigma), add=T, lwd=3) 

# d)
pnorm(mu + 100, mean=mu, sd=sigma) - pnorm(mu - 100, mean=mu, sd=sigma)
mean(abs(mu - X) < 100)

pnorm(100, mu, sigma)
mean(X < 100)

# e)
pnorm(100, mu, sigma) - pnorm(-100, mu, sigma)
mean(abs(X) < 100)

# f)
Z = subset(data, data$Close - data$Open < 0)
Z



# 3
mu = 180 / (qnorm(2/3) + 3)
sigma = mu / 3
qnorm(1/4, mean=mu, sd=sigma, lower.tail=F)
