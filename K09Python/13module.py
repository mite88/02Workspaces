#13module.py
import mod1
print("모듈의 함수호출1:", mod1.add(3, 4))
print("모듈의 함수호출2:", mod1.sub(4, 2))

from mod1 import add
result = add(3,4)
print("결과 :",result)

from mod1 import *
result1 =add(3,4)
print("결과 :",result1)
result2 =sub(3,4)
print("결과 :",result2)

import mod2
result = mod2.mul(3,4)
print(result)

import kosmo.mod3
kosmo.mod3.sum1To10()

from kosmo.mod3 import sum1To10
sum1To10()