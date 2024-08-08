from base.utils import *
from rest_framework import status
from cv_maker.serializers import *
from weasyprint import HTML, CSS
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from cv_maker.models import *
from rest_framework.parsers import JSONParser


@api_view(["GET"])
def preset_data_list(request):
    if request.method == "GET":
        major = Major.objects.all()
        major_serializer = MajorSerializer(major, many=True)

        school = School.objects.all()
        school_serializer = SchoolSerializer(school, many=True)

        skill = Skill.objects.all()
        skill_serializer = SkillSerializer(skill, many=True)

        language = Language.objects.all()
        language_serializer = LanguageSerializer(language, many=True)

        education_level = EducationLevel.objects.all()
        edu_level_serializer = EducationLevelSerializer(education_level, many=True)
        data = {
            "major": major_serializer.data,
            "school": school_serializer.data,
            "skill": skill_serializer.data,
            "language": language_serializer.data,
            "education_level": edu_level_serializer.data,
        }
        return success_response(
            message="Get data successfully", data=data, status_code=status.HTTP_200_OK
        )


# EducationLevelSerializer, SkillSerializer, LanguageSerializer,
# UsereducationSerializer, UserEducationSerializer,
# SchoolSerializer,MajorSerializer,UserAwardSerializer
@api_view(["GET", "POST"])
def education_level(request):
    """
    List all education, or create a new education level
    """
    if request.method == "GET":
        education_level = EducationLevel.objects.all()
        serializer = EducationLevelSerializer(education_level, many=True)
        return success_response(
            message="List data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "POST":
        serializer = EducationLevelSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )

    """
    LIST PRESET DATA
    """


@api_view(["GET"])
def education_list(request):
    if request.method == "GET":
        education_level = EducationLevel.objects.all()
        serializer = EducationLevelSerializer(education_level, many=True)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )


@api_view(["GET"])
def language_list(request):
    if request.method == "GET":
        language = Language.objects.all()
        serializer = LanguageSerializer(language, many=True)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )


@api_view(["GET"])
def skill_list(request):
    if request.method == "GET":
        skill = Skill.objects.all()
        serializer = SkillSerializer(skill, many=True)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )


@api_view(["GET"])
def school_list(request):
    if request.method == "GET":
        school = School.objects.all()
        serializer = SchoolSerializer(school, many=True)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )


@api_view(["GET"])
def major_list(request):
    major = Major.objects.all()
    serializer = MajorSerializer(major, many=True)
    return success_response(
        message="Get data successfully",
        data=serializer.data,
        status_code=status.HTTP_200_OK,
    )


"""View for displaying data about 
- user company, user education, User award
"""


@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def user_company_list(request):
    """
    List all company user work at, or create a new one
    """
    user = request.user
    try:
        cv = CV.objects.get(user=user)
    except CV.DoesNotExist:
        return Response(
            {"message": "CV not found for the user."},
            status=status.HTTP_404_NOT_FOUND
        )
        
    if request.method == "GET":
        user_companies = cv.user_companies.all()

        # Check if user_company queryset is empty
        if not user_companies.exists():
            return error_response(
                message="No UserCompany found for this user",
                status_code=status.HTTP_404_NOT_FOUND,
            )

        serializer = UserCompanySerializer(user_companies, many=True)
        return success_response(data=serializer.data, status_code=status.HTTP_200_OK)

    elif request.method == "POST":
        serializer = UserCompanySerializer(data=request.data)
       
        if serializer.is_valid():
            # serializer.validated_data["user"] = request.user
            data = serializer.save()
            cv.user_companies.add(data)
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )


@api_view(["GET", "PUT", "DELETE"])
@permission_classes([IsAuthenticated])
def user_company_detail(request, pk):
    try:
        user_company = UserCompany.objects.get(pk=pk)
    except UserCompany.DoesNotExist:
        return error_response(
            message="No company available for user",
            status_code=status.HTTP_400_BAD_REQUEST,
        )
    if request.method == "GET":
        serializer = UserCompanySerializer(user_company)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "PUT":
        serializer = UserCompanySerializer(user_company, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Update successfully",
                data=serializer.data,
                status_code=status.HTTP_200_OK,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )

    elif request.method == "DELETE":
        user_company.delete()
        return success_response(
            message="Delete successfully", status_code=status.HTTP_204_NO_CONTENT
        )


