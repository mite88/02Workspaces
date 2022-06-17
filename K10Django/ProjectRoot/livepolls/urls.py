from django.urls import path
from . import views

#차후 url처리를위한 네임스페이스
app_name = 'livepolls'
urlpatterns = [
    #http://localhost:8000/livepolls
    #투표목록보기: 모든투표항목리스팅
    path("", views.index, name="index"),
    
    #http://localhost:8000/livepolls/pk번호
    #투표항목상세보기":질문하위에 등록한 내용이 출력되어 투표 진행가능
    path("<int:question_id>/", views.detail, name="detail"),
    
    #투표페이지
    path("<int:question_id>/vote/", views.vote, name="vote") ,
    #결과보기페이지
    path("<int:question_id>/results/", views.results, name="results") ,
]
