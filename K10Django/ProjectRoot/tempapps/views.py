from django.shortcuts import render
from django.http import HttpResponseRedirect
from tempapps.forms import QuestionForm, BoardWriteForm

#템플릿 메인페이지
def index(request):
    return render (request, 'index.html')

#템플릿 필터사용
def templateFilter(request):
    #정수형 변수
    num1 = 1
    num2 = 10
    #문자형 변수
    engStr = "nakja's MustHave\r\njava <b>web</b>programming" 
    hanStr = "낙자쌤의 자바 웹 프로그래밍"
    
    #집합형 변수 
    dictVar = {'a':'유비','b':'관우','c':'장비'}
    listVar = ['손오공', '저팔계', '사오정']
    
    #템플릿으로 전달한 변수를 딕셔너리로 정의
    context = {'num1': num1, 'num2': num2, 'engStr': engStr, 
               'hanStr': hanStr, 'dictVar': dictVar, 'listVar': listVar}

    #템플릿렌더링
    return render(request, 'template_filter.html', context)

#템플릿 태그 사용
def templateTag(request):
    books=[
        {'name':'자바','price':1000},
        {'name':'HTML','price':2000},
        {'name':'JSP','price':3000}
    ]
    
    hobbys =[]
    favorites =['운동','공부','여행','경제']
    iVar = range(1, 11)
    
    context = {'books':books, 'hobbys':hobbys, 'favorites':favorites,
               'iVar':iVar}
    
    #템플릿렌더링
    return render(request, 'template_tag.html', context)

def formCreate(request):
    '''
    하나의 함수에 폼 출력된 전송된 값의 처리를 동시에 하도록 권장
    '''
    if request.method == 'POST':
        #전송방식이 Post
        form = QuestionForm(request.POST)
        
        #유효성 검사
        if form.is_valid():
            #폼 데이터가 유효시 클린데이터로 복사
            user_id = form.cleaned_data['user_id']
            title = form.cleaned_data['title']
            
            #폼데이터에 문제가 없으면 DB에 처리하는등의 비즈니스로직을 수행
            
            #vpdlwl dlehd
            #return HttpResponseRedirect('/tempapps/thanks/')
            return render(request,'thanks.html', {'user_id':user_id, 'title':title})
    else:
        #전송방식이 get
        form = QuestionForm()
    #입력폼 진입을 위해 템플릿 렌더링
    #return render(request, 'form_create.html', {'user_id':user_id})
    return render(request, 'form_create.html', {'form':form})
        
def thanks(request):
    #user_id = request.args.get('user_id')
    return render(request, 'thanks.html')

def boardWrite(request):
    if request.method == 'POST':
        #전송방식이 Post
        form = QuestionForm(request.POST)
        
        #유효성 검사
        if form.is_valid():
            #폼 데이터가 유효시 클린데이터로 복사
            name = form.cleaned_data['name']
            title = form.cleaned_data['title']
            
            #폼데이터에 문제가 없으면 DB에 처리하는등의 비즈니스로직을 수행
            
            #vpdlwl dlehd
            #return HttpResponseRedirect('/tempapps/thanks/')
            return render(request,'thanks.html', {'name':name, 'title':title})
    else:
        #전송방식이 get
        form = BoardWriteForm()
    return render(request, 'boardWrite.html', {'form':form})
        