from django.contrib import admin
#등록시 해야함
from books.models import Book, Author, Publisher

#생성된 테이블을 관리자페이지에 등록
admin.site.register(Book)
admin.site.register(Author)
admin.site.register(Publisher)

