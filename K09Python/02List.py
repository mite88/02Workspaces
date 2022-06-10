'''
02List.py

List(Nutable 데이터 타입)
[]안에콤마로 항목 구분
대입연산자로 항목 변경
서로 다른 자료형 가능
인덱싱, 슬라이싱, 연결, 반복 등 있음
'''

#사용방식
list1 = [1,2,3,4,5]
list2 = ['java','HTML', 'Python']
list3 = [10, 20, ['java','HTML', 'Python']]

print('list1:', list1)
print('list2[2]:', list2[2])
print('list3[2]:', list3[2]) #리스트 내 리스트 출력

print("===슬라이싱", "="*30)
print('list1[1:4]', list1[1:4])
print('list1[:3]', list1[:3])
print('list1[1:]', list1[1:])

#슬라이싱의 경우 인덱스를 벗어나도 에러가 안남
print('list1[:5]', list1[:5])
#인덱싱은 에러남
#print('list1[5]', list1[5]) #=>IndexError: list index out of range

print("===리스트연결", "="*30)
#리스트내 또다른 리스트 삽입 및 연결
all_list = [list1, list2]
print('all_list',all_list)
print('all_list[1][0]', all_list[1][0]) #java출력됨

print("===list 관련 메소드", "="*30)
#추가
list1.append(6)
print("append(6)=>", list1)
#지우기
list1.clear()
print("clear()=>", list1)

#리스트 확장
list1.extend([10,20,30,40,50])
print("extend()=>", list1)
#삽입
list1.insert(1,99)
print("insert()=>", list1)

#반환 및 삭제 : 마지막원소 삭제 
list1.pop()
print("pop()=>", list1)

#삭제 : 처음나오는 원소 99 삭제
list1.remove(99)
print("remove(99)=>", list1)

# 리스트 뒤집기
list1.reverse()
print("reverse()=>", list1)

'''
List Comprehension 
대괄호 안에 for문으로 반복적인 표현식 실행해 원소초기화

형식) [표현식 for 원소 in 컬렉션[if문]]
'''
print("===List Comprehension", "="*30)
# n의 제곱을 0~9까지 반복하면서 3의 배수인것만 ...
list = [n ** 2 for n in range(10) if n%3 == 0]
print(list);