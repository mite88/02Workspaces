#14class.py
'''
인스턴스 변수
메서드안에 정의된변수

클래스 내부 : self.변수명 형태로 접근
클래스 외부 : 객체변수.인스턴스변수 형태로 접근

인스턴스 메서드
인스턴스 변수에 항상 접근할 수 있도록 메서드 첫번째 매개변수에
항상 객체 자신을 의미하는 self 선언해야함
'''
#클래스 선언
class FourCalculator: 
    #setter() 메서드로 초기화 담당
    def setdata(self, first, second):
        #self.멤버변수 = 매개변수 형태로기술하여 초기화
        self.first = first
        self.second = second 
    #인스턴스 메서드 정의
    def addition(self):
        result = self.first + self.second
        return result 
    
    def subtraction(self):
        result = self.first - self.second
        return result 

    def multiplication(self):
        result = self.first * self.second
        return result 
    
    def division(self):
        result = self.first / self.second 
        return result
    
#객체 생성 (파이썬(최근나온언어들 대부분)에선 new키워드 사용x)
a = FourCalculator()
b = FourCalculator()

#객체 생성후 setter()를 통해 인스턴스 변수 초기화
#self는 함수 생성시 반드시필요하므로 호출시엔 무시해야함 ㅇㅊㅇ;;;;
a.setdata(4, 2) 
b.setdata(3, 8)

#각 객체의 인스턴스 메서드 호출
print("객체a 덧셈" , a. addition() )
print("객체a 곱셈 ", a.multiplication()) 
print("객체b 뺄셈", b.subtraction()) 
print("객체b 나눗셈", b.division()) 
      
'''
생성자(Initializer)
클래스로 부터 객체 생성 시 인스턴스 변수 초기화
init양쪽에 언더바 2개 붙여서 저으이함

정적메서드
클래스명으로 바로 적ㅂ근 가능한 메서드
@staticmethod라는 데코레이터 사용

클래스 메서드
정적메서드와 비슷하나, 객체 인스턴스를 의미하는 self대신
cls라는 클랙스를 의미하는 파라미터르 전달받음
cls를 통해 클래스 변수 엑세스 가능
@classmethod라는 데코레이터 사용

클래스변수
클래스 전체에서 접근 가능한 전역변수
'''      
class CalculatorInit:
    #클래스 변수생성
    count = 0
    '''
    #생성자 오버로딩이 지원안됨 ㅇㅊㅇ;;;
    def __init__(self):
        self.first = 1
        self.second = 2
    '''
    #생성자 메서드 정의
    #멤버변수 초기화를 위해 첫번째파라미터는 self(필수)
    def __init__(self, first, second):
        #인스턴스 변수
        self. first = first 
        self.second = second
        #생성자에서 클래스변수 접근가능
        CalculatorInit.count += 1 
    
    #인스턴스 메서드    
    def addition(self):
        #인스턴스 변수 진입을 위해 self가 필수
        result = self.first + self.second 
        return result
    
    '''
    정적메서드
    객체생성 없이 클래스명으로 직접 호출가능
    '''
    @staticmethod 
    def staticArea (pFirst, pSecond):
        result = pFirst * pSecond
        print("static메소드", result) 
    
    #클래스 메서드 : cls를 통해 클래스 변수에 접근
    @classmethod 
    def showInfo(cls):
        print('class메소드', cls.count) 
        
#fCal = CalculatorInit() -> 에러발생(기본생성자 미정의)
# 2개의 인수를 전달하여 객체 생성
fCal = CalculatorInit(2010, 43) 
print(fCal.addition()) #일반적인 인스턴스메서드호출
fCal.showInfo() #클래스메서드 호출 : 인스턴스 변수이용(권장x)
CalculatorInit.staticArea(5, 8) #클래스메서드 호출 : 클래스명이용
    
#상속 : 파이썬에선 별도 키워드 없이 클래스 정의시 매개변수 형태로 상속함
class moreCalulator(CalculatorInit): 
    #자식쪽에서 확장한 인스턴스 메서드
    def pow(self):
        #first second만큼 거듭 제곱
        result = self.first ** self.second
        return result 

    #오버라이딩 : 부모의 기능을 자식쪽으로 재정의한 메서드
    def addition(self):
        return (self. first + self.second) * 2
    
#객체 생성및 메서드 호출
moreCal = moreCalulator(4, 3) 
#4의 3승
print("상속후", moreCal.pow())

p1 = CalculatorInit(100, 200) #부모클래스
p2 = moreCalulator(100, 200) #자식클래스

print("부모객체로호출", p1.addition())
print("자식객체로호출", p2.addition()) 

#정보은닉 : 인스턴스 변수를 private로 정의
class Person: 
    #생성자 메서드 정의
    def __init__(self, n, a, pw):
        #__가 없으면 public
        self.name = n 
        self.age = a
         #__가 있으면 private 
        self.__passwd = pw 
    
    def secret_info(self):
        return self.__passwd 

#객체 생성 및 초기화
p1 = Person('my', 22, 'qwer1234') 
print("이름", p1.name) 
print("나이", p1.age) 

#passwd은 private라 접근안됨
#print("비밀번호1", p1.__passwd) 
#변수없어서 에러남
#print("비밀번호2", p1.passwd) 

#private 변수는 메서드를통해 간접적으로 접근하여 출력
print("비밀번호", p1.secret_info())
