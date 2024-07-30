from django.shortcuts import render

def index(request):
    return render(request, 'index.html')



from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML

def generate_cv_weasyprint(request):
    # Define the context with variables you want to pass to the template
    context = {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'phone': '123-456-7890',
        'experience': [
            {'job_title': 'Software Engineer', 'company': 'ABC Corp', 'years': '2019-2023'},
            {'job_title': 'Intern', 'company': 'XYZ Inc', 'years': '2018-2019'},
        ],
    }

    html_string = render_to_string('resume/resume1.html', context)

    html = HTML(string=html_string)
    pdf = html.write_pdf()

    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'inline; filename="cv.pdf"'

    return response

