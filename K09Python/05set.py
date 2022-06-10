'''
05set.py

set(집합)
객체 참조를 위한 순서가 없는 컬렉션
원소를 쉽게 추가 및 삭제 가능
딕셔너리에서 value 제거하고 key만 있는 상태랑 같음
'''
empty_set = set()
print(empty_set)

#set()의 인자로 리스트에 전달하여 set으로변환
even_set = set([0,2,4,6,8])
print(even_set)

# 생성과 동시에 초기화, 중복 제거함
odd_set = {1,3,5,7,9,7,5,3,1}
print(odd_set)

#초기화
myset = {1,3,5}

#추가
myset.add(7)
print("myset1=>", myset)

#여러원소 추가
myset.update({4,6,8})
print("myset2=>", myset)

#삭제 (여러개 삭제는안됨)
myset.remove(1)
print("myset3=>", myset)

#완전삭제
myset.clear()
print("myset4=>", myset)

#집합
set_a = {1,3,5,7,9}
set_b = {1,2,5}
print("합집합", set_a | set_b)
print("교집합", set_a & set_b)
print("차집합", set_a - set_b)