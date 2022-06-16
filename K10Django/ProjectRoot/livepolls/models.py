from django.db import models

# Create your models here.
'''
장고에선느 테이블을 하나의클래스로정의하고,
테이블의 컬럼은 클래스의 변수로 매핑함

 django.db.models.Model 클래스를 상속받아 정의, 각 클래스 변수의
 타입도 장고에서 미리 정의한 필드 클래스사용
'''
#Question 테이블 생성 : 질문
class Question(models.Model):
    # pk는 자동생성됨 ㅇㅁㅇ (컬럼명 id로 됨)
    #질문항목 : varchar(200) 
    question_text = models.CharField(max_length=200)
    #등록일 : datetime, 뒤에 문자열은 설명문임
    pub_date = models.DateTimeField('date published')
    
    '''
    객체를 문자열로 표현시 사용
    미 정의시 테이블명이 제대로 표시되지않음
    '''
    def __str__(self) :
        return self.question_text

#Choice 테이블 생성 : 질문답변
class Choice(models.Model):
    #fk는 항상 부모테이블의 pk와 연결됨, 자동으로 _id 접미사가 붙음
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    #답변항목 : 문자형
    choice_text = models.CharField(max_length=200)
    #투표수 : 숫자형
    votes = models.IntegerField(default=0)
    
    def __str__(self) :
        return self.choice_text
     
