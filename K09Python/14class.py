#14class.py
'''

'''
class FourCalculator: 
    def setdata(self, first, second):
        self.first = first
        self.second = second 
        
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
    
a = FourCalculator()
b = FourCalculator()

a.setdata(4, 2) 
b.setdata(3, 8)

print("객체a 덧셈" , a. addition() )
print("객체a 곱셈 ", a.multiplication()) 
print("객체b 뺄셈", b.subtraction()) 
print("객체b 나눗셈", b.division()) 
      
      
class CalculatorInit:
    count = 0
    '''
    def __init__(self):
        self.first = 1
        self.second = 2
    '''
    
    def __init__(self, first, second):
        self. first = first 
        self.second = second
        CalculatorInit.count += 1 
        
    def addition(self):
        result = self.first + self.second 
        return result
    
    @staticmethod 
    def staticArea (pFirst, pSecond):
        result = pFirst * pSecond
        print("static메소드", result) 
    
    @classmethod 
    def showInfo(cls):
        print('class메소드', cls.count) 
        
#fCal = FourCalculator Init() -> 에러발생
fCal = CalculatorInit(2010, 43) 
print(fCal.addition())
fCal.showInfo() 
CalculatorInit.staticArea(5, 8) 
      
class moreCalulator(CalculatorInit): 
    def pow(self):
        result = self.first ** self.second
        return result 

    def addition(self):
        return (self. first + self.second) * 2
    
    
moreCal = moreCalulator(4, 3) 
print("상속후", moreCal.pow())

p1 = CalculatorInit(100, 200) 
p2 = moreCalulator(100, 200) 
print("부모객체로호출", p1.addition())
print("자식객체로호출", p2.addition()) 

class Person: 
    def __init__(self, n, a, pw):
        self.name = n 
        self.age = a
        self.__passwd = pw 
    
    def secret_info(self):
        return self.__passwd 

p1 = Person('my', 22, 'qwer1234') 
print("이름", p1.name) 
print("나이", p1.age) 
print("비밀번호1", p1.__passwd) 
print("비밀번호2", p1.passwd) 
print("비밀번호", p1.secret_info())
