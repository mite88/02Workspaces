import imp
#01HelloPython.py
'''
블럭단위 주석은 싱글쿼테이션 3개임
'''
#파이션은 뒤에 ;이 붙지 않음
print("hello Python")
#한줄의 여러명령 적을 경우 ; 사용
print("한줄에 "); print("여러줄 쓰려면 "); print("세미콜론이 필요함 ")

print("===============================")
print("여러 변수 선언")

print("===============================")
#좌측항에변수, 우측항에 값을 구분하여 선언 및 초기화가능
# 형변환은 자동으로 됨
r,g,b = "Red","Green","Blue"
#여러변수를 출력시 ,를통해 구분
print(r,g,b)

print("===============================")
print("정수형")
print("===============================")
# 변수 선언시 데이터형안붙혀도 자동 형변환됨
x = 2
y = 4
z = 8

print("x / y",x / y ) #나누기는 flaot형으로 항상나옴
print("x // y", x // y) #// 으로 하면 int형으로 나옴
print("x * y", x * y) #곱셉
print("x ** y", x ** y) #거듭제곱
print("pow(x, y)", pow(x, y)) #거듭제곱(함수)
print("pow(x, y, z)", pow(x, y, z)) #2의 4승을 8로 나눈 나머지 
print("divmod(x, y)", divmod(x, y)) #x를 y로 나눈 못과 나머지

#모듈 불려올때 사용
import math
print("math.factorial(5)", math.factorial(5)) #팩토리얼

print("===============================")
print("String형")
print("===============================")
str = """아래와 같이
여려줄에 걸쳐 문자열을 작성하고 싶다면
이와 같이 더블쿼테이션을 3개 작성한다.
"""
print(str);

head="나는 헤더 "
bottom=" 나는 보텀"
#문자열 합치기
print(head+bottom)
#문자열 반복
print(head * 3)

#문자열 슬라이싱 : 문자열 자르기
engStr="Hello Python Good"
print(engStr[0]) #0번 index
print(engStr[:3]) # 0~(3-1)(앞까지만 가져옴)
print(engStr[1:3])# 1~(3-1)
print(engStr[1:]) # 1~끝

korStr="안녕하세요? 파이썬입니다."
#한글도 같습니다 ㅇㅊㅇ
print(korStr[0]) 
print(korStr[:2])
print(korStr[0:6])

'''
format() : 문자열 포멧 지정
형식) format(0번인덱스, 1번인덱스, ...)
사용) {인덱스}
'''
print("{0}는 중복되지 않는 숫자 {1}로 구성된다".format("Lotto", 6))
print("{1}는 중복되지 않는 숫자 {0}로 구성된다".format("Lotto", 6))

#인덱스 대신 변수 사용시 '변수명=값'
menu1 = "치킨"
menu2 = "맥주"
print("오늘 {str}은 {0}과 {1}로 정했다".format(menu1, menu2, str="저녁"))