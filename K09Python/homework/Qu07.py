'''
문제 7] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요.

    *
   ***
  *****
 *******
*********





'''
for i in range(1,6): 
    for j in range(5-i):       
            print(" ", end='') 
    for j in range(1, i*2 , 1):
            print("*", end='')        
    print()
print()
 
                