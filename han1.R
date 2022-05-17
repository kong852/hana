# R기초연산 - 벡터

x <- c(1,2,3,4,5,6)  ##vector of variable
y <- c(7,8,9,10,11,12)
x+y

x*y

sqrt(x)  ##root

sum(x)

diff(x)  ##difference

mean(x)  ##mean

var(x)   ##variance

sd(x)    ##sstandard deviation

median(x)  ##median

IQR(x) ##inter-quantile range

max(x)  ##max value

which.max(x)  ##order of max value

max(x,y) ## max value among x&y ###전체에서 최대인 값1개 

length(x)

x[2]  ## 2번째

x[-2] ## 2번 째만 빼고

x[1:3] ## 1-3번째 

x[c(1,2,3)] ## 동일일

x[c(1,3,4,5,6)] ## 1, 3, 4, 5, 6 번째째

x >= 4  ## 각 항목이 4 이상인지 TRUE/FALSE

sum(x>=4)  ## TRUE 1, FALSE 0 인식

x[x>=4] ## TRUE 인 것들만, 즉 4 이상인 것들

sum(x[x>=4])  ## 1,3,5 중 하나에 속하는 지 TRUE/FALSE

x[x %in% c(1,3,5)]

# 벡터 만들기

v1 <- seq(-5,5,by= .2); v1  ## Sequence

v2 <- rep(1,3); v2  ## Repeat

v3 <- rep(c(1,2,3),2); v3  ## Repeat for vector

v4 <- rep(c(1,2,3), each=2); v4 ## Repeat for vecotor:each

# for, if/else, ifelse 문

for (i in 1:3){
  print(i)
}

i <- 0

for (j in c(1,2,4,5,6)){
  i <- i+j
}
i 
#### 질문! 홈페이지 답은 18인데 결과값이 왜 21?

### if, else는 조건문. else 나 else if 문은 선행 조건문의
### 마지막과 같은 줄이어야 함.

x <- 5
if (x>= 3){
  x<- x+3
}
x

x<- 5 
if(x>=10){
  print('High')
} else if (x>=5){
  print("Medium")
} else {
  print("Low")
} 

## else if와 else는 반드시 }과 같은 줄 위치

# ifelse는 백터화된 if/else 문으로 벡터의 각 항목마다
# 조건문 적용, 엑셀 if 문과 비슷

x <- 1:6
y <- ifelse(x >=4, "Yes", "No") ##ifelse(조건,참일때,거짓일때)
y

# 함수 만들기
# R은 결측치가 하나라도 있으면 평균, 분산 값으로 NA를 출력.

#x <- C(1:10, 12, 13, NA, NA, 15, 17)  ##결측치 포함.
#mean(x) 틀린 서식

x <- c(1:10, 12, 13, NA, NA, 15, 17)      ## 결측치가 포함되어 있다면..
mean(x)  

x <- c(1:10, 12,13,NA,NA,15,17) ##결측치 포함
mean(x)

# 둘 이상의 변수 포함한 함수 

twomean <- function(x1, x2){
  a <- (x1 + x2)/2
  a
}
twomean(4,6)

#Apply 문 : apply, sapply, lapply
#벡터 각 항목에 대해 for loop 보다 간편하게 코드 작성
# 행렬에서 행마다 평균 구하는 예

mat <- matrix(1:20, nrow=4,byrow=T)
## 4행 5열, byrow= T : 행부터 채움.
mat

#모든 행에 대해 for loop 이용. 평균 구해서 저장 코드

out <- NULL ## 빈 벡터, 여기에 하나씩 붙여 넣음.
for (i in 1:nrow(mat)){
  out <- c(out, mean(mat[i, ]))
}
out

# 개선
#sapply 또는 lapply를 사용하면, 행 또는 열 단위 연산 가능
sapply(1:nrow(mat), function(x){mean(mat[x, ])})#Return vector

lapply(1:nrow(mat), function(x){mean(mat[x, ])})#Return list type

unlist(lapply(1:nrow(mat), function(x){mean(mat[x, ])}))#same to sapply

