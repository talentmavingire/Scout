from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import CompanyAccount, Post,CompanyProfile

class CompanyAccountForm(UserCreationForm):
	
	class Meta:
		model = CompanyAccount
		fields = ['company_name','profile_description','company_type','date_established','company_website_url']


class JobPostForm(UserCreationForm):

	class Meta:
		model = Post
		fields = ['job_description','street_address','job_city','job_state','job_country','job_zip','job_type','is_company_name_hidden','is_active']


class CompanyProfileForm(UserCreationForm):
	class Meta: 
		model = CompanyProfile
		fields = ['image']	
		

	
