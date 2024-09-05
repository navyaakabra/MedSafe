from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('patients.urls')),
    path('api/', include('medications.urls')),
    path('api/', include('alerts.urls')),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
]

# patients/models.py
from django.db import models

class Patient(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField()
    email = models.EmailField(unique=True)
    phone_number = models.CharField(max_length=15)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

# medications/models.py
from django.db import models
from patients.models import Patient

class Medication(models.Model):
    name = models.CharField(max_length=200)
    dosage = models.CharField(max_length=100)
    frequency = models.CharField(max_length=100)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='medications')

    def __str__(self):
        return f"{self.name} - {self.dosage}"

# alerts/models.py
from django.db import models
from patients.models import Patient

class Alert(models.Model):
    SEVERITY_CHOICES = [
        ('LOW', 'Low'),
        ('MEDIUM', 'Medium'),
        ('HIGH', 'High'),
        ('CRITICAL', 'Critical'),
    ]

    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='alerts')
    message = models.TextField()
    severity = models.CharField(max_length=10, choices=SEVERITY_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    is_resolved = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.severity} Alert for {self.patient}"