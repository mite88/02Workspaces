from django.urls import path
from . import views

#차후 url처리를위한 네임스페이스
app_name = 'tempapps'
urlpatterns = [
    #http://localhost:8000/tempapps
    #투표목록보기: 모든투표항목리스팅
    path("", views.index, name="index"),
    
    #템플릿필터
    path("template.filter/", views.templateFilter, name="my_filter"), 
    #템플릿태그
    path("template.tag/", views.templateTag, name="my_tag"), 
    #폼사용하기
    #path("template.create/", views.templateFilter, name="my_formCreate"), 
    
    #path("thanks/", views.thanks), 

]
 