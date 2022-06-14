'''
지역변수와 전역변수
    : 두개의 변수가 동일한 이름으로 사용되는 경우 지역변수가
    항상 우선순위가 높다. 
'''
# 전역변수 선언
total = 0  
def sum(arg1, arg2):
    # 지역변수 선언
    total = arg1 + arg2 
    # 지역변수가 우선순위가 높으므로 덧셈의 결과 출력됨
    print("지역변수 total=", total)
    return total 

# 초기값 0이 그대로 출력됨
print("전역변수 total=", total)  
# 덧셈의 결과 출력됨
print("sum(10, 20)호출후 반환값=", sum(10, 20))  
print("===========================")

'''
내부함수
    : 파이썬은 함수내부에 또 다른 함수를 선언할 수 있다. 
    형식]
        def 함수명1():
            실행문
            def 함수명2():
                실행문
'''
# 함수정의
def commander(saying):
    # 내부함수정의
    def inner(quote):  
        return "조선의 위대한 장군 = '%s'" % quote
    #내부함수의 호출한 후 반환된 값을 다시 반환한다. 
    return inner(saying) 
# 1차로 함수를 호출하면 내부에서 2차 호출이 발생되어 결과값을 반환한다.
print(commander("이순신"))  
print("===========================")

'''
파이썬에서는 매개변수를 전달하는 4가지 방법이 있다. 
''' 
#1.순서 매개변수 : 함수에서 사용하는 가장 일반적인 방식으로 작성 순서대로 전달한다.
def printme(str1, str2):
    print(str1, str2)
    return
cont = "은 매우 좋은 프로그램입니다."
printme("Python", cont)
print("===========================")

#2.키워드 매개변수 : 순서와 상관없이 매개변수명에 따라 전달한다. 
def printinfo(name, age):
    print("이름:", name)
    print("나이:", age)
    return
printinfo(age=50, name='홍길동')
print("===========================")

#3.기본(디폴트) 매개변수 : 인수가 전달되지 않는경우 디폴트로 지정되는 값을 말한다.
def defaultArgs(lan="Java"):
    print("내가 좋아하는 언어는 ", lan, "입니다")
    return
# 이경우 인수로 Java가 사용된다. 
defaultArgs()
# 여기서는 C++이 전달되어 사용된다. 
defaultArgs("C++")  
 

'''
4. 가변 매개변수
    : 여러개의 매개변수를 전달해야 할때 사용하는 방식으로 Java의
    가변인자와 비슷하다. 
    *를 이용해서 매개변수값을 튜플로 그룹화한다. 
    **를 이용해서 매개변수를 딕셔너리로 사용할 수 있다. 
''' 
def product(*args):
    #튜플 형태로 출력된다. 
    print("*args=>", args)  
    result = 1
    #튜플의 갯수만큼 반복이 가능하다.
    for a in args:  
        #각 원소를 통해 누적곱을 계산한다. 
        result *= a  
    return result
print("product(1,2,3,4) =", product(1,2,3,4))

def famousMan(**man):
    #딕셔너리 형태로 출력된다. 
    print('**man', man)  
    #딕셔너리는  key를 통해 value를 출력한다. 
    #즉, 반복시 얻어온 key를 통해 해당 값을 출력한다. 
    for key in man:  
        print(key, "=>", man[key])
famousMan(의인='홍길동', 장군='이순신', 임금='세종대왕')

