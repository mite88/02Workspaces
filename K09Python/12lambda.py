#12lambda.py
'''

'''

def two_sum(x, y):
    return x+y

print("함수를 통한 두수의 합=", two_sum(10,20))

sum = lambda arg1, arg2 : arg1+arg2
print("람다식을 통한 합=",sum(10,20))

power = lambda num :num **2
print("5의 제곱은=", power(5))

print("람다식 자체호출=", (lambda x, y : x+y)(100,200))

print("### 람다식과 map함수1 ###")
multLambda = lambda x:x*2
list_data = [1,2,3,4,-1,-2,-5,-10]
result_list = list(map(multLambda, list_data))
print("result_list",result_list);

print("### 람다식과 map함수2 ###")
list_data2 = [1,2,3,4,5,6,7,8,9,10]
strNumLambda = lambda x : str(x) if x%3==0 else x
result_list2 = list(map(strNumLambda, list_data2))
print("result_list2",result_list2);

print("### 람다식과 filter함수 ###")

powLambda = lambda y : y**2
list_data3 = [1,4,9,16,25,46,64,81,100]
result_list3 = list(map(powLambda, list_data3))
print('result list2', result_list3)

filter_result = list(filter(lambda z: z>50 and z<1000, result_list3))
print('filter_result', filter_result)

print("### 람다식과 reduce함수 ###")
import functools, operator
sum1 = functools.reduce(lambda i, j: i + j, range(1,11))
print("sum1=", sum1)

sum2 = functools.reduce(operator.add, range(1, 11))
print("sum2=", sum2)

