from operator import eq
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect
from django.http import Http404
from cloud import models
from dateutil.relativedelta import relativedelta
from cloud.process.RBI import DM_CAL,CA_CAL,pofConvert
from datetime import datetime
from cloud.process.WebUI import location
from cloud.process.WebUI import roundData

# Create your views here.
def base(request):
    return render(request, 'Home/index.html')
def citizen_home(request):
    return render(request, 'CitizenUI/CitizenHome.html')
def base_manager(request):
    return render(request, 'BaseUI/BaseManager/baseManager.html')
def base_business(request):
    return render(request, 'BaseUI/BaseFacility/baseFacility.html')
def base_equipment(request):
    return render(request, 'BaseUI/BaseFacility/baseEquipment.html')
def base_component(request):
    return render(request, 'BaseUI/BaseFacility/baseComponent.html')
def base_proposal(request):
    return render(request, 'BaseUI/BaseFacility/baseProposal.html')
def base_risksummary(request):
    return render(request, 'BaseUI/BaseFacility/baseRiskSummary.html')
def base_designcode(request):
    return render(request, 'BaseUI/BaseFacility/baseDesigncode.html')
def base_manufacture(request):
    return render(request, 'FacilityUI/manufacture/manufactureListDisplay.html')
################## 404 Error ###########################
def handler404(request, exception):
    return render(request, '404/404.html', locals())
################ Business UI Control ###################
def ListFacilities(request, siteID):
    try:
        risk = []

        data= models.Facility.objects.filter(siteid= siteID)
        for a in data:
            dataF = {}
            risTarget = models.FacilityRiskTarget.objects.get(facilityid= a.facilityid)
            dataF['ID'] = a.facilityid
            dataF['FacilitiName'] = a.facilityname
            dataF['ManagementFactor'] = a.managementfactor
            dataF['RiskTarget'] = risTarget.risktarget_fc
            risk.append(dataF)

        pagiFaci = Paginator(risk, 25)
        pageFaci = request.GET.get('page',1)
        try:
            users = pagiFaci.page(pageFaci)
        except PageNotAnInteger:
            users = pagiFaci.page(1)
        except EmptyPage:
            users = pageFaci.page(pagiFaci.num_pages)
        if '_edit' in request.POST:
            for a in data:
                if(request.POST.get('%d' %a.facilityid)):
                    return redirect('facilitiesEdit', a.facilityid)
        if '_delete' in request.POST:
            for a in data:
                if(request.POST.get('%d' %a.facilityid)):
                    a.delete()
            return redirect('facilitiesDisplay', siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/facility/facilityListDisplay.html', {'obj': users,'siteID':siteID})
def NewFacilities(request,siteID):
    try:
        error = {}
        data = {}
        site = models.Sites.objects.get(siteid= siteID)
        if request.method == 'POST':
            data['facilityname'] = request.POST.get('FacilityName')
            data['manageFactor'] = request.POST.get('ManagementSystemFactor')
            data['targetFC'] = request.POST.get('Financial')
            data['targetAC'] = request.POST.get('Area')
            countFaci = models.Facility.objects.filter(facilityname= data['facilityname']).count()
            if countFaci > 0:
                error['exist'] = "This facility already exists!"
            else:
                fa = models.Facility(facilityname= data['facilityname'],managementfactor= data['manageFactor'], siteid_id=siteID)
                fa.save()
                faTarget = models.FacilityRiskTarget(facilityid_id= fa.facilityid , risktarget_ac= data['targetAC'],
                                                         risktarget_fc=data['targetFC'])
                faTarget.save()
                return redirect('facilitiesDisplay',siteID=siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/facility/facilityNew.html', {'site':site, 'error':error, 'data':data, 'siteID':siteID})
def EditFacilities(request,facilityID):
    try:
        error = {}
        dataNew = {}
        dataOld = models.Facility.objects.get(facilityid= facilityID)
        dataRisk = models.FacilityRiskTarget.objects.get(facilityid= facilityID)
        site = models.Sites.objects.get(siteid= dataOld.siteid_id)
        dataNew['facilityname'] = dataOld.facilityname
        dataNew['manageFactor'] = dataOld.managementfactor
        dataNew['targetFC'] = dataRisk.risktarget_fc
        dataNew['targetAC'] = dataRisk.risktarget_ac
        dataNew['sitename'] = site.sitename
        if request.method == 'POST':
            dataNew['facilityname'] = request.POST.get('FacilityName')
            dataNew['manageFactor'] = request.POST.get('ManagementSystemFactor')
            dataNew['targetFC'] = request.POST.get('Financial')
            dataNew['targetAC'] = request.POST.get('Area')
            countFaci = models.Facility.objects.filter(facilityname=dataNew['facilityname']).count()
            if dataNew['facilityname'] != dataOld.facilityname and countFaci > 0:
                error['exist'] = "This facility already exists!"
            else:
                dataOld.facilityname = dataNew['facilityname']
                dataOld.managementfactor = dataNew['manageFactor']
                dataOld.save()

                dataRisk.risktarget_fc = dataNew['targetFC']
                dataRisk.risktarget_ac = dataNew['targetAC']
                dataRisk.save()

                return redirect('facilitiesDisplay', siteID= dataOld.siteid_id)
    except:
        raise Http404
    return render(request, 'FacilityUI/facility/facilityEdit.html',{'dataNew': dataNew, 'error':error, 'siteID':dataOld.siteid_id})
def ListDesignCode(request, siteID):
    try:
        data = models.DesignCode.objects.filter(siteid= siteID)
        pagiDes = Paginator(data, 25)
        pageDes = request.GET.get('page',1)
        try:
            obj = pagiDes.page(pageDes)
        except PageNotAnInteger:
            obj = pagiDes.page(1)
        except EmptyPage:
            obj = pageDes.page(pagiDes.num_pages)
        if '_edit' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.designcodeid):
                    return redirect('designcodeEdit', designcodeID= a.designcodeid)
        if '_delete' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.designcodeid):
                    a.delete()
            return redirect('designcodeDisplay', siteID= siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/design_code/designcodeListDisplay.html', {'obj':obj, 'siteID':siteID})
def NewDesignCode(request,siteID):
    try:
        error = {}
        data = {}
        if request.method == 'POST':
            data['designcode'] = request.POST.get('design_code_name')
            data['designcodeapp'] = request.POST.get('design_code_app')
            count = models.DesignCode.objects.filter(designcode= data['designcode']).count()
            if count > 0:
                error['exist'] = "This design code already exist!"
            else:
                ds = models.DesignCode(designcode= data['designcode'], designcodeapp= data['designcodeapp'], siteid_id = siteID)
                ds.save()
                return redirect('designcodeDisplay', siteID= siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/design_code/designcodeNew.html',{'data':data, 'error':error, 'siteID':siteID})
def EditDesignCode(request,designcodeID):
    try:
        error = {}
        dataNew = {}
        dataOld = models.DesignCode.objects.get(designcodeid= designcodeID)
        dataNew['designcode'] = dataOld.designcode
        dataNew['designcodeapp'] = dataOld.designcodeapp
        if request.method == 'POST':
            dataNew['designcode'] = request.POST.get('design_code_name')
            dataNew['designcodeapp'] = request.POST.get('design_code_app')
            count = models.DesignCode.objects.filter(designcode= dataNew['designcodeapp']).count()
            if dataNew['designcode'] != dataOld.designcode and count > 0:
                error['exist'] = "This design code already exist!"
            else:
                dataOld.designcode = dataNew['designcode']
                dataOld.designcodeapp = dataNew['designcodeapp']
                dataOld.save()
                return redirect('designcodeDisplay', siteID=dataOld.siteid_id)
    except:
        raise Http404
    return render(request, 'FacilityUI/design_code/designcodeEdit.html', {'data':dataNew, 'error':error, 'siteID':dataOld.siteid_id})
def ListManufacture(request, siteID):
    try:
        data = models.Manufacturer.objects.filter(siteid= siteID)
        pagiManu = Paginator(data, 25)
        pageManu = request.GET.get('page',1)
        try:
            obj = pagiManu.page(pageManu)
        except PageNotAnInteger:
            obj = pagiManu.page(1)
        except EmptyPage:
            obj = pageManu.page(pagiManu.num_pages)
        if '_edit' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.manufacturerid):
                    return redirect('manufactureEdit', manufactureID= a.manufacturerid)
        if '_delete' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.manufacturerid):
                    a.delete()
            return redirect('manufactureDisplay', siteID= siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/manufacture/manufactureListDisplay.html', {'obj':obj, 'siteID':siteID})
def NewManufacture(request, siteID):
    try:
        error = {}
        data = {}
        if request.method == 'POST':
            data['manufacture'] = request.POST.get('manufacture')
            count = models.Manufacturer.objects.filter(manufacturername= data['manufacture']).count()
            if count > 0:
                error['exist'] = 'This manufacture already exist!'
            else:
                manu = models.Manufacturer(siteid_id= siteID, manufacturername= data['manufacture'])
                manu.save()
                return redirect('manufactureDisplay', siteID= siteID)
    except:
        raise Http404
    return render(request, 'FacilityUI/manufacture/manufactureNew.html', {'data':data, 'error':error, 'siteID':siteID})
def EditManufacture(request, manufactureID):
    try:
        error = {}
        dataNew = {}
        dataOld = models.Manufacturer.objects.get(manufacturerid= manufactureID)
        dataNew['manufacture'] = dataOld.manufacturername
        if request.method == 'POST':
            dataNew['manufacture'] = request.POST.get('manufacture')
            count = models.Manufacturer.objects.filter(manufacturername= dataNew['manufacture']).count()
            if dataNew['manufacture'] != dataOld.manufacturername and count > 0:
                error['exist'] = 'This manufacturer already exist!'
            else:
                dataOld.manufacturername = dataNew['manufacture']
                dataOld.save()
                return redirect('manufactureDisplay', siteID= dataOld.siteid_id)
    except:
        raise Http404
    return render(request, 'FacilityUI/manufacture/manufactureEdit.html', {'data': dataNew, 'error': error , 'siteID':dataOld.siteid_id})
def ListEquipment(request, facilityID):
    try:
        faci = models.Facility.objects.get(facilityid= facilityID)
        data = models.EquipmentMaster.objects.filter(facilityid= facilityID)
        pagiEquip = Paginator(data,25)
        pageEquip = request.GET.get('page',1)
        try:
            obj = pagiEquip.page(pageEquip)
        except PageNotAnInteger:
            obj = pagiEquip.page(1)
        except EmptyPage:
            obj = pageEquip.page(pagiEquip.num_pages)
        if '_edit' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.equipmentid):
                    return redirect('equipmentEdit', equipmentID= a.equipmentid)
        if '_delete' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.equipmentid):
                    a.delete()
            return redirect('equipmentDisplay' , facilityID= facilityID)
    except:
        raise Http404
    return render(request, 'FacilityUI/equipment/equipmentListDisplay.html', {'obj':obj, 'facilityID':facilityID, 'siteID':faci.siteid_id})
def NewEquipment(request, facilityID):
    try:
        data = {}
        error = {}
        faci = models.Facility.objects.get(facilityid= facilityID)
        manufacture = models.Manufacturer.objects.filter(siteid= faci.siteid_id)
        designcode = models.DesignCode.objects.filter(siteid= faci.siteid_id)
        equipmenttype = models.EquipmentType.objects.all()
        if request.method == 'POST':
            data['equipmentnumber'] = request.POST.get('equipmentNumber')
            data['equipmentname'] = request.POST.get('equipmentName')
            data['equipmenttype'] = request.POST.get('equipmentType')
            data['designcode'] = request.POST.get('designCode')
            data['manufacture'] = request.POST.get('manufacture')
            data['commissiondate'] = request.POST.get('CommissionDate')
            data['pdf'] = request.POST.get('PDFNo')
            data['processdescrip'] = request.POST.get('processDescription')
            data['description'] = request.POST.get('decription')
            count = models.EquipmentMaster.objects.filter(equipmentnumber= data['equipmentnumber']).count()
            if count > 0:
                error['exist']='This equipment already exist!'
            else:
                eq = models.EquipmentMaster(equipmentnumber= data['equipmentnumber'], equipmentname= data['equipmentname'], equipmenttypeid_id=models.EquipmentType.objects.get(equipmenttypename= data['equipmenttype']).equipmenttypeid,
                                                designcodeid_id= models.DesignCode.objects.get(designcode= data['designcode']).designcodeid, siteid_id= faci.siteid_id, facilityid_id= facilityID,
                                                manufacturerid_id= models.Manufacturer.objects.get(manufacturername= data['manufacture']).manufacturerid, commissiondate= data['commissiondate'], pfdno= data['pdf'], processdescription= data['processdescrip'], equipmentdesc= data['description'])
                eq.save()
                return redirect('equipmentDisplay', facilityID= facilityID)
    except:
        raise Http404
    return render(request, 'FacilityUI/equipment/equipmentNew.html', {'data':data, 'equipmenttype': equipmenttype, 'designcode':designcode, 'manufacture':manufacture, 'facilityID':facilityID, 'siteID':faci.siteid_id})
def EditEquipment(request, equipmentID):
    try:
        error = {}
        dataNew = {}
        dataOld = models.EquipmentMaster.objects.get(equipmentid= equipmentID)
        manufacture = models.Manufacturer.objects.filter(siteid=dataOld.siteid_id)
        designcode = models.DesignCode.objects.filter(siteid= dataOld.siteid_id)
        dataNew['equipmentnumber'] = dataOld.equipmentnumber
        dataNew['equipmentname'] = dataOld.equipmentname
        dataNew['equipmenttype'] = models.EquipmentType.objects.get(equipmenttypeid= dataOld.equipmenttypeid_id).equipmenttypename
        dataNew['designcode'] = models.DesignCode.objects.get(designcodeid= dataOld.designcodeid_id).designcode
        dataNew['manufacture'] = models.Manufacturer.objects.get(manufacturerid= dataOld.manufacturerid_id).manufacturername
        dataNew['commissiondate'] = dataOld.commissiondate.date().strftime('%Y-%m-%d')
        dataNew['pdf'] = dataOld.pfdno
        dataNew['processdescrip'] = dataOld.processdescription
        dataNew['description'] = dataOld.equipmentdesc
        if request.method == 'POST':
            dataNew['equipmentnumber'] = request.POST.get('equipmentNumber')
            dataNew['equipmentname'] = request.POST.get('equipmentName')
            dataNew['designcode'] = request.POST.get('designCode')
            dataNew['manufacture'] = request.POST.get('manufacture')
            dataNew['commissiondate'] = request.POST.get('CommissionDate')
            dataNew['pdf'] = request.POST.get('PDFNo')
            dataNew['processdescrip'] = request.POST.get('processDescription')
            dataNew['description'] = request.POST.get('decription')
            count = models.EquipmentMaster.objects.filter(equipmentnumber= dataNew['equipmentnumber']).count()
            if dataNew['equipmentnumber'] != dataOld.equipmentnumber and count > 0:
                error['exist'] = 'This equipment already exist!'
            else:
                dataOld.equipmentnumber = dataNew['equipmentnumber']
                dataOld.equipmentname = dataNew['equipmentname']
                dataOld.designcodeid_id = models.DesignCode.objects.get(designcode= dataNew['designcode']).designcodeid
                dataOld.manufacturerid_id = models.Manufacturer.objects.get(manufacturername= dataNew['manufacture']).manufacturerid
                dataOld.commissiondate = dataNew['commissiondate']
                dataOld.pfdno = dataNew['pdf']
                dataOld.processdescription = dataNew['processdescrip']
                dataOld.equipmentdesc = dataNew['description']
                dataOld.save()
                return redirect('equipmentDisplay', facilityID=dataOld.facilityid_id)
    except:
        raise Http404
    return render(request, 'FacilityUI/equipment/equipmentEdit.html', {'data': dataNew, 'error':error, 'designcode':designcode, 'manufacture':manufacture, 'facilityID':dataOld.facilityid_id, 'siteID':dataOld.siteid_id})
def ListComponent(request, equipmentID):
    try:
        eq = models.EquipmentMaster.objects.get(equipmentid= equipmentID)
        data = models.ComponentMaster.objects.filter(equipmentid= equipmentID)
        pagiComp = Paginator(data,25)
        pageComp = request.GET.get('page',1)
        try:
            obj = pagiComp.page(pageComp)
        except PageNotAnInteger:
            obj= pagiComp.page(1)
        except EmptyPage:
            obj = pageComp.page(pagiComp.num_pages)
        if '_edit' in request.POST:
            for a in data:
                if request.POST.get('%a' %a.componentid):
                    return redirect('componentEdit', componentID= a.componentid)
        if '_delete' in request.POST:
            for a in data:
                if request.POST.get('%d' %a.componentid):
                    a.delete()
            return  redirect('componentDisplay', equipmentID= equipmentID)
    except:
        raise Http404
    return render(request, 'FacilityUI/component/componentListDisplay.html', {'obj':obj, 'equipmentID':equipmentID, 'facilityID': eq.facilityid_id})
def NewComponent(request, equipmentID):
    try:
        eq = models.EquipmentMaster.objects.get(equipmentid= equipmentID)
        data = {}
        error = {}
        componentType = models.ComponentType.objects.all()
        apicomponentType = models.ApiComponentType.objects.all()
        tankapi = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 36, 38, 39]
        other = []
        for a in apicomponentType:
            if a.apicomponenttypeid not in tankapi:
                other.append(a)
        if request.method == 'POST':
            data['componentNumber'] = request.POST.get('componentNumer')
            data['componenttype'] = request.POST.get('componentType')
            data['apicomponenttype'] = request.POST.get('apiComponentType')
            data['componentname'] = request.POST.get('componentName')
            if request.POST.get('comRisk'):
                data['link'] = 1
            else:
                data['link'] = 0
            data['description'] = request.POST.get('decription')
            count = models.ComponentMaster.objects.filter(componentnumber= data['componentNumber']).count()
            if count >0:
                error['exist'] = 'This component already exist!'
            else:
                comp = models.ComponentMaster(componentnumber= data['componentNumber'], equipmentid_id= equipmentID,
                                              componenttypeid_id = models.ComponentType.objects.get(componenttypename= data['componenttype']).componenttypeid,
                                              componentname= data['componentname'], componentdesc= data['description'], isequipmentlinked= data['link'],
                                              apicomponenttypeid= models.ApiComponentType.objects.get(apicomponenttypename= data['apicomponenttype']).apicomponenttypeid)
                comp.save()
                return redirect('componentDisplay', equipmentID= equipmentID)
    except:
        raise Http404
    return render(request, 'FacilityUI/component/componentNew.html', {'error':error, 'componenttype': componentType, 'api':apicomponentType,'other':other, 'data':data, 'equipmentID':equipmentID, 'facilityID': eq.facilityid_id})
def EditComponent(request, componentID):
    try:
        dataNew = {}
        error = {}
        dataOld = models.ComponentMaster.objects.get(componentid= componentID)
        dataNew['componentnumber'] = dataOld.componentnumber
        dataNew['componentname'] = dataOld.componentname
        dataNew['componenttype'] = models.ComponentType.objects.get(componenttypeid= dataOld.componenttypeid_id).componenttypename
        dataNew['apicomponenttype'] = models.ApiComponentType.objects.get(apicomponenttypeid= dataOld.apicomponenttypeid).apicomponenttypename
        dataNew['link'] = dataOld.isequipmentlinked
        dataNew['description'] = dataOld.componentdesc
        if request.method == 'POST':
            dataNew['componentnumber'] = request.POST.get('componentNumer')
            dataNew['componentname'] = request.POST.get('componentName')
            if request.POST.get('comRisk'):
                dataNew['link'] = 1
            else:
                dataNew['link'] = 0
            dataNew['description'] = request.POST.get('decription')
            count = models.ComponentMaster.objects.filter(componentnumber= dataNew['componentnumber']).count()
            if count > 0 and dataNew['componentnumber'] != dataOld.componentnumber:
                error['exist'] = 'This component already exist!'
            else:
                dataOld.componentnumber = dataNew['componentnumber']
                dataOld.componentname = dataNew['componentname']
                dataOld.isequipmentlinked = dataNew['link']
                dataOld.componentdesc = dataNew['description']
                dataOld.save()
                return redirect('componentDisplay', equipmentID= dataOld.equipmentid_id)
    except:
        raise Http404
    return render(request, 'FacilityUI/component/componentEdit.html', {'data':dataNew, 'error':error, 'equipmentID':dataOld.equipmentid_id, 'facilityID': models.EquipmentMaster.objects.get(equipmentid= dataOld.equipmentid_id).facilityid_id})
def ListProposal(request, componentID):
    try:
        rwass = models.RwAssessment.objects.filter(componentid= componentID)
        data = []
        comp = models.ComponentMaster.objects.get(componentid= componentID)
        equip = models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id)
        tank = [8,12,14,15]
        for a in rwass:
            df = models.RwFullPof.objects.filter(id= a.id)
            fc = models.RwFullFcof.objects.filter(id= a.id)
            dm = models.RwDamageMechanism.objects.filter(id_dm= a.id)
            obj1 = {}
            obj1['id'] = a.id
            obj1['name'] = a.proposalname
            obj1['lastinsp'] = a.assessmentdate.strftime('%Y-%m-%d')
            if df.count() != 0:
                obj1['df'] = round(df[0].totaldfap1, 2)
                obj1['gff'] = df[0].gfftotal
                obj1['fms'] = df[0].fms
            else:
                obj1['df'] = 0
                obj1['gff'] = 0
                obj1['fms'] = 0
            if fc.count() != 0:
                obj1['fc'] = round(fc[0].fcofvalue, 2)
            else:
                obj1['fc'] = 0
            if dm.count() != 0:
                obj1['duedate'] = dm[0].inspduedate.date().strftime('%Y-%m-%d')
            else:
                obj1['duedate'] = (a.assessmentdate.date() + relativedelta(years=15)).strftime('%Y-%m-%d')
                obj1['lastinsp'] = equip.commissiondate.date().strftime('%Y-%m-%d')
            obj1['risk'] = round(obj1['df'] * obj1['gff'] * obj1['fms'] * obj1['fc'], 2)
            data.append(obj1)
        pagidata = Paginator(data,25)
        pagedata = request.GET.get('page',1)
        try:
            obj = pagidata.page(pagedata)
        except PageNotAnInteger:
            obj = pagidata.page(1)
        except EmptyPage:
            obj = pagedata.page(pagidata.num_pages)

        if comp.componenttypeid_id in tank:
            istank = 1
        else:
            istank = 0
        if comp.componenttypeid_id == 8 or comp.componenttypeid_id == 14:
            isshell = 1
        else:
            isshell = 0
        if '_delete' in request.POST:
            for a in rwass:
                if request.POST.get('%d' %a.id):
                    a.delete()
            return redirect('proposalDisplay', componentID=componentID)
        if '_edit' in request.POST:
            for a in rwass:
                if request.POST.get('%d' %a.id):
                    if istank:
                        return redirect('tankEdit', proposalID= a.id)
                    else:
                        return redirect('prosalEdit', proposalID= a.id)
    except:
        raise Http404
    return render(request, 'FacilityUI/proposal/proposalListDisplay.html', {'obj':obj, 'istank': istank, 'isshell':isshell,
                                                                            'componentID':componentID,
                                                                            'equipmentID':comp.equipmentid_id})
