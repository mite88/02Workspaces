'''
06if.py

if문
* else if가 아닌 elif

형식)
if 조건식:
     코드1
elif 조건식:
     코드2
else 조건식:
     코드3
'''
age = 33
#여려개의 print()사용시 줄바꿈없이 출력하고 싶으면 end=''사용
print(age, "살은 ", end="")

if age >= 35:
    print("중년입니다.") 

elif age >= 30:
    print("중년의 시작입니다.")
else: 
    print("청년입니다.") 
    
print("==========================")
#input() : 사용자로부터 입력값 받을때 사용하는 함수
num1 = int(input("숫자 하나를 입력하세요 : "))
if num1%2==0 :
    if num1%3==0 :
        print("2와 3으로 나누어짐") 
    else:
        print("2는 가능, 3은 불가")
else:
    if num1%3==0 :
        print("2는 불가, 3은 가능")
    else:
        print("2와 3 모두 불가") 
print("==========================")
