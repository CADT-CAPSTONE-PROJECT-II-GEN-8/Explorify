from rest_framework import serializers

from account.models import Profile
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


class AllInternshipApplicationSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)
    email = serializers.CharField(source='user.email', read_only=True)
    job_title = serializers.CharField(source='internship_post.job_title', read_only=True)
    profile_pic = serializers.SerializerMethodField()

    class Meta:
        model = InternshipApplication
        fields = ('internship_application_id', 'job_title', 'username', 'email', 'cv', 'cover_letter', 'profile_pic')

    def get_profile_pic(self, obj):
        # Get the profile associated with the user
        try:
            profile = Profile.objects.get(user=obj.user)
            return self.context['request'].build_absolute_uri(profile.profile_pic.url)
        except Profile.DoesNotExist:
            return None


from rest_framework import serializers
from .models import InternshipApplication
from django.conf import settings
from django.core.mail import send_mail, EmailMessage, BadHeaderError
from django.utils.html import strip_tags
import smtplib
# import logging

class EmailSerializer(serializers.ModelSerializer):
    class Meta:
        model = InternshipApplication
        fields = ('internship_application_id', 'is_approved', 'is_rejected')

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
            message = (
                f"Dear Candidate,\n\n"
                "We are pleased to inform you that you have been selected your application "
                f"Congratulations on your successful application!\n\n"
                "We were impressed with your qualifications and enthusiasm for the role. "
                "We are excited to welcome you to our team and look forward to your contributions.\n\n"
                "We will contact you via email to schedule an interview and provide further details about your internship, "
                "including the start date and orientation. If you have any questions in the meantime, feel free to reach out.\n\n"
                "Once again, congratulations, and we look forward to working with you!\n\n"
                
            )
        else:
            message = (
                f"Dear Candidate,\n\n"
                "Thank you for taking the time to apply for the application to our company "
                f"We appreciate your interest in our company and the opportunity to learn more about your qualifications.\n\n"
                "After careful consideration, we have decided to move forward with other candidates who more closely match the requirements of the position. "
                "We encourage you to continue to apply for future opportunities with our company.\n\n"
                "We appreciate your interest in this position and wish you all the best in your future endeavors.\n\n"
               
            )

        email = EmailMessage(
            subject,
            message,
            settings.EMAIL_HOST_USER,
            [instance.user.email],
        )
        
        try:
            email.send()
        except BadHeaderError:
            print("Invalid header found.")
        except smtplib.SMTPException as e:
            print(f"SMTP error occurred: {e}")