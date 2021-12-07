mu_real = 72/124
p0 = 2/3
n = 124

z0 = (mu_real - p0) / sqrt(p0 * (1 - p0) / n)
pnorm(z0)
prop.test(x=)
?prop.test()
prop.test(x=72, n=124, p=p0, alternative = "less", correct=F)

library(TeachingDemos)

t0 = (16 - 20) / (12 / sqrt(28))
pt(t0, df=28-1)

c0 = (28-1) * 12^2 / 10^2
1 - pchisq(c0, df=28-1)



theta = 4.611766
pnorm(30, 25*theta / (theta - 1), 25/(theta-1)^2) / sqrt(n / theta^2)


