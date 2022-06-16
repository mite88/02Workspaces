from django.contrib import admin

#앱이름.models import 클래스명, 클래스명
from livepolls.models import Question, Choice

'''
models.py에서 테이블 생성시 관리자모드에 적용하기 위한 등록절차
이때 테이블은 클래스로 표현되어 상단에 import해야함
'''
admin.site.register(Question)
admin.site.register(Choice)