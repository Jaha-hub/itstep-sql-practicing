from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import BlogPost


def register(request):
    """Представление для регистрации новых пользователей."""
    if request.user.is_authenticated:
        return redirect('blog_list')

    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user) # Автоматический вход после регистрации
            return redirect('blog_list')
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

class BlogPostListView(LoginRequiredMixin, ListView):
    model = BlogPost
    template_name = 'blog_list.html'
    context_object_name = 'posts'

class BlogPostDetailView(LoginRequiredMixin, DetailView):
    model = BlogPost
    template_name = 'blogpost_detail.html'

class BlogPostCreateView(LoginRequiredMixin, CreateView):
    model = BlogPost
    fields = ['title', 'content']
    template_name = 'blogpost_form.html'
    
    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

class BlogPostUpdateView(LoginRequiredMixin, UpdateView):
    model = BlogPost
    fields = ['title', 'content']
    template_name = 'blogpost_form.html'

class BlogPostDeleteView(LoginRequiredMixin, DeleteView):
    model = BlogPost
    success_url = reverse_lazy('blog_list')
    template_name = 'blogpost_confirm_delete.html'