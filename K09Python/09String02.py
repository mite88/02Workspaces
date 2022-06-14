#09String02.py
'''
서식문자로 문자열, 정수, 실수 표현

형식]
'문자열 서식문자' % 변수 or 문자열

서식문자를 java와 동일
'''
#문자열이용
str = '내 이름은 %s 입니다'%'칸'
print("str1=", str)

#리스트이용
names= ['유미','간우','장비']
for n in names:
    print('이름 : %s' % n)
    
#정수형
money = 1000
str = '마우스 가격은 %d 원입니다' % money
print(str)

#실수
pi = 3.141592
print("원주율은 %f" % pi)

#문자열(2개 이상의 변수는 ,로 구분)
Str = '이름 : %s. 나이 :%d' %('홍길동', 99)
print(str)

#여러변수를 초기화시 좌측항 및 우측항에 나눠서 기술
phone, age, heigth = "010-1234-5678", 28, 181.5
str2 = '전화번호 : %s, 나이 :%d, 키:%f' % (phone, age, heigth)
print("str2="+str2)
