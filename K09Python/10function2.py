#10function2.py
'''

'''
#지역변수/전역변수
from re import A


total = 0
def sum(arg1, arg2):
    total = arg1 + arg2
    print("지역변수 total=", total)
    return total

print("전역변수 total=", total)
print("sum(10, 20)호출후 반환값=", sum(10, 20))

print("===============================")    

#내부함수 : 함수안에 다른함수 선언
def commander(saying):
    def inner(quote):
        return "조선의 위대한 장군 = '%s' " % quote
    return inner(saying)

print(commander("이순신"))
print("===============================")    

#순서매개변수
def printme(str1, str2):
    print(str1, str2)
    return

cont = "은 매우 좋은 프로그램입니다."
print("Python", cont)
print("===============================")  

#키워드 매개변수
def printinfo(name, age):
    print("이름:", name)
    print("나이:", age)
    return

printinfo(age=50, name='홍길동')
print("===============================")  

#기본매개변수
def defaultArgs(lan="Java"):
    print("내가 좋아하는 언어는 ", lan, "입니다")
    return

defaultArgs()
defaultArgs("C++")

#가변 매개변수
def product(*args):
    print("*args=>", args)
    result = 1
    for a in args:
        result *= a
    return result

print("product(1,2,3,4)=", product(1,2,3,4))

def famousMan(**man):
    print('**man', man)
    for key in man:
        print(key, "=>", man[key])
        
famousMan(의인='홍길동', 장군='이순신', 임금='세종대왕')
    