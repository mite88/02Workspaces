'''
replace('바꿀문자열', '새문자열')
    : 특정 문자열을 찾아 변경한다. 
'''
# 문자열에 직접 적용
print("="*5, "replace()", "="*20)
print('Hello, world!'.replace('world', 'Python'))

# 변수에 적용
s = 'Hello, world!'
s = s.replace('world!', 'Python')
print(s)

'''
문자바꾸기
    translate()는 문자열 내의 문자를 다른 문자로 변경한다. 
    maketrans('바꿀문자', '새문자')로 변환 테이블을 만든 후 적용한다. 
'''
print("="*5, "maketrans()/translate()", "="*20)
str1 = "apple"
# str1에 적용할 변환테이블을 생성한다. a->1, e->2 와 같은 형태의 테이블을 생성한다.
table = str1.maketrans('aeiou', '12345')
# 앞에서 생성한 변환테이블을 적용하여 해당 문자를 변경한다.
print(str1.translate(table)) # 결과: 1ppl2

# '한'=>X, '아'=>Y 로 변경된다. 
str2 = "한글은 아름다운 언어"
table = str2.maketrans('한아언', 'XYZ')
print(str2.translate(table))

'''
'구분자'.join(합칠문자열)
    : 합칠 문자열을 구분자를 통해 합쳐서 반환한다. 
'''
print("="*5, "join()", "="*20)
print('-'.join(['010', '7906', '3600']))

'''
공백삭제 혹은 특정 문자 삭제
    : lstrip(왼쪽),  rstrip(오른쪽), strip(양쪽)
    별도의 인자가 없으면 공백이 삭제된다. 
'''
print("="*5, "strip()", "="*20)
str = "#^%오늘은 @@ 파이썬 @@ 공부하는날#^%"
print(str.lstrip('#')) #왼쪽의 # 제거
print(str.rstrip('%')) #오른쪽의 %제거
# 좌우측의 특수기호와 문장에 포함된 @를 모두 제거한다.
print(str.rstrip('%').lstrip('#').replace('@', ''))

'''
문자열 위치 찾기
    : find(왼쪽부터찾기), rfind(오른쪽부터찾기)
'''
print("="*5, "find()", "="*20)
print('apple pineapple'.find('pl'))
print('apple pineapple'.rfind('pl'))



