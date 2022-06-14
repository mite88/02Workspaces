'''
f-String
    채우기와 정렬
    형식] 
        '{문자열변수:<길이}'
    < : 좌측정렬
    > : 우측정렬
    ^ : 센터정렬
    남은 부분은 공백으로 채운다.     
'''
# 문자열 앞에 f를 붙이고, 표현할 변수를 중괄호를 이용해서 삽입한다.
str = 'coffee'
num = 1
result = f'{str}는 하루에 {num}잔만 마시는게 좋아요'
print(result)

# 정해진 공간에서의 정렬.(아래에서 사용한 |는 서식이 아니라 단순히 공간을 확인하기 위한 용도임)
s1 = '좌측정렬'
# 10칸의 공간을 확보한 후 문자열을 좌측정렬로 출력한다.
result1 = f'|{s1:<10}|' 
print(result1)
# 아래는 위와 동일하다. 
s2 = '센터정렬'
result2 = f'|{s2:^10}|'
print(result2)

s3 = '우측정렬'
result3 = f'|{s3:>10}|'
print(result3)

# f-String에 딕셔너리를 사용 : key를 통해 value를 출력한다. 
dics = {'name':'성유겸', 'gender':'남자', 'age':10}
result = f'{dics["name"]}은 {dics["gender"]}이고 나이는 {dics["age"]}살이다'
print(result)

# 리스트를 사용 : index를 통해 접근한다. 
lists = [10, 20, 30]
print(f'리스트 : {lists[0]}, {lists[1]}, {lists[2]}') 
# 확장 for문과 같이 리스트의 갯수만큼 반복하여 출력한다.
for v in lists:
    print(f'반복출력 : {v}')



