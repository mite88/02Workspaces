#16tryexcept.py
'''
예외처리
(try ~except)
else도 사용가능
형식]
    try:
    실행할 코드
    except:
        예외가 발생했을 때 처리하는 코드
    else:
        예외가 발생하지 않았을 때 실행할 코드
    finally:
        예외 발생 여부와 상관없이 항상 실행할 코드
'''
def calc(val):
    sum = None 
    try:
        #예외발생이 예상되는 지점에  try로 묶음
        sum = val[0] + val[1] + val[2]
        if val[0]==100:
            #선언하지 않은 변수
            print(no_var) 
        elif val[0]==55:
            #무한대가 되기때문에 예외발생
            result = val[0] / 0
            print("결과", result) 
            
    except IndexError:
        print('리스트의 인덱스 에러')
    #예외발생시 에러메서지를 변수로 받아 출력시 as를 사용
    except NameError as err: 
        print('선언되지 않은 변수 사용', str(err)) 
    #모든예외처리
    except:
        print('에러 발생') 
    #예외발생없을때 출력
    else:
        print('에러없음^^')
    #무조건실행
    finally:
        print('sum', sum)

print('실행1')
calc([1, 2, 3])
print('실행2')
calc([10, 20])
print('실행3') 
calc([100, 101, 102, 103])
print('실행4')
calc([55,56,57])

print('실행5') 
try:
    fp = open("test.txt", "r")
    try:
        lines = fp.readlines()
        print(lines) 
    finally:
        print("파일객체 닫기")
        fp.close()
except IOError:
    print('파일에러발생')

#개발자가 직접 예외 발생시키기
print('실행6') 
try:
    x = int(input('3의 배수 입력 : '))
    if x % 3 != 0:
        raise Exception('[예외메세지] 3의 배수 아님')
    print(x) 
except Exception as e:
    print('예외발생')

'''
개발자 정의 예외클래스 생성
'''
#상속
print('실행7')
class GugudanRangeExcept(Exception): 
    def __init__(self):
        super().__init__('구구단 범위 벗어남')

def print_gugudan(end_num):
    try: 
        if end_num > 9:
            raise GugudanRangeExcept 
        end_su = end_num + 1 
        for su in range(2, end_su): 
            for dan in range(1,10):
                print("%2d * %2d = %2d" % (su, dan, su*dan), end=' ') 
            print() 
        print() 
    except Exception as e:
        print('예외발생 ', e)

print_gugudan(int(input("출력할 단 수를 입력:")))
