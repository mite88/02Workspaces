'''
문제 4] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요.

*****
****
***
**
*

'''
for i in range(6, 1 , -1): 
    for j in range(1,6):
        if j<i:  
           print("*", end='') 
    print()
print()

'''
for i in range(1,6): 
    #print(" ", end='') 
    for j in range(i-1):       
            print("*", end='')  
    print()
print()
'''