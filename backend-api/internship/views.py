from rest_framework.decorators import api_view

from internship.models import CompanyProfile, InternshipPost
from internship.serializers import CompanyProfileSerializer, InternshipPostSerialzer

# For CompanyProfile CRUD operation 

from rest_framework import serializers
from rest_framework import status 
from rest_framework.response import Response


@api_view(['GET'])
def view_company(request):
     # checking for the parameters from the URL
    if request.query_params:
        company = CompanyProfile.objects.filter(**request.query_params.dict())
    else:
        company = CompanyProfile.objects.all()
 
    # if there is something in items else raise error
    if company:
        serializer = CompanyProfileSerializer(company, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def view_details(request, companyId=None):
    try:
        if companyId is not None:
            company = CompanyProfile.objects.get(pk=companyId)
            serializer = CompanyProfileSerializer(company)
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    except CompanyProfile.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND) 


@api_view(['POST'])
def add_company(request):
    company_serializer = CompanyProfileSerializer(data=request.data)

    if company_serializer.is_valid():
        company_serializer.save()
        return Response(company_serializer.data, status=status.HTTP_201_CREATED)
    else:
        return Response(company_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT'])
def update_company(request, companyId):
    try:
        company = CompanyProfile.objects.get(pk=companyId)
    except CompanyProfile.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    company_serializer = CompanyProfileSerializer(company, data=request.data)
    if company_serializer.is_valid():
        company_serializer.save()
        return Response(company_serializer.data)
    else:
        return Response(company_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def delete_company(request, companyId):
    try:
        company = CompanyProfile.objects.get(pk=companyId)
    except CompanyProfile.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    company.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)



# CRUD operation fo InternshipPost 
@api_view(['GET'])
def view_post(request):
     # checking for the parameters from the URL
    if request.query_params:
        post = InternshipPost.objects.filter(**request.query_params.dict())
    else:
        post = InternshipPost.objects.all()
 
    # if there is something in items else raise error
    if post:
        serializer = InternshipPostSerialzer(post, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def view_details_post(request, postId=None):
    try:
        if postId is not None:
            post = InternshipPost.objects.get(pk=postId)
            serializer = InternshipPostSerialzer(post)
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    except InternshipPost.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND) 




@api_view(['POST'])
def add_post(request):
    post = InternshipPostSerialzer(data=request.data)

    if InternshipPost.objects.filter(**request.data).exists():
        raise serializers.ValidationError('This data already exits')
    if post.is_valid():
        post.save()
        return Response(post.data , status=status.HTTP_201_CREATED)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)


@api_view(['PUT'])
def update_post(request, postId):
    try:
        post = InternshipPost.objects.get(pk=postId)
    except InternshipPost.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    post_serializer = InternshipPostSerialzer(post, data=request.data)
    if post_serializer.is_valid():
        post_serializer.save()
        return Response(post_serializer.data)
    else:
        return Response(post_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def delete_post(request, postId):
    try:
        post = InternshipPost.objects.get(pk=postId)
    except InternshipPost.DoesNotExist:
        return Response({'error': 'Company not found'}, status=status.HTTP_404_NOT_FOUND)

    post.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

# views : internship application
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from .models import InternshipApplication
from .serializers import AllInternshipApplicationSerializer, InternshipApplicationSerializer
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import AnonymousUser



""" class ApplyInternshipView(generics.CreateAPIView) : 
    queryset = InternshipApplication.objects.all()
    serializer_class = InternshipApplicationSerializer
    # permission_classes = [permissions.IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]

    def perform_create(self, serializer):
        user = self.request.user
        if isinstance(user, AnonymousUser) : 
            raise ValueError("cannot assign anonymous User to internship application")
        serializer.save(user = user)

    def post(self, request, *args, **kwargs) : 
       if not request.user.is_authenticated : 
           return Response({"detail" : "Authentication credentials were not provided."}, status=status.HTTP_401_UNAUTHORIZED)
       return self.create(request, *args, **kwargs) """

from rest_framework import status
from rest_framework.parsers import FormParser, MultiPartParser
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404
from rest_framework.decorators import permission_classes, api_view
from django.http import HttpResponse, Http404, FileResponse
from .serializers import InternshipApplicationSerializer
import mimetypes
from rest_framework.permissions import BasePermission, IsAuthenticated, AllowAny

class IsAdminUser(BasePermission):
    def has_permission(self, request, *args, **kwargs):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.role.role_id < 3
        )
class IsUser(BasePermission):
    def has_permission(request):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.role.role_id == 1
        )

# @permission_classes([IsAdminUser])
class ApplyInternshipView(APIView): 
    parser_classes = (MultiPartParser, FormParser)
    serializer_class = InternshipApplicationSerializer

    def post(self, request,pk, *args, **kwargs) : 
        internship_post = get_object_or_404(InternshipPost, pk=pk)
        data = request.data.copy()
        data['internship_post'] = internship_post.pk
        # return Response(None,200)
        serializer = self.serializer_class(data=data)
        if serializer.is_valid() : 
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            Response({"message": "Error"}, status=400 )
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class FetchCvView(APIView) : 
    def get(self, request, pk, *args, **kwargs) : 
        application = get_object_or_404(InternshipApplication, pk=pk)
        cv = application.cv
        if not cv : 
            raise Http404("Cv not found")

        return FileResponse(cv.open('rb'), content_type = 'application/pdf', as_attachment=False)

class FetchCoverLetterView(APIView) : 
    def get(self, request, pk, *args, **kwargs) : 
        application = get_object_or_404(InternshipApplication, pk=pk)
        cover_letter = application.cover_letter
        if not cover_letter: 
            raise Http404("Cv not found")

        return FileResponse(cover_letter.open('rb'), content_type = 'application/pdf', as_attachment=False)
    

# List Internship Post  // DONE
# Check IsAdminUser
# Internship POst -> List of Internship Application  // API List Internship Application (need Internship POST ID)
# Click one In-Application -> Detail of Internship Application (User info, Url of CV) // Show detail of Internship application ()


# to display list of internship application
# @permission_classes([IsAdminUser])
class ListInternshipApplication(APIView) :
    
    def get(self, request, pk, *args, **kwargs) : 
        internship_post = get_object_or_404(InternshipPost, pk = pk)
        applications = InternshipApplication.objects.filter(internship_post = internship_post)
        serializer = InternshipApplicationSerializer(applications, many = True) 
        return Response(serializer.data, status=status.HTTP_200_OK) 


@api_view(['GET'])
def all_application(request):
     # checking for the parameters from the URL
    if request.query_params:
        post = InternshipApplication.objects.filter(**request.query_params.dict())
    else:
        post = InternshipApplication.objects.all()
 
    # if there is something in items else raise error
    if post:
        serializer = AllInternshipApplicationSerializer(post, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)
