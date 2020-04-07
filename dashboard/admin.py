from django.contrib import admin
from .models import Post, CompanyAccount, CompanyProfile,JobPostActivity,CompanyType

admin.site.register(Post)
admin.site.register(CompanyAccount)
admin.site.register(CompanyProfile)
admin.site.register(JobPostActivity)
admin.site.register(CompanyType)
