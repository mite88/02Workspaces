'''
파일명 : 03Tuple.py

튜플(Tuple) 
    : 소괄호() 안에 콤마로 구분된 항목들이 나열되어 표현되는 시퀀스 자료형이다. 
    서로 다른 자료형으로 구성할 수 있지만, 대입 연산자로 튜플의 항목을 변경할수 없다.
    따라서 Immutable 데이터 타입이라고 한다. 
'''
# 함수를 이용해서 빈 튜플 생성
tu1 = tuple()  
tu2 = (1, 2, 3, 4, 5) 
# 1개의 항목을 갖는 튜플생성. 뒤에 컴마가 없다면 단순한 변수선언이 된다. 
tu3 = 1, 
tu4 = (98, 99, 100)
print(tu1, tu2, tu3)

print("===인덱싱/슬라이싱", "="*30)
print("tu2[0]:", tu2[0]) 
#인덱스가 음수인 경우 마지막 항목을 순회한다. 
print("tu2[-1]:", tu2[-1]) # 결과 : 5
print("tu2[-2]:", tu2[-2]) # 결과 : 4
#인덱스 1~2까지를 슬라이싱 한다. 
print("tu2[1:3]:", tu2[1:3]) # 결과 : 2,3


# 튜플안에 해당 원소가 포함되었는지 확인한다. 
print("===포함여부확인", "="*30)
print("4 in tu2:", 4 in tu2) #포함되었으므로 True
print("99 not in tu2:", 99 not in tu2) #포함되지 않았으므로 True

print("===반복출력", "="*30)
print("tu2 * 3:", tu2 * 3) 

#2개의 튜플을 하나로 합침
print("===병합", "="*30)
new_tu = tu2 + tu4
print("new_tu", new_tu)

# 튜플은 변경이 불가능하므로 경우에 따라 리스트로 변경할 수 있다. 
print("===튜플과 리스트 변환", "="*30)
my_list = [1, 2, 3]
my_tuple = ('x', 'y', 'z')
print(tuple(my_list))
print(list(my_tuple))