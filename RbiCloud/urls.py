"""RbiCloud URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from cloud import views
from django.conf.urls import handler404
from django.conf.urls import handler500
import django.views.static
from RbiCloud import settings

urlpatterns = [
    # path('static/(?P<path>.*)$', django.views.static.serve, {'document_root': settings.STATIC_ROOT, 'show_indexes': settings.DEBUG}),
    path('admin/', admin.site.urls),
    path('', views.base, name='home'),
    path('citizen/', views.citizen_home, name= 'citizenHome'),
    path('management/', views.base_manager, name= 'manager'),
    path('business/', views.base_business, name='business'),
    path('equipment/', views.base_equipment, name='equipment'),
    path('component/', views.base_component, name='component'),
    path('proposal/', views.base_proposal, name='prosal'),
    path('risksummary/', views.base_risksummary, name='risk'),
    path('designcode/', views.base_designcode, name='designcode'),
    path('manufacture/', views.base_manufacture, name= 'manufacture'),
    ########################## Facility UI################################
    path('facilities/display/<int:siteID>/', views.ListFacilities, name='facilitiesDisplay'),
    path('facilities/<int:siteID>/new/', views.NewFacilities, name='facilitiesNew'),
    path('facilities/<int:facilityID>/edit/', views.EditFacilities, name= 'facilitiesEdit'),
    path('designcode/display/<int:siteID>/', views.ListDesignCode, name='designcodeDisplay'),
    path('designcode/<int:siteID>/new/', views.NewDesignCode, name='designcodeNew'),
    path('designcode/<int:designcodeID>/edit/', views.EditDesignCode, name='designcodeEdit'),
    path('manufacture/display/<int:siteID>/', views.ListManufacture, name='manufactureDisplay'),
    path('manufacture/<int:siteID>/new/', views.NewManufacture , name='manufactureNew'),
    path('manufacture/<int:manufactureID>/edit/', views.EditManufacture, name='manufactureEdit'),
    path('equipment/display/<int:facilityID>/', views.ListEquipment, name='equipmentDisplay'),
    path('equipment/<int:facilityID>/new/', views.NewEquipment, name='equipmentNew'),
    path('equipment/<int:equipmentID>/edit/', views.EditEquipment, name='equipmentEdit'),
    path('component/display/<int:equipmentID>/', views.ListComponent, name='componentDisplay'),
    path('component/<int:equipmentID>/new/', views.NewComponent , name='componentNew'),
    path('component/<int:componentID>/edit/', views.EditComponent, name='componentEdit'),
    path('proposal/display/<int:componentID>/', views.ListProposal, name='proposalDisplay'),
    path('proposal/<int:componentID>/new/', views.NewProposal, name='proposalNew'),
    path('tank/<int:componentID>/new/', views.NewTank , name='tankNew'),
    path('proposal/<int:proposalID>/edit/', views.EditProposal, name='prosalEdit'),
    path('tank/<int:proposalID>/edit/', views.EditTank, name='tankEdit'),
    path('proposal/<int:proposalID>/risk-matrix/', views.RiskMatrix, name='riskMatrix'),
    path('proposal/<int:proposalID>/damage-factor/', views.FullyDamageFactor, name='damgeFactor'),
    path('proposal/<int:proposalID>/chart/', views.RiskChart, name='riskChart'),
    path('proposal/<int:proposalID>/fully-consequence/',views.FullyConsequence, name='fullyConsequence'),
    path('export/<int:index>/<str:type>/', views.ExportExcel, name='exportData'),
    path('upload/', views.upload, name='upload'),
    path('upload/InspectionPlan/', views.uploadInspPlan, name='uploadInsp'),
]
handler404 = 'cloud.views.handler404'
handler500 = 'cloud.views.handler404'