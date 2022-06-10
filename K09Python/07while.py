'''
07while.py

while
파이션에선 반복문이 while, for문
(do~while x)
'''

str = 'python'
#str 이공백일때까지 반복함
#파이션에선 문자열도 배열과 같은 인덱스라 접근이 된다 ㅇㅊㅇ
while str:
    print(str, end=' ')
    str = str[1:]
print()
print("=========================="*3)

#시나리오] 1~10까지의 합을 구하시오
#파이션에선 while문에 else문(조건이 False일때) 추가가능
sum = 0
i = 1 
while i<=10 :
    sum += i 
    if i<10:
        print(i, end=" + ") 
    else:
        print(i, end=" = ")
    i += 1
else: 
    print(sum)


print("=========================="*3) 
 
# 시나리오] 구구단을 출력하되 짝수단만 출력하시오 
dan = 2
while dan<=9 :
    if dan%2 == 1: 
        dan += 1
        #반복문의처음으로.. 
        continue

    else:
        #단이 짝수일때 ㅇㅊㅇ
        su = 1 
        while su<=9:
            print("%2d * %2d = %2d" % (dan, su, su*dan), end=' ')
            su += 1 
        dan += 1
    print() 
print()
