from rest_framework import serializers

from account.serializers import UsersSerializer
from cv_maker.serializers import ProfileSerializer
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
    # profile_pic = ProfileSerializer()
    username = serializers.CharField(source='user.username', read_only=True)
    # profile_pic = serializers.CharField(source='user.profile_pic', read_only=True)
    email = serializers.CharField(source='user.email', read_only=True)
    job_title = serializers.CharField(source='internship_post.job_title', read_only=True)
    
    class Meta : 
        model = InternshipApplication
        fields = ('internship_application_id','job_title','username','email','cv','cover_letter')
        internship_application_id = serializers.IntegerField(required=False)


from rest_framework import serializers
from django.core.mail import send_mail
from .models import InternshipApplication

class EmailSerializer(serializers.ModelSerializer):
    class Meta:
        model = InternshipApplication
        fields = ('internship_application_id','is_approved', 'is_rejected')

    def update(self, instance, validated_data):
        previous_is_approved = instance.is_approved
        previous_is_rejected = instance.is_rejected

        instance.is_approved = validated_data.get('is_approved', instance.is_approved)
        instance.is_rejected = validated_data.get('is_rejected', instance.is_rejected)
        instance.save()

        # Send an email if the approval or rejection status changes
        if previous_is_approved != instance.is_approved:
            if instance.is_approved:
                self.send_email(instance, approved=True)
        elif previous_is_rejected != instance.is_rejected:
            if instance.is_rejected:
                self.send_email(instance, approved=False)

        return instance

    def send_email(self, instance, approved):
        subject = 'Application Status Update'
        if approved:
            message = 'Your application has been approved.'
        else:
            message = 'Your application has been rejected.'
        
        send_mail(
            subject,
            message,
            'admin@example.com',  # Replace with your "from" email address
            [instance.user.email],  # Assuming there's a user field in the InternshipApplication model
            fail_silently=False,
        )
