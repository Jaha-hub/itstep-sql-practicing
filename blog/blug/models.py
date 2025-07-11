from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='blog_posts')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        """Возвращает URL для доступа к конкретному экземпляру поста."""
        return reverse('blog_detail', kwargs={'pk': self.pk})