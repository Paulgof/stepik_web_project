from django.db import models
from django.contrib.auth.models import User


class QuestionManager(models.Manager):
    def new(self):
        return self.order_by('-added_at')

    def popular(self):
        return self.order_by('-rating')


class Question(models.Model):
    objects = QuestionManager()
    title = models.CharField(max_length=256)
    text = models.TextField()
    added_at = models.DateField(blank=True, auto_now_add=True)
    rating = models.IntegerField(default=0)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    likes = models.ManyToManyField(User, related_name='likes_set')


class Answer(models.Model):
    text = models.TextField()
    added_at = models.DateField(blank=True, auto_now_add=True)
    question = models.ForeignKey(Question, on_delete=models.SET_NULL, null=True)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
