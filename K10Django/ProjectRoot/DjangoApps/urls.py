"""DjangoApps URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

''' 
해당 URLconf는 프로젝트 레벨이라 livepolls앱의 views파일(모듈)
을 임포트해야 접근가능 
'''
from livepolls import views

#장고에서의 url패턴 : path(요청url패턴, 처리한view함수명, url별칭)
urlpatterns = [
    path('admin/', admin.site.urls),
    # http://localhost:8000/으로 요청이 들어오면메인화면으로 대체
    path('', views.main, name='main'), # 메인화면추가
    
    #방법1 : 파일 1개로
   
    #path("livepolls/", views.index, name="index"),
    #path("livepolls/<int:euqstion_id>/", views.detail, name="detail"),
    #path("livepolls/<int:euqstion_id>/results/", views.results, name="results"),
    #path("livepolls/<int:euqstion_id>/vote/", views.vote, name="vote") ,

    #방법2 : 파일 2개로
    #설문관련 요청이 들어오면 뒷부분 앱수준의 urls.py에서 매핑함
    path("livepolls/", include('livepolls.urls')),
]
