from django.db import models
import os
from django.conf import settings

class Post(models.Model):
    titles = models.CharField(max_length=50)
    contents = models.TextField()
    mainphoto = models.ImageField(blank=True, null=True)
    
    #이부분 없으면 게시글 제목이 안나오고 Post object(1),(2)로나옴
    def __str__(self):
        return self.titles
    
    def delete(self, *args, **kargs):
        if self.mainphoto:
            print(settings.MEDIA_ROOT, self.mainphoto.path)
            os.remove(os.path.join(settings.MEDIA_ROOT, self.mainphoto.path))
        super(Post, self).delete(*args, **kargs)