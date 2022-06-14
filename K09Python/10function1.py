'''
함수
    형식] def 함수명(매개변수1, 매개변수2):
                실행부
                return 결과1, 결과2
    -return문은 경우에 따라 생략할 수 있다. 
    -2개 이상의 결과를 콤마로 구분하여 반환할 수 있다. 
    -이 경우 2개 이상의 변수를 통해 반환값을 받거나
    -만약 1개의 변수로 값을 받는경우 튜플로 받을 수 있다. 
'''

# 메뉴출력 및 선택용 함수 정의
def menu():
    print('메뉴중 숫자를 선택하세요:')
    print('1.덧셈 2.뺄셈 3.곱셈 4.나눗셈')
    print('5.종료')
    #사용자가 입력한 번호가 반환된다. 
    return input('번호선택:')  

# 사칙연산 용도의 함수 정의(반환값 없음)
def add(a, b):
    print(a, "+", b, '=', a+b)
def sub(a, b):
    print(a, "-", b, '=', a-b)
def mul(a, b):
    print(a, "*", b, '=', a*b)
def div(a, b):
    print(a, "/", b, '=', a/b)

# loop가 1일때 지속적으로 수행 가능한 반복문을 생성(무한루프)
loop = 1
choice = 0
while loop==1:  
    #메뉴를 출력한 후 사용자가 입력한 값을 반환받아 while문에서 사용한다.
    choice = int(menu()) 
    if choice == 1:
        add(int(input("덧셈 a= ")), int(input("b=")))
    elif choice == 2:
        sub(int(input("뺄셈 a= ")), int(input("b=")))
    elif choice == 3:
        mul(int(input("곱셈 a= ")), int(input("b=")))
    elif choice == 4:
        div(int(input("나눗셈 a= ")), int(input("b=")))
    elif choice == 5:  
        # 사용자가 5를 입력하면 while문을 탈출한다.
        loop = 0
print("연산 종료!!")

# 2개 이상의 반환값을 가진 함수 정의
def min_max(num):
    sum = 0
    # 매개변수로 전달된 튜플의 갯수만큼 반복
    for val in num:
        # 누적합을 구함
        sum += val
    # 2개 이상의 값은 콤마로 구분하여 반환한다. 
    # min() 혹은 max() : 인수로 튜플을 전달하면 최소, 최대값을 반환
    return sum, min(num), max(num)
# 튜플 정의
numbers = (8,7,6,8,4,9,5)
# 함수 호출시 튜플을 매개변수로 전달
sumval, minval, maxval = min_max(numbers)
print("튜플의합, 최소값, 최대값:", sumval, minval, maxval)
    