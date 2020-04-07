from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from PIL import Image
from datetime import date
from dashboard.models import SkillSet


class Account(models.Model):
        RECRUITER = 'RT'
        SEEKER = 'SR'
        USER_TYPE_CHOICES=[
        (RECRUITER,'Recruiter'),
        (SEEKER,'Job Seeker'),
        ]
        user = models.OneToOneField(User, on_delete=models.CASCADE)
        user_type = models.CharField(max_length=2,choices=USER_TYPE_CHOICES,default=SEEKER)
        phone = models.CharField(max_length=20)
        sms_notifications = models.BooleanField(default=False)
        email_notifications = models.BooleanField(default=False)





class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')

    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self,**kwargs):
        super().save()

        img = Image.open(self.image.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)








class SeekerSkillSet(models.Model):
    user_account = models.ForeignKey(User,on_delete=models.CASCADE)
    skill_set = models.ForeignKey(SkillSet,on_delete=models.CASCADE)
    skill_level = models.PositiveIntegerField()

    


class Education(models.Model):
    user_account = models.ForeignKey(User,on_delete=models.CASCADE)
    certificate_degree_name = models.CharField(max_length=50,verbose_name="degree Name")
    major = models.CharField(max_length=50)
    institute_university_name = models.CharField(max_length=50,verbose_name="university/Institute Name")
    starting_date = models.DateField(default=date.today)
    completion_date = models.DateField(blank=True)
    percentage = models.PositiveIntegerField(blank=True)
    cgpa = models.FloatField(blank=True)



    def get_absolute_url(self):
        return reverse('education-create')

class Experience(models.Model):
    user_account = models.ForeignKey(User,on_delete=models.CASCADE)
    is_current_job = models.BooleanField(default = False,verbose_name="current Job?")
    start_date = models.DateField(default=date.today)
    end_date = models.DateField()
    job_title = models.CharField(max_length=50)
    company_name = models.CharField(max_length=100)
    job_location_city = models.CharField(max_length=50,verbose_name='city')
    job_location_state = models.CharField(max_length=50,verbose_name="state")
    job_location_country = models.CharField(max_length=50,verbose_name="country")
    description = models.TextField()

    def get_absolute_url(self):
        return reverse('experience-create')