#list는 벡터보다 상위 개념. unlist를 취하면 벡터,행렬 얻음
# 행열 단위 연상은 apply, row***,col*** 시리즈 함수

apply(mat,1,mean) ## 1:행

rowMeans(mat) ##동일일

rowSums(mat) ##행별 합합

apply(mat,2,mean) ##열 

colMeans(mat) ##열별 합


#연습문제1
#sapply나 lapply 이용, 아래 두 벡터의 최대값 각각 구하기
x<- 1:6
y<- 7:12

# sapply(max(x&y) 잘못된 식
# 정답

x<- 1:6
y<- 7:12
lapply(list(x,y),max)

sapply(list(x,y), max)

#멀티코어 병렬연산으로 apply를 빠르게 수행 (생략)

#데이터 불러와서 작업하기
# 데이터 불러오기, 저장

getwd() ##현재 디렉토리

setwd("data") ##디렉토리 설정

## 동일
setwd("C:/users/ngs10/Documents")
getwd()

# 폴더 구분은 / (\\도 가능) #r은 유닉스 기반.
#데이터 포맷은 csv 추천.
#excel, spss, sas 파일도 읽을 수 있는데 변수명,값 한글 에러

ex<-read.csv("example_gle.csv")
head(ex)

ex <- read.csv("example_g1e.csv")
head(ex) 

#### 질문2 / 오류남 

#URL 링크 이용
ex <- read.csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv")

#Excel 파일은 readxl 패키지
#SAS나 SPSS는 haven 패키지 이용

#install.packages(c("readxl","haven")) ##install packages
library(readx1) ## for xlsx
ex.excel <- read_excel("example_gle.xlse", sheet=1) ##1st sheet

library(heaven) ## for SAS/SPSS/STATA
ex.sas <- read_sas("example_gle.sas7bdat") ##SAS
ex.spss <- read_sav("example_gle.sav") ##SPAA
heap(ex.spss)

#### 질문_ 다운 받았는데 에러 뜸

# 파일 저장은 write.csv를 이용. 맨 왼쪽에 나타나는
# 행 넘버링을 빼려면, row.names=F 옵션 추가.

write.csv(ex, "example_gle_ex.csv", row.names=F)

# haven 패키지에서 write_sas 나 write_Sav 도 가능.

write_sas(ex.sas, "example_gle_ex.sas7bdat")
write_sav(ex.spss, "example_gle_ex.sav")

# 읽은 데이터 살펴보기
head(ex) ##처음 6행
tail(ex) ##마지막 6행
head(ex, 10) ## 처음 10행행

#str과 head는 다른 방식 데이터 확인.
#int 정수, num은 실수형

str(ex)

#names로 변수들 이름 확인
#공백, 특수문자는 "." 으로 바뀜.
#이름이 같은 변수들은 뒤에 숫자 추가되어 구별
#read.csv(..., check.names=F) 옵셥으로 이름 유지,에러

names(ex)

#샘플수, 변수 갯수는 dim,nrow,ncol로 확인

dim(ex) ##row, column

nrow(ex)

ncol(ex) ##column

# 클래스는 class 확인.
#read.csv는 data.frame, 
#excexl/sas/spass는 tibble&'data.frame 인데,
#data.frame은 행렬이면서 데이터에 특화된 list, tibble은
#앞서 언급했던 tidyverse 스타일의 data.frame인 정도만 알자

class(ex)

class(ex.spss)

#### 질문

#summary로 모든 변수의 평균, 중위수, 결측치 등 한 번에확인
#R은 결측치를 NA로 표시. 분산은 안 나옴.

summary(ex)

## 특정 변수 보기
##data.frame 에서 특정변수는 $를 이용. 
##데이터이름$변수이름로 확인가능.
##data.frame은 행렬과 list 성질도 있어서 해당 스타일 가능

ex$EXMD_BZ_YYYY ##data.frame style
ex[, "EXMD_BZ_YYYY"] ##matrix style
ex[["EXMD_BZ_YYYY"]] ##list style
ex[,1] ## matrix style with order
ex[[1]] ## list style with order

