import re
from django.shortcuts import redirect, render
from .models import Post
import os
from django.conf import settings
from django.core.paginator import Paginator

def index(request):
    return render(request, 'board/index.html')

def list(request):
    page = request.GET.get('page', 1)
    postlist = Post.objects.all().order_by('-id')
    
    paginator = Paginator(postlist, 10)
    postlist = paginator.get_page(page)
    return render(request, 'board/list.html', {'postlist':postlist})

def write(request):
    if request.method == "POST":
        try:
            Post.objects.create(
                titles = request.POST['titles'],
                contents = request.POST['contents'],
                mainphoto = request.FILES['mainphoto'],
            )
        except:
            Post.objects.create(
                titles = request.POST['titles'],
                contents = request.POST['contents'],
            )
        return redirect('/board/list/')
    
    return render(request, 'board/write.html')

def view(request, pk):
    post = Post.objects.get(pk=pk)
    return render(request, 'board/view.html', {'post':post})

def edit(request, pk):
    post = Post.objects.get(pk=pk)
    
    if request.method == "POST":
        try:
            post.titles = request.POST['titles']
            post.contents = request.POST['contents']
            post.mainphoto = request.FILES['mainphoto']
            
            print(os.path.join(settings.MEDIA_ROOT, request.POST['mainphoto']))
            os.remove(os.path.join(settings.MEDIA_ROOT, request.POST['mainphoto']))
            
        except:
            post.titles = request.POST['titles']
            post.contents = request.POST['contents']
        post.save()
        return redirect('/board/view/'+str(pk)+'/')
    
    return render(request, 'board/edit.html',{'post':post})

def delete(request, pk):
    post = Post.objects.get(pk=pk)
    
    if request.method == "GET":
        post.delete()
        return redirect('/board/list/')