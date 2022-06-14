'''
문제 3] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요.

*
**
***
****
*****

'''
for i in range(1,6): 
    print("*", end='') 
    for j in range(1,5):
        if i== j:         
            break
        if i != j:    
            print("*", end='') 
    print()
print()
