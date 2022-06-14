#09String01.py
'''
f-string (채우기와 정렬)

형식]
'{문자열변수:<길이}'

<:좌측정렬
>:우측정렬
^:센터정렬
남은부분은 공백으로 채움
'''

#문자열앞에 f를 붙이고, 표현할 변수를 중괄호를 이용하여 삽입
str = 'coffee'
num = 1
result = f'{str}는 하루에 {num}잔만 마시는게 좋아요' 
print (result)

# 정해진 공간에서의 정렬(|은 공간채우기용으로썼음)
s1 = '좌측정렬'
result1 = f'|{s1:<10}|' 
print (result1)

s2 = '센터정렬'
result2 = f'|{s2:^10}|' 
print (result2)

s3 = '우측정렬'
result3 = f'|{s3:>10}|' 
print (result3)

# f-String에 딕셔너리 사용
dics = {'name':'성유겸', 'gender':'남자', 'age': 10}
result = f'{dics["name"]}은 {dics["gender"]}이고 나이는{dics["age"]}살이다' 
print (result)

# 리스트 사용:index를 통해 접근
lists = [10, 20, 30] 
print(f'리스트 : {lists[0]}, {lists[1]}, {lists[2]}') 
#확장 for문
for v in lists:
    print(f'반복출력 : {v}')
