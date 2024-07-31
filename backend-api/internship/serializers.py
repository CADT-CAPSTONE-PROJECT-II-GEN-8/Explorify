from rest_framework import serializers

from account.serializers import UsersSerializer
from post.serializers import InternshipPostSerializer
#from .models import CompanyProfile
from .models import *


class CompanyProfileSerializer(serializers.ModelSerializer):
    
    class Meta: 
        model = CompanyProfile
        fields = ('company_id','company_name','description','location','head_office','employee_size','company_type','specialization','company_website','company_pic')  
        company_id = serializers.IntegerField(required=False)


class MobileCompanyProfileSerializer(serializers.ModelSerializer):
    
    class Meta: 
        model = CompanyProfile
        fields = ('company_id','user','company_name','description','location','head_office','employee_size','company_type','specialization','company_website','company_pic')  
        company_id = serializers.IntegerField(required=False)


class InternshipPostSerialzer(serializers.ModelSerializer):
    class Meta: 
        model = InternshipPost
   
        fields =('internship_post_id',
                 'job_title','location','job_description',
                 'job_requirement','job_type','salary','job_duration',
                 'qualification','status','deadline',)
        internship_post_id = serializers.IntegerField(required=False)
        user = serializers.TimeField(required=False)

#  serializers for intern application
class InternshipApplicationSerializer(serializers.ModelSerializer) : 
    class Meta : 
        model = InternshipApplication
        fields = ('cv','cover_letter','internship_application_id')


class AllInternshipApplicationSerializer(serializers.ModelSerializer) : 
    # user = UsersSerializer()
    # internship_post = InternshipPostSerialzer()
    class Meta : 
        model = InternshipApplication
        fields = ('internship_application_id','internship_post','user','cv','cover_letter','is_approved','is_rejected')
        internship_application_id = serializers.IntegerField(required=False)