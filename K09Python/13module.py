#13module.py
'''
모듈
다른 파이썬 프로그램을 불러와 사용할 수 있게 만든 파일로
함수 및 변수 또는 클래스를 모아 놓은것을 말함
모듈을 모아놓은것을 패키지라함

형식]
    import 모듈명
    from 모듈명 import 함수
'''
#사용1 : 함수 호출시 모듈명 같이 기술
import mod1
print("모듈의 함수호출1:", mod1.add(3, 4))
print("모듈의 함수호출2:", mod1.sub(4, 2))

#사용2 : 함수 호출시 모듈명 생략
from mod1 import add
result = add(3,4)
print("결과 :",result)

#사용3 : 2와 동일하나 모든 함수를 한번에 임포트 시키는 방식
from mod1 import *
result1 =add(3,4)
print("결과 :",result1)
result2 =sub(3,4)
print("결과 :",result2)

'''
__name__ 변수를 사용한 모듈로 import할경우
"mod2"가 저장되므로 해당 블록은 실행되지 않음
'''
import mod2
result = mod2.mul(3,4)
print(result)

#위치가 다를경우 패키지를 이용함 
import kosmo.mod3
#패키지명까지 포함한 형태로 함수호출
kosmo.mod3.sum1To10()

#이와 같이 특정 함수를 import하면 패지지명생략가능
from kosmo.mod3 import sum1To10
sum1To10()