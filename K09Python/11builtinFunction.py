#11builtinFunction.py
'''

'''
print("="*5, "enumerate() ", "-"*20) 
data = ['Naver', 'Kakao', 'Google'] 
for i, v in enumerate(data):
    print(i, v)
            
print("="*5, "evalo", "-"*20)
print(eval('1+2'))
print(eval("'hi' + 'a'"))

print("="*5, "sorted", "-"*20)
numbers = (8,7,6,8,4,9,7,5,3,2,7,4,9,8,2,6,5)
print (sorted (numbers))

import sys
print("="*5, "이터레이터 함수1", "="*20)
list = [1,2,3,4]
it = iter(list)

while True:
    try:
        print('it=', next(it)) 
    except StopIteration:
        print("예외발생")
        break 
print()

print("="*5, "이터레이터 함수2", "="*20)

import random 
for i in iter(lambda : random.randint(0,10), 2):
    print(i, end='') 
print()

print("="*5, "제너레이터 함수1", "="*20) 
print('yield의 동작과정') 

def number_generator1():
    yield 0 
    yield 1
    yield 2 
g = number_generator1()
print('next(g)', next(g)) 
print('next(g)', next(g))
print('next(g)', next(g))

print("="*5, "제너레이터 함수2", "="*20) 

def number_generator2(n):
    i = 0 
    while i<n:
        yield i
        i += 1 
for i in number_generator2(5):
    print(i)
        
print("="*5, "제너레이터 함수3", "="*20) 

def upper_generator (val):
    for i in val:
        yield i.upper() 
        
fruits = ['apple', 'pear', 'grape', 'pineapple', 'orange'] 
for i in upper_generator(fruits):
    print(i, end='')
