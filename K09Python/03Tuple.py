'''
03Tuple.py

Tuple(ImNutable 데이터 타입)
소괄호 안에 콤마로 구분
시퀀스 자료형
서로 다른 자료형 구성
대입연산자로 튜플항목 변경 불가능
'''
#생성방법
tu1= tuple()
tu2 = (1,2,3,4,5)
#한개의 항목을 갓는 튜플생성 , 없으면 단순 변수선언됨
tu3 = 1,
tu4 = (98,99, 100)

print(tu1, tu2, tu3)

print("===인덱싱/슬라이싱", "="*30)
print("tu2[0]", tu2[0])
#파이션에선 -index를 하면 순회함 5가나옴
print("tu2[-1]", tu2[-1]) 
print("tu2[1:3]", tu2[1:3])

#튜플안에 원소 포함 확인
print("===포함여부확인", "="*30)
print("4 in tu2", 4 in tu2)
print("99 not in tu2", 99 not in tu2)

print("===반복출력", "="*30)
print("tu2 * 3", tu2 * 3)

print("===병합", "="*30)
nuw_tu = tu2 +tu4;
print("nuw_tu", nuw_tu)

#튜플은 변경이 안되서 경우에 따라 리스트로 변경할수 있음
print("===튜플과 리스트 변환", "="*30)
my_list = [1,2,3]
my_tuple = ('x','y', 'z')
print(tuple(my_list))
print(list(my_tuple))
