# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
#pandas 불러오기
import pandas as pd

#key:value 쌍으로 딕셔너리만들고, 변수 dict_data저장
dict_data = {'a':1, 'b':2, 'c':3}

#판다스 Series()함수로 dictionary를 Series로 변환
sr = pd.Series(dict_data)

#sr의 자료형 출력
print(type(sr))
print('\n')

#변수 sr에 저장된 시리즈 객체 출력
print(sr)