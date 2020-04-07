from django.shortcuts import render, get_object_or_404, reverse
from django.contrib.auth.models import User
from django.views.generic import (
	ListView, 
	DetailView, 
	CreateView, 
	UpdateView,
	DeleteView
)
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponse
from .models import Post, CompanyAccount, JobPostActivity
from users.models import Education, Experience
from django.db.models import Q
from operator import attrgetter


#return what users seee when sent to this route
def home(request):
	context = {}
			
	query=""
	if request.GET:
		query = request.GET['q']
		context['query'] = str(query)
	posts = sorted(get_post_queryset(query),key=attrgetter('date_posted'),reverse=True)
	context['posts']=posts
	return render(request,'dashboard/home.html',context)

class PostListView(ListView):
	model = Post
	template_name = 'dashboard/home.html' #<app>/<model>_<viewtype>.html
	context_object_name = 'posts'
	ordering = ['-date_posted']
	paginate_by = 2

class JobPostActivityListView(ListView):
	model = JobPostActivity
	template_name="dashboard/job_applicants.html"
	context_object_name = 'applicants'
	paginate_by = 3

	def get_queryset(self):
		job_post1 = get_object_or_404(Post, id=self.kwargs.get('pk'))
		job_title = job_post1.job_title
		return JobPostActivity.objects.filter(job_post=job_post1).order_by('-apply_date')

class UserPostListView(ListView):
	model = Post
	template_name = 'dashboard/user_posts.html' #<app>/<model>_<viewtype>.html
	context_object_name = 'posts'
	paginate_by = 2

	def get_queryset(self):
		#company_name = get_object_or_404(User, company_name=self.kwargs.get('company_name'))
		return Post.objects.filter(company_name="Google").order_by('-date_posted')



class CompanyPostListView(ListView):
	model = Post
	template_name = 'dashboard/company_posts.html' #<app>/<model>_<viewtype>.html
	context_object_name = 'posts'
	paginate_by = 2

	def get_queryset(self):
		company1 = get_object_or_404(CompanyAccount, company_name=self.kwargs.get('company_name'))
		return Post.objects.filter(company=company1).order_by('-date_posted')


class UserEducationListView(ListView):
	model = Education
	template_name ='dashboard/user_degrees.html'
	context_object_name= 'degrees'
	paginate_by = 2

	def get_queryset(self):
		user = get_object_or_404(User, username=self.kwargs.get('username'))
		return Education.objects.filter(user_account=user).order_by('-starting_date')

class UserExperienceListView(ListView):
	model = Experience
	template_name ='dashboard/user_experience.html'
	context_object_name= 'job'
	paginate_by = 2

	def get_queryset(self):
		user = get_object_or_404(User, username=self.kwargs.get('username'))
		return Experience.objects.filter(user_account=user).order_by('-start_date')



class PostDetailView(DetailView):
	model = Post

class EducationDetailView(DetailView):
	model = Education

#create posts
class PostCreateView(SuccessMessageMixin,LoginRequiredMixin, CreateView):
	model = Post
	fields = ['company','job_title', 'job_description','street_address','job_city','job_state','job_country','job_zip','is_company_name_hidden','is_active']
	success_message="Post successfully created!"
	

	def form_valid(self, form):
		form.instance.posted_by = self.request.user
		return super().form_valid(form)

	def test_func(self):
		post = self.get_object()
		if self.request.user == post.posted_by:
			return True
		return False



class JobPostActivityCreateView(SuccessMessageMixin,LoginRequiredMixin, CreateView):
	model = JobPostActivity
	fields=['notify_closed']
	template_name ='dashboard/job_confirm_apply.html'
	success_message="You have successfully applied for the Job!"
	
	def form_valid(self, form):
		form.instance.user_account = self.request.user
		form.instance.job_post = get_object_or_404(Post, id=self.kwargs.get('pk'))
		return super().form_valid(form)

	def get_success_url(self):
		return reverse('dashboard-home')



