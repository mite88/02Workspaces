from django.shortcuts import render

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