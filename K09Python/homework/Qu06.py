'''
문제 6] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요.

*****
 ****
  ***
   **
    *




'''
for i in range(1,6): 
   
    for j in range(6-i):       
        if j== (6-i):
            print(" ", end='') 
        else:
            print("*", end='')        
    print()
print()