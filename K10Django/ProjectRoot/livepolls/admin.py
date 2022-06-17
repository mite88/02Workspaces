from dataclasses import fields
from secrets import choice
from django.contrib import admin

#앱이름.models import 클래스명, 클래스명
from livepolls.models import Question, Choice

#4.외래키관계의 테이블을 한화면에서 편집하기
#StackedInline : 세로형
#TabularInline : 테이블형
class ChoiceInline(admin.TabularInline):
    model = Choice #외래키관계의 테이블
    extra =2 # 입력상자갯수
    #해당 클래스 생성 후 QuestionChanger클래스에 등록해야함

class QuestionChanger(admin.ModelAdmin):
    #1. 관리자 모드에서 출력되는 필드순서 변경(테이블적용x)
    # fields =['pub_date', 'question_text']
    
    #2.필드분리하여 보여주기 +  순서변경
    #각 항목을 블럭으로 구분하여 제목 및 입력 부분 출력
    '''fieldsets = [
        ('질문을 입력하세요', {'fields' : ['question_text']}),
        ('날짜를 입력하세요', {'fields' : ['pub_date']}),
    ]'''
    
    #3.필드접기 : 'classes':['collapse']추가
    fieldsets = [
        ('질문을 입력하세요', {'fields' : ['question_text']}),
        ('날짜를 입력하세요', {'fields' : ['pub_date'], 'classes':['collapse']}),
    ]
    
    # 4번의 클래스를 inlines하여 등록함
    inlines = [ChoiceInline]
    list_display =('question_text', 'pub_date')
    list_filter = ['pub_date']
    search_fields =['question_text']

'''
models.py에서 테이블 생성시 관리자모드에 적용하기 위한 등록절차
이때 테이블은 클래스로 표현되어 상단에 import해야함
'''
admin.site.register(Question, QuestionChanger)
admin.site.register(Choice)