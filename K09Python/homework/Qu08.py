'''
문제 8] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요.
*********
 *******
  *****
   ***
    *
'''
        
for i in range (6, 0, -1):
    for j in range(12-i):
        print(" ", end='')
        
    for j in range(i*2-1):
        print("*", end='')

    print()
print()
 

''' for i in range(12,0,-1):
    print(" "*(12-i)+"*"*(i*2-1))
    print(' ' * (5 - i) + '*' * (i * 2 + 1))  '''