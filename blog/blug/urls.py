from django.urls import path
from blug.views import (
    BlogPostListView,
    BlogPostDetailView,
    BlogPostCreateView,
    BlogPostUpdateView,
    BlogPostDeleteView,
)

urlpatterns = [
    path('', BlogPostListView.as_view(), name='blog_list'),
    path('post/<int:pk>/', BlogPostDetailView.as_view(), name='blog_detail'),
    path('post/new/', BlogPostCreateView.as_view(), name='blog_create'),
    path('post/<int:pk>/edit/', BlogPostUpdateView.as_view(), name='blog_update'),
    path('post/<int:pk>/delete/', BlogPostDeleteView.as_view(), name='blog_delete'),
]