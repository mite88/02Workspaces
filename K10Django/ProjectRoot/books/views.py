from django.shortcuts import render
from django.views.generic.base import TemplateView
from django.views.generic import ListView
#디테일뷰
from django.views.generic import DetailView
#레코드 조회를 위한 모델 클래스 임포트
from books.models import Book, Author, Publisher

#books 애플리케이션 철 화면을 출력 : TemplateView상속하여 정의
class BooksModelView(TemplateView):
    #파일경로 지정 , 클래스형 뷰 사용시 함수형 뷰처럼 render()함수를 통해 자동 렌더링됨
    template_name = 'books/index.html'
    
    #템플릿으로 전달할 데이터가 있는 경우 오버라이딩
    def get_context_data(self, **kwargs):
        #오버라이딩 하는경우 super()을 첫줄에 선언해야함
        context = super().get_context_data(**kwargs)
        #템플릿에 전달할 데이터 저장함
        context['model_list'] = ['Book', 'Author', 'Publisher']
        return context

class Booklist(ListView):
    model= Book
   
class AuthorList(ListView):
    model= Author
    
class PublisherList(ListView):
    model= Publisher
  
class BookDetail(DetailView):
    model= Book
   
class AuthorDetail(DetailView):
    model= Author
    
class PublisherDetail(DetailView):
    model= Publisher 