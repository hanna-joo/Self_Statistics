# 기술통계(Descriptive Statistics)
library(MASS)
head(Cars93)
head(Cars93,3)
summary(Cars93)
mean(Cars93$Width)
median(Cars93$Width)
sd(Cars93$Width)
var(Cars93$Width)
quantile(Cars93$Price)

# 상관분석(Correlation Analysis)
data(mtcars)
a <- mtcars$mpg
b <- mtcars$hp
  # 분산
var(a)
var(b)
var(a,b,na.rm=FALSE) # cov(a,b)와 동일한 값
  # 공분산
cov(a,b)
cov(a,b,use="everything",method="pearson")
cov(a,b,method="kendall")
cov(a,b,method="spearman")
  # 상관관계
cor(a,b)
cor(a,b,method="pearson")   # -0.7761684
cor(a,b,method="kendall")   # -0.7428125
cor(a,b,method="spearman")  # -0.8946646
cor.test(a,b,method="pearson")  # p-value값을 통해 상관관계의 유의성 확인