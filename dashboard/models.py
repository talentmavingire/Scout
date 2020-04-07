from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from PIL import Image

class CompanyType(models.Model):
	company_type_name = models.CharField(max_length=100)
	def __str__(self):
		return f'{self.company_type_name} '

class CompanyAccount(models.Model):
	company_name = models.CharField(max_length=100)
	profile_description = models.TextField()
	company_type = models.ForeignKey(CompanyType, on_delete=models.CASCADE)
	date_established = models.DateTimeField()
	company_website_url = models.TextField()

	def __str__(self):
		return self.company_name

class CompanyProfile(models.Model):
	company = models.OneToOneField(CompanyAccount, on_delete=models.CASCADE)
	company_image = models.ImageField(default='company.jpg',upload_to='profile_pics')

	def __str__(self):
		return f'{self.company} Company Profile'

		def save(self):
			super().save()

			img = Image.open(sef.image.path)

			if img.height > 300 or img.width >300:
				output_size = (300,300)
				img.thumbnail(output_size)
				img.save(self.image.path)



class SkillSet(models.Model):
	skill_set_name = models.CharField(max_length=50)



class Post(models.Model):
	
	posted_by = models.ForeignKey(User, on_delete=models.CASCADE)
	job_title = models.CharField(max_length=50,blank=True,verbose_name="job Title")
	company = models.ForeignKey(CompanyAccount,on_delete=models.CASCADE)
	is_company_name_hidden = models.BooleanField(default=False, verbose_name = "hide Company Name?")
	date_posted = models.DateTimeField(default=timezone.now)
	job_description = models.TextField()
	street_address = models.CharField(max_length=100,blank=True)
	job_city = models.CharField(max_length=50,blank=True,verbose_name="city")
	job_state = models.CharField(max_length=50,blank=True,verbose_name="state")
	job_country = models.CharField(max_length=50,blank=True,verbose_name="country")
	job_zip = models.CharField(max_length=50,blank=True,verbose_name="zip")
	is_active = models.BooleanField(default=True)

	def __str__(self):
		return f'{self.company}, {self.job_title} '

	def get_absolute_url(self):
		return reverse('post-detail',kwargs={'pk':self.pk})

class JobPostSkillSet(models.Model):
	skill_set = models.ForeignKey(SkillSet, on_delete=models.CASCADE)
	job_post = models.ForeignKey(Post, on_delete = models.CASCADE)
	skill_level = models.PositiveIntegerField()


class JobPostActivity(models.Model):
	user_account = models.ForeignKey(User, on_delete=models.CASCADE)
	job_post = models.ForeignKey(Post, on_delete=models.CASCADE)
	apply_date = models.DateTimeField(default=timezone.now)
	notify_closed = models.BooleanField(default = True, verbose_name="Notify me when job is closed")

	def __str__(self):
		return f'Job: {self.job_post}, Applicant: {self.user_account} '