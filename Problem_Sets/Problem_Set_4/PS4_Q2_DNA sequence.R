s <- sample(c("A","C","G","T"),10,replace = T)
print(s)
s2 <- sample(c("A","C","G","T"),10,replace = T,prob = c(0.25,0.3,0.25,0.2))
print(s2)

#paste0 (collapse ="") concatenate strings together
s1 <- paste0(s,collapse = "")
print(s1)
