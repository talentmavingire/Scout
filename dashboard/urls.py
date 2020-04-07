from django.urls import path
from .views import (
	PostListView,
	PostDetailView,
	PostCreateView,
	PostUpdateView,
	PostDeleteView,
    UserPostListView,
    CompanyPostListView,
    EducationCreateView,
    EducationDetailView,
    EducationUpdateView,
    EducationDeleteView,
    ExperienceCreateView,
    ExperienceUpdateView,
    ExperienceDeleteView,
    UserExperienceListView,
    UserEducationListView,
    JobPostActivityCreateView,
    JobPostActivityListView

)

#import from current directory
from . import views

#leave path blank if you want this to be the homepage 
urlpatterns = [
    path('', views.home, name='dashboard-home'),
    path('user/<str:username>', UserPostListView.as_view(), name='user-posts'),
    path('company/<str:company_name>', CompanyPostListView.as_view(), name='company-posts'),
    path('education/<str:username>/', UserEducationListView.as_view(), name='user-degrees'),
    path('experience/<str:username>/', UserExperienceListView.as_view(), name='user-experience'),
    path('job/<int:pk>/applicants', JobPostActivityListView.as_view(), name='job-applicants'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('education/<int:pk>/', EducationDetailView.as_view(), name='education-detail'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('education/<int:pk>/update/', EducationUpdateView.as_view(), name='education-update'),
    path('experience/<int:pk>/update/', ExperienceUpdateView.as_view(), name='experience-update'),
    path('post/<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('education/<int:pk>/delete/', EducationDeleteView.as_view(), name='education-delete'),
    path('experience/<int:pk>/delete/', ExperienceDeleteView.as_view(), name='experience-delete'),
    path('post/new/', PostCreateView.as_view(), name='post-create'),
    path('education/<str:username>/add/', EducationCreateView.as_view(), name='education-create'),
    path('experience/<str:username>/add/', ExperienceCreateView.as_view(), name='experience-create'),
    path('post/<int:pk>/apply/', JobPostActivityCreateView.as_view(), name='apply-create'),
    path('about/', views.about, name='dashboard-about'),
]

