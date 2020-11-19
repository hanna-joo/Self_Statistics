# 데이터 변형

# 1. 주요코드
  # 요인으로 집단 정의 
v<-c(24,23,52,46,75,25)
w<-c(87,86,92,84,77,68)
f<-factor(c("A","A","B","B","C","A"))

  # 벡터를 여러 집단으로 분할
groups<-split(v,f)
groups
groups<-split(w,f)
groups
groups<-unstack(data.frame(v,f))
groups

  # 데이터프레임을 여러 집단으로 분할
library(MASS)
head(Cars93)
sp<-split(Cars93$MPG.city,Cars93$Origin)
sp[[1]]
median(sp[[1]])

  # 리스트의 각 원소에 함수 적용
ls()
v_list<-lapply(v,log)
v_list
v_vec<-sapply(w,log)
v_vec

  # 행렬에 함수 적용
mat_1<-as.matrix(data.frame(v,w))
mat_1
m<-apply(mat_1,1,log)
m

  # 데이터 프레임에 함수 적용
lapply(sp,log)
sapply(sp,log)
apply(as.matrix(sp[[1]]),2,log)

  # 대용량 데이터의 함수 적용(ex.다중회귀분석)
head(Cars93)
temp<-Cars93[c("Min.Price","Price","Max.Price","MPG.city","MPG.highway","EngineSize","Horsepower","RPM","Rev.per.mile",
               "Fuel.tank.capacity","Passengers","Length","Wheelbase","Width","Rear.seat.room","Luggage.room","Weight")]

targetVariable<-temp["Fuel.tank.capacity"]   # 1. 타겟변수 설정
cors<-sapply(temp,cor,y=targetVariable)   # 2. 타겟변수와 상관계수 구하기
mask<-(rank(-abs(cors))<=10)   # 3. 입력변수 설정: 상관계수가 높은 상위 10개의 변수
mask
best.pred<-as.matrix(temp[,mask])
lm(as.matrix(targetVariable)~best.pred)   # 4. 타겟변수와 입력변수로 다중회귀분석

  # 집단별 함수 적용
with(Cars93,tapply(MPG.highway,Type,mean))
tapply(Cars93$MPG.highway,Cars93$Type,mean)

  # 행집단 함수 적용
with(Cars93,by(MPG.highway,Type,mean))
    # 요인별 선형회귀선 구하기
    # model(dfm, factor, function(df) lm(종속변수~독립변수1+...+독립변수k, data=df))

# 2. 문자열 및 날짜 다루기
  # 문자열 길이
nchar("안녕하세요")
  
  # 문자열 연결
paste("A","B",sep=',')
vec=c(1,2,3)
paste(vec,"loves me",colloapse=",and me too")

  # 하위문자열 추출
substr("statistics",1,4)

  # 구분자로 문자열 추출
strsplit("너,나,우리",',')

  # 하위문자열 대체
sub("십니까","세요","안녕하십니까")
gsub("십니까","세요","안녕하십니까")

  # 쌍별 조합
mat<-outer("안녕하세요","Hello",paste,sep="-")
mat

  # 날짜 변환 및 조회 
Sys.Date()   # 현재 날짜를 반환
format(Sys.Date(), '%a')  # 요일
format(Sys.Date(), '%b')   # 월 축약
format(Sys.Date(), '%B')   # 월 전체
format(Sys.Date(), '%d')   # 일 두자리
format(Sys.Date(), '%m')   # 월 두자리
format(Sys.Date(), '%y')   # 연도 두자리
format(Sys.Date(), '%Y')   # 연도 네자리

  # 날짜 일부 추출
d<-as.Date("2015-12-31")
p<-as.POSIXlt(d)
p$yday
start<-as.Date("2014-12-01")
end<-as.Date("2014-12-25")
seq(from=start, to=end, by=2)
