#08for.py
'''
for 변수 in range(횟수):
     반복할 코드
     
range()
반복문에서 주로 사용하는 함수로 범위 지정 및 증가치 지정
* 미만임 ㅇㅁㅇ
  range(2, 10) => 2~9
  range(2, 10, 2) => 2~9까지 2씩증가
'''
from math import remainder


for i in range(5):
    print("i=", i, end=" ") 
print()

# 리스트크기 만큼 반복(확장for문 같음)
list1 = [1,2,3,4,5,6,7,8,9,10] 
sum = 0 
for i in list1:
    sum += i 
print("1부터 10까지의 합 = ", sum)

#파이썬에선 글자수 만큼 반봅이 가능함
str1 = "파이썬이좋아요" 

for ch in str1: 
    print(ch, end=" ") 
print()

#중첩 for문
for dan in range(2,10): 
    for su in range(1,10):
        print("%2d * %2d = %2d" % (dan, su, su*dan), end='') 
    print()
print()

#else : for문이 정상적으로 종료될경우 실행됨
for i in range(3):
    print(i, end=" ")
else:
    print("for문 종료됨")

for i in range(3):
    print(i, end=" ")
    break #함수를 빠져나옴
else:
    print("break를 통해 for문이 완료되지 않았으므로 출력되지 않음")
    
#[시나리오] 08for.py 에 추가하세요 
'''
연월일을 입력해서 요일을 구하는 프로그램 작성

#윤년추가규칙
지구의 공전주기가 365.2422이므로 이를 보정하기 위한 수식

-4로 나누어서 떨어지는 해는 윤년, 그 밖의 해는 평년
-4로 나누어 떨어지지만 100으로도 나누어 떨어지는 해는 평년
-단 400으로 떨어지는 해는 윤년
'''

#년, 월, 일 입력(숫자형)
year = int(input("년도를 입력하시오:"))
month = int(input("월을 입력하시오:"))
day = int(input("일을 입력하시오:"))

#누적날짜계산(서기 1월 1일부터 지금까지의 일수 계산)
total_days = 0;
#월별 날짜수 선언
year_month_days = [0,31,28,31,30,31,30,31,31,30,31,30,31]

#서기1년부터 입력할 년도까지의 누적 날짜수 계산
#2022년일 경우 2021년까지만 반복됨
for d in range(1, year):
    if d % 400 == 0: #윤년
        total_days = total_days + 366
    elif d % 100 == 0: #평년
        total_days = total_days + 365
    elif d % 4 == 0:#윤년
        total_days = total_days + 366
    else:#평년
        total_days = total_days + 365
        
#입력년도의 각 달의 날짜수 누적해서 더함
for m in range(1, month):
    #월별 날짜를 정의한 리스트 이용
    total_days = total_days + year_month_days[m]
   
'''
입력월이 3월 이상이고, 년도가 윤년이면 1을 더함
월별 날짜수는 2월에 28일로 고정되어있어 별도 처리안해도 됨
'''
if month >= 3:
  if d % 400 == 0: #윤년
    total_days = total_days + 1
elif d % 100 == 0:#평년
    total_days = total_days + 0
elif d % 4 == 0: #윤년
    total_days = total_days + 1
else:#평년
    total_days = total_days + 0
    
#누적일수에서 입력한 일수 더함
total_days += day;
print()
print("total_days:", total_days)
#요일을 구하기위해 전체일수에서 7로 나눔
remainder = total_days % 7

if remainder == 0:
    print("일요일")            
if remainder == 1:
    print("월요일")  
if remainder == 2:
    print("화요일")  
if remainder == 3:
    print("수요일")  
if remainder == 4:
    print("목요일")  
if remainder == 5:
    print("금요일")  
if remainder == 6:
    print("토요일")  





