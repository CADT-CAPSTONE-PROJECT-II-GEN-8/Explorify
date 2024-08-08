import json
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
        serializer = MobileCompanyProfileSerializer(company, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['GET'])
def view_details(request, companyId=None):
    try:
        if companyId is not None:
            company = CompanyProfile.objects.get(pk=companyId)
            serializer = MobileCompanyProfileSerializer(company)
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
from .serializers import AllInternshipApplicationSerializer, EmailSerializer, InternshipApplicationSerializer, MobileCompanyProfileSerializer



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
        serializer = AllInternshipApplicationSerializer(post, many=True,context={'request': request})
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

from base.utils import (
    StandardResultsSetPagination,
    success_response,
    error_response,
) 
# active internship post count
from django.utils import timezone
class ActiveInternPostView(APIView) : 
    permission_classes = [IsAuthenticated] 

    def get(self, request, *agrs, **kwargs) : 
        user = request.user
        active_post_count = InternshipPost.objects.filter(user = user, active = 1).count() 
        return success_response(data={'active_post_count' : active_post_count})
    

class InternshipApplicationCountView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        user = request.user
        internship_post = request.query_params.get('internship_post', None)
        
        if internship_post:
            active_posts = InternshipPost.objects.filter(user=user, active=1, internship_post_id=internship_post)
        else:
            active_posts = InternshipPost.objects.filter(user=user, active=1)
        
        applications_count = InternshipApplication.objects.filter(internship_post__in=active_posts).count()
        return success_response(data={'application_count': applications_count},status_code=200)
    
#  Email Sending 

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import InternshipApplication
from .serializers import EmailSerializer

class ApplicationStatusUpdateView(APIView):
    def post(self, request, pk):
        try:
            application = InternshipApplication.objects.get(pk=pk)
        except InternshipApplication.DoesNotExist:
            return Response({"error": "Application not found."}, status=status.HTTP_404_NOT_FOUND)

        serializer = EmailSerializer(application, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ApplicationStatusRetrieveView(APIView):
    def get(self, request, pk):
        try:
            application = InternshipApplication.objects.get(pk=pk)
        except InternshipApplication.DoesNotExist:
            return Response({"error": "Application not found."}, status=status.HTTP_404_NOT_FOUND)

        serializer = EmailSerializer(application)
        return Response({"status": serializer.data.get('status')}, status=status.HTTP_200_OK)
    
#  total count approve and reject
class ApplicationCountsView(APIView):
    def get(self, request):
        approved_count = InternshipApplication.count_approved()
        rejected_count = InternshipApplication.count_rejected()
        
        return Response({
            'approved_count': approved_count,
            'rejected_count': rejected_count
        }, status=status.HTTP_200_OK)
    
# count internship post by date
from django.db.models import Count
from django.db.models.functions import TruncDate
class InternshipPostCountByDate(APIView):
    permission_classes = [IsAuthenticated]
    
    def get(self, request, *args, **kwargs):
        posts = InternshipPost.objects.filter(user=request.user)
        post_counts = posts.annotate(date=TruncDate('created_at')).values('date').annotate(count=Count('internship_post_id')).order_by('date')
        data = [{'date': item['date'].isoformat(), 'count': item['count']} for item in post_counts]
        
        return Response(data)
        