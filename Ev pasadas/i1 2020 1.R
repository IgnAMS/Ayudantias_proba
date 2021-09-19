#######################################
#             I1 - 2020 - 1           #
#######################################


# Pregunta 1.2
a = 0.3
b = 0.4 
b_a = 0.15
a + b - (1 - b_a) * a


# Pregunta 2.1

1 - choose(30, 2) / choose(34, 2)


# Pregunta 3.1
0.5 *  0.1 / (0.3 * 0.09 + 0.5 * 0.1 + 0.6 * 0.93)

# Pregunta 3.2
b_f = 0.75 # Bebe dado qeu fuma
f_b = 2/3 # Fuma dado que bebe
f = 0.41 
b = (b_f * f) / f_b
b
1 - (f + b - f_b * b)


# Pregunta 3.3
1 - (0.35 * 0.26 + 0.5 * 0.14 + 0.15 * 0.06)

# Pregunta 4.1


# Pregunta 4.2


# Pregunta 4.3 wolframeable
X = data.frame(x=c(0, 1, 2, 3), p=c(0.4, 0.3, 0.2, 0.1))
Y = data.frame(y=c(0, 1, 2, 3), p=c(0.2, 0.3, 0.4, 0.1))
ds(X) / mean(X)
sd(X)
X








