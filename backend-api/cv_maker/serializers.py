from rest_framework import serializers
from .models import (
    EducationLevel,
    Skill,
    Language,
    UserCompany,
    UserEducation,
    School,
    Major,
    UserAward,
    CV,
)
from account.serializers import UsersSerializer, UsersContactSerializer
from account.models import ContactInformation


class EducationLevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EducationLevel
        fields = ["education_level_id", "education_name"]


class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = Skill
        fields = ["skill_id", "skill_name"]


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = ["language_id", "language_name"]


class SchoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = School
        fields = ["school_id", "school_name"]


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ["major_id", "major_name"]


class UserCompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserCompany
        fields = "__all__"


class UserEducationSerializer(serializers.ModelSerializer):
    # education_level = EducationLevelSerializer()
    # school = SchoolSerializer()
    # major = MajorSerializer()
    class Meta:
        model = UserEducation
        fields = [
            "user_education_id",
            "education_level",
            "school",
            "major",
            "start_date",
            "end_date",
        ]


class UserEducationDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserEducation
        fields = [
            "user_education_id",
            "education_level",
            "school",
            "major",
            "start_date",
            "end_date",
        ]


class UserAwardSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAward
        fields = ["user_award_id", "award_name", "date", "description"]


from account.models import User, Profile
class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ["profile_pic","website","city","country","date_of_birth","gender"]

class ProfileUserSerializer(serializers.ModelSerializer):
    profile = ProfileSerializer()
    class Meta:
        model = User
        fields = ["first_name","last_name", "headline","profile"]


class CVDataSerializer(serializers.ModelSerializer):
    user_companies = UserCompanySerializer(many=True)
    user_education = UserEducationSerializer(many=True)
    user_skill = SkillSerializer(many=True)
    user_major = MajorSerializer(many=True)
    user_language = LanguageSerializer(many=True)
    user_award = UserAwardSerializer(many=True)
    user_contact_information = serializers.SerializerMethodField()
    user = ProfileUserSerializer()

    class Meta:
        model = CV
        fields = [
            "cv_id",
            "user",
            "user_companies",
            "user_education",
            "user_skill",
            "user_major",
            "user_language",
            "user_award",
            "user_contact_information",
            "description",
            "job_title",
            "references",
            "created_at",
            "updated_at",
        ]

    def get_user_contact_information(self, obj):
        try:
            contact = ContactInformation.objects.get(user=obj.user)
            return UsersContactSerializer(contact).data
        except ContactInformation.DoesNotExist:
            return None


class ImageUploadSerializer(serializers.Serializer):
    image_file = serializers.ImageField()

    def validate_image_file(self, value):
        # Validate file extension
        ext = value.name.split(".")[-1].lower()
        if ext not in ["jpg", "jpeg", "png", "gif"]:
            raise serializers.ValidationError("Unsupported file extension.")

        # Validate file size
        limit_mb = 2  # 2MB
        if value.size > limit_mb * 1024 * 1024:
            raise serializers.ValidationError("File size exceeds 2 MB limit.")

        return value
