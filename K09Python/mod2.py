#mod2.py
def mul(a,b):
    return a*b
    
def div(a,b):
   return a/b

''' 
__name__ 변수
내부적으로 사용하는 특별한 변수명으로
콘솔에서 직접 mod2.py실행시 해당변수에 __name__이 저장됨
(import할경우는 모듈명인 mod2로 저장됨)
'''
if __name__ == "__main__":
    print("==여긴 mod2.py==")
    print(mul(1,4))
    print(div(4,2))