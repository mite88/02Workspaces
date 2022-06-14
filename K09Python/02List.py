'''
파일명 : 02List.py

파이썬에서는 연속된 Collection 데이터 구조에 
list, tuple, dictionary, set이 있다. 

리스트(List)
    : 대괄호[] 안에 콤마로 항목을 구분한다. 
    대입연산자로 항목을 변경할 수 있는 시퀀스 자료형이다. 
    서로 다른 자료형의 항목으로도 구성할 수 있다. 
    인덱싱, 슬라이싱, 연결, 반복 등이 가능하다. 
    Mutable 데이터 타입이라고 한다. 즉 변경가능한 자료라는 뜻이다. 
'''
# 기본적인 선언과 사용법은 배열과 동일하다.
# 정수형 리스트와 스트링형 리스트를 선언 
list1 = [1,2,3,4,5]
list2 = ['Java', 'HTML', 'Python']
# 중첩된 리스트 선언
list3 = [10, 20, ['Java', 'HTML', 'Python']]

#출력
#리스트 전체가 출력된다. 
print('list1:', list1)  
#Python 출력
print('list2[2]:', list2[2])  
#리스트내의 리스트가 출력됨
print('list3[2]:', list3[2])  

# 리스트 슬라이싱
print("===슬라이싱", "="*30)
#1~3까지 슬라이싱된다. 
print('list1[1:4]:', list1[1:4]) 
#0~2까지
print('list1[:3]:', list1[:3]) 
#1~마지막까지
print('list1[1:]:', list1[1:]) 
#0~2까지 이므로 정상적으로 출력됨
print('list2[:3]:', list2[:3]) 
#슬라이싱의 경우 인덱스를 벗어나더라도 에러가 발생하지 않음.
print('list2[:4]:', list2[:4]) #정상출력
print('list2[:5]:', list2[:5]) #정상출력

#인덱싱의 경우 인덱스를 벗어나면 에러가 발생한다.  
# print('list2[5]:', list2[5])  => index out of range : 오류발생

 
print("===리스트 연결", "="*30)
# 리스트 내에 또다른 리스트를 삽입하여 연결하는 형태로 사용할 수 있다.
all_list = [list1, list2]
#2개의 리스트가 1개의 리스트로 합쳐진다. 
print('all_list:', all_list)
#Java가 출력됨
print('all_list[1][0]:', all_list[1][0]) 


print("===list 관련 메소드", "="*30)
# 추가 : 리스트의 마지막 부분에 원소를 추가한다.
list1.append(6) 
print('append(6)=>', list1)

# 항목 전체를 삭제
list1.clear()  
print('clear()=>', list1)

# 확장 : 리스트 확장하기
list1.extend([10, 20, 30, 40, 50])  
print('extend=>', list1)

# 삽입 : 1번 인덱스에 99를 삽입한다. 
list1.insert(1, 99)  
print('insert=>', list1)

# 반환 및 삭제 : 리스트의 마지막 원소를 삭제한다.
print(list1.pop())  
print('pop()=>', list1)

# 삭제 : 처음 나오는 원소 99를 삭제한다.
list1.remove(99)  
print('remove=>', list1)

#리스트 뒤집기 
list1.reverse()  
print('reverse()=>', list1)

'''
List Comprehension
    : 대괄호 안에 for루프로 반복적인 표현식을 실행해서 리스트
    원소들을 초기화 하는 방법이다. 
    형식]
        [표현식 for 원소 in 컬렉션 [if조건식]]
'''
print("===List Comprehension", "="*30)
'''
   표현식(n의 제곱) 반복문(0~9까지반복) 조건식(3의배수)
   => 0~9까지의 정수 중 3의 배수의 제곱을 리스트에 초기화한다.
'''
list = [n ** 2 for n in range(10) if n%3==0]
print(list)