#2개 이상 변수 선택은 행렬 스타일 이용.

ex[, c("EXMD_BZ_YYYY", "RN_INDI", "BMI")] ##matrix syle with names
ex[, c(1,2,16)] ## matrix syle with names
ex[, names(ex)[c(1,2,16)]] ##same

## 특정 변수는 벡터형태로 나타남
#처음에 다룬 벡터다루기를 그대로 활용
#예, 년도 변수 EXMD_BZ_YYYY의 첫 50개만 확인

ex$EXMD_BZ_YYYY[1:50]  ##data.frame style
ex[1:50,1] ##matrix style
ex[[1]][1:50] ##list style

#unique로 변수가 어떤 값들로 이루어져 있는지
#table로 해당 값들이 몇 개씩 있는지 확인 

unique(ex$EXMD_BZ_YYYY)  ##unique value

length(unique(ex$EXMD_BZ_YYYY)) ## number if unique value

table(ex$EXMD_BZ_YYYY) ##table

#새로운 변수 만들기
#연속형 변수인 BMI에서 원하는 조건에 맞는 정보 뽑기

mean(ex$BMI) ##mean

BMI_cat <- (ex$BMI >= 25) ## TRUE of FALSE
table(BMI_cat)

rows <- which(ex$BMI>= 25) ## row numbers
head(rows)

values <- ex$BMI[ex$BMI>=25] ##values
head(values)

length(values)

BMI_HGHT_and <- (ex$BMI >= 25 & ex$HGHT>=175) ## and
BMI_HGHT_or <- (ex$BMI >= 25 | ex$HGHT >= 175) ## or

# 데이터에 새로운 변수 추가 

ex$zero <- 0 ## variable with 0
ex$BMI_cat <- (ex$BMI>=25) ##T/F
ex$BMI_CAT <- as.integer(ex$BMI >=25) ##0,1
ex$BMI_CAT <- as.character(ex$BMI>=25) ##"0","1"
ex$BMI_CAT <- ifelse(ex$BMI >= 25,"1","0") ##same
table(ex$BMI_cat)

ex[,"BMI_cat"] <- (ex$BMI >= 25) #matrix style
ex[["BMI_cat"]] <- (ex$BMI>=25) ##list style

#변수 클래스 설정: 데이터 읽은 후 가장 먼저 해야할 것.
#데이터의 클래스가 data.frame
#각 변수들도 자신의 클래스 가짐. 대표 숫자형,문자형,팩터
#그 외 T/F로 나타내는 논리, 날짜 DATA클래스.
#숫자는 정수, 실수. 전부 실수형도 상관없음
#범주형은 character와 factor 두 종류
#character은 단순 문자, factor는 레벨이 있어 순서 설정.
#read.csv로 읽으면 숫자는 int/num
#문자는 전부 factor가 기본값.
#숫자 변수 중 0/1 같은 것들은 직접 factor로 바꿔줘야 함

#ID와 설문조사를 범주형으로 바꾸기 

vars.cat <- c("RN_INDI", "Q_PHX_DX_STK", "Q_PHX_DX)HTDZ", "Q_PHX_DX_HTN", "Q_PHX_DM", "Q_PHX_DX_DLD", "Q_PHX_DX_PTB", "Q_HBV_AG", "Q_SMK_YN", "Q_DRK_FRQ_V09N")
vars.cat <- names(ex)[c(2, 4:12)]  ## same
vars.cat <- c("RN_INDI", grep("Q_", names(ex), value = T)) #same: extract variables starting with "Q_"

vars.conti <- setdiff(names(ex), vars.cat) ##Exclude categorical variables
vars.conti <- names(ex)[!(names(ex) %in% vars.cat)] ##same: !- not, %in%- including

for (vn in vars.conti){ ## for loop: as.factor
  ex[, vn] <- as.factor(ex[, vn])
}

for (vn in vars.conti){ ## for loop: as.numeric
  ex[, vn] <- as.numeric(ex[, vn])
}

summary(ex)

