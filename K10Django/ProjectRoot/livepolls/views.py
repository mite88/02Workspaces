'''
단축함수
장고에서 웹 프로그램 개발시 자주 사용하는기능을
내장함수로 제공하는데 이를 단축함수라함
대표적으로 render()와 같은 함수가 있음
'''

from django.shortcuts import get_object_or_404, render

#Model(Question테이블) 사용하기 위한 임포트
from livepolls.models import Question

#메인함수 : 기능없고 바로가기 링크만 있는 페이지 구성
#views.py에 함수를 정의 시 request내장객체는 필수
def main(request):
    #render()함수는 웹브라우저에 해당 템플시의 내용을 찰력하는 역할
    return render(request, 'livepolls/main.html')

#투표앱의 첫번째화면 : 질문리스팅
def index(request):
    #Question 테이블에서 pub_date를 내림차순정렬하여 최근게시물 5개 가져옴
    latest_question_list = Question.objects.all().order_by('-pub_date')[:5]
    #템플릿으로 데이터 전달을 위해 디셔너리에 저장
    context = {'latest_question_list':latest_question_list}
    #render함수로 템플릿 로드 및 데이터 전달
    return render(request, 'livepolls/index.html', context)

def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'livepolls/detail.html', {'question':question})