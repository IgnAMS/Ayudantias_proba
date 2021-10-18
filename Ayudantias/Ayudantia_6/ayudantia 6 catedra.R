# Ayudantai 6 catedra

# Problema 1
# a)
qnorm(0.25) 
qnorm(0.75)
# Wolframear el solve
zeta = 0.218952
lambda = 7.87522
plnorm(1520, meanlog=lambda, sdlog=zeta) - plnorm(1300, meanlog=lambda, sdlog=zeta)
qlnorm(0.1, meanlog=lambda, sdlog=zeta) - 1520


# Problema 3
library(rio)
data = import(file.choose(), dec=".")
head(data)

# a)
zeta = sqrt(log(1 + sigma^2 / mu^2, exp(1)))
lambda = log(mean(data$HDL)) - zeta^2/2
zeta
lambda

# b)
hist(data$HDL, freq=F, breaks=50)
curve(dlnorm(x, meanlog=lambda, sdlog=zeta), add=T, lwd=3) 

# c) 
p = plnorm(40, meanlog=lambda, sdlog=zeta)
p

# d)
# 1 - pbinom(5, size=n, prob = 1-p) >= 0.9
x = 6
while(1 - pbinom(5, x, 1-p) < 0.9) {
  print(1 - pbinom(5, x, 1-p))
  x = x+1
}
x
1 - pbinom(5, x, 1 - p)








