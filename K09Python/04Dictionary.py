'''
04Dictionary.py

Dictionary
List와 비슷하지만 순서가 중요하지 않음
:으로 문자구분, key와 value로 지정
값 변경 가능
{}로 선언
'''
#생성1
dic1= dict(birth=1970,name="홍길동", size="100cm")
print(dic1)

#생성2
dic2= {'one':1, 'two':2, 'three':3}
print(dic2)

#반복문을 통한 출력
fruits = {'apple':100, 'grapes':200, 'orange':300, 'peach':400}
print('for문을 이용한 출력')
#key값 얻은 후
for key in fruits:
    #얻은 key값을 통해 value출력
    val = fruits[key]
    #java의 printf() 같이 출력함
    print("%s : %d" % (key, val))

print("길이", len(fruits)) #길이
print("복숭아", fruits['peach']) #특정 key의 값

#값 변경
fruits['orange']= 3500 # value변경
print("오렌지", fruits['orange'])

#key 삭제
del fruits['peach']
print("fruits=", fruits)

#keys() : 딕셔너리의 키로 된 dict_keys 객체 반환
get_keys = fruits.keys()
for k in get_keys:
    print(k) #key값 출력
    
#values() :  딕셔너리의 키로 된 dict_values 객체 반환
get_values = fruits.values()
for v in get_values:
    print(v) #value값 출력