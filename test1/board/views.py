from django.shortcuts import render,get_object_or_404
from .models import Track
from .models import Product
from .models import Author


def hello_view(request):
    return render(request, 'hello.html')
def op(request):
    return render(request, 'op.html')
def food(request):
    return render(request, 'food.html')
def music(request):
    return render(request, 'music.html')
def home(request):
    return render(request,'home.html')

def product_list(request):
    products = Product.objects.all()
    return render(request , 'korzina.html',{'products':products})

def track_list(request):
    tracks = Track.objects.all()
    return render(request, 'track_list.html', {'tracks': tracks})

def author_tracks(request, author_id):
    author = get_object_or_404(Author, id=author_id)
    tracks = Track.objects.filter(author=author)
    return render(request, 'author_tracks.html', {'author': author, 'tracks': tracks})