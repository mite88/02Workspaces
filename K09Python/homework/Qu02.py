'''
문제 2] 아래와 같은 패턴의 별(*)을 출력하는 프로그램을 작성해보세요. 
(힌트: 이중 루프 사용)

*****
*****
*****
*****


'''
for i in range(1,5): 
    print("*", end='') 
    for j in range(1,5):
        print("*", end='') 
    print()
print()
