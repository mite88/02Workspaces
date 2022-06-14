#09String04.py
'''
문자열함수
'''
#replace() : 문자열 변경
print("="*5, "replace()", "-"*20) 
print('Hello, world!'.replace('world', 'Python'))

s = 'Hello, world!' 
s = s.replace('world!', 'Python') 
print(s)

'''
maketrans()/translate()
변환테이블

해당문자 a e i o u
바꿀문자 1 2 3 4 5
'''
print("="*5, "maketrans()/translate()", "="*20)
str1 = "apple" 
#str1에 적용할 변환테이블 생성
table = str1.maketrans('aeiou', '12345') 
# 앞에서 생성한 변환테이블을 적용하여 문자 변경
print(str1.translate(table)) 

str2 = "한글은 아름다운 언어"
table = str2.maketrans('한아언', 'XYZ') 
print(str2.translate(table))

#join() 합침
print("="*5, "join() ", "="*20) 
print('-'.join(['010', '7906', '3600']))

#lstrip(): 왼쪽 문자하나 자름
#rstrip() : 오른쪽 문자하나 자름
#replace() : 문자변환
#인자가 없으면 공백 제거
print("="*5, "strip())", "-"*20)
str = "#^%오늘은 @@ 파이썬 @@ 공부하는날 #^%"
print(str. lstrip('#')) 
print(str.rstrip('%')) 
print(str.rstrip('%').lstrip('#').replace('@', ''))
        
#find() : 해당 글자의 index반환                                  
print("="*5, "find()", "-"*20) 
print('apple pineapple'.find('pl'))
print('apple pineapple'.rfind('pl'))
