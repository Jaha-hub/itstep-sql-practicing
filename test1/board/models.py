from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=100, verbose_name="Название")
    description = models.TextField(verbose_name="Описание")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")

    def __str__(self):
        return self.name


class Author(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Track(models.Model):
    title = models.CharField(max_length=100)
    author_id = models.ForeignKey(Author, on_delete=models.CASCADE)

    def __str__(self):
        return self.title