class ExperienceCreateView(SuccessMessageMixin,LoginRequiredMixin, CreateView):
	model = Experience
	fields =['company_name','job_title','description','is_current_job','start_date','end_date','job_location_city','job_location_state','job_location_country']
	success_url="/"
	success_message="Resume updated!"
	def form_valid(self, form):
		form.instance.user_account = self.request.user
		return super().form_valid(form)

	def test_func(self):
		job = self.get_object()
		if self.request.user == job.user_account:
			return True
		return False
	def get_success_url(self):
		return reverse('user-experience',kwargs={'username':self.request.user.username})


class EducationCreateView(SuccessMessageMixin,LoginRequiredMixin, CreateView):
	model = Education
	template_name ='users/education_form.html'
	fields =['certificate_degree_name','major','institute_university_name','starting_date','completion_date','percentage','cgpa']
	success_url="/"
	success_message="Resume updated!"
	def form_valid(self, form):
		form.instance.user_account = self.request.user
		return super().form_valid(form)

	def test_func(self):
		degree = self.get_object()
		if self.request.user == degree.user_account:
			return True
		return False
	def get_success_url(self):
		return reverse('user-degrees',kwargs={'username':self.request.user.username})


class PostDeleteView(SuccessMessageMixin,LoginRequiredMixin, UserPassesTestMixin,DeleteView):
	model = Post
	success_message="Post Deleted!"
	def test_func(self):
		post = self.get_object()
		if self.request.user == post.posted_by:
			return True
		return False

	def get_success_url(self):
		return reverse('dashboard-home')

class EducationDeleteView(SuccessMessageMixin,LoginRequiredMixin, UserPassesTestMixin,DeleteView):
	model = Education
	success_message="Resume updated!"
	def test_func(self):
		education = self.get_object()
		if self.request.user == education.user_account:
			return True
		return False
	def get_success_url(self):
		return reverse('user-degrees',kwargs={'username':self.request.user.username})

class ExperienceDeleteView(SuccessMessageMixin,LoginRequiredMixin, UserPassesTestMixin,DeleteView):
	model = Experience
	success_message="Resume updated!"
	def test_func(self):
		experience = self.get_object()
		if self.request.user == experience.user_account:
			return True
		return False

	def get_success_url(self):
		return reverse('user-experience',kwargs={'username':self.request.user.username})



#update posts
class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin,SuccessMessageMixin, UpdateView):
	model = Post
	fields = ['company', 'job_title','job_description','street_address','job_city','job_state','job_country','job_zip','is_company_name_hidden','is_active']
	success_message="Post updated!"

	def form_valid(self, form):
		form.instance.posted_by = self.request.user
		return super().form_valid(form)

	def test_func(self):
		post = self.get_object()
		if self.request.user == post.posted_by:
			return True
		return False

class EducationUpdateView(SuccessMessageMixin,LoginRequiredMixin, UserPassesTestMixin, UpdateView):
	model = Education
	fields =['certificate_degree_name','major','institute_university_name','starting_date','completion_date','percentage','cgpa']
	success_message="Resume updated!"
	def form_valid(self, form):
		form.instance.posted_by = self.request.user
		return super().form_valid(form)

	def test_func(self):
		education = self.get_object()
		if self.request.user == education.user_account:
			return True
		return False
	def get_success_url(self):
		return reverse('user-degrees',kwargs={'username':self.request.user.username})

		
class ExperienceUpdateView(SuccessMessageMixin,LoginRequiredMixin, UserPassesTestMixin, UpdateView):
	model = Experience
	fields =['company_name','job_title','description','is_current_job','start_date','end_date','job_location_city','job_location_state','job_location_country']
	success_message="Resume updated!"
	def form_valid(self, form):
		form.instance.posted_by = self.request.user
		return super().form_valid(form)

	def test_func(self):
		experience = self.get_object()
		if self.request.user == experience.user_account:
			return True
		return False
	def get_success_url(self):
		return reverse('user-experience',kwargs={'username':self.request.user.username})
	

def about(request):
	return render(request,'dashboard/about.html',{'title':'About'})


def get_post_queryset(query=None):
	queryset = []
	queries = query.split(" ")
	for  q in queries:
		posts = Post.objects.filter(
				Q(job_title__icontains=q)|
				Q(job_country__icontains=q)
				
			).distinct()
		for post in posts:
			queryset.append(post)
	return list(set(queryset))
		
	
