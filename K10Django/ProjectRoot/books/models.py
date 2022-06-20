from django.db import models

#책테이블
class Book(models.Model):
    #책이름
    title = models.CharField(max_length=100)
    #저자명 : n:n 외래키관계
    authors = models.ManyToManyField('Author') 
    #출판사 : 1:1 외래키관계
    publisher = models.ForeignKey('Publisher', on_delete=models.CASCADE) 
    publication_date = models.DateField()
    
    #해당 함수가 없으면 테이블생성안됨
    def __str__(self):
        return self.title

#저자 테이블
class Author(models.Model):
    #이름
    name = models.CharField(max_length=50) 
    #인사말
    salutation = models.CharField(max_length=100) 
    #이메일
    email = models.EmailField()

    def __str__(self):
        return self.name

#출판사테이블
class Publisher(models.Model):
    name = models.CharField(max_length=50)
    address = models.CharField(max_length=100)
    wdbsite = models.URLField()
    
    def __str__(self):
        return self.name