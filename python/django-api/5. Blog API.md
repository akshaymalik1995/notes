# BLOG API

Our next project is a Blog API using the full set of Django REST Framework features. It will have users, permissions, and allow for full CRUD (Create-Read-Update-Delete) functionality. We’ll also
explore viewsets, routers, and documentation.

## Initial Set Up

- Create a directory `blogapi`
- Install `django` in a new virtual environment.
- Create a new django project
- Create an app `posts` for blog entries.
- Add `posts` to our list of `INSTALLED_APPS` in the `config/settings.py`
- Now run `migrate` for the first time to sync our database with Django’s default settings and the
new app.

## Model

- Our database model will have five fields: `author`, `title`, `body`, `created_at`, and `updated_at`.

```python
#posts/models.py
from django.db import models
from django.contrib.auth.models import User
class Post(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=50)
    body = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.title

```
`python manage.py makemigrations posts`
`python manage.py migrate`

```python
# posts/admin.py
from django.contrib import admin
from .models import Post
admin.site.register(Post)

```

`python manage.py runserver`

- Navigate to http://127.0.0.1:8000/admin/ and log in with your superuser credentials. Click on
the `+ Add` button next to `Posts` and create a new blog post.

## Tests

- Let’s write a basic test for our `Post` model. 
- We want to ensure a logged-in user can create a blog post with a title and body.

```python
# posts/tests.py
from django.test import TestCase
from django.contrib.auth.models import User
from .models import Post
class BlogTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Create a user
        testuser1 = User.objects.create_user(
        username='testuser1', password='abc123')
        testuser1.save()
        # Create a blog post
        test_post = Post.objects.create(
        author=testuser1, title='Blog title', body='Body content...')
        test_post.save()
    def test_blog_content(self):
        post = Post.objects.get(id=1)
        author = f'{post.author}'
        title = f'{post.title}'
        body = f'{post.body}'
        self.assertEqual(author, 'testuser1')
        self.assertEqual(title, 'Blog title')
        self.assertEqual(body, 'Body content...')
```
- To confirm that our tests are working quit the local server Control+c. Then run our tests.


`python manage.py test`

## Django REST Framework 

Django REST Framework takes care of the heavy lifting of transforming our database models into a RESTful API.

There are three main steps to this process:
- `urls.py` file for the URL routes
- `serializers.py` file to transform the data into JSON
- `views.py` file to apply logic to each API endpoint


`pip install djangorestframework`

```python
# config/settings.py

INSTALLED_APPS = [
...
'rest_framework', # new
]
# new

REST_FRAMEWORK = {
'DEFAULT_PERMISSION_CLASSES': [
'rest_framework.permissions.AllowAny',
]
}
```

## URLs

```python
# config/urls.py

from django.contrib import admin
from django.urls import include, path # new

urlpatterns = [
path('admin/', admin.site.urls),
path('api/v1/', include('posts.urls')), # new
]
```

It is a good practice to always version your APIs—v1/, v2/, etc—since when you make a large change there may be some lag time before various consumers of the API can also update. That way you can support a v1 of an API for a period of time while also launching a new, updated v2 and avoid breaking other apps that rely on your API back-end.

- Next create our posts app `urls.py` file.

```python
# posts/urls.py
from django.urls import path
from .views import PostList, PostDetail
urlpatterns = [
path('<int:pk>/', PostDetail.as_view()),
path('', PostList.as_view()),
]
```python


## Serializers

Now for our serializers. Create a new `serializers.py` file in our posts app.


```python

# posts/serializers.py
from rest_framework import serializers
from .models import Post
class PostSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('id', 'author', 'title', 'body', 'created_at',)
        model = Post


```

## Views

# posts/views.py
from rest_framework import generics
from .models import Post
from .serializers import PostSerializer
class PostList(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
class PostDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