def NewProposal(request, componentID):
    try:
        Fluid = ["Acid", "AlCl3", "C1-C2", "C13-C16", "C17-C25", "C25+", "C3-C4", "C5", "C6-C8", "C9-C12", "CO", "DEE",
             "EE", "EEA", "EG", "EO", "H2", "H2S", "HCl", "HF", "Methanol", "Nitric Acid", "NO2", "Phosgene", "PO",
             "Pyrophoric", "Steam", "Styrene", "TDI", "Water"]
        comp = models.ComponentMaster.objects.get(componentid= componentID)
        target = models.FacilityRiskTarget.objects.get(facilityid= models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).facilityid_id)
        datafaci = models.Facility.objects.get(facilityid= models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).facilityid_id)
        data = {}
        if request.method == 'POST':
            data['assessmentname'] = request.POST.get('AssessmentName')
            data['assessmentdate'] = request.POST.get('assessmentdate')
            data['apicomponenttypeid'] = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).apicomponenttypename
            data['equipmentType'] = models.EquipmentType.objects.get(equipmenttypeid= models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).equipmenttypeid_id).equipmenttypename
            data['riskperiod'] = request.POST.get('RiskAnalysisPeriod')
            if request.POST.get('adminControlUpset'):
                adminControlUpset = 1
            else:
                adminControlUpset = 0

            if request.POST.get('ContainsDeadlegs'):
                containsDeadlegs = 1
            else:
                containsDeadlegs = 0

            if request.POST.get('Highly'):
                HighlyEffe = 1
            else:
                HighlyEffe = 0

            if request.POST.get('CylicOper'):
                cylicOP = 1
            else:
                cylicOP = 0

            if request.POST.get('Downtime'):
                downtime = 1
            else:
                downtime = 0

            if request.POST.get('SteamedOut'):
                steamOut = 1
            else:
                steamOut = 0

            if request.POST.get('HeatTraced'):
                heatTrace = 1
            else:
                heatTrace = 0

            if request.POST.get('PWHT'):
                pwht = 1
            else:
                pwht = 0

            if request.POST.get('InterfaceSoilWater'):
                interfaceSoilWater = 1
            else:
                interfaceSoilWater = 0

            if request.POST.get('PressurisationControlled'):
                pressureControl = 1
            else:
                pressureControl = 0

            if request.POST.get('LOM'):
                linerOnlineMoniter = 1
            else:
                linerOnlineMoniter = 0

            if request.POST.get('EquOper'):
                lowestTemp = 1
            else:
                lowestTemp = 0

            if request.POST.get('PresenceofSulphidesShutdow'):
                presentSulphidesShutdown =1
            else:
                presentSulphidesShutdown = 0

            if request.POST.get('MFTF'):
                materialExposed = 1
            else:
                materialExposed = 0

            if request.POST.get('PresenceofSulphides'):
                presentSulphide = 1
            else:
                presentSulphide = 0

            data['minTemp'] = request.POST.get('Min')
            data['ExternalEnvironment'] = request.POST.get('ExternalEnvironment')
            data['ThermalHistory'] = request.POST.get('ThermalHistory')
            data['OnlineMonitoring'] = request.POST.get('OnlineMonitoring')
            data['EquipmentVolumn'] = request.POST.get('EquipmentVolume')

            data['normaldiameter'] = request.POST.get('NominalDiameter')
            data['normalthick'] = request.POST.get('NominalThickness')
            data['currentthick'] = request.POST.get('CurrentThickness')
            data['tmin'] = request.POST.get('tmin')
            data['currentrate'] = request.POST.get('CurrentRate')
            data['deltafatt'] = request.POST.get('DeltaFATT')

            if request.POST.get('DFDI'):
                damageDuringInsp = 1
            else:
                damageDuringInsp = 0

            if request.POST.get('ChemicalInjection'):
                chemicalInj = 1
            else:
                chemicalInj = 0

            if request.POST.get('PresenceCracks'):
                crackpresent = 1
            else:
                crackpresent = 0

            if request.POST.get('HFICI'):
                HFICI = 1
            else:
                HFICI = 0

            if request.POST.get('TrampElements'):
                TrampElement = 1
            else:
                TrampElement = 0

            data['MaxBrinell'] = request.POST.get('MBHW')
            data['complex'] = request.POST.get('ComplexityProtrusions')
            data['CylicLoad'] = request.POST.get('CLC')
            data['branchDiameter'] = request.POST.get('BranchDiameter')
            data['joinTypeBranch'] = request.POST.get('JTB')
            data['numberPipe'] = request.POST.get('NFP')
            data['pipeCondition'] = request.POST.get('PipeCondition')
            data['prevFailure'] = request.POST.get('PreviousFailures')

            if request.POST.get('VASD'):
                visibleSharkingProtect = 1
            else:
                visibleSharkingProtect = 0

            data['shakingPipe'] = request.POST.get('ASP')
            data['timeShakingPipe'] = request.POST.get('ATSP')
            data['correctActionMitigate'] = request.POST.get('CAMV')

            # OP condition
            data['maxOT'] = request.POST.get('MaxOT')
            data['maxOP'] = request.POST.get('MaxOP')
            data['minOT'] = request.POST.get('MinOT')
            data['minOP'] = request.POST.get('MinOP')
            data['OpHydroPressure'] = request.POST.get('OHPP')
            data['criticalTemp'] = request.POST.get('CET')
            data['OP1'] = request.POST.get('Operating1')
            data['OP2'] = request.POST.get('Operating2')
            data['OP3'] = request.POST.get('Operating3')
            data['OP4'] = request.POST.get('Operating4')
            data['OP5'] = request.POST.get('Operating5')
            data['OP6'] = request.POST.get('Operating6')
            data['OP7'] = request.POST.get('Operating7')
            data['OP8'] = request.POST.get('Operating8')
            data['OP9'] = request.POST.get('Operating9')
            data['OP10'] = request.POST.get('Operating10')

            #material
            data['material'] = request.POST.get('Material')
            data['maxDesignTemp'] = request.POST.get('MaxDesignTemp')
            data['minDesignTemp'] = request.POST.get('MinDesignTemp')
            data['designPressure'] = request.POST.get('DesignPressure')
            data['tempRef'] = request.POST.get('ReferenceTemperature')
            data['allowStress'] = request.POST.get('ASAT')
            data['BrittleFacture'] = request.POST.get('BFGT')
            data['CA'] = request.POST.get('CorrosionAllowance')
            data['sigmaPhase'] = request.POST.get('SigmaPhase')
            if request.POST.get('CoLAS'):
                cacbonAlloy = 1
            else:
                cacbonAlloy = 0

            if request.POST.get('AusteniticSteel'):
                austeniticStell = 1
            else:
                austeniticStell = 0

            if request.POST.get('SusceptibleTemper'):
                suscepTemp = 1
            else:
                suscepTemp = 0

            if request.POST.get('NickelAlloy'):
                nickelAlloy = 1
            else:
                nickelAlloy = 0

            if request.POST.get('Chromium'):
                chromium = 1
            else:
                chromium = 0

            data['sulfurContent'] = request.POST.get('SulfurContent')
            data['heatTreatment'] = request.POST.get('heatTreatment')

            if request.POST.get('MGTEHTHA'):
                materialHTHA = 1
            else:
                materialHTHA = 0

            data['HTHAMaterialGrade'] = request.POST.get('HTHAMaterialGrade')

            if request.POST.get('MaterialPTA'):
                materialPTA = 1
            else:
                materialPTA = 0

            data['PTAMaterialGrade'] = request.POST.get('PTAMaterialGrade')
            data['materialCostFactor'] = request.POST.get('MaterialCostFactor')

            #Coating, Clading
            if request.POST.get('InternalCoating'):
                InternalCoating = 1
            else:
                InternalCoating = 0

            if request.POST.get('ExternalCoating'):
                ExternalCoating = 1
            else:
                ExternalCoating = 0

            data['ExternalCoatingID'] = request.POST.get('ExternalCoatingID')
            data['ExternalCoatingQuality'] = request.POST.get('ExternalCoatingQuality')

            if request.POST.get('SCWD'):
                supportMaterial = 1
            else:
                supportMaterial = 0

            if request.POST.get('InternalCladding'):
                InternalCladding = 1
            else:
                InternalCladding = 0

            data['CladdingCorrosionRate'] = request.POST.get('CladdingCorrosionRate')

            if request.POST.get('InternalLining'):
                InternalLining = 1
            else:
                InternalLining = 0

            data['InternalLinerType'] = request.POST.get('InternalLinerType')
            data['InternalLinerCondition'] = request.POST.get('InternalLinerCondition')

            if request.POST.get('ExternalInsulation')== "on" or request.POST.get('ExternalInsulation')== 1:
                ExternalInsulation = 1
            else:
                ExternalInsulation = 0

            if request.POST.get('ICC'):
                InsulationCholride = 1
            else:
                InsulationCholride = 0

            data['ExternalInsulationType'] = request.POST.get('ExternalInsulationType')
            data['InsulationCondition'] = request.POST.get('InsulationCondition')

            # Steam
            data['NaOHConcentration'] = request.POST.get('NaOHConcentration')
            data['ReleasePercentToxic'] = request.POST.get('RFPT')
            data['ChlorideIon'] = request.POST.get('ChlorideIon')
            data['CO3'] = request.POST.get('CO3')
            data['H2SContent'] = request.POST.get('H2SContent')
            data['PHWater'] = request.POST.get('PHWater')

            if request.POST.get('EAGTA'):
                exposureAcid = 1
            else:
                exposureAcid = 0

            if request.POST.get('ToxicConstituents'):
                ToxicConstituents = 1
            else:
                ToxicConstituents = 0

            data['ExposureAmine'] = request.POST.get('ExposureAmine')
            data['AminSolution'] = request.POST.get('ASC')

            if request.POST.get('APDO'):
                aquaDuringOP = 1
            else:
                aquaDuringOP = 0

            if request.POST.get('APDSD'):
                aquaDuringShutdown = 1
            else:
                aquaDuringShutdown = 0

            if request.POST.get('EnvironmentCH2S'):
                EnvironmentCH2S = 1
            else:
                EnvironmentCH2S = 0

            if request.POST.get('PHA'):
                presentHF = 1
            else:
                presentHF = 0

            if request.POST.get('PresenceCyanides'):
                presentCyanide = 1
            else:
                presentCyanide = 0

            if request.POST.get('PCH'):
                processHydrogen = 1
            else:
                processHydrogen = 0

            if request.POST.get('ECCAC'):
                environCaustic = 1
            else:
                environCaustic = 0

            if request.POST.get('ESBC'):
                exposedSulfur = 1
            else:
                exposedSulfur = 0

            if request.POST.get('MEFMSCC'):
                materialExposedFluid = 1
            else:
                materialExposedFluid = 0
            # CA
            data['APIFluid'] = request.POST.get('APIFluid')
            data['MassInventory'] = request.POST.get('MassInventory')
            data['Systerm'] = request.POST.get('Systerm')
            data['MassComponent'] = request.POST.get('MassComponent')
            data['EquipmentCost'] = request.POST.get('EquipmentCost')
            data['MittigationSysterm'] = request.POST.get('MittigationSysterm')
            data['ProductionCost'] = request.POST.get('ProductionCost')
            data['ToxicPercent'] = request.POST.get('ToxicPercent')
            data['InjureCost'] = request.POST.get('InjureCost')
            data['ReleaseDuration'] = request.POST.get('ReleaseDuration')
            data['EnvironmentCost'] = request.POST.get('EnvironmentCost')
            data['PersonDensity'] = request.POST.get('PersonDensity')
            data['DetectionType'] = request.POST.get('DetectionType')
            data['IsulationType'] = request.POST.get('IsulationType')
            rwassessment = models.RwAssessment(equipmentid_id=comp.equipmentid_id, componentid_id=comp.componentid, assessmentdate=data['assessmentdate'],
                                        riskanalysisperiod=data['riskperiod'], isequipmentlinked= comp.isequipmentlinked,
                                        proposalname=data['assessmentname'])
            rwassessment.save()
            rwequipment = models.RwEquipment(id=rwassessment, commissiondate=models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).commissiondate,
                                      adminupsetmanagement=adminControlUpset, containsdeadlegs=containsDeadlegs,
                                      cyclicoperation=cylicOP, highlydeadleginsp=HighlyEffe,
                                      downtimeprotectionused=downtime, externalenvironment=data['ExternalEnvironment'],
                                      heattraced=heatTrace, interfacesoilwater=interfaceSoilWater,
                                      lineronlinemonitoring=linerOnlineMoniter, materialexposedtoclext=materialExposed,
                                      minreqtemperaturepressurisation=data['minTemp'],
                                      onlinemonitoring=data['OnlineMonitoring'], presencesulphideso2=presentSulphide,
                                      presencesulphideso2shutdown=presentSulphidesShutdown,
                                      pressurisationcontrolled=pressureControl, pwht=pwht, steamoutwaterflush=steamOut,
                                      managementfactor= datafaci.managementfactor, thermalhistory=data['ThermalHistory'],
                                      yearlowestexptemp=lowestTemp, volume=data['EquipmentVolumn'])
            rwequipment.save()
            rwcomponent = models.RwComponent(id=rwassessment, nominaldiameter=data['normaldiameter'],
                                      nominalthickness=data['normalthick'], currentthickness=data['currentthick'],
                                      minreqthickness=data['tmin'], currentcorrosionrate=data['currentrate'],
                                      branchdiameter=data['branchDiameter'], branchjointtype=data['joinTypeBranch'],
                                      brinnelhardness=data['MaxBrinell']
                                      , deltafatt=data['deltafatt'], chemicalinjection=chemicalInj,
                                      highlyinjectioninsp=HFICI, complexityprotrusion=data['complex'],
                                      correctiveaction=data['correctActionMitigate'], crackspresent=crackpresent,
                                      cyclicloadingwitin15_25m=data['CylicLoad'],
                                      damagefoundinspection=damageDuringInsp, numberpipefittings=data['numberPipe'],
                                      pipecondition=data['pipeCondition'],
                                      previousfailures=data['prevFailure'], shakingamount=data['shakingPipe'],
                                      shakingdetected=visibleSharkingProtect, shakingtime=data['timeShakingPipe'],
                                      trampelements=TrampElement)
            rwcomponent.save()
            rwstream = models.RwStream(id=rwassessment, aminesolution=data['AminSolution'], aqueousoperation=aquaDuringOP,
                                aqueousshutdown=aquaDuringShutdown, toxicconstituent=ToxicConstituents,
                                caustic=environCaustic,
                                chloride=data['ChlorideIon'], co3concentration=data['CO3'], cyanide=presentCyanide,
                                exposedtogasamine=exposureAcid, exposedtosulphur=exposedSulfur,
                                exposuretoamine=data['ExposureAmine'],
                                h2s=EnvironmentCH2S, h2sinwater=data['H2SContent'], hydrogen=processHydrogen,
                                hydrofluoric=presentHF, materialexposedtoclint=materialExposedFluid,
                                maxoperatingpressure=data['maxOP'],
                                maxoperatingtemperature=float(data['maxOT']), minoperatingpressure=float(data['minOP']),
                                minoperatingtemperature=data['minOT'], criticalexposuretemperature=data['criticalTemp'],
                                naohconcentration=data['NaOHConcentration'],
                                releasefluidpercenttoxic=float(data['ReleasePercentToxic']),
                                waterph=float(data['PHWater']), h2spartialpressure=float(data['OpHydroPressure']))
            rwstream.save()
            rwexcor = models.RwExtcorTemperature(id=rwassessment, minus12tominus8=data['OP1'], minus8toplus6=data['OP2'],
                                          plus6toplus32=data['OP3'], plus32toplus71=data['OP4'],
                                          plus71toplus107=data['OP5'],
                                          plus107toplus121=data['OP6'], plus121toplus135=data['OP7'],
                                          plus135toplus162=data['OP8'], plus162toplus176=data['OP9'],
                                          morethanplus176=data['OP10'])
            rwexcor.save()
            rwcoat = models.RwCoating(id=rwassessment, externalcoating=ExternalCoating, externalinsulation=ExternalInsulation,
                               internalcladding=InternalCladding, internalcoating=InternalCoating,
                               internallining=InternalLining,
                               externalcoatingdate=data['ExternalCoatingID'],
                               externalcoatingquality=data['ExternalCoatingQuality'],
                               externalinsulationtype=data['ExternalInsulationType'],
                               insulationcondition=data['InsulationCondition'],
                               insulationcontainschloride=InsulationCholride,
                               internallinercondition=data['InternalLinerCondition'],
                               internallinertype=data['InternalLinerType'],
                               claddingcorrosionrate=data['CladdingCorrosionRate'],
                               supportconfignotallowcoatingmaint=supportMaterial)
            rwcoat.save()
            rwmaterial = models.RwMaterial(id=rwassessment, corrosionallowance=data['CA'], materialname=data['material'],
                                    designpressure=data['designPressure'], designtemperature=data['maxDesignTemp'],
                                    mindesigntemperature=data['minDesignTemp'],
                                    brittlefracturethickness=data['BrittleFacture'], sigmaphase=data['sigmaPhase'],
                                    sulfurcontent=data['sulfurContent'], heattreatment=data['heatTreatment'],
                                    referencetemperature=data['tempRef'],
                                    ptamaterialcode=data['PTAMaterialGrade'],
                                    hthamaterialcode=data['HTHAMaterialGrade'], ispta=materialPTA, ishtha=materialHTHA,
                                    austenitic=austeniticStell, temper=suscepTemp, carbonlowalloy=cacbonAlloy,
                                    nickelbased=nickelAlloy, chromemoreequal12=chromium,
                                    allowablestress=data['allowStress'], costfactor=data['materialCostFactor'])
            rwmaterial.save()
            rwinputca = models.RwInputCaLevel1(id=rwassessment, api_fluid=data['APIFluid'], system=data['Systerm'],
                                        release_duration=data['ReleaseDuration'], detection_type=data['DetectionType'],
                                        isulation_type=data['IsulationType'],
                                        mitigation_system=data['MittigationSysterm'],
                                        equipment_cost=data['EnvironmentCost'], injure_cost=data['InjureCost'],
                                        evironment_cost=data['EnvironmentCost'], toxic_percent=data['ToxicPercent'],
                                        personal_density=data['PersonDensity'],
                                        material_cost=data['materialCostFactor'],
                                        production_cost=data['ProductionCost'], mass_inventory=data['MassInventory'],
                                        mass_component=data['MassComponent'],
                                        stored_pressure=float(data['minOP']) * 6.895, stored_temp=data['minOT'])
            rwinputca.save()
            if data['ExternalCoatingID'] is None:
                dm_cal = DM_CAL.DM_CAL(ComponentNumber=str(comp.componentnumber), Commissiondate=models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).commissiondate,
                                AssessmentDate=datetime.strptime(data['assessmentdate'],"%Y-%M-%d"),
                                APIComponentType=str(data['apicomponenttypeid']),
                                Diametter=float(data['normaldiameter']), NomalThick=float(data['normalthick']),
                                CurrentThick=float(data['currentthick']), MinThickReq=float(data['tmin']),
                                CorrosionRate=float(data['currentrate']), CA=float(data['CA']),
                                ProtectedBarrier=False, CladdingCorrosionRate=float(data['CladdingCorrosionRate']),
                                InternalCladding=bool(InternalCladding),
                                OnlineMonitoring=data['OnlineMonitoring'], HighlyEffectDeadleg=bool(HighlyEffe),
                                ContainsDeadlegs=bool(containsDeadlegs),
                                TankMaintain653=False, AdjustmentSettle="", ComponentIsWeld=False,
                                LinningType=data['InternalLinerType'], LINNER_ONLINE=bool(linerOnlineMoniter),
                                LINNER_CONDITION=data['InternalLinerCondition'], YEAR_IN_SERVICE=0,
                                INTERNAL_LINNING=bool(InternalLining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['NaOHConcentration']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOut),
                                AMINE_EXPOSED=bool(exposureAcid), AMINE_SOLUTION=data['AminSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(EnvironmentCH2S), AQUEOUS_OPERATOR=bool(aquaDuringOP),
                                AQUEOUS_SHUTDOWN=bool(aquaDuringShutdown),
                                H2SContent=float(data['H2SContent']), PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(presentCyanide), BRINNEL_HARDNESS=data['MaxBrinell'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['CO3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presentSulphide),
                                ExposedSH2OShutdown=bool(presentSulphidesShutdown),
                                ThermalHistory=data['ThermalHistory'], PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtime),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialExposedFluid),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialExposed),
                                CHLORIDE_ION_CONTENT=float(data['ChlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater), SUPPORT_COATING=bool(supportMaterial),
                                INSULATION_TYPE=data['ExternalInsulationType'],
                                CUI_PERCENT_1=data['OP1'], CUI_PERCENT_2=data['OP2'],
                                CUI_PERCENT_3=data['OP3'], CUI_PERCENT_4=data['OP4'], CUI_PERCENT_5=data['OP5'],
                                CUI_PERCENT_6=data['OP6'], CUI_PERCENT_7=data['OP7'], CUI_PERCENT_8=data['OP8'],
                                CUI_PERCENT_9=data['OP9'], CUI_PERCENT_10=data['OP10'],
                                EXTERNAL_INSULATION=bool(ExternalInsulation),
                                COMPONENT_INSTALL_DATE= models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).commissiondate,
                                CRACK_PRESENT=bool(crackpresent),
                                EXTERNAL_EVIRONMENT=data['ExternalEnvironment'],
                                EXTERN_COAT_QUALITY=data['ExternalCoatingQuality'],
                                PIPING_COMPLEXITY=data['complex'], INSULATION_CONDITION=data['InsulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationCholride),
                                MATERIAL_SUSCEP_HTHA=bool(materialHTHA), HTHA_MATERIAL=data['HTHAMaterialGrade'],
                                HTHA_PRESSURE=float(data['OpHydroPressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageDuringInsp),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=bool(suscepTemp), PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['BrittleFacture']), CARBON_ALLOY=bool(cacbonAlloy),
                                DELTA_FATT=float(data['deltafatt']),
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['tempRef']),
                                AUSTENITIC_STEEL=bool(austeniticStell), PERCENT_SIGMA=float(data['sigmaPhase']),
                                EquipmentType=data['equipmentType'], PREVIOUS_FAIL=data['prevFailure'],
                                AMOUNT_SHAKING=data['shakingPipe'], TIME_SHAKING=data['timeShakingPipe'],
                                CYLIC_LOAD=data['CylicLoad'],
                                CORRECT_ACTION=data['correctActionMitigate'], NUM_PIPE=data['numberPipe'],
                                PIPE_CONDITION=data['pipeCondition'], JOINT_TYPE=data['joinTypeBranch'],
                                BRANCH_DIAMETER=data['branchDiameter'])
            else:
                dm_cal = DM_CAL.DM_CAL(ComponentNumber=str(comp.componentnumber), Commissiondate=models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id).commissiondate,
                                AssessmentDate=datetime.strptime(data['assessmentdate'],"%Y-%M-%d"),
                                APIComponentType=str(data['apicomponenttypeid']),
                                Diametter=float(data['normaldiameter']), NomalThick=float(data['normalthick']),
                                CurrentThick=float(data['currentthick']), MinThickReq=float(data['tmin']),
                                CorrosionRate=float(data['currentrate']), CA=float(data['CA']),
                                ProtectedBarrier=False, CladdingCorrosionRate=float(data['CladdingCorrosionRate']),
                                InternalCladding=bool(InternalCladding),
                                OnlineMonitoring=data['OnlineMonitoring'], HighlyEffectDeadleg=bool(HighlyEffe),
                                ContainsDeadlegs=bool(containsDeadlegs),
                                TankMaintain653=False, AdjustmentSettle="", ComponentIsWeld=False,
                                LinningType=data['InternalLinerType'], LINNER_ONLINE=bool(linerOnlineMoniter),
                                LINNER_CONDITION=data['InternalLinerCondition'], YEAR_IN_SERVICE=0,
                                INTERNAL_LINNING=bool(InternalLining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['NaOHConcentration']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOut),
                                AMINE_EXPOSED=bool(exposureAcid), AMINE_SOLUTION=data['AminSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(EnvironmentCH2S), AQUEOUS_OPERATOR=bool(aquaDuringOP),
                                AQUEOUS_SHUTDOWN=bool(aquaDuringShutdown),
                                H2SContent=float(data['H2SContent']), PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(presentCyanide), BRINNEL_HARDNESS=data['MaxBrinell'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['CO3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presentSulphide),
                                ExposedSH2OShutdown=bool(presentSulphidesShutdown),
                                ThermalHistory=data['ThermalHistory'], PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtime),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialExposedFluid),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialExposed),
                                CHLORIDE_ION_CONTENT=float(data['ChlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater), SUPPORT_COATING=bool(supportMaterial),
                                INSULATION_TYPE=data['ExternalInsulationType'],
                                CUI_PERCENT_1=data['OP1'], CUI_PERCENT_2=data['OP2'],
                                CUI_PERCENT_3=data['OP3'], CUI_PERCENT_4=data['OP4'], CUI_PERCENT_5=data['OP5'],
                                CUI_PERCENT_6=data['OP6'], CUI_PERCENT_7=data['OP7'], CUI_PERCENT_8=data['OP8'],
                                CUI_PERCENT_9=data['OP9'], CUI_PERCENT_10=data['OP10'],
                                EXTERNAL_INSULATION=bool(ExternalInsulation),
                                COMPONENT_INSTALL_DATE=datetime.strptime(str(data['ExternalCoatingID']),"%Y-%M-%d"),
                                CRACK_PRESENT=bool(crackpresent),
                                EXTERNAL_EVIRONMENT=data['ExternalEnvironment'],
                                EXTERN_COAT_QUALITY=data['ExternalCoatingQuality'],
                                PIPING_COMPLEXITY=data['complex'], INSULATION_CONDITION=data['InsulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationCholride),
                                MATERIAL_SUSCEP_HTHA=bool(materialHTHA), HTHA_MATERIAL=data['HTHAMaterialGrade'],
                                HTHA_PRESSURE=float(data['OpHydroPressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageDuringInsp),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=bool(suscepTemp), PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['BrittleFacture']), CARBON_ALLOY=bool(cacbonAlloy),
                                DELTA_FATT=float(data['deltafatt']),
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['tempRef']),
                                AUSTENITIC_STEEL=bool(austeniticStell), PERCENT_SIGMA=float(data['sigmaPhase']),
                                EquipmentType=data['equipmentType'], PREVIOUS_FAIL=data['prevFailure'],
                                AMOUNT_SHAKING=data['shakingPipe'], TIME_SHAKING=data['timeShakingPipe'],
                                CYLIC_LOAD=data['CylicLoad'],
                                CORRECT_ACTION=data['correctActionMitigate'], NUM_PIPE=data['numberPipe'],
                                PIPE_CONDITION=data['pipeCondition'], JOINT_TYPE=data['joinTypeBranch'],
                                BRANCH_DIAMETER=data['branchDiameter'])
            ca_cal = CA_CAL.CA_NORMAL(NominalDiametter=float(data['normaldiameter']),
                               MATERIAL_COST=float(data['materialCostFactor']), FLUID=data['APIFluid'],
                               FLUID_PHASE=data['Systerm'], API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                               DETECTION_TYPE=data['DetectionType'],
                               ISULATION_TYPE=data['IsulationType'], STORED_PRESSURE=float(data['minOP']) * 6.895,
                               ATMOSPHERIC_PRESSURE=101, STORED_TEMP=float(data['minOT']) + 273,
                               MASS_INVERT=float(data['MassInventory']),
                               MASS_COMPONENT=float(data['MassComponent']),
                               MITIGATION_SYSTEM=data['MittigationSysterm'], TOXIC_PERCENT=float(data['ToxicPercent']),
                               RELEASE_DURATION=data['ReleaseDuration'], PRODUCTION_COST=float(data['ProductionCost']),
                               INJURE_COST=float(data['InjureCost']), ENVIRON_COST=float(data['EnvironmentCost']),
                               PERSON_DENSITY=float(data['PersonDensity']), EQUIPMENT_COST=float(data['EquipmentCost']))
            TOTAL_DF_API1 = dm_cal.DF_TOTAL_API(0)
            TOTAL_DF_API2 = dm_cal.DF_TOTAL_API(3)
            TOTAL_DF_API3 = dm_cal.DF_TOTAL_API(6)
            gffTotal = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).gfftotal
            pofap1 = TOTAL_DF_API1 * datafaci.managementfactor * gffTotal
            pofap2 = TOTAL_DF_API2 * datafaci.managementfactor * gffTotal
            pofap3 = TOTAL_DF_API3 * datafaci.managementfactor * gffTotal
            # Pof
            # thinningtype = General or Local
            refullPOF = models.RwFullPof(id=rwassessment, thinningap1=dm_cal.DF_THINNING_TOTAL_API(0),
                                  thinningap2=dm_cal.DF_THINNING_TOTAL_API(3),
                                  thinningap3=dm_cal.DF_THINNING_TOTAL_API(6),
                                  sccap1=dm_cal.DF_SSC_TOTAL_API(0), sccap2=dm_cal.DF_SSC_TOTAL_API(3),
                                  sccap3=dm_cal.DF_SSC_TOTAL_API(6),
                                  externalap1=dm_cal.DF_EXT_TOTAL_API(0), externalap2=dm_cal.DF_EXT_TOTAL_API(3),
                                  externalap3=dm_cal.DF_EXT_TOTAL_API(6),
                                  brittleap1=dm_cal.DF_BRIT_TOTAL_API(), brittleap2=dm_cal.DF_BRIT_TOTAL_API(),
                                  brittleap3=dm_cal.DF_BRIT_TOTAL_API(),
                                  htha_ap1=dm_cal.DF_HTHA_API(0), htha_ap2=dm_cal.DF_HTHA_API(3),
                                  htha_ap3=dm_cal.DF_HTHA_API(6),
                                  fatigueap1=dm_cal.DF_PIPE_API(), fatigueap2=dm_cal.DF_PIPE_API(),
                                  fatigueap3=dm_cal.DF_PIPE_API(),
                                  fms= datafaci.managementfactor, thinningtype="Local",
                                  thinninglocalap1=max(dm_cal.DF_THINNING_TOTAL_API(0), dm_cal.DF_EXT_TOTAL_API(0)),
                                  thinninglocalap2=max(dm_cal.DF_THINNING_TOTAL_API(3), dm_cal.DF_EXT_TOTAL_API(3)),
                                  thinninglocalap3=max(dm_cal.DF_THINNING_TOTAL_API(6), dm_cal.DF_EXT_TOTAL_API(6)),
                                  thinninggeneralap1=dm_cal.DF_THINNING_TOTAL_API(0) + dm_cal.DF_EXT_TOTAL_API(0),
                                  thinninggeneralap2=dm_cal.DF_THINNING_TOTAL_API(3) + dm_cal.DF_EXT_TOTAL_API(3),
                                  thinninggeneralap3=dm_cal.DF_THINNING_TOTAL_API(6) + dm_cal.DF_EXT_TOTAL_API(6),
                                  totaldfap1=TOTAL_DF_API1, totaldfap2=TOTAL_DF_API2, totaldfap3=TOTAL_DF_API3,
                                  pofap1=pofap1, pofap2=pofap2, pofap3=pofap3, gfftotal=gffTotal,
                                  pofap1category=dm_cal.PoFCategory(TOTAL_DF_API1),
                                  pofap2category=dm_cal.PoFCategory(TOTAL_DF_API2),
                                  pofap3category=dm_cal.PoFCategory(TOTAL_DF_API3))

            refullPOF.save()
            # ca level 1( CoF)
            if ca_cal.NominalDiametter == 0 or ca_cal.STORED_PRESSURE == 0 or ca_cal.MASS_INVERT == 0 or ca_cal.MASS_COMPONENT == 0 or ca_cal.FLUID is None:
                calv1 = models.RwCaLevel1(id= rwassessment,release_phase= ca_cal.GET_RELEASE_PHASE(),fact_di= ca_cal.fact_di(),
                                   fact_mit=ca_cal.fact_mit(), fact_ait=ca_cal.fact_ait(),fc_total= 100000000,fcof_category="E" )
            else:
                calv1 = models.RwCaLevel1(id= rwassessment, release_phase= ca_cal.GET_RELEASE_PHASE(), fact_di= ca_cal.fact_di(), ca_inj_flame= ca_cal.ca_inj_flame(),
                                   ca_inj_toxic= ca_cal.ca_inj_tox(), ca_inj_ntnf= ca_cal.ca_inj_nfnt(),
                                   fact_mit= ca_cal.fact_mit(), fact_ait= ca_cal.fact_ait(), ca_cmd= ca_cal.ca_cmd(), fc_cmd= ca_cal.fc_cmd(),
                                   fc_affa= ca_cal.fc_affa(), fc_envi= ca_cal.fc_environ(), fc_prod= ca_cal.fc_prod(), fc_inj= ca_cal.fc_inj(),
                                   fc_total= ca_cal.fc(), fcof_category= ca_cal.FC_Category(ca_cal.fc()))

            calv1.save()
            # damage machinsm
            damageList = dm_cal.ISDF()
            for damage in damageList:
                damageMachinsm = models.RwDamageMechanism(id_dm=rwassessment, dmitemid_id= damage['DM_ITEM_ID'],
                                                   isactive=damage['isActive'],
                                                   df1=damage['DF1'], df2=damage['DF2'], df3=damage['DF3'],
                                                   highestinspectioneffectiveness=damage['highestEFF'],
                                                   secondinspectioneffectiveness=damage['secondEFF'],
                                                   numberofinspections=damage['numberINSP'],
                                                   lastinspdate=damage['lastINSP'].date().strftime('%Y-%m-%d'),
                                                   inspduedate= dm_cal.INSP_DUE_DATE(calv1.fc_total, gffTotal, datafaci.managementfactor, target.risktarget_fc).date().strftime('%Y-%m-%d'))
                damageMachinsm.save()
            refullfc = models.RwFullFcof(id=rwassessment,fcofvalue= calv1.fc_total, fcofcategory= calv1.fcof_category, envcost= data['EnvironmentCost'],
                                  equipcost= data['EquipmentCost'], prodcost= data['ProductionCost'], popdens= data['PersonDensity'], injcost= data['InjureCost'])
            refullfc.save()
            # data for chart
            riskList = dm_cal.DF_LIST_16(calv1.fc_total,gffTotal,datafaci.managementfactor, target.risktarget_fc)
            chart = models.RwDataChart(id=rwassessment, riskage1=riskList[1], riskage2=riskList[2], riskage3=riskList[3],
                                       riskage4=riskList[4], riskage5=riskList[5], riskage6=riskList[6], riskage7= riskList[7],
                                       riskage8= riskList[8], riskage9=riskList[9], riskage10= riskList[10], riskage11= riskList[11],
                                       riskage12= riskList[12], riskage13= riskList[13], riskage14= riskList[14],
                                       riskage15=riskList[15], risktarget= riskList[0])
            chart.save()
            return redirect('damgeFactor', proposalID= rwassessment.id)
    except Exception as e:
        raise Http404
    return render(request, 'FacilityUI/proposal/proposalNormalNew.html',{'api':Fluid, 'componentID':componentID, 'equipmentID':comp.equipmentid_id})
def NewTank(request, componentID):
    try:
        comp = models.ComponentMaster.objects.get(componentid= componentID)
        eq = models.EquipmentMaster.objects.get(equipmentid= comp.equipmentid_id)
        target = models.FacilityRiskTarget.objects.get(facilityid= eq.facilityid_id)
        datafaci = models.Facility.objects.get(facilityid= eq.facilityid_id)
        data={}
        isshell = False
        if comp.componenttypeid_id == 8 or comp.componenttypeid_id == 38:
            isshell = True
        if request.method =='POST':
            # Data Assessment
            data['assessmentName'] = request.POST.get('AssessmentName')
            data['assessmentdate'] = request.POST.get('assessmentdate')
            data['riskperiod'] = request.POST.get('RiskAnalysisPeriod')
            data['apicomponenttypeid'] = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).apicomponenttypename
            data['equipmenttype'] = models.EquipmentType.objects.get(equipmenttypeid= eq.equipmenttypeid_id).equipmenttypename
            # Data Equipment Properties
            if request.POST.get('Admin'):
                adminControlUpset = 1
            else:
                adminControlUpset = 0

            if request.POST.get('CylicOper'):
                cylicOp = 1
            else:
                cylicOp = 0

            if request.POST.get('Highly'):
                highlyDeadleg = 1
            else:
                highlyDeadleg = 0

            if request.POST.get('Steamed'):
                steamOutWater = 1
            else:
                steamOutWater = 0

            if request.POST.get('Downtime'):
                downtimeProtect = 1
            else:
                downtimeProtect = 0

            if request.POST.get('PWHT'):
                pwht = 1
            else:
                pwht = 0

            if request.POST.get('HeatTraced'):
                heatTrace = 1
            else:
                heatTrace = 0

            data['distance'] = request.POST.get('Distance')

            if request.POST.get('InterfaceSoilWater'):
                interfaceSoilWater = 1
            else:
                interfaceSoilWater = 0

            data['soiltype'] = request.POST.get('typeofSoil')

            if request.POST.get('PressurisationControlled'):
                pressureControl = 1
            else:
                pressureControl = 0

            data['minRequireTemp'] = request.POST.get('MinReq')

            if request.POST.get('lowestTemp'):
                lowestTemp = 1
            else:
                lowestTemp = 0

            if request.POST.get('MFTF'):
                materialChlorineExt = 1
            else:
                materialChlorineExt = 0

            if request.POST.get('LOM'):
                linerOnlineMonitor = 1
            else:
                linerOnlineMonitor = 0

            if request.POST.get('PresenceofSulphides'):
                presenceSulphideOP = 1
            else:
                presenceSulphideOP = 0

            if request.POST.get('PresenceofSulphidesShutdow'):
                presenceSulphideShut = 1
            else:
                presenceSulphideShut = 0

            if request.POST.get('ComponentWelded'):
                componentWelded = 1
            else:
                componentWelded = 0

            if request.POST.get('TMA'):
                tankIsMaintain = 1
            else:
                tankIsMaintain = 0

            data['adjustSettlement'] = request.POST.get('AdjForSettlement')
            data['extEnvironment'] = request.POST.get('ExternalEnvironment')
            data['EnvSensitivity'] = request.POST.get('EnvironmentSensitivity')
            data['themalHistory'] = request.POST.get('ThermalHistory')
            data['onlineMonitor'] = request.POST.get('OnlineMonitoring')
            data['equipmentVolumn'] = request.POST.get('EquipmentVolume')
            # Component Properties
            data['tankDiameter'] = request.POST.get('TankDiameter')
            data['NominalThickness'] = request.POST.get('NominalThickness')
            data['currentThick'] = request.POST.get('CurrentThickness')
            data['minRequireThick'] = request.POST.get('MinReqThick')
            data['currentCorrosion'] = request.POST.get('CurrentCorrosionRate')
            data['shellHieght'] = request.POST.get('shellHeight')

            if request.POST.get('DFDI'):
                damageFound = 1
            else:
                damageFound = 0

            if request.POST.get('PresenceCracks'):
                crackPresence = 1
            else:
                crackPresence = 0

            if request.POST.get('TrampElements'):
                trampElements = 1
            else:
                trampElements = 0

            if request.POST.get('ReleasePreventionBarrier'):
                preventBarrier = 1
            else:
                preventBarrier = 0

            if request.POST.get('ConcreteFoundation'):
                concreteFoundation = 1
            else:
                concreteFoundation = 0

            data['maxBrinnelHardness'] = request.POST.get('MBHW')
            data['complexProtrusion'] = request.POST.get('ComplexityProtrusions')
            data['severityVibration'] = request.POST.get('SeverityVibration')

            # Operating condition
            data['maxOT'] = request.POST.get('MaxOT')
            data['maxOP'] = request.POST.get('MaxOP')
            data['minOT'] = request.POST.get('MinOT')
            data['minOP'] = request.POST.get('MinOP')
            data['H2Spressure'] = request.POST.get('OHPP')
            data['criticalTemp'] = request.POST.get('CET')
            data['OP1'] = request.POST.get('Operating1')
            data['OP2'] = request.POST.get('Operating2')
            data['OP3'] = request.POST.get('Operating3')
            data['OP4'] = request.POST.get('Operating4')
            data['OP5'] = request.POST.get('Operating5')
            data['OP6'] = request.POST.get('Operating6')
            data['OP7'] = request.POST.get('Operating7')
            data['OP8'] = request.POST.get('Operating8')
            data['OP9'] = request.POST.get('Operating9')
            data['OP10'] = request.POST.get('Operating10')

            # Material
            data['materialName'] = request.POST.get('materialname')
            data['maxDesignTemp'] = request.POST.get('MaxDesignTemp')
            data['minDesignTemp'] = request.POST.get('MinDesignTemp')
            data['designPressure'] = request.POST.get('DesignPressure')
            data['refTemp'] = request.POST.get('ReferenceTemperature')
            data['allowStress'] = request.POST.get('ASAT')
            data['brittleThick'] = request.POST.get('BFGT')
            data['corrosionAllow'] = request.POST.get('CorrosionAllowance')

            if request.POST.get('CoLAS'):
                carbonLowAlloySteel = 1
            else:
                carbonLowAlloySteel = 0

            if request.POST.get('AusteniticSteel'):
                austeniticSteel = 1
            else:
                austeniticSteel = 0

            if request.POST.get('NickelAlloy'):
                nickelAlloy = 1
            else:
                nickelAlloy = 0

            if request.POST.get('Chromium'):
                chromium = 1
            else:
                chromium = 0

            data['sulfurContent'] = request.POST.get('SulfurContent')
            data['heatTreatment'] = request.POST.get('heatTreatment')

            if request.POST.get('MGTEPTA'):
                materialPTA = 1
            else:
                materialPTA = 0

            data['PTAMaterialGrade'] = request.POST.get('PTAMaterialGrade')
            data['materialCostFactor'] = request.POST.get('MaterialCostFactor')
            data['productionCost'] = request.POST.get('ProductionCost')

            # Coating, Cladding
            if request.POST.get('InternalCoating'):
                internalCoating = 1
            else:
                internalCoating = 0

            if request.POST.get('ExternalCoating'):
                externalCoating = 1
            else:
                externalCoating = 0

            data['externalInstallDate'] = request.POST.get('ExternalCoatingID')
            data['externalCoatQuality'] = request.POST.get('ExternalCoatingQuality')

            if request.POST.get('SCWD'):
                supportCoatingMaintain = 1
            else:
                supportCoatingMaintain = 0

            if request.POST.get('InternalCladding'):
                internalCladding = 1
            else:
                internalCladding = 0

            data['cladCorrosion'] = request.POST.get('CladdingCorrosionRate')

            if request.POST.get('InternalLining'):
                internalLinning = 1
            else:
                internalLinning = 0

            data['internalLinnerType'] = request.POST.get('InternalLinerType')
            data['internalLinnerCondition'] = request.POST.get('InternalLinerCondition')

            if request.POST.get('ExternalInsulation'):
                extInsulation = 1
            else:
                extInsulation = 0

            if request.POST.get('ICC'):
                InsulationContainChloride = 1
            else:
                InsulationContainChloride = 0

            data['extInsulationType'] = request.POST.get('ExternalInsulationType')
            data['insulationCondition'] = request.POST.get('InsulationCondition')

            # Stream
            data['fluid'] = request.POST.get('Fluid')
            data['fluidHeight'] = request.POST.get('FluidHeight')
            data['fluidLeaveDike'] = request.POST.get('PFLD')
            data['fluidOnsite'] = request.POST.get('PFLDRS')
            data['fluidOffsite'] = request.POST.get('PFLDGoffsite')
            data['naohConcent'] = request.POST.get('NaOHConcentration')
            data['releasePercentToxic'] = request.POST.get('RFPT')
            data['chlorideIon'] = request.POST.get('ChlorideIon')
            data['co3'] = request.POST.get('CO3')
            data['h2sContent'] = request.POST.get('H2SContent')
            data['PHWater'] = request.POST.get('PHWater')

            if request.POST.get('EAGTA'):
                exposedAmine = 1
            else:
                exposedAmine = 0

            data['amineSolution'] = request.POST.get('AmineSolution')
            data['exposureAmine'] = request.POST.get('ExposureAmine')

            if request.POST.get('APDO'):
                aqueosOP = 1
            else:
                aqueosOP = 0

            if request.POST.get('EnvironmentCH2S'):
                environtH2S = 1
            else:
                environtH2S = 0

            if request.POST.get('APDSD'):
                aqueosShut = 1
            else:
                aqueosShut = 0

            if request.POST.get('PresenceCyanides'):
                cyanidesPresence = 1
            else:
                cyanidesPresence = 0

            if request.POST.get('presenceHF'):
                presentHF = 1
            else:
                presentHF = 0

            if request.POST.get('ECCAC'):
                environtCaustic = 1
            else:
                environtCaustic = 0

            if request.POST.get('PCH'):
                processContainHydro = 1
            else:
                processContainHydro = 0

            if request.POST.get('MEFMSCC'):
                materialChlorineIntern = 1
            else:
                materialChlorineIntern = 0

            if request.POST.get('ESBC'):
                exposedSulfur = 1
            else:
                exposedSulfur = 0

            if str(data['fluid']) == "Gasoline":
                apiFluid = "C6-C8"
            elif str(data['fluid']) == "Light Diesel Oil":
                apiFluid = "C9-C12"
            elif str(data['fluid']) == "Heavy Diesel Oil":
                apiFluid = "C13-C16"
            elif str(data['fluid']) == "Fuel Oil" or str(data['fluid']) == "Crude Oil":
                apiFluid = "C17-C25"
            else:
                apiFluid = "C25+"
            rwassessment = models.RwAssessment(equipmentid_id=comp.equipmentid_id, componentid_id=comp.componentid, assessmentdate=data['assessmentdate'],
                                        riskanalysisperiod=data['riskperiod'],
                                        isequipmentlinked=comp.isequipmentlinked, proposalname=data['assessmentName'])
            rwassessment.save()
            rwequipment = models.RwEquipment(id=rwassessment, commissiondate= eq.commissiondate,
                                      adminupsetmanagement=adminControlUpset,
                                      cyclicoperation=cylicOp, highlydeadleginsp=highlyDeadleg,
                                      downtimeprotectionused=downtimeProtect, steamoutwaterflush=steamOutWater,
                                      pwht=pwht, heattraced=heatTrace, distancetogroundwater=data['distance'],
                                      interfacesoilwater=interfaceSoilWater, typeofsoil=data['soiltype'],
                                      pressurisationcontrolled=pressureControl,
                                      minreqtemperaturepressurisation=data['minRequireTemp'], yearlowestexptemp=lowestTemp,
                                      materialexposedtoclext=materialChlorineExt, lineronlinemonitoring=linerOnlineMonitor,
                                      presencesulphideso2=presenceSulphideOP,
                                      presencesulphideso2shutdown=presenceSulphideShut,
                                      componentiswelded=componentWelded, tankismaintained=tankIsMaintain,
                                      adjustmentsettle=data['adjustSettlement'],
                                      externalenvironment=data['extEnvironment'],
                                      environmentsensitivity=data['EnvSensitivity'],
                                      onlinemonitoring=data['onlineMonitor'], thermalhistory=data['themalHistory'],
                                      managementfactor=datafaci.managementfactor,
                                      volume=data['equipmentVolumn'])
            rwequipment.save()
            rwcomponent = models.RwComponent(id=rwassessment, nominaldiameter=data['tankDiameter'],
                                      nominalthickness=data['NominalThickness'], currentthickness=data['currentThick'],
                                      minreqthickness=data['minRequireThick'],
                                      currentcorrosionrate=data['currentCorrosion'],
                                      shellheight=data['shellHieght'], damagefoundinspection=damageFound,
                                      crackspresent=crackPresence, trampelements=trampElements,
                                      releasepreventionbarrier=preventBarrier, concretefoundation=concreteFoundation,
                                      brinnelhardness=data['maxBrinnelHardness'],
                                      complexityprotrusion=data['complexProtrusion'],
                                      severityofvibration=data['severityVibration'])
            rwcomponent.save()
            rwstream = models.RwStream(id=rwassessment, maxoperatingtemperature=data['maxOT'], maxoperatingpressure=data['maxOP'],
                                minoperatingtemperature=data['minOT'], minoperatingpressure=data['minOP'],
                                h2spartialpressure=data['H2Spressure'], criticalexposuretemperature=data['criticalTemp'],
                                tankfluidname=data['fluid'], fluidheight=data['fluidHeight'],
                                fluidleavedikepercent=data['fluidLeaveDike'],
                                fluidleavedikeremainonsitepercent=data['fluidOnsite'],
                                fluidgooffsitepercent=data['fluidOffsite'],
                                naohconcentration=data['naohConcent'], releasefluidpercenttoxic=data['releasePercentToxic'],
                                chloride=data['chlorideIon'], co3concentration=data['co3'], h2sinwater=data['h2sContent'],
                                waterph=data['PHWater'], exposedtogasamine=exposedAmine,
                                aminesolution=data['amineSolution'],
                                exposuretoamine=data['exposureAmine'], aqueousoperation=aqueosOP, h2s=environtH2S,
                                aqueousshutdown=aqueosShut, cyanide=cyanidesPresence, hydrofluoric=presentHF,
                                caustic=environtCaustic, hydrogen=processContainHydro,
                                materialexposedtoclint=materialChlorineIntern,
                                exposedtosulphur=exposedSulfur)
            rwstream.save()
            rwexcor = models.RwExtcorTemperature(id=rwassessment, minus12tominus8=data['OP1'], minus8toplus6=data['OP2'],
                                          plus6toplus32=data['OP3'], plus32toplus71=data['OP4'],
                                          plus71toplus107=data['OP5'],
                                          plus107toplus121=data['OP6'], plus121toplus135=data['OP7'],
                                          plus135toplus162=data['OP8'], plus162toplus176=data['OP9'],
                                          morethanplus176=data['OP10'])
            rwexcor.save()
            rwcoat = models.RwCoating(id=rwassessment, internalcoating=internalCoating, externalcoating=externalCoating,
                               externalcoatingdate=data['externalInstallDate'],
                               externalcoatingquality=data['externalCoatQuality'],
                               supportconfignotallowcoatingmaint=supportCoatingMaintain, internalcladding=internalCladding,
                               claddingcorrosionrate=data['cladCorrosion'], internallining=internalLinning,
                               internallinertype=data['internalLinnerType'],
                               internallinercondition=data['internalLinnerCondition'], externalinsulation=extInsulation,
                               insulationcontainschloride=InsulationContainChloride,
                               externalinsulationtype=data['extInsulationType'],
                               insulationcondition=data['insulationCondition']
                               )
            rwcoat.save()
            rwmaterial = models.RwMaterial(id=rwassessment, materialname=data['materialName'],
                                    designtemperature=data['maxDesignTemp'],
                                    mindesigntemperature=data['minDesignTemp'], designpressure=data['designPressure'],
                                    referencetemperature=data['refTemp'],
                                    allowablestress=data['allowStress'], brittlefracturethickness=data['brittleThick'],
                                    corrosionallowance=data['corrosionAllow'],
                                    carbonlowalloy=carbonLowAlloySteel, austenitic=austeniticSteel, nickelbased=nickelAlloy,
                                    chromemoreequal12=chromium,
                                    sulfurcontent=data['sulfurContent'], heattreatment=data['heatTreatment'],
                                    ispta=materialPTA, ptamaterialcode=data['PTAMaterialGrade'],
                                    costfactor=data['materialCostFactor'])
            rwmaterial.save()
            rwinputca = models.RwInputCaTank(id=rwassessment, fluid_height=data['fluidHeight'],
                                      shell_course_height=data['shellHieght'],
                                      tank_diametter=data['tankDiameter'], prevention_barrier=preventBarrier,
                                      environ_sensitivity=data['EnvSensitivity'],
                                      p_lvdike=data['fluidLeaveDike'], p_offsite=data['fluidOffsite'],
                                      p_onsite=data['fluidOnsite'], soil_type=data['soiltype'],
                                      tank_fluid=data['fluid'], api_fluid=apiFluid, sw=data['distance'],
                                      productioncost=data['productionCost'])
            rwinputca.save()
            if data['externalInstallDate'] is None:
                dm_cal = DM_CAL.DM_CAL(APIComponentType=data['apicomponenttypeid'],
                                Diametter=float(data['tankDiameter']), NomalThick=float(data['NominalThickness']),
                                CurrentThick=float(rwcomponent.currentthickness),
                                MinThickReq=float(rwcomponent.minreqthickness),
                                CorrosionRate=float(rwcomponent.currentcorrosionrate),
                                CA=float(rwmaterial.corrosionallowance),
                                ProtectedBarrier=bool(rwcomponent.releasepreventionbarrier),
                                CladdingCorrosionRate=float(rwcoat.claddingcorrosionrate),
                                InternalCladding=bool(rwcoat.internalcladding), NoINSP_THINNING=1,
                                EFF_THIN="B", OnlineMonitoring=rwequipment.onlinemonitoring,
                                HighlyEffectDeadleg=bool(rwequipment.highlydeadleginsp),
                                ContainsDeadlegs=bool(rwequipment.containsdeadlegs),
                                TankMaintain653=bool(rwequipment.tankismaintained),
                                AdjustmentSettle=rwequipment.adjustmentsettle,
                                ComponentIsWeld=bool(rwequipment.componentiswelded),
                                LinningType=data['internalLinnerType'],
                                LINNER_ONLINE=bool(rwequipment.lineronlinemonitoring),
                                LINNER_CONDITION=data['internalLinnerCondition'],
                                INTERNAL_LINNING=bool(rwcoat.internallining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['naohConcent']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOutWater),
                                AMINE_EXPOSED=bool(exposedAmine),
                                AMINE_SOLUTION=data['amineSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(environtH2S), AQUEOUS_OPERATOR=bool(aqueosOP),
                                AQUEOUS_SHUTDOWN=bool(aqueosShut), H2SContent=float(data['h2sContent']),
                                PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(cyanidesPresence), BRINNEL_HARDNESS=data['maxBrinnelHardness'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['co3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presenceSulphideOP),
                                ExposedSH2OShutdown=bool(presenceSulphideShut), ThermalHistory=data['themalHistory'],
                                PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtimeProtect),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineIntern),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineExt),
                                CHLORIDE_ION_CONTENT=float(data['chlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                SUPPORT_COATING=bool(supportCoatingMaintain),
                                INSULATION_TYPE=data['extInsulationType'], CUI_PERCENT_1=float(data['OP1']),
                                CUI_PERCENT_2=float(data['OP2']),
                                CUI_PERCENT_3=float(data['OP3']), CUI_PERCENT_4=float(data['OP4']),
                                CUI_PERCENT_5=float(data['OP5']),
                                CUI_PERCENT_6=float(data['OP6']), CUI_PERCENT_7=float(data['OP7']),
                                CUI_PERCENT_8=float(data['OP8']),
                                CUI_PERCENT_9=float(data['OP9']), CUI_PERCENT_10=float(data['OP10']),
                                EXTERNAL_INSULATION=bool(extInsulation),
                                COMPONENT_INSTALL_DATE=eq.commissiondate,
                                CRACK_PRESENT=bool(crackPresence),
                                EXTERNAL_EVIRONMENT=data['extEnvironment'],
                                EXTERN_COAT_QUALITY=data['externalCoatQuality'],
                                PIPING_COMPLEXITY=data['complexProtrusion'],
                                INSULATION_CONDITION=data['insulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationContainChloride),
                                MATERIAL_SUSCEP_HTHA=False, HTHA_MATERIAL="",
                                HTHA_PRESSURE=float(data['H2Spressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageFound),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=False, PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['brittleThick']), CARBON_ALLOY=bool(carbonLowAlloySteel),
                                DELTA_FATT=0,
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['refTemp']),
                                AUSTENITIC_STEEL=bool(austeniticSteel), PERCENT_SIGMA=0,
                                EquipmentType= data['equipmenttype'], PREVIOUS_FAIL="",
                                AMOUNT_SHAKING="", TIME_SHAKING="",
                                CYLIC_LOAD="",
                                CORRECT_ACTION="", NUM_PIPE="",
                                PIPE_CONDITION="", JOINT_TYPE="",
                                BRANCH_DIAMETER="")
            else:
                dm_cal = DM_CAL.DM_CAL(APIComponentType=data['apicomponenttypeid'],
                                Diametter=float(data['tankDiameter']), NomalThick=float(data['NominalThickness']),
                                CurrentThick=float(rwcomponent.currentthickness),
                                MinThickReq=float(rwcomponent.minreqthickness),
                                CorrosionRate=float(rwcomponent.currentcorrosionrate),
                                CA=float(rwmaterial.corrosionallowance),
                                ProtectedBarrier=bool(rwcomponent.releasepreventionbarrier),
                                CladdingCorrosionRate=float(rwcoat.claddingcorrosionrate),
                                InternalCladding=bool(rwcoat.internalcladding), NoINSP_THINNING=1,
                                EFF_THIN="B", OnlineMonitoring=rwequipment.onlinemonitoring,
                                HighlyEffectDeadleg=bool(rwequipment.highlydeadleginsp),
                                ContainsDeadlegs=bool(rwequipment.containsdeadlegs),
                                TankMaintain653=bool(rwequipment.tankismaintained),
                                AdjustmentSettle=rwequipment.adjustmentsettle,
                                ComponentIsWeld=bool(rwequipment.componentiswelded),
                                LinningType=data['internalLinnerType'],
                                LINNER_ONLINE=bool(rwequipment.lineronlinemonitoring),
                                LINNER_CONDITION=data['internalLinnerCondition'],
                                INTERNAL_LINNING=bool(rwcoat.internallining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['naohConcent']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOutWater),
                                AMINE_EXPOSED=bool(exposedAmine),
                                AMINE_SOLUTION=data['amineSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(environtH2S), AQUEOUS_OPERATOR=bool(aqueosOP),
                                AQUEOUS_SHUTDOWN=bool(aqueosShut), H2SContent=float(data['h2sContent']),
                                PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(cyanidesPresence), BRINNEL_HARDNESS=data['maxBrinnelHardness'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['co3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presenceSulphideOP),
                                ExposedSH2OShutdown=bool(presenceSulphideShut), ThermalHistory=data['themalHistory'],
                                PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtimeProtect),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineIntern),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineExt),
                                CHLORIDE_ION_CONTENT=float(data['chlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                SUPPORT_COATING=bool(supportCoatingMaintain),
                                INSULATION_TYPE=data['extInsulationType'], CUI_PERCENT_1=float(data['OP1']),
                                CUI_PERCENT_2=float(data['OP2']),
                                CUI_PERCENT_3=float(data['OP3']), CUI_PERCENT_4=float(data['OP4']),
                                CUI_PERCENT_5=float(data['OP5']),
                                CUI_PERCENT_6=float(data['OP6']), CUI_PERCENT_7=float(data['OP7']),
                                CUI_PERCENT_8=float(data['OP8']),
                                CUI_PERCENT_9=float(data['OP9']), CUI_PERCENT_10=float(data['OP10']),
                                EXTERNAL_INSULATION=bool(extInsulation),
                                COMPONENT_INSTALL_DATE=datetime.strptime(str(data['externalInstallDate']), "%Y-%M-%d"),
                                CRACK_PRESENT=bool(crackPresence),
                                EXTERNAL_EVIRONMENT=data['extEnvironment'],
                                EXTERN_COAT_QUALITY=data['externalCoatQuality'],
                                PIPING_COMPLEXITY=data['complexProtrusion'],
                                INSULATION_CONDITION=data['insulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationContainChloride),
                                MATERIAL_SUSCEP_HTHA=False, HTHA_MATERIAL="",
                                HTHA_PRESSURE=float(data['H2Spressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageFound),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=False, PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['brittleThick']), CARBON_ALLOY=bool(carbonLowAlloySteel),
                                DELTA_FATT=0,
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['refTemp']),
                                AUSTENITIC_STEEL=bool(austeniticSteel), PERCENT_SIGMA=0,
                                EquipmentType= data['equipmenttype'], PREVIOUS_FAIL="",
                                AMOUNT_SHAKING="", TIME_SHAKING="",
                                CYLIC_LOAD="",
                                CORRECT_ACTION="", NUM_PIPE="",
                                PIPE_CONDITION="", JOINT_TYPE="",
                                BRANCH_DIAMETER="")
            if isshell:
                cacal = CA_CAL.CA_SHELL(FLUID=apiFluid, FLUID_HEIGHT=float(data['fluidHeight']),
                                 SHELL_COURSE_HEIGHT=float(data['shellHieght']),
                                 TANK_DIAMETER=float(data['tankDiameter']), EnvironSensitivity=data['EnvSensitivity'],
                                 P_lvdike=float(data['fluidLeaveDike']),
                                 P_onsite=float(data['fluidOnsite']), P_offsite=float(data['fluidOffsite']),
                                 MATERIAL_COST=float(data['materialCostFactor']),
                                 API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                                 PRODUCTION_COST=float(data['productionCost']))
                rwcatank = models.RwCaTank(id=rwassessment, flow_rate_d1=cacal.W_n_Tank(1), flow_rate_d2=cacal.W_n_Tank(2),
                                    flow_rate_d3=cacal.W_n_Tank(3),
                                    flow_rate_d4=cacal.W_n_Tank(4), leak_duration_d1=cacal.ld_tank(1),
                                    leak_duration_d2=cacal.ld_tank(2),
                                    leak_duration_d3=cacal.ld_tank(3), leak_duration_d4=cacal.ld_tank(4),
                                    release_volume_leak_d1=cacal.Bbl_leak_n(1),
                                    release_volume_leak_d2=cacal.Bbl_leak_n(2), release_volume_leak_d3=cacal.Bbl_leak_n(3),
                                    release_volume_leak_d4=cacal.Bbl_leak_n(4),
                                    release_volume_rupture=cacal.Bbl_rupture_release(), liquid_height=cacal.FLUID_HEIGHT,
                                    volume_fluid=cacal.Bbl_total_shell(),
                                    time_leak_ground=cacal.ld_tank(4), volume_subsoil_leak_d1=cacal.Bbl_leak_release(),
                                    volume_subsoil_leak_d4=cacal.Bbl_rupture_release(),
                                    volume_ground_water_leak_d1=cacal.Bbl_leak_water(),
                                    volume_ground_water_leak_d4=cacal.Bbl_rupture_water(),
                                    barrel_dike_leak=cacal.Bbl_leak_indike(),
                                    barrel_dike_rupture=cacal.Bbl_rupture_indike(),
                                    barrel_onsite_leak=cacal.Bbl_leak_ssonsite(),
                                    barrel_onsite_rupture=cacal.Bbl_rupture_ssonsite(),
                                    barrel_offsite_leak=cacal.Bbl_leak_ssoffsite(),
                                    barrel_offsite_rupture=cacal.Bbl_rupture_ssoffsite(),
                                    barrel_water_leak=cacal.Bbl_leak_water(),
                                    barrel_water_rupture=cacal.Bbl_rupture_water(), fc_environ_leak=cacal.FC_leak_environ(),
                                    fc_environ_rupture=cacal.FC_rupture_environ(),
                                    fc_environ=cacal.FC_environ_shell(), material_factor=float(data['materialCostFactor']),
                                    component_damage_cost=cacal.fc_cmd(),
                                    business_cost=cacal.FC_PROD_SHELL(), consequence=cacal.FC_total_shell(),
                                    consequencecategory=cacal.FC_Category(cacal.FC_total_shell()))
                rwcatank.save()
                FC_TOTAL = cacal.FC_total_shell()
                FC_CATEGORY = cacal.FC_Category(cacal.FC_total_shell())
            else:
                cacal = CA_CAL.CA_TANK_BOTTOM(Soil_type=data['soiltype'], TANK_FLUID=data['fluid'], Swg=float(data['distance']),
                                       TANK_DIAMETER=float(data['tankDiameter']),
                                       FLUID_HEIGHT=float(data['fluidHeight']),
                                       API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                                       PREVENTION_BARRIER=bool(preventBarrier), EnvironSensitivity=data['EnvSensitivity'],
                                       MATERIAL_COST=float(data['materialCostFactor']),
                                       PRODUCTION_COST=float(data['productionCost']),
                                       P_lvdike=float(data['fluidLeaveDike']), P_onsite=float(data['fluidOnsite']),
                                       P_offsite=float(data['fluidOffsite']))
                rwcatank = models.RwCaTank(id=rwassessment, hydraulic_water=cacal.k_h_water(), hydraulic_fluid=cacal.k_h_prod(),
                                    seepage_velocity=cacal.vel_s_prod(), flow_rate_d1=cacal.rate_n_tank_bottom(1),
                                    flow_rate_d4=cacal.rate_n_tank_bottom(4),
                                    leak_duration_d1=cacal.ld_n_tank_bottom(1), leak_duration_d4=cacal.ld_n_tank_bottom(4),
                                    release_volume_leak_d1=cacal.Bbl_leak_n_bottom(1),
                                    release_volume_leak_d4=cacal.Bbl_leak_n_bottom(4),
                                    release_volume_rupture=cacal.Bbl_rupture_release_bottom(),
                                    time_leak_ground=cacal.t_gl_bottom(), volume_subsoil_leak_d1=cacal.Bbl_leak_subsoil(1),
                                    volume_subsoil_leak_d4=cacal.Bbl_leak_subsoil(4),
                                    volume_ground_water_leak_d1=cacal.Bbl_leak_groundwater(1),
                                    volume_ground_water_leak_d4=cacal.Bbl_leak_groundwater(4),
                                    barrel_dike_rupture=cacal.Bbl_rupture_indike_bottom(),
                                    barrel_onsite_rupture=cacal.Bbl_rupture_ssonsite_bottom(),
                                    barrel_offsite_rupture=cacal.Bbl_rupture_ssoffsite_bottom(),
                                    barrel_water_rupture=cacal.Bbl_rupture_water_bottom(),
                                    fc_environ_leak=cacal.FC_leak_environ_bottom(),
                                    fc_environ_rupture=cacal.FC_rupture_environ_bottom(),
                                    fc_environ=cacal.FC_environ_bottom(), material_factor=float(data['materialCostFactor']),
                                    component_damage_cost=cacal.FC_cmd_bottom(), business_cost=cacal.FC_PROD_BOTTOM(),
                                    consequence=cacal.FC_total_bottom(),
                                    consequencecategory=cacal.FC_Category(cacal.FC_total_bottom()),
                                    liquid_height=cacal.FLUID_HEIGHT, volume_fluid=cacal.BBL_TOTAL_TANKBOTTOM())
                rwcatank.save()
                FC_TOTAL = cacal.FC_total_bottom()
                FC_CATEGORY = cacal.FC_Category(cacal.FC_total_bottom())
            TOTAL_DF_API1 = dm_cal.DF_TOTAL_API(0)
            TOTAL_DF_API2 = dm_cal.DF_TOTAL_API(3)
            TOTAL_DF_API3 = dm_cal.DF_TOTAL_API(6)
            gffTotal = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).gfftotal
            pofap1 = float(TOTAL_DF_API1) * float(datafaci.managementfactor) * float(gffTotal)
            pofap2 = float(TOTAL_DF_API2) * float(datafaci.managementfactor) * float(gffTotal)
            pofap3 = float(TOTAL_DF_API3) * float(datafaci.managementfactor) * float(gffTotal)
            # thinningtype = General or Local
            refullPOF = models.RwFullPof(id=rwassessment, thinningap1=dm_cal.DF_THINNING_TOTAL_API(0),
                                  thinningap2=dm_cal.DF_THINNING_TOTAL_API(3),
                                  thinningap3=dm_cal.DF_THINNING_TOTAL_API(6),
                                  sccap1=dm_cal.DF_SSC_TOTAL_API(0), sccap2=dm_cal.DF_SSC_TOTAL_API(3),
                                  sccap3=dm_cal.DF_SSC_TOTAL_API(6),
                                  externalap1=dm_cal.DF_EXT_TOTAL_API(0), externalap2=dm_cal.DF_EXT_TOTAL_API(3),
                                  externalap3=dm_cal.DF_EXT_TOTAL_API(6),
                                  brittleap1=dm_cal.DF_BRIT_TOTAL_API(), brittleap2=dm_cal.DF_BRIT_TOTAL_API(),
                                  brittleap3=dm_cal.DF_BRIT_TOTAL_API(),
                                  htha_ap1=dm_cal.DF_HTHA_API(0), htha_ap2=dm_cal.DF_HTHA_API(3),
                                  htha_ap3=dm_cal.DF_HTHA_API(6),
                                  fatigueap1=dm_cal.DF_PIPE_API(), fatigueap2=dm_cal.DF_PIPE_API(),
                                  fatigueap3=dm_cal.DF_PIPE_API(),
                                  fms=datafaci.managementfactor, thinningtype="Local",
                                  thinninglocalap1=max(dm_cal.DF_THINNING_TOTAL_API(0), dm_cal.DF_EXT_TOTAL_API(0)),
                                  thinninglocalap2=max(dm_cal.DF_THINNING_TOTAL_API(3), dm_cal.DF_EXT_TOTAL_API(3)),
                                  thinninglocalap3=max(dm_cal.DF_THINNING_TOTAL_API(6), dm_cal.DF_EXT_TOTAL_API(6)),
                                  thinninggeneralap1=dm_cal.DF_THINNING_TOTAL_API(0) + dm_cal.DF_EXT_TOTAL_API(0),
                                  thinninggeneralap2=dm_cal.DF_THINNING_TOTAL_API(3) + dm_cal.DF_EXT_TOTAL_API(3),
                                  thinninggeneralap3=dm_cal.DF_THINNING_TOTAL_API(6) + dm_cal.DF_EXT_TOTAL_API(6),
                                  totaldfap1=TOTAL_DF_API1, totaldfap2=TOTAL_DF_API2, totaldfap3=TOTAL_DF_API3,
                                  pofap1=pofap1, pofap2=pofap2, pofap3=pofap3, gfftotal=gffTotal,
                                  pofap1category=dm_cal.PoFCategory(TOTAL_DF_API1),
                                  pofap2category=dm_cal.PoFCategory(TOTAL_DF_API2),
                                  pofap3category=dm_cal.PoFCategory(TOTAL_DF_API3))
            refullPOF.save()
            # damage machinsm
            damageList = dm_cal.ISDF()
            for damage in damageList:
                damageMachinsm = models.RwDamageMechanism(id_dm=rwassessment, dmitemid_id=damage['DM_ITEM_ID'],
                                                   isactive=damage['isActive'],
                                                   df1=damage['DF1'], df2=damage['DF2'], df3=damage['DF3'],
                                                   highestinspectioneffectiveness=damage['highestEFF'],
                                                   secondinspectioneffectiveness=damage['secondEFF'],
                                                   numberofinspections=damage['numberINSP'],
                                                   lastinspdate=damage['lastINSP'].date().strftime('%Y-%m-%d'),
                                                   inspduedate=dm_cal.INSP_DUE_DATE(FC_TOTAL, gffTotal,
                                                                                    datafaci.managementfactor,
                                                                                    target.risktarget_fc).date().strftime(
                                                       '%Y-%m-%d'))
                damageMachinsm.save()
            refullfc = models.RwFullFcof(id=rwassessment, fcofvalue=FC_TOTAL, fcofcategory=FC_CATEGORY,
                                  prodcost=data['productionCost'])
            refullfc.save()
            # data for chart
            riskList = dm_cal.DF_LIST_16(refullfc.fcofvalue, gffTotal, datafaci.managementfactor, target.risktarget_fc)

            chart = models.RwDataChart(id=rwassessment, riskage1=riskList[1], riskage2=riskList[2], riskage3=riskList[3],
                                       riskage4=riskList[4], riskage5=riskList[5], riskage6=riskList[6],
                                       riskage7=riskList[7],
                                       riskage8=riskList[8], riskage9=riskList[9], riskage10=riskList[10],
                                       riskage11=riskList[11],
                                       riskage12=riskList[12], riskage13=riskList[13], riskage14=riskList[14],
                                       riskage15=riskList[15], risktarget=riskList[0])
            chart.save()
            return redirect('damgeFactor', proposalID=rwassessment.id)
    except Exception as e:
        # print(e)
        raise Http404
    return render(request, 'FacilityUI/proposal/proposalTankNew.html', {'isshell':isshell, 'componentID':componentID, 'equipmentID':comp.equipmentid_id})
def EditProposal(request, proposalID):
    try:
        Fluid = ["Acid", "AlCl3", "C1-C2", "C13-C16", "C17-C25", "C25+", "C3-C4", "C5", "C6-C8", "C9-C12", "CO", "DEE",
                 "EE", "EEA", "EG", "EO", "H2", "H2S", "HCl", "HF", "Methanol", "Nitric Acid", "NO2", "Phosgene", "PO",
                 "Pyrophoric", "Steam", "Styrene", "TDI", "Water"]
        rwassessment = models.RwAssessment.objects.get(id= proposalID)
        rwequipment = models.RwEquipment.objects.get(id= proposalID)
        rwcomponent = models.RwComponent.objects.get(id= proposalID)
        rwstream = models.RwStream.objects.get(id= proposalID)
        rwexcor = models.RwExtcorTemperature.objects.get(id= proposalID)
        rwcoat = models.RwCoating.objects.get(id= proposalID)
        rwmaterial = models.RwMaterial.objects.get(id= proposalID)
        rwinputca = models.RwInputCaLevel1.objects.get(id= proposalID)
        refullPOF = models.RwFullPof.objects.get(id= proposalID)
        calv1 = models.RwCaLevel1.objects.get(id= proposalID)
        damageMachinsm = models.RwDamageMechanism.objects.filter(id_dm= proposalID)
        refullfc = models.RwFullFcof.objects.get(id= proposalID)
        chart = models.RwDataChart.objects.get(id= proposalID)
        assDate = rwassessment.assessmentdate.strftime('%Y-%m-%d')
        try:
            extDate = rwcoat.externalcoatingdate.strftime('%Y-%m-%d')
        except:
            extDate = datetime.now().strftime('%Y-%m-%d')

        comp = models.ComponentMaster.objects.get(componentid=rwassessment.componentid_id)
        target = models.FacilityRiskTarget.objects.get(
            facilityid=models.EquipmentMaster.objects.get(equipmentid=comp.equipmentid_id).facilityid_id)
        datafaci = models.Facility.objects.get(
            facilityid=models.EquipmentMaster.objects.get(equipmentid=comp.equipmentid_id).facilityid_id)
        data = {}
        if request.method == 'POST':
            data['assessmentname'] = request.POST.get('AssessmentName')
            data['assessmentdate'] = request.POST.get('assessmentdate')
            data['apicomponenttypeid'] = models.ApiComponentType.objects.get(
                apicomponenttypeid=comp.apicomponenttypeid).apicomponenttypename
            data['equipmentType'] = models.EquipmentType.objects.get(equipmenttypeid=models.EquipmentMaster.objects.get(
                equipmentid=comp.equipmentid_id).equipmenttypeid_id).equipmenttypename
            data['riskperiod'] = request.POST.get('RiskAnalysisPeriod')
            if request.POST.get('adminControlUpset'):
                adminControlUpset = 1
            else:
                adminControlUpset = 0

            if request.POST.get('ContainsDeadlegs'):
                containsDeadlegs = 1
            else:
                containsDeadlegs = 0

            if request.POST.get('Highly'):
                HighlyEffe = 1
            else:
                HighlyEffe = 0

            if request.POST.get('CylicOper'):
                cylicOP = 1
            else:
                cylicOP = 0

            if request.POST.get('Downtime'):
                downtime = 1
            else:
                downtime = 0

            if request.POST.get('SteamedOut'):
                steamOut = 1
            else:
                steamOut = 0

            if request.POST.get('HeatTraced'):
                heatTrace = 1
            else:
                heatTrace = 0

            if request.POST.get('PWHT'):
                pwht = 1
            else:
                pwht = 0

            if request.POST.get('InterfaceSoilWater'):
                interfaceSoilWater = 1
            else:
                interfaceSoilWater = 0

            if request.POST.get('PressurisationControlled'):
                pressureControl = 1
            else:
                pressureControl = 0

            if request.POST.get('LOM'):
                linerOnlineMoniter = 1
            else:
                linerOnlineMoniter = 0

            if request.POST.get('EquOper'):
                lowestTemp = 1
            else:
                lowestTemp = 0

            if request.POST.get('PresenceofSulphidesShutdow'):
                presentSulphidesShutdown = 1
            else:
                presentSulphidesShutdown = 0

            if request.POST.get('MFTF'):
                materialExposed = 1
            else:
                materialExposed = 0

            if request.POST.get('PresenceofSulphides'):
                presentSulphide = 1
            else:
                presentSulphide = 0

            data['minTemp'] = request.POST.get('Min')
            data['ExternalEnvironment'] = request.POST.get('ExternalEnvironment')
            data['ThermalHistory'] = request.POST.get('ThermalHistory')
            data['OnlineMonitoring'] = request.POST.get('OnlineMonitoring')
            data['EquipmentVolumn'] = request.POST.get('EquipmentVolume')

            data['normaldiameter'] = request.POST.get('NominalDiameter')
            data['normalthick'] = request.POST.get('NominalThickness')
            data['currentthick'] = request.POST.get('CurrentThickness')
            data['tmin'] = request.POST.get('tmin')
            data['currentrate'] = request.POST.get('CurrentRate')
            data['deltafatt'] = request.POST.get('DeltaFATT')

            if request.POST.get('DFDI'):
                damageDuringInsp = 1
            else:
                damageDuringInsp = 0

            if request.POST.get('ChemicalInjection'):
                chemicalInj = 1
            else:
                chemicalInj = 0

            if request.POST.get('PresenceCracks'):
                crackpresent = 1
            else:
                crackpresent = 0

            if request.POST.get('HFICI'):
                HFICI = 1
            else:
                HFICI = 0

            if request.POST.get('TrampElements'):
                TrampElement = 1
            else:
                TrampElement = 0

            data['MaxBrinell'] = request.POST.get('MBHW')
            data['complex'] = request.POST.get('ComplexityProtrusions')
            data['CylicLoad'] = request.POST.get('CLC')
            data['branchDiameter'] = request.POST.get('BranchDiameter')
            data['joinTypeBranch'] = request.POST.get('JTB')
            data['numberPipe'] = request.POST.get('NFP')
            data['pipeCondition'] = request.POST.get('PipeCondition')
            data['prevFailure'] = request.POST.get('PreviousFailures')

            if request.POST.get('VASD'):
                visibleSharkingProtect = 1
            else:
                visibleSharkingProtect = 0

            data['shakingPipe'] = request.POST.get('ASP')
            data['timeShakingPipe'] = request.POST.get('ATSP')
            data['correctActionMitigate'] = request.POST.get('CAMV')
            # OP condition
            data['maxOT'] = request.POST.get('MaxOT')
            data['maxOP'] = request.POST.get('MaxOP')
            data['minOT'] = request.POST.get('MinOT')
            data['minOP'] = request.POST.get('MinOP')
            data['OpHydroPressure'] = request.POST.get('OHPP')
            data['criticalTemp'] = request.POST.get('CET')
            data['OP1'] = request.POST.get('Operating1')
            data['OP2'] = request.POST.get('Operating2')
            data['OP3'] = request.POST.get('Operating3')
            data['OP4'] = request.POST.get('Operating4')
            data['OP5'] = request.POST.get('Operating5')
            data['OP6'] = request.POST.get('Operating6')
            data['OP7'] = request.POST.get('Operating7')
            data['OP8'] = request.POST.get('Operating8')
            data['OP9'] = request.POST.get('Operating9')
            data['OP10'] = request.POST.get('Operating10')
            # material
            data['material'] = request.POST.get('Material')
            data['maxDesignTemp'] = request.POST.get('MaxDesignTemp')
            data['minDesignTemp'] = request.POST.get('MinDesignTemp')
            data['designPressure'] = request.POST.get('DesignPressure')
            data['tempRef'] = request.POST.get('ReferenceTemperature')
            data['allowStress'] = request.POST.get('ASAT')
            data['BrittleFacture'] = request.POST.get('BFGT')
            data['CA'] = request.POST.get('CorrosionAllowance')
            data['sigmaPhase'] = request.POST.get('SigmaPhase')
            if request.POST.get('CoLAS'):
                cacbonAlloy = 1
            else:
                cacbonAlloy = 0

            if request.POST.get('AusteniticSteel'):
                austeniticStell = 1
            else:
                austeniticStell = 0

            if request.POST.get('SusceptibleTemper'):
                suscepTemp = 1
            else:
                suscepTemp = 0

            if request.POST.get('NickelAlloy'):
                nickelAlloy = 1
            else:
                nickelAlloy = 0

            if request.POST.get('Chromium'):
                chromium = 1
            else:
                chromium = 0

            data['sulfurContent'] = request.POST.get('SulfurContent')
            data['heatTreatment'] = request.POST.get('heatTreatment')

            if request.POST.get('MGTEHTHA'):
                materialHTHA = 1
            else:
                materialHTHA = 0

            data['HTHAMaterialGrade'] = request.POST.get('HTHAMaterialGrade')

            if request.POST.get('MaterialPTA'):
                materialPTA = 1
            else:
                materialPTA = 0

            data['PTAMaterialGrade'] = request.POST.get('PTAMaterialGrade')
            data['materialCostFactor'] = request.POST.get('MaterialCostFactor')
            # Coating, Clading
            if request.POST.get('InternalCoating'):
                InternalCoating = 1
            else:
                InternalCoating = 0

            if request.POST.get('ExternalCoating'):
                ExternalCoating = 1
            else:
                ExternalCoating = 0

            data['ExternalCoatingID'] = request.POST.get('ExternalCoatingID')
            data['ExternalCoatingQuality'] = request.POST.get('ExternalCoatingQuality')

            if request.POST.get('SCWD'):
                supportMaterial = 1
            else:
                supportMaterial = 0

            if request.POST.get('InternalCladding'):
                InternalCladding = 1
            else:
                InternalCladding = 0

            data['CladdingCorrosionRate'] = request.POST.get('CladdingCorrosionRate')

            if request.POST.get('InternalLining'):
                InternalLining = 1
            else:
                InternalLining = 0

            data['InternalLinerType'] = request.POST.get('InternalLinerType')
            data['InternalLinerCondition'] = request.POST.get('InternalLinerCondition')

            if request.POST.get('ExternalInsulation') == "on" or request.POST.get('ExternalInsulation') == 1:
                ExternalInsulation = 1
            else:
                ExternalInsulation = 0

            if request.POST.get('ICC'):
                InsulationCholride = 1
            else:
                InsulationCholride = 0

            data['ExternalInsulationType'] = request.POST.get('ExternalInsulationType')
            data['InsulationCondition'] = request.POST.get('InsulationCondition')
            # Steam
            data['NaOHConcentration'] = request.POST.get('NaOHConcentration')
            data['ReleasePercentToxic'] = request.POST.get('RFPT')
            data['ChlorideIon'] = request.POST.get('ChlorideIon')
            data['CO3'] = request.POST.get('CO3')
            data['H2SContent'] = request.POST.get('H2SContent')
            data['PHWater'] = request.POST.get('PHWater')

            if request.POST.get('EAGTA'):
                exposureAcid = 1
            else:
                exposureAcid = 0

            if request.POST.get('ToxicConstituents'):
                ToxicConstituents = 1
            else:
                ToxicConstituents = 0

            data['ExposureAmine'] = request.POST.get('ExposureAmine')
            data['AminSolution'] = request.POST.get('ASC')

            if request.POST.get('APDO'):
                aquaDuringOP = 1
            else:
                aquaDuringOP = 0

            if request.POST.get('APDSD'):
                aquaDuringShutdown = 1
            else:
                aquaDuringShutdown = 0

            if request.POST.get('EnvironmentCH2S'):
                EnvironmentCH2S = 1
            else:
                EnvironmentCH2S = 0

            if request.POST.get('PHA'):
                presentHF = 1
            else:
                presentHF = 0

            if request.POST.get('PresenceCyanides'):
                presentCyanide = 1
            else:
                presentCyanide = 0

            if request.POST.get('PCH'):
                processHydrogen = 1
            else:
                processHydrogen = 0

            if request.POST.get('ECCAC'):
                environCaustic = 1
            else:
                environCaustic = 0

            if request.POST.get('ESBC'):
                exposedSulfur = 1
            else:
                exposedSulfur = 0

            if request.POST.get('MEFMSCC'):
                materialExposedFluid = 1
            else:
                materialExposedFluid = 0
            # CA
            data['APIFluid'] = request.POST.get('APIFluid')
            data['MassInventory'] = request.POST.get('MassInventory')
            data['Systerm'] = request.POST.get('Systerm')
            data['MassComponent'] = request.POST.get('MassComponent')
            data['EquipmentCost'] = request.POST.get('EquipmentCost')
            data['MittigationSysterm'] = request.POST.get('MittigationSysterm')
            data['ProductionCost'] = request.POST.get('ProductionCost')
            data['ToxicPercent'] = request.POST.get('ToxicPercent')
            data['InjureCost'] = request.POST.get('InjureCost')
            data['ReleaseDuration'] = request.POST.get('ReleaseDuration')
            data['EnvironmentCost'] = request.POST.get('EnvironmentCost')
            data['PersonDensity'] = request.POST.get('PersonDensity')
            data['DetectionType'] = request.POST.get('DetectionType')
            data['IsulationType'] = request.POST.get('IsulationType')

            rwassessment.assessmentdate=data['assessmentdate']
            rwassessment.proposalname=data['assessmentname']
            rwassessment.save()

            rwequipment.adminupsetmanagement=adminControlUpset
            rwequipment.containsdeadlegs=containsDeadlegs
            rwequipment.cyclicoperation=cylicOP
            rwequipment.highlydeadleginsp=HighlyEffe
            rwequipment.downtimeprotectionused=downtime
            rwequipment.externalenvironment=data['ExternalEnvironment']
            rwequipment.heattraced=heatTrace
            rwequipment.interfacesoilwater=interfaceSoilWater
            rwequipment.lineronlinemonitoring=linerOnlineMoniter
            rwequipment.materialexposedtoclext=materialExposed
            rwequipment.minreqtemperaturepressurisation=data['minTemp']
            rwequipment.onlinemonitoring=data['OnlineMonitoring']
            rwequipment.presencesulphideso2=presentSulphide
            rwequipment.presencesulphideso2shutdown=presentSulphidesShutdown
            rwequipment.pressurisationcontrolled=pressureControl
            rwequipment.pwht=pwht
            rwequipment.steamoutwaterflush=steamOut
            rwequipment.thermalhistory=data['ThermalHistory']
            rwequipment.yearlowestexptemp=lowestTemp
            rwequipment.volume=data['EquipmentVolumn']
            rwequipment.save()

            rwcomponent.nominaldiameter=data['normaldiameter']
            rwcomponent.nominalthickness=data['normalthick']
            rwcomponent.currentthickness=data['currentthick']
            rwcomponent.minreqthickness=data['tmin']
            rwcomponent.currentcorrosionrate=data['currentrate']
            rwcomponent.branchdiameter=data['branchDiameter']
            rwcomponent.branchjointtype=data['joinTypeBranch']
            rwcomponent.brinnelhardness=data['MaxBrinell']
            rwcomponent.deltafatt=data['deltafatt']
            rwcomponent.chemicalinjection=chemicalInj
            rwcomponent.highlyinjectioninsp=HFICI
            rwcomponent.complexityprotrusion=data['complex']
            rwcomponent.correctiveaction=data['correctActionMitigate']
            rwcomponent.crackspresent=crackpresent
            rwcomponent.cyclicloadingwitin15_25m=data['CylicLoad']
            rwcomponent.damagefoundinspection=damageDuringInsp
            rwcomponent.numberpipefittings=data['numberPipe']
            rwcomponent.pipecondition=data['pipeCondition']
            rwcomponent.previousfailures=data['prevFailure']
            rwcomponent.shakingamount=data['shakingPipe']
            rwcomponent.shakingdetected=visibleSharkingProtect
            rwcomponent.shakingtime=data['timeShakingPipe']
            rwcomponent.trampelements=TrampElement
            rwcomponent.save()

            rwstream.aminesolution=data['AminSolution']
            rwstream.aqueousoperation=aquaDuringOP
            rwstream.aqueousshutdown=aquaDuringShutdown
            rwstream.toxicconstituent=ToxicConstituents
            rwstream.caustic=environCaustic
            rwstream.chloride=data['ChlorideIon']
            rwstream.co3concentration=data['CO3']
            rwstream.cyanide=presentCyanide
            rwstream.exposedtogasamine= exposureAcid
            rwstream.exposedtosulphur=exposedSulfur
            rwstream.exposuretoamine=data['ExposureAmine']
            rwstream.h2s=EnvironmentCH2S
            rwstream.h2sinwater=data['H2SContent']
            rwstreamhydrogen=processHydrogen
            rwstream.hydrofluoric=presentHF
            rwstream.materialexposedtoclint=materialExposedFluid
            rwstream.maxoperatingpressure=data['maxOP']
            rwstream.maxoperatingtemperature=float(data['maxOT'])
            rwstream.minoperatingpressure=float(data['minOP'])
            rwstream.minoperatingtemperature=data['minOT']
            rwstream.criticalexposuretemperature=data['criticalTemp']
            rwstream.naohconcentration=data['NaOHConcentration']
            rwstream.releasefluidpercenttoxic=float(data['ReleasePercentToxic'])
            rwstream.waterph=float(data['PHWater'])
            rwstream.h2spartialpressure=float(data['OpHydroPressure'])
            rwstream.save()

            rwexcor.minus12tominus8=data['OP1']
            rwexcor.minus8toplus6=data['OP2']
            rwexcor.plus6toplus32=data['OP3']
            rwexcor.plus32toplus71=data['OP4']
            rwexcor.plus71toplus107=data['OP5']
            rwexcor.plus107toplus121=data['OP6']
            rwexcor.plus121toplus135=data['OP7']
            rwexcor.plus135toplus162=data['OP8']
            rwexcor.plus162toplus176=data['OP9']
            rwexcor.morethanplus176=data['OP10']
            rwexcor.save()

            rwcoat.externalcoating=ExternalCoating
            rwcoat.externalinsulation=ExternalInsulation
            rwcoat.internalcladding=InternalCladding
            rwcoat.internalcoating=InternalCoating
            rwcoat.internallining=InternalLining
            rwcoat.externalcoatingdate=data['ExternalCoatingID']
            rwcoat.externalcoatingquality=data['ExternalCoatingQuality']
            rwcoat.externalinsulationtype=data['ExternalInsulationType']
            rwcoat.insulationcondition=data['InsulationCondition']
            rwcoat.insulationcontainschloride=InsulationCholride
            rwcoat.internallinercondition=data['InternalLinerCondition']
            rwcoat.internallinertype=data['InternalLinerType']
            rwcoat.claddingcorrosionrate=data['CladdingCorrosionRate']
            rwcoat.supportconfignotallowcoatingmaint=supportMaterial
            rwcoat.save()

            rwmaterial.corrosionallowance=data['CA']
            rwmaterial.materialname=data['material']
            rwmaterial.designpressure=data['designPressure']
            rwmaterial.designtemperature=data['maxDesignTemp']
            rwmaterial.mindesigntemperature=data['minDesignTemp']
            rwmaterial.brittlefracturethickness=data['BrittleFacture']
            rwmaterial.sigmaphase=data['sigmaPhase']
            rwmaterial.sulfurcontent=data['sulfurContent']
            rwmaterial.heattreatment=data['heatTreatment']
            rwmaterial.referencetemperature=data['tempRef']
            rwmaterial.ptamaterialcode=data['PTAMaterialGrade']
            rwmaterial.hthamaterialcode=data['HTHAMaterialGrade']
            rwmaterial.ispta=materialPTA
            rwmaterial.ishtha=materialHTHA
            rwmaterial.austenitic=austeniticStell
            rwmaterial.temper=suscepTemp
            rwmaterial.carbonlowalloy=cacbonAlloy
            rwmaterial.nickelbased=nickelAlloy
            rwmaterial.chromemoreequal12=chromium
            rwmaterial.allowablestress=data['allowStress']
            rwmaterial.costfactor=data['materialCostFactor']
            rwmaterial.save()

            rwinputca.api_fluid=data['APIFluid']
            rwinputca.system=data['Systerm']
            rwinputca.release_duration=data['ReleaseDuration']
            rwinputca.detection_type=data['DetectionType']
            rwinputca.isulation_type=data['IsulationType']
            rwinputca.mitigation_system=data['MittigationSysterm']
            rwinputca.equipment_cost=data['EnvironmentCost']
            rwinputca.injure_cost=data['InjureCost']
            rwinputca.evironment_cost=data['EnvironmentCost']
            rwinputca.toxic_percent=data['ToxicPercent']
            rwinputca.personal_density=data['PersonDensity']
            rwinputca.material_cost=data['materialCostFactor']
            rwinputca.production_cost=data['ProductionCost']
            rwinputca.mass_inventory=data['MassInventory']
            rwinputca.mass_component=data['MassComponent']
            rwinputca.stored_pressure=float(data['minOP']) * 6.895
            rwinputca.stored_temp=data['minOT']
            rwinputca.save()

            if data['ExternalCoatingID'] is None:
                dm_cal = DM_CAL.DM_CAL(ComponentNumber=str(comp.componentnumber),
                                       Commissiondate=models.EquipmentMaster.objects.get(
                                           equipmentid=comp.equipmentid_id).commissiondate,
                                       AssessmentDate=datetime.strptime(data['assessmentdate'], "%Y-%M-%d"),
                                       APIComponentType=str(data['apicomponenttypeid']),
                                       Diametter=float(data['normaldiameter']), NomalThick=float(data['normalthick']),
                                       CurrentThick=float(data['currentthick']), MinThickReq=float(data['tmin']),
                                       CorrosionRate=float(data['currentrate']), CA=float(data['CA']),
                                       ProtectedBarrier=False,
                                       CladdingCorrosionRate=float(data['CladdingCorrosionRate']),
                                       InternalCladding=bool(InternalCladding),
                                       OnlineMonitoring=data['OnlineMonitoring'], HighlyEffectDeadleg=bool(HighlyEffe),
                                       ContainsDeadlegs=bool(containsDeadlegs),
                                       TankMaintain653=False, AdjustmentSettle="", ComponentIsWeld=False,
                                       LinningType=data['InternalLinerType'], LINNER_ONLINE=bool(linerOnlineMoniter),
                                       LINNER_CONDITION=data['InternalLinerCondition'], YEAR_IN_SERVICE=0,
                                       INTERNAL_LINNING=bool(InternalLining),
                                       HEAT_TREATMENT=data['heatTreatment'],
                                       NaOHConcentration=float(data['NaOHConcentration']), HEAT_TRACE=bool(heatTrace),
                                       STEAM_OUT=bool(steamOut),
                                       AMINE_EXPOSED=bool(exposureAcid), AMINE_SOLUTION=data['AminSolution'],
                                       ENVIRONMENT_H2S_CONTENT=bool(EnvironmentCH2S),
                                       AQUEOUS_OPERATOR=bool(aquaDuringOP),
                                       AQUEOUS_SHUTDOWN=bool(aquaDuringShutdown),
                                       H2SContent=float(data['H2SContent']), PH=float(data['PHWater']),
                                       PRESENT_CYANIDE=bool(presentCyanide), BRINNEL_HARDNESS=data['MaxBrinell'],
                                       SULFUR_CONTENT=data['sulfurContent'],
                                       CO3_CONTENT=float(data['CO3']),
                                       PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                       EXPOSED_SULFUR=bool(exposedSulfur),
                                       ExposedSH2OOperation=bool(presentSulphide),
                                       ExposedSH2OShutdown=bool(presentSulphidesShutdown),
                                       ThermalHistory=data['ThermalHistory'], PTAMaterial=data['PTAMaterialGrade'],
                                       DOWNTIME_PROTECTED=bool(downtime),
                                       INTERNAL_EXPOSED_FLUID_MIST=bool(materialExposedFluid),
                                       EXTERNAL_EXPOSED_FLUID_MIST=bool(materialExposed),
                                       CHLORIDE_ION_CONTENT=float(data['ChlorideIon']),
                                       HF_PRESENT=bool(presentHF),
                                       INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                       SUPPORT_COATING=bool(supportMaterial),
                                       INSULATION_TYPE=data['ExternalInsulationType'],
                                       CUI_PERCENT_1=data['OP1'], CUI_PERCENT_2=data['OP2'],
                                       CUI_PERCENT_3=data['OP3'], CUI_PERCENT_4=data['OP4'], CUI_PERCENT_5=data['OP5'],
                                       CUI_PERCENT_6=data['OP6'], CUI_PERCENT_7=data['OP7'], CUI_PERCENT_8=data['OP8'],
                                       CUI_PERCENT_9=data['OP9'], CUI_PERCENT_10=data['OP10'],
                                       EXTERNAL_INSULATION=bool(ExternalInsulation),
                                       COMPONENT_INSTALL_DATE=models.EquipmentMaster.objects.get(
                                           equipmentid=comp.equipmentid_id).commissiondate,
                                       CRACK_PRESENT=bool(crackpresent),
                                       EXTERNAL_EVIRONMENT=data['ExternalEnvironment'],
                                       EXTERN_COAT_QUALITY=data['ExternalCoatingQuality'],
                                       PIPING_COMPLEXITY=data['complex'],
                                       INSULATION_CONDITION=data['InsulationCondition'],
                                       INSULATION_CHLORIDE=bool(InsulationCholride),
                                       MATERIAL_SUSCEP_HTHA=bool(materialHTHA), HTHA_MATERIAL=data['HTHAMaterialGrade'],
                                       HTHA_PRESSURE=float(data['OpHydroPressure']) * 0.006895,
                                       CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageDuringInsp),
                                       LOWEST_TEMP=bool(lowestTemp),
                                       TEMPER_SUSCEP=bool(suscepTemp), PWHT=bool(pwht),
                                       BRITTLE_THICK=float(data['BrittleFacture']), CARBON_ALLOY=bool(cacbonAlloy),
                                       DELTA_FATT=float(data['deltafatt']),
                                       MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                       MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                       REF_TEMP=float(data['tempRef']),
                                       AUSTENITIC_STEEL=bool(austeniticStell), PERCENT_SIGMA=float(data['sigmaPhase']),
                                       EquipmentType=data['equipmentType'], PREVIOUS_FAIL=data['prevFailure'],
                                       AMOUNT_SHAKING=data['shakingPipe'], TIME_SHAKING=data['timeShakingPipe'],
                                       CYLIC_LOAD=data['CylicLoad'],
                                       CORRECT_ACTION=data['correctActionMitigate'], NUM_PIPE=data['numberPipe'],
                                       PIPE_CONDITION=data['pipeCondition'], JOINT_TYPE=data['joinTypeBranch'],
                                       BRANCH_DIAMETER=data['branchDiameter'])
            else:
                dm_cal = DM_CAL.DM_CAL(ComponentNumber=str(comp.componentnumber),
                                       Commissiondate=models.EquipmentMaster.objects.get(
                                           equipmentid=comp.equipmentid_id).commissiondate,
                                       AssessmentDate=datetime.strptime(data['assessmentdate'], "%Y-%M-%d"),
                                       APIComponentType=str(data['apicomponenttypeid']),
                                       Diametter=float(data['normaldiameter']), NomalThick=float(data['normalthick']),
                                       CurrentThick=float(data['currentthick']), MinThickReq=float(data['tmin']),
                                       CorrosionRate=float(data['currentrate']), CA=float(data['CA']),
                                       ProtectedBarrier=False,
                                       CladdingCorrosionRate=float(data['CladdingCorrosionRate']),
                                       InternalCladding=bool(InternalCladding),
                                       OnlineMonitoring=data['OnlineMonitoring'], HighlyEffectDeadleg=bool(HighlyEffe),
                                       ContainsDeadlegs=bool(containsDeadlegs),
                                       TankMaintain653=False, AdjustmentSettle="", ComponentIsWeld=False,
                                       LinningType=data['InternalLinerType'], LINNER_ONLINE=bool(linerOnlineMoniter),
                                       LINNER_CONDITION=data['InternalLinerCondition'], YEAR_IN_SERVICE=0,
                                       INTERNAL_LINNING=bool(InternalLining),
                                       HEAT_TREATMENT=data['heatTreatment'],
                                       NaOHConcentration=float(data['NaOHConcentration']), HEAT_TRACE=bool(heatTrace),
                                       STEAM_OUT=bool(steamOut),
                                       AMINE_EXPOSED=bool(exposureAcid), AMINE_SOLUTION=data['AminSolution'],
                                       ENVIRONMENT_H2S_CONTENT=bool(EnvironmentCH2S),
                                       AQUEOUS_OPERATOR=bool(aquaDuringOP),
                                       AQUEOUS_SHUTDOWN=bool(aquaDuringShutdown),
                                       H2SContent=float(data['H2SContent']), PH=float(data['PHWater']),
                                       PRESENT_CYANIDE=bool(presentCyanide), BRINNEL_HARDNESS=data['MaxBrinell'],
                                       SULFUR_CONTENT=data['sulfurContent'],
                                       CO3_CONTENT=float(data['CO3']),
                                       PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                       EXPOSED_SULFUR=bool(exposedSulfur),
                                       ExposedSH2OOperation=bool(presentSulphide),
                                       ExposedSH2OShutdown=bool(presentSulphidesShutdown),
                                       ThermalHistory=data['ThermalHistory'], PTAMaterial=data['PTAMaterialGrade'],
                                       DOWNTIME_PROTECTED=bool(downtime),
                                       INTERNAL_EXPOSED_FLUID_MIST=bool(materialExposedFluid),
                                       EXTERNAL_EXPOSED_FLUID_MIST=bool(materialExposed),
                                       CHLORIDE_ION_CONTENT=float(data['ChlorideIon']),
                                       HF_PRESENT=bool(presentHF),
                                       INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                       SUPPORT_COATING=bool(supportMaterial),
                                       INSULATION_TYPE=data['ExternalInsulationType'],
                                       CUI_PERCENT_1=data['OP1'], CUI_PERCENT_2=data['OP2'],
                                       CUI_PERCENT_3=data['OP3'], CUI_PERCENT_4=data['OP4'], CUI_PERCENT_5=data['OP5'],
                                       CUI_PERCENT_6=data['OP6'], CUI_PERCENT_7=data['OP7'], CUI_PERCENT_8=data['OP8'],
                                       CUI_PERCENT_9=data['OP9'], CUI_PERCENT_10=data['OP10'],
                                       EXTERNAL_INSULATION=bool(ExternalInsulation),
                                       COMPONENT_INSTALL_DATE=datetime.strptime(str(data['ExternalCoatingID']),
                                                                                "%Y-%M-%d"),
                                       CRACK_PRESENT=bool(crackpresent),
                                       EXTERNAL_EVIRONMENT=data['ExternalEnvironment'],
                                       EXTERN_COAT_QUALITY=data['ExternalCoatingQuality'],
                                       PIPING_COMPLEXITY=data['complex'],
                                       INSULATION_CONDITION=data['InsulationCondition'],
                                       INSULATION_CHLORIDE=bool(InsulationCholride),
                                       MATERIAL_SUSCEP_HTHA=bool(materialHTHA), HTHA_MATERIAL=data['HTHAMaterialGrade'],
                                       HTHA_PRESSURE=float(data['OpHydroPressure']) * 0.006895,
                                       CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageDuringInsp),
                                       LOWEST_TEMP=bool(lowestTemp),
                                       TEMPER_SUSCEP=bool(suscepTemp), PWHT=bool(pwht),
                                       BRITTLE_THICK=float(data['BrittleFacture']), CARBON_ALLOY=bool(cacbonAlloy),
                                       DELTA_FATT=float(data['deltafatt']),
                                       MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                       MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                       REF_TEMP=float(data['tempRef']),
                                       AUSTENITIC_STEEL=bool(austeniticStell), PERCENT_SIGMA=float(data['sigmaPhase']),
                                       EquipmentType=data['equipmentType'], PREVIOUS_FAIL=data['prevFailure'],
                                       AMOUNT_SHAKING=data['shakingPipe'], TIME_SHAKING=data['timeShakingPipe'],
                                       CYLIC_LOAD=data['CylicLoad'],
                                       CORRECT_ACTION=data['correctActionMitigate'], NUM_PIPE=data['numberPipe'],
                                       PIPE_CONDITION=data['pipeCondition'], JOINT_TYPE=data['joinTypeBranch'],
                                       BRANCH_DIAMETER=data['branchDiameter'])
            ca_cal = CA_CAL.CA_NORMAL(NominalDiametter=float(data['normaldiameter']),
                                      MATERIAL_COST=float(data['materialCostFactor']), FLUID=data['APIFluid'],
                                      FLUID_PHASE=data['Systerm'], API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                                      DETECTION_TYPE=data['DetectionType'],
                                      ISULATION_TYPE=data['IsulationType'],
                                      STORED_PRESSURE=float(data['minOP']) * 6.895,
                                      ATMOSPHERIC_PRESSURE=101, STORED_TEMP=float(data['minOT']) + 273,
                                      MASS_INVERT=float(data['MassInventory']),
                                      MASS_COMPONENT=float(data['MassComponent']),
                                      MITIGATION_SYSTEM=data['MittigationSysterm'],
                                      TOXIC_PERCENT=float(data['ToxicPercent']),
                                      RELEASE_DURATION=data['ReleaseDuration'],
                                      PRODUCTION_COST=float(data['ProductionCost']),
                                      INJURE_COST=float(data['InjureCost']),
                                      ENVIRON_COST=float(data['EnvironmentCost']),
                                      PERSON_DENSITY=float(data['PersonDensity']),
                                      EQUIPMENT_COST=float(data['EquipmentCost']))
            TOTAL_DF_API1 = dm_cal.DF_TOTAL_API(0)
            TOTAL_DF_API2 = dm_cal.DF_TOTAL_API(3)
            TOTAL_DF_API3 = dm_cal.DF_TOTAL_API(6)
            gffTotal = models.ApiComponentType.objects.get(apicomponenttypeid=comp.apicomponenttypeid).gfftotal
            pofap1 = pofConvert.convert(TOTAL_DF_API1 * datafaci.managementfactor * gffTotal)
            pofap2 = pofConvert.convert(TOTAL_DF_API2 * datafaci.managementfactor * gffTotal)
            pofap3 = pofConvert.convert(TOTAL_DF_API3 * datafaci.managementfactor * gffTotal)
            # Pof
            # thinningtype = General or Local
            refullPOF.thinningap1=dm_cal.DF_THINNING_TOTAL_API(0)
            refullPOF.thinningap2=dm_cal.DF_THINNING_TOTAL_API(3)
            refullPOF.thinningap3=dm_cal.DF_THINNING_TOTAL_API(6)
            refullPOF.sccap1=dm_cal.DF_SSC_TOTAL_API(0)
            refullPOF.sccap2=dm_cal.DF_SSC_TOTAL_API(3)
            refullPOF.sccap3=dm_cal.DF_SSC_TOTAL_API(6)
            refullPOF.externalap1=dm_cal.DF_EXT_TOTAL_API(0)
            refullPOF.externalap2=dm_cal.DF_EXT_TOTAL_API(3)
            refullPOF.externalap3=dm_cal.DF_EXT_TOTAL_API(6)
            refullPOF.brittleap1=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.brittleap2=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.brittleap3=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.htha_ap1=dm_cal.DF_HTHA_API(0)
            refullPOF.htha_ap2=dm_cal.DF_HTHA_API(3)
            refullPOF.htha_ap3=dm_cal.DF_HTHA_API(6)
            refullPOF.fatigueap1=dm_cal.DF_PIPE_API()
            refullPOF.fatigueap2=dm_cal.DF_PIPE_API()
            refullPOF.fatigueap3=dm_cal.DF_PIPE_API()
            refullPOF.fms=datafaci.managementfactor
            refullPOF.thinningtype="Local"
            refullPOF.thinninglocalap1=max(dm_cal.DF_THINNING_TOTAL_API(0),
                                            dm_cal.DF_EXT_TOTAL_API(0))
            refullPOF.thinninglocalap2=max(dm_cal.DF_THINNING_TOTAL_API(3),
                                            dm_cal.DF_EXT_TOTAL_API(3))
            refullPOF.thinninglocalap3=max(dm_cal.DF_THINNING_TOTAL_API(6),
                                            dm_cal.DF_EXT_TOTAL_API(6))
            refullPOF.thinninggeneralap1=dm_cal.DF_THINNING_TOTAL_API(0) + dm_cal.DF_EXT_TOTAL_API(0)
            refullPOF.thinninggeneralap2=dm_cal.DF_THINNING_TOTAL_API(3) + dm_cal.DF_EXT_TOTAL_API(3)
            refullPOF.thinninggeneralap3=dm_cal.DF_THINNING_TOTAL_API(6) + dm_cal.DF_EXT_TOTAL_API(6)
            refullPOF.totaldfap1=TOTAL_DF_API1
            refullPOF.totaldfap2=TOTAL_DF_API2
            refullPOF.totaldfap3=TOTAL_DF_API3
            refullPOF.pofap1=pofap1
            refullPOF.pofap2=pofap2
            refullPOF.pofap3=pofap3
            refullPOF.gfftotal=gffTotal
            refullPOF.pofap1category=dm_cal.PoFCategory(TOTAL_DF_API1)
            refullPOF.pofap2category=dm_cal.PoFCategory(TOTAL_DF_API2)
            refullPOF.pofap3category=dm_cal.PoFCategory(TOTAL_DF_API3)
            refullPOF.save()
            # ca level 1( CoF)
            if ca_cal.NominalDiametter == 0 or ca_cal.STORED_PRESSURE == 0 or ca_cal.MASS_INVERT == 0 or ca_cal.MASS_COMPONENT == 0 or ca_cal.FLUID is None:
                calv1.release_phase=ca_cal.GET_RELEASE_PHASE()
                calv1.fact_di=ca_cal.fact_di()
                calv1.fact_mit=ca_cal.fact_mit()
                calv1.fact_ait=ca_cal.fact_ait()
                calv1.fc_total=100000000
                calv1.fcof_category="E"
            else:
                calv1.release_phase=ca_cal.GET_RELEASE_PHASE()
                calv1.fact_di=ca_cal.fact_di()
                calv1.ca_inj_flame=ca_cal.ca_inj_flame()
                calv1.ca_inj_toxic=ca_cal.ca_inj_tox()
                calv1.ca_inj_ntnf=ca_cal.ca_inj_nfnt()
                calv1.fact_mit=ca_cal.fact_mit()
                calv1.fact_ait=ca_cal.fact_ait()
                calv1.ca_cmd=ca_cal.ca_cmd()
                calv1.fc_cmd=ca_cal.fc_cmd()
                calv1.fc_affa=ca_cal.fc_affa()
                calv1.fc_envi=ca_cal.fc_environ()
                calv1.fc_prod=ca_cal.fc_prod()
                calv1.fc_inj=ca_cal.fc_inj()
                calv1.fc_total=ca_cal.fc()
                calv1.fcof_category=ca_cal.FC_Category(ca_cal.fc())
            calv1.save()
            # damage machinsm
            damageList = dm_cal.ISDF()
            for dm in damageMachinsm:
                dm.delete()
            for damage in damageList:
                dm = models.RwDamageMechanism(id_dm=rwassessment, dmitemid_id=damage['DM_ITEM_ID'],
                                                          isactive=damage['isActive'],
                                                          df1=damage['DF1'], df2=damage['DF2'], df3=damage['DF3'],
                                                          highestinspectioneffectiveness=damage['highestEFF'],
                                                          secondinspectioneffectiveness=damage['secondEFF'],
                                                          numberofinspections=damage['numberINSP'],
                                                          lastinspdate=damage['lastINSP'].date().strftime('%Y-%m-%d'),
                                                          inspduedate=dm_cal.INSP_DUE_DATE(calv1.fc_total, gffTotal,
                                                                                           datafaci.managementfactor,
                                                                                           target.risktarget_fc).date().strftime(
                                                              '%Y-%m-%d'))
                dm.save()

            refullfc.fcofvalue=calv1.fc_total
            refullfc.fcofcategory=calv1.fcof_category
            refullfc.envcost=data['EnvironmentCost']
            refullfc.equipcost=data['EquipmentCost']
            refullfc.prodcost=data['ProductionCost']
            refullfc.popdens=data['PersonDensity']
            refullfc.injcost=data['InjureCost']
            refullfc.save()
            # data for chart
            riskList = dm_cal.DF_LIST_16(calv1.fc_total, gffTotal, datafaci.managementfactor, target.risktarget_fc)
            chart.riskage1=riskList[1]
            chart.riskage2=riskList[2]
            chart.riskage3=riskList[3]
            chart.riskage4=riskList[4]
            chart.riskage5=riskList[5]
            chart.riskage6=riskList[6]
            chart.riskage7=riskList[7]
            chart.riskage8=riskList[8]
            chart.riskage9=riskList[9]
            chart.riskage10=riskList[10]
            chart.riskage11=riskList[11]
            chart.riskage12=riskList[12]
            chart.riskage13=riskList[13]
            chart.riskage14=riskList[14]
            chart.riskage15=riskList[15]
            chart.risktarget=riskList[0]
            chart.save()
            return redirect('damgeFactor', proposalID= proposalID)
    except:
        raise Http404
    return render(request, 'FacilityUI/proposal/proposalNormalEdit.html', {'api':Fluid, 'rwAss':rwassessment, 'rwEq':rwequipment,
                                                                           'rwComp':rwcomponent, 'rwStream':rwstream, 'rwExcot':rwexcor,
                                                                           'rwCoat':rwcoat, 'rwMaterial':rwmaterial, 'rwInputCa':rwinputca,
                                                                           'assDate':assDate, 'extDate':extDate,
                                                                           'componentID': rwassessment.componentid_id,
                                                                           'equipmentID': rwassessment.equipmentid_id})
def EditTank(request, proposalID):
    try:
        rwassessment = models.RwAssessment.objects.get(id=proposalID)
        rwequipment = models.RwEquipment.objects.get(id=proposalID)
        rwcomponent = models.RwComponent.objects.get(id=proposalID)
        rwstream = models.RwStream.objects.get(id=proposalID)
        rwexcor = models.RwExtcorTemperature.objects.get(id=proposalID)
        rwcoat = models.RwCoating.objects.get(id=proposalID)
        rwmaterial = models.RwMaterial.objects.get(id=proposalID)
        rwinputca = models.RwInputCaTank.objects.get(id=proposalID)
        rwcatank = models.RwCaTank.objects.get(id=proposalID)
        refullPOF = models.RwFullPof.objects.get(id=proposalID)
        damageMachinsm = models.RwDamageMechanism.objects.filter(id_dm=proposalID)
        refullfc = models.RwFullFcof.objects.get(id=proposalID)
        chart = models.RwDataChart.objects.get(id=proposalID)
        assDate = rwassessment.assessmentdate.strftime('%Y-%m-%d')
        try:
            extDate = rwcoat.externalcoatingdate.strftime('%Y-%m-%d')
        except:
            extDate = datetime.now().strftime('%Y-%m-%d')

        comp = models.ComponentMaster.objects.get(componentid= rwassessment.componentid_id)
        eq = models.EquipmentMaster.objects.get(equipmentid= rwassessment.equipmentid_id)
        target = models.FacilityRiskTarget.objects.get(facilityid= eq.facilityid_id)
        datafaci = models.Facility.objects.get(facilityid= eq.facilityid_id)
        data={}
        isshell = False
        if comp.componenttypeid_id == 8 or comp.componenttypeid_id == 38:
            isshell = True
        if request.method =='POST':
            # Data Assessment
            data['assessmentName'] = request.POST.get('AssessmentName')
            data['assessmentdate'] = request.POST.get('assessmentdate')
            data['riskperiod'] = request.POST.get('RiskAnalysisPeriod')
            data['apicomponenttypeid'] = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).apicomponenttypename
            data['equipmenttype'] = models.EquipmentType.objects.get(equipmenttypeid= eq.equipmenttypeid_id).equipmenttypename
            # Data Equipment Properties
            if request.POST.get('Admin'):
                adminControlUpset = 1
            else:
                adminControlUpset = 0

            if request.POST.get('CylicOper'):
                cylicOp = 1
            else:
                cylicOp = 0

            if request.POST.get('Highly'):
                highlyDeadleg = 1
            else:
                highlyDeadleg = 0

            if request.POST.get('Steamed'):
                steamOutWater = 1
            else:
                steamOutWater = 0

            if request.POST.get('Downtime'):
                downtimeProtect = 1
            else:
                downtimeProtect = 0

            if request.POST.get('PWHT'):
                pwht = 1
            else:
                pwht = 0

            if request.POST.get('HeatTraced'):
                heatTrace = 1
            else:
                heatTrace = 0

            data['distance'] = request.POST.get('Distance')

            if request.POST.get('InterfaceSoilWater'):
                interfaceSoilWater = 1
            else:
                interfaceSoilWater = 0

            data['soiltype'] = request.POST.get('typeofSoil')

            if request.POST.get('PressurisationControlled'):
                pressureControl = 1
            else:
                pressureControl = 0

            data['minRequireTemp'] = request.POST.get('MinReq')

            if request.POST.get('lowestTemp'):
                lowestTemp = 1
            else:
                lowestTemp = 0

            if request.POST.get('MFTF'):
                materialChlorineExt = 1
            else:
                materialChlorineExt = 0

            if request.POST.get('LOM'):
                linerOnlineMonitor = 1
            else:
                linerOnlineMonitor = 0

            if request.POST.get('PresenceofSulphides'):
                presenceSulphideOP = 1
            else:
                presenceSulphideOP = 0

            if request.POST.get('PresenceofSulphidesShutdow'):
                presenceSulphideShut = 1
            else:
                presenceSulphideShut = 0

            if request.POST.get('ComponentWelded'):
                componentWelded = 1
            else:
                componentWelded = 0

            if request.POST.get('TMA'):
                tankIsMaintain = 1
            else:
                tankIsMaintain = 0

            data['adjustSettlement'] = request.POST.get('AdjForSettlement')
            data['extEnvironment'] = request.POST.get('ExternalEnvironment')
            data['EnvSensitivity'] = request.POST.get('EnvironmentSensitivity')
            data['themalHistory'] = request.POST.get('ThermalHistory')
            data['onlineMonitor'] = request.POST.get('OnlineMonitoring')
            data['equipmentVolumn'] = request.POST.get('EquipmentVolume')
            # Component Properties
            data['tankDiameter'] = request.POST.get('TankDiameter')
            data['NominalThickness'] = request.POST.get('NominalThickness')
            data['currentThick'] = request.POST.get('CurrentThickness')
            data['minRequireThick'] = request.POST.get('MinReqThick')
            data['currentCorrosion'] = request.POST.get('CurrentCorrosionRate')
            data['shellHieght'] = request.POST.get('shellHeight')

            if request.POST.get('DFDI'):
                damageFound = 1
            else:
                damageFound = 0

            if request.POST.get('PresenceCracks'):
                crackPresence = 1
            else:
                crackPresence = 0

            if request.POST.get('TrampElements'):
                trampElements = 1
            else:
                trampElements = 0

            if request.POST.get('ReleasePreventionBarrier'):
                preventBarrier = 1
            else:
                preventBarrier = 0

            if request.POST.get('ConcreteFoundation'):
                concreteFoundation = 1
            else:
                concreteFoundation = 0

            data['maxBrinnelHardness'] = request.POST.get('MBHW')
            data['complexProtrusion'] = request.POST.get('ComplexityProtrusions')
            data['severityVibration'] = request.POST.get('SeverityVibration')

            # Operating condition
            data['maxOT'] = request.POST.get('MaxOT')
            data['maxOP'] = request.POST.get('MaxOP')
            data['minOT'] = request.POST.get('MinOT')
            data['minOP'] = request.POST.get('MinOP')
            data['H2Spressure'] = request.POST.get('OHPP')
            data['criticalTemp'] = request.POST.get('CET')
            data['OP1'] = request.POST.get('Operating1')
            data['OP2'] = request.POST.get('Operating2')
            data['OP3'] = request.POST.get('Operating3')
            data['OP4'] = request.POST.get('Operating4')
            data['OP5'] = request.POST.get('Operating5')
            data['OP6'] = request.POST.get('Operating6')
            data['OP7'] = request.POST.get('Operating7')
            data['OP8'] = request.POST.get('Operating8')
            data['OP9'] = request.POST.get('Operating9')
            data['OP10'] = request.POST.get('Operating10')

            # Material
            data['materialName'] = request.POST.get('materialname')
            data['maxDesignTemp'] = request.POST.get('MaxDesignTemp')
            data['minDesignTemp'] = request.POST.get('MinDesignTemp')
            data['designPressure'] = request.POST.get('DesignPressure')
            data['refTemp'] = request.POST.get('ReferenceTemperature')
            data['allowStress'] = request.POST.get('ASAT')
            data['brittleThick'] = request.POST.get('BFGT')
            data['corrosionAllow'] = request.POST.get('CorrosionAllowance')

            if request.POST.get('CoLAS'):
                carbonLowAlloySteel = 1
            else:
                carbonLowAlloySteel = 0

            if request.POST.get('AusteniticSteel'):
                austeniticSteel = 1
            else:
                austeniticSteel = 0

            if request.POST.get('NickelAlloy'):
                nickelAlloy = 1
            else:
                nickelAlloy = 0

            if request.POST.get('Chromium'):
                chromium = 1
            else:
                chromium = 0

            data['sulfurContent'] = request.POST.get('SulfurContent')
            data['heatTreatment'] = request.POST.get('heatTreatment')

            if request.POST.get('MGTEPTA'):
                materialPTA = 1
            else:
                materialPTA = 0

            data['PTAMaterialGrade'] = request.POST.get('PTAMaterialGrade')
            data['materialCostFactor'] = request.POST.get('MaterialCostFactor')
            data['productionCost'] = request.POST.get('ProductionCost')

            # Coating, Cladding
            if request.POST.get('InternalCoating'):
                internalCoating = 1
            else:
                internalCoating = 0

            if request.POST.get('ExternalCoating'):
                externalCoating = 1
            else:
                externalCoating = 0

            data['externalInstallDate'] = request.POST.get('ExternalCoatingID')
            data['externalCoatQuality'] = request.POST.get('ExternalCoatingQuality')

            if request.POST.get('SCWD'):
                supportCoatingMaintain = 1
            else:
                supportCoatingMaintain = 0

            if request.POST.get('InternalCladding'):
                internalCladding = 1
            else:
                internalCladding = 0

            data['cladCorrosion'] = request.POST.get('CladdingCorrosionRate')

            if request.POST.get('InternalLining'):
                internalLinning = 1
            else:
                internalLinning = 0

            data['internalLinnerType'] = request.POST.get('InternalLinerType')
            data['internalLinnerCondition'] = request.POST.get('InternalLinerCondition')

            if request.POST.get('ExternalInsulation'):
                extInsulation = 1
            else:
                extInsulation = 0

            if request.POST.get('ICC'):
                InsulationContainChloride = 1
            else:
                InsulationContainChloride = 0

            data['extInsulationType'] = request.POST.get('ExternalInsulationType')
            data['insulationCondition'] = request.POST.get('InsulationCondition')

            # Stream
            data['fluid'] = request.POST.get('Fluid')
            data['fluidHeight'] = request.POST.get('FluidHeight')
            data['fluidLeaveDike'] = request.POST.get('PFLD')
            data['fluidOnsite'] = request.POST.get('PFLDRS')
            data['fluidOffsite'] = request.POST.get('PFLDGoffsite')
            data['naohConcent'] = request.POST.get('NaOHConcentration')
            data['releasePercentToxic'] = request.POST.get('RFPT')
            data['chlorideIon'] = request.POST.get('ChlorideIon')
            data['co3'] = request.POST.get('CO3')
            data['h2sContent'] = request.POST.get('H2SContent')
            data['PHWater'] = request.POST.get('PHWater')

            if request.POST.get('EAGTA'):
                exposedAmine = 1
            else:
                exposedAmine = 0

            data['amineSolution'] = request.POST.get('AmineSolution')
            data['exposureAmine'] = request.POST.get('ExposureAmine')

            if request.POST.get('APDO'):
                aqueosOP = 1
            else:
                aqueosOP = 0

            if request.POST.get('EnvironmentCH2S'):
                environtH2S = 1
            else:
                environtH2S = 0

            if request.POST.get('APDSD'):
                aqueosShut = 1
            else:
                aqueosShut = 0

            if request.POST.get('PresenceCyanides'):
                cyanidesPresence = 1
            else:
                cyanidesPresence = 0

            if request.POST.get('presenceHF'):
                presentHF = 1
            else:
                presentHF = 0

            if request.POST.get('ECCAC'):
                environtCaustic = 1
            else:
                environtCaustic = 0

            if request.POST.get('PCH'):
                processContainHydro = 1
            else:
                processContainHydro = 0

            if request.POST.get('MEFMSCC'):
                materialChlorineIntern = 1
            else:
                materialChlorineIntern = 0

            if request.POST.get('ESBC'):
                exposedSulfur = 1
            else:
                exposedSulfur = 0

            if str(data['fluid']) == "Gasoline":
                apiFluid = "C6-C8"
            elif str(data['fluid']) == "Light Diesel Oil":
                apiFluid = "C9-C12"
            elif str(data['fluid']) == "Heavy Diesel Oil":
                apiFluid = "C13-C16"
            elif str(data['fluid']) == "Fuel Oil" or str(data['fluid']) == "Crude Oil":
                apiFluid = "C17-C25"
            else:
                apiFluid = "C25+"
            rwassessment.assessmentdate=data['assessmentdate']
            rwassessment.proposalname=data['assessmentName']
            rwassessment.save()

            rwequipment.adminupsetmanagement=adminControlUpset
            rwequipment.cyclicoperation=cylicOp
            rwequipment.highlydeadleginsp=highlyDeadleg
            rwequipment.downtimeprotectionused=downtimeProtect
            rwequipment.steamoutwaterflush=steamOutWater
            rwequipment.pwht=pwht
            rwequipment.heattraced=heatTrace
            rwequipment.distancetogroundwater=data['distance']
            rwequipment.interfacesoilwater=interfaceSoilWater
            rwequipment.typeofsoil=data['soiltype']
            rwequipment.pressurisationcontrolled=pressureControl
            rwequipment.minreqtemperaturepressurisation=data['minRequireTemp']
            rwequipment.yearlowestexptemp=lowestTemp
            rwequipment.materialexposedtoclext=materialChlorineExt
            rwequipment.lineronlinemonitoring=linerOnlineMonitor
            rwequipment.presencesulphideso2=presenceSulphideOP
            rwequipment.presencesulphideso2shutdown=presenceSulphideShut
            rwequipment.componentiswelded=componentWelded
            rwequipment.tankismaintained=tankIsMaintain
            rwequipment.adjustmentsettle=data['adjustSettlement']
            rwequipment.externalenvironment=data['extEnvironment']
            rwequipment.environmentsensitivity=data['EnvSensitivity']
            rwequipment.onlinemonitoring=data['onlineMonitor']
            rwequipment.thermalhistory=data['themalHistory']
            rwequipment.managementfactor=datafaci.managementfactor
            rwequipment.volume=data['equipmentVolumn']
            rwequipment.save()

            rwcomponent.nominaldiameter=data['tankDiameter']
            rwcomponent.nominalthickness=data['NominalThickness']
            rwcomponent.currentthickness=data['currentThick']
            rwcomponent.minreqthickness=data['minRequireThick']
            rwcomponent.currentcorrosionrate=data['currentCorrosion']
            rwcomponent.shellheight=data['shellHieght']
            rwcomponent.damagefoundinspection=damageFound
            rwcomponent.crackspresent=crackPresence
            rwcomponent.trampelements=trampElements
            rwcomponent.releasepreventionbarrier=preventBarrier
            rwcomponent.concretefoundation=concreteFoundation
            rwcomponent.brinnelhardness=data['maxBrinnelHardness']
            rwcomponent.complexityprotrusion=data['complexProtrusion']
            rwcomponent.severityofvibration=data['severityVibration']
            rwcomponent.save()

            rwstream.maxoperatingtemperature=data['maxOT']
            rwstream.maxoperatingpressure=data['maxOP']
            rwstream.minoperatingtemperature=data['minOT']
            rwstream.minoperatingpressure=data['minOP']
            rwstream.h2spartialpressure=data['H2Spressure']
            rwstream.criticalexposuretemperature=data['criticalTemp']
            rwstream.tankfluidname=data['fluid']
            rwstream.fluidheight=data['fluidHeight']
            rwstream.fluidleavedikepercent=data['fluidLeaveDike']
            rwstream.fluidleavedikeremainonsitepercent=data['fluidOnsite']
            rwstream.fluidgooffsitepercent=data['fluidOffsite']
            rwstream.naohconcentration=data['naohConcent']
            rwstream.releasefluidpercenttoxic=data['releasePercentToxic']
            rwstream.chloride=data['chlorideIon']
            rwstream.co3concentration=data['co3']
            rwstream.h2sinwater=data['h2sContent']
            rwstream.waterph=data['PHWater']
            rwstream.exposedtogasamine=exposedAmine
            rwstream.aminesolution=data['amineSolution']
            rwstream.exposuretoamine=data['exposureAmine']
            rwstream.aqueousoperation=aqueosOP
            rwstream.h2s=environtH2S
            rwstream.aqueousshutdown=aqueosShut
            rwstream.cyanide=cyanidesPresence
            rwstream.hydrofluoric=presentHF
            rwstream.caustic=environtCaustic
            rwstream.hydrogen=processContainHydro
            rwstream.materialexposedtoclint=materialChlorineIntern
            rwstream.exposedtosulphur=exposedSulfur
            rwstream.save()

            rwexcor.minus12tominus8=data['OP1']
            rwexcor.minus8toplus6=data['OP2']
            rwexcor.plus6toplus32=data['OP3']
            rwexcor.plus32toplus71=data['OP4']
            rwexcor.plus71toplus107=data['OP5']
            rwexcor.plus107toplus121=data['OP6']
            rwexcor.plus121toplus135=data['OP7']
            rwexcor.plus135toplus162=data['OP8']
            rwexcor.plus162toplus176=data['OP9']
            rwexcor.morethanplus176=data['OP10']
            rwexcor.save()

            rwcoat.internalcoating=internalCoating
            rwcoat.externalcoating=externalCoating
            rwcoat.externalcoatingdate=data['externalInstallDate']
            rwcoat.externalcoatingquality=data['externalCoatQuality']
            rwcoat.supportconfignotallowcoatingmaint=supportCoatingMaintain
            rwcoat.internalcladding=internalCladding
            rwcoat.claddingcorrosionrate=data['cladCorrosion']
            rwcoat.internallining=internalLinning
            rwcoat.internallinertype=data['internalLinnerType']
            rwcoat.internallinercondition=data['internalLinnerCondition']
            rwcoat.externalinsulation=extInsulation
            rwcoat.insulationcontainschloride=InsulationContainChloride
            rwcoat.externalinsulationtype=data['extInsulationType']
            rwcoat.insulationcondition=data['insulationCondition']
            rwcoat.save()

            rwmaterial.materialname=data['materialName']
            rwmaterial.designtemperature=data['maxDesignTemp']
            rwmaterial.mindesigntemperature=data['minDesignTemp']
            rwmaterial.designpressure=data['designPressure']
            rwmaterial.referencetemperature=data['refTemp']
            rwmaterial.allowablestress=data['allowStress']
            rwmaterial.brittlefracturethickness=data['brittleThick']
            rwmaterial.corrosionallowance=data['corrosionAllow']
            rwmaterial.carbonlowalloy=carbonLowAlloySteel
            rwmaterial.austenitic=austeniticSteel
            rwmaterial.nickelbased=nickelAlloy
            rwmaterial.chromemoreequal12=chromium
            rwmaterial.sulfurcontent=data['sulfurContent']
            rwmaterial.heattreatment=data['heatTreatment']
            rwmaterial.ispta=materialPTA
            rwmaterial.ptamaterialcode=data['PTAMaterialGrade']
            rwmaterial.costfactor=data['materialCostFactor']
            rwmaterial.save()

            rwinputca.fluid_height=data['fluidHeight']
            rwinputca.shell_course_height=data['shellHieght']
            rwinputca.tank_diametter=data['tankDiameter']
            rwinputca.prevention_barrier=preventBarrier
            rwinputca.environ_sensitivity=data['EnvSensitivity']
            rwinputca.p_lvdike=data['fluidLeaveDike']
            rwinputca.p_offsite=data['fluidOffsite']
            rwinputca.p_onsite=data['fluidOnsite']
            rwinputca.soil_type=data['soiltype']
            rwinputca.tank_fluid=data['fluid']
            rwinputca.api_fluid=apiFluid
            rwinputca.sw=data['distance']
            rwinputca.productioncost=data['productionCost']
            rwinputca.save()

            if data['externalInstallDate'] is None:
                dm_cal = DM_CAL.DM_CAL(APIComponentType=data['apicomponenttypeid'],
                                Diametter=float(data['tankDiameter']), NomalThick=float(data['NominalThickness']),
                                CurrentThick=float(rwcomponent.currentthickness),
                                MinThickReq=float(rwcomponent.minreqthickness),
                                CorrosionRate=float(rwcomponent.currentcorrosionrate),
                                CA=float(rwmaterial.corrosionallowance),
                                ProtectedBarrier=bool(rwcomponent.releasepreventionbarrier),
                                CladdingCorrosionRate=float(rwcoat.claddingcorrosionrate),
                                InternalCladding=bool(rwcoat.internalcladding), NoINSP_THINNING=1,
                                EFF_THIN="B", OnlineMonitoring=rwequipment.onlinemonitoring,
                                HighlyEffectDeadleg=bool(rwequipment.highlydeadleginsp),
                                ContainsDeadlegs=bool(rwequipment.containsdeadlegs),
                                TankMaintain653=bool(rwequipment.tankismaintained),
                                AdjustmentSettle=rwequipment.adjustmentsettle,
                                ComponentIsWeld=bool(rwequipment.componentiswelded),
                                LinningType=data['internalLinnerType'],
                                LINNER_ONLINE=bool(rwequipment.lineronlinemonitoring),
                                LINNER_CONDITION=data['internalLinnerCondition'],
                                INTERNAL_LINNING=bool(rwcoat.internallining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['naohConcent']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOutWater),
                                AMINE_EXPOSED=bool(exposedAmine),
                                AMINE_SOLUTION=data['amineSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(environtH2S), AQUEOUS_OPERATOR=bool(aqueosOP),
                                AQUEOUS_SHUTDOWN=bool(aqueosShut), H2SContent=float(data['h2sContent']),
                                PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(cyanidesPresence), BRINNEL_HARDNESS=data['maxBrinnelHardness'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['co3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presenceSulphideOP),
                                ExposedSH2OShutdown=bool(presenceSulphideShut), ThermalHistory=data['themalHistory'],
                                PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtimeProtect),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineIntern),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineExt),
                                CHLORIDE_ION_CONTENT=float(data['chlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                SUPPORT_COATING=bool(supportCoatingMaintain),
                                INSULATION_TYPE=data['extInsulationType'], CUI_PERCENT_1=float(data['OP1']),
                                CUI_PERCENT_2=float(data['OP2']),
                                CUI_PERCENT_3=float(data['OP3']), CUI_PERCENT_4=float(data['OP4']),
                                CUI_PERCENT_5=float(data['OP5']),
                                CUI_PERCENT_6=float(data['OP6']), CUI_PERCENT_7=float(data['OP7']),
                                CUI_PERCENT_8=float(data['OP8']),
                                CUI_PERCENT_9=float(data['OP9']), CUI_PERCENT_10=float(data['OP10']),
                                EXTERNAL_INSULATION=bool(extInsulation),
                                COMPONENT_INSTALL_DATE=eq.commissiondate,
                                CRACK_PRESENT=bool(crackPresence),
                                EXTERNAL_EVIRONMENT=data['extEnvironment'],
                                EXTERN_COAT_QUALITY=data['externalCoatQuality'],
                                PIPING_COMPLEXITY=data['complexProtrusion'],
                                INSULATION_CONDITION=data['insulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationContainChloride),
                                MATERIAL_SUSCEP_HTHA=False, HTHA_MATERIAL="",
                                HTHA_PRESSURE=float(data['H2Spressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageFound),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=False, PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['brittleThick']), CARBON_ALLOY=bool(carbonLowAlloySteel),
                                DELTA_FATT=0,
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['refTemp']),
                                AUSTENITIC_STEEL=bool(austeniticSteel), PERCENT_SIGMA=0,
                                EquipmentType= data['equipmenttype'], PREVIOUS_FAIL="",
                                AMOUNT_SHAKING="", TIME_SHAKING="",
                                CYLIC_LOAD="",
                                CORRECT_ACTION="", NUM_PIPE="",
                                PIPE_CONDITION="", JOINT_TYPE="",
                                BRANCH_DIAMETER="")
            else:
                dm_cal = DM_CAL.DM_CAL(APIComponentType=data['apicomponenttypeid'],
                                Diametter=float(data['tankDiameter']), NomalThick=float(data['NominalThickness']),
                                CurrentThick=float(rwcomponent.currentthickness),
                                MinThickReq=float(rwcomponent.minreqthickness),
                                CorrosionRate=float(rwcomponent.currentcorrosionrate),
                                CA=float(rwmaterial.corrosionallowance),
                                ProtectedBarrier=bool(rwcomponent.releasepreventionbarrier),
                                CladdingCorrosionRate=float(rwcoat.claddingcorrosionrate),
                                InternalCladding=bool(rwcoat.internalcladding), NoINSP_THINNING=1,
                                EFF_THIN="B", OnlineMonitoring=rwequipment.onlinemonitoring,
                                HighlyEffectDeadleg=bool(rwequipment.highlydeadleginsp),
                                ContainsDeadlegs=bool(rwequipment.containsdeadlegs),
                                TankMaintain653=bool(rwequipment.tankismaintained),
                                AdjustmentSettle=rwequipment.adjustmentsettle,
                                ComponentIsWeld=bool(rwequipment.componentiswelded),
                                LinningType=data['internalLinnerType'],
                                LINNER_ONLINE=bool(rwequipment.lineronlinemonitoring),
                                LINNER_CONDITION=data['internalLinnerCondition'],
                                INTERNAL_LINNING=bool(rwcoat.internallining),
                                HEAT_TREATMENT=data['heatTreatment'],
                                NaOHConcentration=float(data['naohConcent']), HEAT_TRACE=bool(heatTrace),
                                STEAM_OUT=bool(steamOutWater),
                                AMINE_EXPOSED=bool(exposedAmine),
                                AMINE_SOLUTION=data['amineSolution'],
                                ENVIRONMENT_H2S_CONTENT=bool(environtH2S), AQUEOUS_OPERATOR=bool(aqueosOP),
                                AQUEOUS_SHUTDOWN=bool(aqueosShut), H2SContent=float(data['h2sContent']),
                                PH=float(data['PHWater']),
                                PRESENT_CYANIDE=bool(cyanidesPresence), BRINNEL_HARDNESS=data['maxBrinnelHardness'],
                                SULFUR_CONTENT=data['sulfurContent'],
                                CO3_CONTENT=float(data['co3']),
                                PTA_SUSCEP=bool(materialPTA), NICKEL_ALLOY=bool(nickelAlloy),
                                EXPOSED_SULFUR=bool(exposedSulfur),
                                ExposedSH2OOperation=bool(presenceSulphideOP),
                                ExposedSH2OShutdown=bool(presenceSulphideShut), ThermalHistory=data['themalHistory'],
                                PTAMaterial=data['PTAMaterialGrade'],
                                DOWNTIME_PROTECTED=bool(downtimeProtect),
                                INTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineIntern),
                                EXTERNAL_EXPOSED_FLUID_MIST=bool(materialChlorineExt),
                                CHLORIDE_ION_CONTENT=float(data['chlorideIon']),
                                HF_PRESENT=bool(presentHF),
                                INTERFACE_SOIL_WATER=bool(interfaceSoilWater),
                                SUPPORT_COATING=bool(supportCoatingMaintain),
                                INSULATION_TYPE=data['extInsulationType'], CUI_PERCENT_1=float(data['OP1']),
                                CUI_PERCENT_2=float(data['OP2']),
                                CUI_PERCENT_3=float(data['OP3']), CUI_PERCENT_4=float(data['OP4']),
                                CUI_PERCENT_5=float(data['OP5']),
                                CUI_PERCENT_6=float(data['OP6']), CUI_PERCENT_7=float(data['OP7']),
                                CUI_PERCENT_8=float(data['OP8']),
                                CUI_PERCENT_9=float(data['OP9']), CUI_PERCENT_10=float(data['OP10']),
                                EXTERNAL_INSULATION=bool(extInsulation),
                                COMPONENT_INSTALL_DATE=datetime.strptime(str(data['externalInstallDate']), "%Y-%M-%d"),
                                CRACK_PRESENT=bool(crackPresence),
                                EXTERNAL_EVIRONMENT=data['extEnvironment'],
                                EXTERN_COAT_QUALITY=data['externalCoatQuality'],
                                PIPING_COMPLEXITY=data['complexProtrusion'],
                                INSULATION_CONDITION=data['insulationCondition'],
                                INSULATION_CHLORIDE=bool(InsulationContainChloride),
                                MATERIAL_SUSCEP_HTHA=False, HTHA_MATERIAL="",
                                HTHA_PRESSURE=float(data['H2Spressure']) * 0.006895,
                                CRITICAL_TEMP=float(data['criticalTemp']), DAMAGE_FOUND=bool(damageFound),
                                LOWEST_TEMP=bool(lowestTemp),
                                TEMPER_SUSCEP=False, PWHT=bool(pwht),
                                BRITTLE_THICK=float(data['brittleThick']), CARBON_ALLOY=bool(carbonLowAlloySteel),
                                DELTA_FATT=0,
                                MAX_OP_TEMP=float(data['maxOT']), CHROMIUM_12=bool(chromium),
                                MIN_OP_TEMP=float(data['minOT']), MIN_DESIGN_TEMP=float(data['minDesignTemp']),
                                REF_TEMP=float(data['refTemp']),
                                AUSTENITIC_STEEL=bool(austeniticSteel), PERCENT_SIGMA=0,
                                EquipmentType= data['equipmenttype'], PREVIOUS_FAIL="",
                                AMOUNT_SHAKING="", TIME_SHAKING="",
                                CYLIC_LOAD="",
                                CORRECT_ACTION="", NUM_PIPE="",
                                PIPE_CONDITION="", JOINT_TYPE="",
                                BRANCH_DIAMETER="")
            if isshell:
                cacal = CA_CAL.CA_SHELL(FLUID=apiFluid, FLUID_HEIGHT=float(data['fluidHeight']),
                                 SHELL_COURSE_HEIGHT=float(data['shellHieght']),
                                 TANK_DIAMETER=float(data['tankDiameter']), EnvironSensitivity=data['EnvSensitivity'],
                                 P_lvdike=float(data['fluidLeaveDike']),
                                 P_onsite=float(data['fluidOnsite']), P_offsite=float(data['fluidOffsite']),
                                 MATERIAL_COST=float(data['materialCostFactor']),
                                 API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                                 PRODUCTION_COST=float(data['productionCost']))
                rwcatank.flow_rate_d1=cacal.W_n_Tank(1)
                rwcatank.flow_rate_d2=cacal.W_n_Tank(2)
                rwcatank.flow_rate_d3=cacal.W_n_Tank(3)
                rwcatank.flow_rate_d4=cacal.W_n_Tank(4)
                rwcatank.leak_duration_d1=cacal.ld_tank(1)
                rwcatank.leak_duration_d2=cacal.ld_tank(2)
                rwcatank.leak_duration_d3=cacal.ld_tank(3)
                rwcatank.leak_duration_d4=cacal.ld_tank(4)
                rwcatank.release_volume_leak_d1=cacal.Bbl_leak_n(1)
                rwcatank.release_volume_leak_d2=cacal.Bbl_leak_n(2)
                rwcatank.release_volume_leak_d3=cacal.Bbl_leak_n(3)
                rwcatank.release_volume_leak_d4=cacal.Bbl_leak_n(4)
                rwcatank.release_volume_rupture=cacal.Bbl_rupture_release()
                rwcatank.liquid_height=cacal.FLUID_HEIGHT
                rwcatank.volume_fluid=cacal.Bbl_total_shell()
                rwcatank.time_leak_ground=cacal.ld_tank(4)
                rwcatank.volume_subsoil_leak_d1=cacal.Bbl_leak_release()
                rwcatank.volume_subsoil_leak_d4=cacal.Bbl_rupture_release()
                rwcatank.volume_ground_water_leak_d1=cacal.Bbl_leak_water()
                rwcatank.volume_ground_water_leak_d4=cacal.Bbl_rupture_water()
                rwcatank.barrel_dike_leak=cacal.Bbl_leak_indike()
                rwcatank.barrel_dike_rupture=cacal.Bbl_rupture_indike()
                rwcatank.barrel_onsite_leak=cacal.Bbl_leak_ssonsite()
                rwcatank.barrel_onsite_rupture=cacal.Bbl_rupture_ssonsite()
                rwcatank.barrel_offsite_leak=cacal.Bbl_leak_ssoffsite()
                rwcatank.barrel_offsite_rupture=cacal.Bbl_rupture_ssoffsite()
                rwcatank.barrel_water_leak=cacal.Bbl_leak_water()
                rwcatank.barrel_water_rupture=cacal.Bbl_rupture_water()
                rwcatank.fc_environ_leak=cacal.FC_leak_environ()
                rwcatank.fc_environ_rupture=cacal.FC_rupture_environ()
                rwcatank.fc_environ=cacal.FC_environ_shell()
                rwcatank.material_factor=float(data['materialCostFactor'])
                rwcatank.component_damage_cost=cacal.fc_cmd()
                rwcatank.business_cost=cacal.FC_PROD_SHELL()
                rwcatank.consequence=cacal.FC_total_shell()
                rwcatank.consequencecategory=cacal.FC_Category(cacal.FC_total_shell())
                rwcatank.save()

                FC_TOTAL = cacal.FC_total_shell()
                FC_CATEGORY = cacal.FC_Category(cacal.FC_total_shell())
            else:
                cacal = CA_CAL.CA_TANK_BOTTOM(Soil_type=data['soiltype'], TANK_FLUID=data['fluid'], Swg=float(data['distance']),
                                       TANK_DIAMETER=float(data['tankDiameter']),
                                       FLUID_HEIGHT=float(data['fluidHeight']),
                                       API_COMPONENT_TYPE_NAME=data['apicomponenttypeid'],
                                       PREVENTION_BARRIER=bool(preventBarrier), EnvironSensitivity=data['EnvSensitivity'],
                                       MATERIAL_COST=float(data['materialCostFactor']),
                                       PRODUCTION_COST=float(data['productionCost']),
                                       P_lvdike=float(data['fluidLeaveDike']), P_onsite=float(data['fluidOnsite']),
                                       P_offsite=float(data['fluidOffsite']))
                rwcatank.hydraulic_water=cacal.k_h_water()
                rwcatank.hydraulic_fluid=cacal.k_h_prod()
                rwcatank.seepage_velocity=cacal.vel_s_prod()
                rwcatank.flow_rate_d1=cacal.rate_n_tank_bottom(1)
                rwcatank.flow_rate_d4=cacal.rate_n_tank_bottom(4)
                rwcatank.leak_duration_d1=cacal.ld_n_tank_bottom(1)
                rwcatank.leak_duration_d4=cacal.ld_n_tank_bottom(4)
                rwcatank.release_volume_leak_d1=cacal.Bbl_leak_n_bottom(1)
                rwcatank.release_volume_leak_d4=cacal.Bbl_leak_n_bottom(4)
                rwcatank.release_volume_rupture=cacal.Bbl_rupture_release_bottom()
                rwcatank.time_leak_ground=cacal.t_gl_bottom()
                rwcatank.volume_subsoil_leak_d1=cacal.Bbl_leak_subsoil(1)
                rwcatank.volume_subsoil_leak_d4=cacal.Bbl_leak_subsoil(4)
                rwcatank.volume_ground_water_leak_d1=cacal.Bbl_leak_groundwater(1)
                rwcatank.volume_ground_water_leak_d4=cacal.Bbl_leak_groundwater(4)
                rwcatank.barrel_dike_rupture=cacal.Bbl_rupture_indike_bottom()
                rwcatank.barrel_onsite_rupture=cacal.Bbl_rupture_ssonsite_bottom()
                rwcatank.barrel_offsite_rupture=cacal.Bbl_rupture_ssoffsite_bottom()
                rwcatank.barrel_water_rupture=cacal.Bbl_rupture_water_bottom()
                rwcatank.fc_environ_leak=cacal.FC_leak_environ_bottom()
                rwcatank.fc_environ_rupture=cacal.FC_rupture_environ_bottom()
                rwcatank.fc_environ=cacal.FC_environ_bottom()
                rwcatank.material_factor=float(data['materialCostFactor'])
                rwcatank.component_damage_cost=cacal.FC_cmd_bottom()
                rwcatank.business_cost=cacal.FC_PROD_BOTTOM()
                rwcatank.consequence=cacal.FC_total_bottom()
                rwcatank.consequencecategory=cacal.FC_Category(cacal.FC_total_bottom())
                rwcatank.liquid_height=cacal.FLUID_HEIGHT, volume_fluid=cacal.BBL_TOTAL_TANKBOTTOM()
                rwcatank.save()
                FC_TOTAL = cacal.FC_total_bottom()
                FC_CATEGORY = cacal.FC_Category(cacal.FC_total_bottom())
            TOTAL_DF_API1 = dm_cal.DF_TOTAL_API(0)
            TOTAL_DF_API2 = dm_cal.DF_TOTAL_API(3)
            TOTAL_DF_API3 = dm_cal.DF_TOTAL_API(6)
            gffTotal = models.ApiComponentType.objects.get(apicomponenttypeid= comp.apicomponenttypeid).gfftotal
            pofap1 = pofConvert.convert(float(TOTAL_DF_API1) * float(datafaci.managementfactor) * float(gffTotal))
            pofap2 = pofConvert.convert(float(TOTAL_DF_API2) * float(datafaci.managementfactor) * float(gffTotal))
            pofap3 = pofConvert.convert(float(TOTAL_DF_API3) * float(datafaci.managementfactor) * float(gffTotal))
            # thinningtype = General or Local
            refullPOF.thinningap1=dm_cal.DF_THINNING_TOTAL_API(0)
            refullPOF.thinningap2=dm_cal.DF_THINNING_TOTAL_API(3)
            refullPOF.thinningap3=dm_cal.DF_THINNING_TOTAL_API(6)
            refullPOF.sccap1=dm_cal.DF_SSC_TOTAL_API(0)
            refullPOF.sccap2=dm_cal.DF_SSC_TOTAL_API(3)
            refullPOF.sccap3=dm_cal.DF_SSC_TOTAL_API(6)
            refullPOF.externalap1=dm_cal.DF_EXT_TOTAL_API(0)
            refullPOF.externalap2=dm_cal.DF_EXT_TOTAL_API(3)
            refullPOF.externalap3=dm_cal.DF_EXT_TOTAL_API(6)
            refullPOF.brittleap1=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.brittleap2=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.brittleap3=dm_cal.DF_BRIT_TOTAL_API()
            refullPOF.htha_ap1=dm_cal.DF_HTHA_API(0)
            refullPOF.htha_ap2=dm_cal.DF_HTHA_API(3)
            refullPOF.htha_ap3=dm_cal.DF_HTHA_API(6)
            refullPOF.fatigueap1=dm_cal.DF_PIPE_API()
            refullPOF.fatigueap2=dm_cal.DF_PIPE_API()
            refullPOF.fatigueap3=dm_cal.DF_PIPE_API()
            refullPOF.fms=datafaci.managementfactor
            refullPOF.thinningtype="Local"
            refullPOF.thinninglocalap1=max(dm_cal.DF_THINNING_TOTAL_API(0), dm_cal.DF_EXT_TOTAL_API(0))
            refullPOF.thinninglocalap2=max(dm_cal.DF_THINNING_TOTAL_API(3), dm_cal.DF_EXT_TOTAL_API(3))
            refullPOF.thinninglocalap3=max(dm_cal.DF_THINNING_TOTAL_API(6), dm_cal.DF_EXT_TOTAL_API(6))
            refullPOF.thinninggeneralap1=dm_cal.DF_THINNING_TOTAL_API(0) + dm_cal.DF_EXT_TOTAL_API(0)
            refullPOF.thinninggeneralap2=dm_cal.DF_THINNING_TOTAL_API(3) + dm_cal.DF_EXT_TOTAL_API(3)
            refullPOF.thinninggeneralap3=dm_cal.DF_THINNING_TOTAL_API(6) + dm_cal.DF_EXT_TOTAL_API(6)
            refullPOF.totaldfap1=TOTAL_DF_API1
            refullPOF.totaldfap2=TOTAL_DF_API2
            refullPOF.totaldfap3=TOTAL_DF_API3
            refullPOF.pofap1=pofap1
            refullPOF.pofap2=pofap2
            refullPOF.pofap3=pofap3
            refullPOF.gfftotal=gffTotal
            refullPOF.pofap1category=dm_cal.PoFCategory(TOTAL_DF_API1)
            refullPOF.pofap2category=dm_cal.PoFCategory(TOTAL_DF_API2)
            refullPOF.pofap3category=dm_cal.PoFCategory(TOTAL_DF_API3)
            refullPOF.save()
            # damage machinsm
            damageList = dm_cal.ISDF()
            for dm in damageMachinsm:
                dm.delete()
            for damage in damageList:
                dm = models.RwDamageMechanism(id_dm=rwassessment, dmitemid_id=damage['DM_ITEM_ID'],
                                                   isactive=damage['isActive'],
                                                   df1=damage['DF1'], df2=damage['DF2'], df3=damage['DF3'],
                                                   highestinspectioneffectiveness=damage['highestEFF'],
                                                   secondinspectioneffectiveness=damage['secondEFF'],
                                                   numberofinspections=damage['numberINSP'],
                                                   lastinspdate=damage['lastINSP'].date().strftime('%Y-%m-%d'),
                                                   inspduedate=dm_cal.INSP_DUE_DATE(FC_TOTAL, gffTotal,
                                                                                    datafaci.managementfactor,
                                                                                    target.risktarget_fc).date().strftime(
                                                       '%Y-%m-%d'))
                dm.save()
            refullfc.fcofvalue=FC_TOTAL
            refullfc.fcofcategory=FC_CATEGORY
            refullfc.prodcost=data['productionCost']
            refullfc.save()
            # data for chart
            riskList = dm_cal.DF_LIST_16(refullfc.fcofvalue, gffTotal, datafaci.managementfactor, target.risktarget_fc)

            chart.riskage1=riskList[1]
            chart.riskage2=riskList[2]
            chart.riskage3=riskList[3]
            chart.riskage4=riskList[4]
            chart.riskage5=riskList[5]
            chart.riskage6=riskList[6]
            chart.riskage7=riskList[7]
            chart.riskage8=riskList[8]
            chart.riskage9=riskList[9]
            chart.riskage10=riskList[10]
            chart.riskage11=riskList[11]
            chart.riskage12=riskList[12]
            chart.riskage13=riskList[13]
            chart.riskage14=riskList[14]
            chart.riskage15=riskList[15]
            chart.risktarget=riskList[0]
            chart.save()
            return redirect('damgeFactor', proposalID= proposalID)
    except:
        raise Http404
    return render(request, 'FacilityUI/proposal/proposalTankEdit.html', {'isshell':isshell,'rwAss':rwassessment,
                                                                         'rwEq':rwequipment,'rwComp':rwcomponent,
                                                                         'rwStream':rwstream,'rwExcot':rwexcor,
                                                                         'rwCoat':rwcoat, 'rwMaterial':rwmaterial, 'rwInputCa':rwinputca,
                                                                         'assDate': assDate, 'extDate': extDate,
                                                                         'componentID': comp.componentid,
                                                                         'equipmentID': comp.equipmentid_id})
def RiskMatrix(request, proposalID):
    try:
        locatAPI1 = {}
        locatAPI2 = {}
        locatAPI3 = {}
        locatAPI1['x'] = 0
        locatAPI1['y'] = 500

        locatAPI2['x'] = 0
        locatAPI2['y'] = 500

        locatAPI3['x'] = 0
        locatAPI3['y'] = 500

        df = models.RwFullPof.objects.get(id=proposalID)
        ca = models.RwFullFcof.objects.get(id=proposalID)
        rwAss = models.RwAssessment.objects.get(id=proposalID)
        component = models.ComponentMaster.objects.get(componentid=rwAss.componentid_id)
        if component.componenttypeid_id == 8 or component.componenttypeid_id == 12 or component.componenttypeid_id == 14 or component.componenttypeid_id == 15:
            isTank = 1
        else:
            isTank = 0

        if component.componenttypeid_id == 8:
            isShell = 1
        else:
            isShell = 0
        Ca = round(ca.fcofvalue, 2)
        DF1 = round(df.totaldfap1, 2)
        DF2 = round(df.totaldfap2, 2)
        DF3 = round(df.totaldfap3, 2)
    except:
        raise Http404
    return render(request, 'FacilityUI/risk_summary/riskMatrix.html',{'API1':location.locat(df.totaldfap1, ca.fcofvalue), 'API2':location.locat(df.totaldfap2, ca.fcofvalue),
                                                                      'API3':location.locat(df.totaldfap3, ca.fcofvalue),'DF1': DF1,'DF2': DF2,'DF3': DF3, 'ca':Ca,
                                                                      'ass':rwAss,'isTank': isTank, 'isShell': isShell, 'df':df, 'proposalID':proposalID})
def FullyDamageFactor(request, proposalID):
    try:
        df = models.RwFullPof.objects.get(id= proposalID)
        rwAss = models.RwAssessment.objects.get(id= proposalID)
        data={}
        component = models.ComponentMaster.objects.get(componentid=rwAss.componentid_id)
        if component.componenttypeid_id == 8 or component.componenttypeid_id == 12 or component.componenttypeid_id == 14 or component.componenttypeid_id == 15:
            isTank = 1
        else:
            isTank = 0
        if component.componenttypeid_id == 8:
            isShell = 1
        else:
            isShell = 0
        data['gfftotal'] = df.gfftotal
        data['fms'] = df.fms
        data['thinningap1'] = roundData.roundDF(df.thinningap1)
        data['thinningap2'] = roundData.roundDF(df.thinningap2)
        data['thinningap3'] = roundData.roundDF(df.thinningap3)
        data['sccap1'] = roundData.roundDF(df.sccap1)
        data['sccap2'] = roundData.roundDF(df.sccap2)
        data['sccap3'] = roundData.roundDF(df.sccap3)
        data['externalap1'] = roundData.roundDF(df.externalap1)
        data['externalap2'] = roundData.roundDF(df.externalap2)
        data['externalap3'] = roundData.roundDF(df.externalap3)
        data['htha_ap1'] = roundData.roundDF(df.htha_ap1)
        data['htha_ap2'] = roundData.roundDF(df.htha_ap2)
        data['htha_ap3'] = roundData.roundDF(df.htha_ap3)
        data['brittleap1'] = roundData.roundDF(df.brittleap1)
        data['brittleap2'] = roundData.roundDF(df.brittleap2)
        data['brittleap3'] = roundData.roundDF(df.brittleap3)
        data['fatigueap1'] = roundData.roundDF(df.fatigueap1)
        data['fatigueap2'] = roundData.roundDF(df.fatigueap2)
        data['fatigueap3'] = roundData.roundDF(df.fatigueap3)
        data['thinninggeneralap1'] = roundData.roundDF(df.thinninggeneralap1)
        data['thinninggeneralap2'] = roundData.roundDF(df.thinninggeneralap2)
        data['thinninggeneralap3'] = roundData.roundDF(df.thinninggeneralap3)
        data['thinninglocalap1'] = roundData.roundDF(df.thinninglocalap1)
        data['thinninglocalap2'] = roundData.roundDF(df.thinninglocalap2)
        data['thinninglocalap3'] = roundData.roundDF(df.thinninglocalap3)
        data['totaldfap1'] = roundData.roundDF(df.totaldfap1)
        data['totaldfap2'] = roundData.roundDF(df.totaldfap2)
        data['totaldfap3'] = roundData.roundDF(df.totaldfap3)
        data['pofap1'] = roundData.roundPoF(df.pofap1)
        data['pofap2'] = roundData.roundPoF(df.pofap2)
        data['pofap3'] = roundData.roundPoF(df.pofap3)
        data['pofap1category'] = df.pofap1category
        data['pofap2category'] = df.pofap2category
        data['pofap3category'] = df.pofap3category
    except:
        raise Http404
    return render(request, 'FacilityUI/risk_summary/dfFull.html', {'obj':data, 'assess': rwAss, 'isTank': isTank,
                                                                   'isShell': isShell, 'proposalID':proposalID})