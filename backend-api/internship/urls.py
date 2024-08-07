from django.urls import path
from . import views
from .views import *

urlpatterns = [
 
    # api for Company Profile view 
    path('company/list/', views.view_company , name = 'view-company'),
    path('company/details/<int:companyId>/', views.view_details, name = 'view-details'),
    path('company/create/',views.add_company, name='add-company'),
    path('company/update/<int:companyId>/', views.update_company, name='update_company'),
    path('company/delete/<int:companyId>/', views.delete_company, name='delete_company'),

    # for Internship view 

    path('post/list/job', views.view_post , name = 'view-post'),
    path('post/details/<int:postId>/', views.view_details_post, name = 'view-details'),
    path('post/create/',views.add_post, name='add-post'),
    path('post/update/<int:postId>/', views.update_post, name='update_post'),
    path('post/delete/<int:postId>/', views.delete_post, name='delete_post'),

    # application urls
    # FOR ADMIN URL
    path('internship/<int:pk>/applications/', ListInternshipApplication.as_view(), name="list-intern-application"),
    path('internship/list/all/', views.all_application , name = 'all-application'),

        # post count
    path('internship/count/', ActiveInternPostView.as_view(), name="internship-count"), 
    path('internship/application/count/', InternshipApplicationCountView.as_view(), name="application-count"), 

    #  Email Sending 

     path('application/<int:pk>/status/update/', ApplicationStatusUpdateView.as_view(), name='application-status-update'),
     path('application/<int:pk>/status/', ApplicationStatusRetrieveView.as_view(), name='application-status-retrieve'),
     path('application-counts/', ApplicationCountsView.as_view(), name='application-counts'),

     #  count intern post by date
    path('internship/count-by-date/', InternshipPostByDateView.as_view(), name='intern-count-by-date'),

]

    