# summary를 보면 설문조사 변수들이 빈도로 요약됨
# factor를 numeric으로 바로 바꾸면 안됨. 
# 방금 factor로 바꾼  Q_PHX_DX_STK를 numeric로 바꿔서 
# 테이블 요악, 원래의 0/1이 아닌 1/2로 바뀜

table(
  as.numeric(ex$Q_PHX_DX_STK)
  )

# factor를 바로 바꾸면 원래 값이 아닌, factor에 내장된
# 레벨(순서값)로 바뀌기 때문.
# 제대로 바꾸려먼 아래처럼 character로 먼저 바꾼 후
# 숫자형을 적용해야 함.

table(
  as.numeric(as.character(ex$Q_PHX_DX_STK))
  )

# DATA클래스, 검진년월 변수인 HME_YYYYMM를 Data로 바꾸는데
#DATA는 년/월/일이 모두 필요. 일은 1로 통일, paste로 붙임

addDate<- paste(ex$HME_YYYYMM, "01", sep="") ## add day- use 'paste'
ex$HME_YYYYMM <- as.Date(addDate, format = "%Y%m%d") ## set format
head(ex$HME_YYYYMM)

#### 질문! 홈페이지 값과 다름 

class(ex$HME_YYYYMM)

# 결측치 다루기 
# 결측치가 있으면 평균도 na.rm=T옵션이 필요.
# 결측치가 있는 LDL 변수의 평균을 연도별로 구하기
# 그룹별 통계는 tapply를 이용

tapply(ex$LDL, ex$EXMD_BZ_YYYY, mean) ## measure/group/function

# 2009년만 결측치가 없고, 나머지는 결측치가 있어
# 평균값이 NA로 나옴
# na.rm=T 옵션으로 결측치를 제외하면 원하는 결과 얻음.

tapply(ex$LDL, ex$EXMD_BZ_YYY,
       function(x){
        mean(x, na.rm=T)
       })

# 대부분의 R통계분석이 결측치를 갖는 샘플을 분석에서 제외.
# 결측치를 신경쓰지 않고 분석하면
# 원래 샘플 수와 분석의 샘플 수 가 달라지는 문제.
# LDL과 HDL의 회귀분석 결과 사례

summary(lm(LDL ~ HDL, data = ex))

# LDL이 결측인 16명은 분석에서 제외했다는 뜻

# 연습문제2: 결측치 처리 
#하나라도 결측치 있는 샘플은 제외로, na.omit 함수 이용

ex.naomit <- na.omit(ex)
nrow(ex.naomit)

####w질문 홈페이지 결과값은 620

# 1644명에서 620명으로 샘플 수가 줄어든 것을 확인 가능 
# 결측치 처리에 3가지 원칙 적용
# 1 결측치 너무 많으면(10% 이상) 그 변수 삭제
# 2 연속변수는 중간값(median)
# 3 범주형 변수는 최빈값(mode)

# 아까 변수형을 정리한 ex 데이터에 위 3가지 원칙을 적용
# 새로운 데이터 ex.impute aksemfrl 
# 최빈값 함수는 아래와 값이 getmode로 주어짐

getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(ex$Q_PHX_DX_STK)

# 정답보기

vars.ok <- sapply(names(ex), function(v){sum(is.na(ex[, v])) < nrow(ex)/10})
ex.impute <- ex[, vars.ok]                                     ## only missing < 10%

for (v in names(ex.impute)){
  if (is.factor(ex.impute[, v])){                              ## or class(ex[, v]) == "factor"
    ex.impute[, v] <- ifelse(is.na(ex.impute[, v]), 
                             getmode(ex.impute[, v]), 
                             ex.impute[, v])
  } else if (is.numeric(ex[, v])){                             ## or class(ex[, v]) %in% c("integer", "numeric")
    ex.impute[, v] <- ifelse(is.na(ex.impute[, v]), 
                             median(ex.impute[, v], na.rm = T), 
                             ex.impute[, v])
  } else{                                                      ## when date
    ex.impute[, v]
  }
}

summary(ex.impute)