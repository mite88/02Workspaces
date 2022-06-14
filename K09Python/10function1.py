#10function1.py
'''
함수
형식] def 함수명(매개변수1, 2...)
        실행부
        return 결과1, 2...(생략가능)
        
'''

import numbers

def menu():
    print('메뉴중 숫자를 선택하세요:')
    print('1.덧셈 2.뺄셈 3.곱셉 4.나눗셈')
    print('5.종료')
    return input('번호선택:')

# 사칙연산 용도의 함수 정의(반환값 없음)
def add(a,b):
    print(a,"+",b, "=", a+b)
    
def sub(a,b):
    print(a,"-",b, "=", a-b)
    
def mul(a,b):
    print(a,"*",b, "=", a*b)
    
def div(a,b):
    print(a,"/",b, "=", a/b)
   
#loop가 1일때 지속적으로 수행가능한 반복문 생성(무한) 
loop = 1
choice = 0
while loop == 1:
    #메뉴 출력 후 입력한 값을 반환받아 while문사용
    choice = int(menu())
    if choice == 1:
        add(int(input("덧셈 a=")), int(input("b=")) )
    if choice == 2:
        sub(int(input("뺄셈 a=")), int(input("b=")) )
    if choice == 3:
        mul(int(input("곱셈 a=")), int(input("b=")) )
    if choice == 4:
        div(int(input("나눗셈 a=")), int(input("b=")) )
    #5입력시종료됨
    elif choice == 5:
        loop = 0
print("연산종료!!")

#2개 이상의 반환값을 가진 함수 정의
def min_max(num):
    sum = 0
    for val in num:
        sum += val
    return sum, min(num), max(num)

#튜플 정의
numbers =(8,7,6,8,4,9,5)
#함수 호출시 튜플를 매개변수로 전달함
sumval, minval, maxval = min_max(numbers)
print("튜플의합, 최소값, 최대값:",sumval, minval, maxval)