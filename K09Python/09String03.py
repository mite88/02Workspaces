#09String03.py
'''
format()함수
문자열 포맷팅은 서식문자보다 좀 더 간단히 문자열 표현
{}중괄호안에 포맷팅 지정 및 format()함수로 값 삽입
'''

#문자열 직접대입(index 사용)
str1 = 'name : {0}'.format('홍길동')
print (str1)

#변수명을 통한 대입
age = 55 
str2 = 'age : {0}'.format(age) 
print (str2)

#매개변수에 변수명 부여하여 대입
str3 = 'name : {name}, age : {age}'.format(name='홍길동', age=33) 
print(str3)

#인덱스 및 변수명이 없으면 순서대로 대입됨
str4 = '이름 : {}, 나이: {}'.format('이순신', 44)
print (str4) 

#인덱스를 이용하여 순서 변경하여 출력
str5 = '나이 : {1}, 이름 : {0}'.format('이성계', 55)
print(str5)

#index를 통해 변수 중복하여 사용가능
str6 = '항목1 : {0}, 항목2 : {1}, 항목3 : {0}'.format('서울','부산')
print(str6)

#정수 N자리 : {인덱스:자리수 및 서식문자}
# 자리수 초과시 모자라는 경우 자리수를 0으로 채움
str7 = '정수3자리 : {0:03d}, {1:03d}'.format(12345, 12)
print(str7)

'''
    파이션은 문장 끝에 세미클론을 사용하지않아 
    줄바꿈시 역슬러쉬로 연결되는 코드임을 명시해야함
'''
str8 ='소수점 아래 2자리 : {0:0.2f}, 소수점 아래 5자리 : {1:0.5f}'\
    .format(123.1234567, 3.14) 
print(str8)

#{}자체를 출력시 겹쳐서 사용가능
str9 = '{{ {0} }}'.format('Python 중괄호 표현')
print("str9", str9) 

#3자리수마다 ,실행시 사용
str10 = 1592000 
print(format(str10,','))

