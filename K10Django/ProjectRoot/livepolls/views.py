'''
단축함수
장고에서 웹 프로그램 개발시 자주 사용하는기능을
내장함수로 제공하는데 이를 단축함수라함
대표적으로 render()와 같은 함수가 있음
'''

from django.shortcuts import get_object_or_404, render

#Model(Question테이블) 사용하기 위한 임포트
from livepolls.models import Question

from livepolls.models import Choice
from django.http import HttpResponseRedirect
from django.urls import reverse


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

'''
 get_object_or_404(모델클래스(테이블), 검색조건)
 모델 클래스에서 검색 조건에 맞느 객체를 select하여 반환
 조건에 맞는 객체가 없으면 404에러 발생
'''
def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'livepolls/detail.html', {'question':question})

#투표처리 : 선택한 항목의 votes칼럼 +1함
#question_id은 매개변수로 전달된 값
def vote(request, question_id):
    # 선택한 질문의 일련번호로 레코드얻기
    question = get_object_or_404(Question, pk=question_id) 
    try:
        #request.POST['choice'] : <form>태그의 전송된 값
        #choice_set.get : 외래키 항목에서 해당 컬럼을 얻는거 
        selected_choice = question.choice_set.get(pk=request.POST['choice']) 
    except (KeyError, Choice.DoesNotExist):
        #예외발생시 detail페이지로 다시 렌더링함 이때 에러메세지가 출력됨
        return render(request, 'livepolls/detail.html', {
            'question': question, 
            'error_message': "You didn't select a choice.",
        })
    else:
        #정상적으로 실행시 가져온 레코드를 통해 votes항목을 1증가시킴
        selected_choice.votes += 1 
        #앞에서 처리한 내용을 실제 테이블에 적용
        selected_choice.save() 
        
        #결과페이지 이동
        '''
        reverse(url별칭, 인수) : 
        별칭 및 인수를 통해 url을 만들기 위한 함수, 이경우 별칭을 통해 url을 만듬 
        '''
        return HttpResponseRedirect(reverse('livepolls:results', args=(question.id,)))

#결과보기페이지
def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    #템플릿 렌더링
    return render(request, 'livepolls/results.html', {'question':question})
