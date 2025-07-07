from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import BlogPost
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.urls import reverse_lazy
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages

# Create your views here.

class BlogPostListView(ListView):
    model = BlogPost
    template_name = 'blog_list.html'
    context_object_name = 'posts'
    ordering = ['-created_at']

class BlogPostDetailView(DetailView):
    model = BlogPost
    template_name = 'blog_detail.html'

class BlogPostCreateView(LoginRequiredMixin, CreateView):
    model = BlogPost
    fields = ['title', 'content']
    template_name = 'blog_form.html'

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

class BlogPostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = BlogPost
    fields = ['title', 'content']
    template_name = 'blog_form.html'

    def test_func(self):
        post = self.get_object()
        return self.request.user == post.author

class BlogPostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = BlogPost
    template_name = 'blog_confirm_delete.html'
    success_url = reverse_lazy('blog_list')

    def test_func(self):
        post = self.get_object()
        return self.request.user == post.author

def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Вы успешно зарегистрировались! Теперь можете войти.')
            return redirect('login')
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {'form': form})
