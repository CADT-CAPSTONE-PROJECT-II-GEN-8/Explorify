from rest_framework import serializers
from .models import User, ContactInformation
from internship.models import CompanyProfile
from django.contrib.auth import authenticate
from django.contrib.auth.password_validation import validate_password
from django.utils.translation import gettext_lazy as _

class OtpLoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    code = serializers.CharField(required=True)

class RegistrationSerializer(serializers.ModelSerializer):
    social_registration = serializers.BooleanField(required=True, write_only=True)

    class Meta:
        model = User
        fields = ("email", "username", "password", "social_registration")
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        password = validated_data.pop("password", None)
        social_registration = validated_data.pop("social_registration", False)
        instance = self.Meta.model(**validated_data)

        if password:
            instance.set_password(password)

        instance.is_active = True
        instance.save()

        return instance


class LoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    password = serializers.CharField(max_length=128, write_only=True)

    def validate(self, data):
        username_or_email = data.get("username_or_email")
        password = data.get("password")

        if "@" in username_or_email:
            try:
                user = User.objects.get(email=username_or_email)
                username = user.username
            except User.DoesNotExist:
                raise serializers.ValidationError("Invalid email or password")
        else:
            username = username_or_email

        user = authenticate(username=username, password=password)

        if user is None:
            raise serializers.ValidationError("Invalid username/email or password")

        if not user.is_active:
            raise serializers.ValidationError("User is inactive")

        data["user"] = user
        return data


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


class CompanyProfileRegistrationSerializer(serializers.ModelSerializer):
    username = serializers.CharField(max_length=128)
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True)
    # company_pic = serializers.ImageField(required=False)

    class Meta:
        model = CompanyProfile
        fields = [
            "username",
            "email",
            "password",
            "company_name",
            "description",
            "location",
            "head_office",
            "employee_size",
            "company_type",
            "specialization",
            "company_website",
            # "company_pic",
        ]

    def create(self, validated_data):
        user_data = {
            "username": validated_data.pop("username"),
            "email": validated_data.pop("email"),
            "password": validated_data.pop("password"),
        }
        user = User.objects.create_user(**user_data, is_active=False)

        # company_pic = validated_data.pop("company_pic", None)
        company_profile = CompanyProfile.objects.create(
            user=user, 
            # company_pic=company_pic, 
            **validated_data
        )

        return company_profile

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("email", "username")


class UsersContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactInformation
        fields = ("email", "phone", "website")


class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True, write_only=True)
    new_password = serializers.CharField(required=True, write_only=True)
    confirm_new_password = serializers.CharField(required=True, write_only=True)

    def validate_old_password(self, value):
        user = self.context["request"].user
        if not user.check_password(value):
            raise serializers.ValidationError(_("Old password is incorrect."))
        return value

    def validate_new_password(self, value):
        # Use Django's built-in password validators
        validate_password(value)
        return value

    def validate(self, attrs):
        if attrs["new_password"] != attrs["confirm_new_password"]:
            raise serializers.ValidationError(_("New passwords do not match."))
        elif attrs["new_password"] == attrs["old_password"]:
            raise serializers.ValidationError(
                _("Please input new different passwords.")
            )
        return attrs

    def save(self, **kwargs):
        user = self.context["request"].user
        user.set_password(self.validated_data["new_password"])
        user.save()
        return user


class ResetPasswordEmailSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)


class UpdateCompanyProfileSerializer(serializers.ModelSerializer):
    company_pic = serializers.ImageField(required=False)

    class Meta:
        model = CompanyProfile
        fields = [
            "company_name",
            "description",
            "location",
            "head_office",
            "employee_size",
            "company_type",
            "specialization",
            "company_website",
            "company_pic",
        ]

    def update(self, instance, validated_data):

        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        instance.save()

        return instance
    
    def validate_company_pic(self, value):
        # Validate file extension
        ext = value.name.split(".")[-1].lower()
        if ext not in ["jpg", "jpeg", "png", "gif"]:
            raise serializers.ValidationError("Unsupported file extension.")

        # Validate file size
        limit_mb = 2  # 2MB
        if value.size > limit_mb * 1024 * 1024:
            raise serializers.ValidationError("File size exceeds 2 MB limit.")

        return value
    
#  DONE
from account.models import Profile
class UpdateUserInfo(serializers.ModelSerializer):
    username = serializers.CharField(max_length=128, required=False)
    email = serializers.EmailField(required=False)
    class Meta:
        model = User
        fields = ["email", "username","first_name", "last_name", "phone", "headline" ]
    
    def update(self, instance, validated_data):
        for attr, value in validated_data.items():
            if value is not "":
                setattr(instance, attr, value)
        instance.save()

        return instance

    # def update(self, validated_data):
    #     # user_data = {
    #     #     "username": validated_data.pop("username"),
    #     #     "email": validated_data.pop("email"),
    #     #     "first_name": validated_data.pop("first_name"),
    #     #     "last_name": validated_data.pop("last_name"),
    #     #     "headline": validated_data.pop("headline"),
    #     #     "phone": validated_data.pop("phone"),
    #     # }
    #     # user = User.objects.get(**user_data, is_active=False)

    #     # company_pic = validated_data.pop("company_pic", None)
    #     company_profile = CompanyProfile.objects.get(
    #         user=user, 
    #         # company_pic=company_pic, 
    #         **validated_data
    #     )

    #     return company_profile