# User education
@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def user_education_list(request):
    """
    List all , or create a new one
    """
    user = request.user
    try:
        cv = CV.objects.get(user=user)
    except CV.DoesNotExist:
        return Response(
            {"message": "CV not found for the user."},
            status=status.HTTP_404_NOT_FOUND
        )
        
    if request.method == "GET":
        user_education = cv.user_education.all()

        # Check if user_education queryset is empty
        if not user_education.exists():
            return error_response(
                message="No User education found for this user",
                status_code=status.HTTP_404_NOT_FOUND,
            )

        serializer = UserEducationSerializer(user_education, many=True)
        return success_response(
            message="List successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "POST":
        serializer = UserEducationDetailSerializer(data=request.data)
        if serializer.is_valid():
            data = serializer.save()
            
            school_instance = serializer.data["school"]
            major_instance = serializer.data["major"]
            education_level_instance = serializer.data["education_level"]
            
            cv.user_education.add(data)
            return success_response(
                message="Create successfully",
                data=None,
                status_code=status.HTTP_201_CREATED,
            )
        return error_response(
            message=serializer.errors,
            status_code=status.HTTP_400_BAD_REQUEST,
        )


@api_view(["GET", "PUT", "DELETE"])
@permission_classes([IsAuthenticated])
def user_education_detail(request, pk):
    try:
        user_education = UserEducation.objects.get(pk=pk)
    except UserEducation.DoesNotExist:
        return error_response(
            message="No education available for user",
            status_code=status.HTTP_400_BAD_REQUEST,
        )
    if request.method == "GET":
        serializer = UserEducationSerializer(user_education)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "PUT":
        serializer = UserEducationDetailSerializer(user_education, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Update successfully",
                data=serializer.data,
                status_code=status.HTTP_200_OK,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )

    elif request.method == "DELETE":
        user_education.delete()
        return success_response(
            message="Delete successfully", status_code=status.HTTP_204_NO_CONTENT
        )


# User Award
@api_view(["GET", "POST"])
@permission_classes([IsAuthenticated])
def user_award_list(request):
    """
    List all , or create a new one
    """
    user = request.user
    try:
        cv = CV.objects.get(user=user)
    except CV.DoesNotExist:
        return Response(
            {"message": "CV not found for the user."},
            status=status.HTTP_404_NOT_FOUND
        )
    if request.method == "GET":
        user_award = cv.user_award.all()

        # Check if user_award queryset is empty
        if not user_award.exists():
            return error_response(
                message="No User award found for this user",
                status_code=status.HTTP_404_NOT_FOUND,
            )

        serializer = UserAwardSerializer(user_award, many=True)
        return success_response(
            message="List successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "POST":
        serializer = UserAwardSerializer(data=request.data)
        if serializer.is_valid():
            # serializer.validated_data["user"] = request.user
            data = serializer.save()
            cv.user_award.add(data)
            return success_response(
                message="Create successfully",
                data=serializer.data,
                status_code=status.HTTP_201_CREATED,
            )
        return error_response(
            message=serializer.errors,
            status_code=status.HTTP_400_BAD_REQUEST,
        )


@api_view(["GET", "PUT", "DELETE"])
@permission_classes([IsAuthenticated])
def user_award_detail(request, pk):
    try:
        user_award = UserAward.objects.get(pk=pk, user=request.user)
    except UserAward.DoesNotExist:
        return error_response(
            message="No award available for user",
            status_code=status.HTTP_400_BAD_REQUEST,
        )
    if request.method == "GET":
        serializer = UserAwardSerializer(user_award)
        return success_response(
            message="Get data successfully",
            data=serializer.data,
            status_code=status.HTTP_200_OK,
        )

    elif request.method == "PUT":
        serializer = UserAwardSerializer(user_award, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return success_response(
                message="Update successfully",
                data=serializer.data,
                status_code=status.HTTP_200_OK,
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )

    elif request.method == "DELETE":
        user_award.delete()
        return success_response(
            message="Delete successfully", status_code=status.HTTP_204_NO_CONTENT
        )
