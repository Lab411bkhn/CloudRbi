import os
from django.core.wsgi import get_wsgi_application

os.environ['DJANGO_SETTINGS_MODULE'] = 'rbi.settings'
application = get_wsgi_application()

from cloud.process.RBI import models
from dateutil import relativedelta

def convertDF(DF):
    if DF == 0 or DF is None:
        return 'N/A'
    elif DF <= 2:
        return 'A'
    elif DF <= 20:
        return 'B'
    elif DF <= 100:
        return 'C'
    elif DF <= 1000:
        return 'D'
    else:
        return 'E'


def convertCA(CA):
    if CA == 0 or CA is None:
        return 0
    elif CA <= 10000:
        return 1
    elif CA <= 100000:
        return 2
    elif CA <= 1000000:
        return 3
    elif CA <= 10000000:
        return 4
    else:
        return 5


def convertRisk(CA, DF):
    if CA == 0 or DF == 'N/A':
        return 'N/A'
    elif CA in (1, 2) and DF in ('A', 'B', 'C'):
        return "Low"
    elif (CA in (1, 2) and DF == 'D') or (CA in (3, 4) and DF in ('A', 'B')) or (CA == 3 and DF == 'C'):
        return "Medium"
    elif (CA == 5 and DF in ('C', 'D', 'E')) or (CA == 4 and DF == 'E'):
        return "High"
    else:
        return "Medium High"


def checkData(data):
    if data is None:
        return 0
    else:
        return data


def getC_risk(idx):
    dataGeneral = {}
    new = models.RwAssessment.objects.filter(componentid=idx).order_by('-id')
    if new.count() != 0:
        newest = new[0]
        component = models.ComponentMaster.objects.get(componentid=idx)
        if component.componenttypeid_id == 8 or component.componenttypeid_id == 12 or component.componenttypeid_id == 14 or component.componenttypeid_id == 15:
            isTank = 1
        else:
            isTank = 0
        equip = models.EquipmentMaster.objects.get(equipmentid=component.equipmentid_id)
        fcof = models.RwFullFcof.objects.get(id=newest.id)
        fpof = models.RwFullPof.objects.get(id=newest.id)

        dataGeneral['equipment_name'] = equip.equipmentname
        dataGeneral['equipment_desc'] = equip.equipmentdesc
        dataGeneral['equipment_type'] = models.EquipmentType.objects.get(
            equipmenttypeid=equip.equipmenttypeid_id).equipmenttypename
        dataGeneral['component_name'] = component.componentname
        dataGeneral['init_thinning'] = fpof.thinningap1
        dataGeneral['init_cracking'] = fpof.sccap1
        dataGeneral['init_other'] = fpof.htha_ap1 + fpof.brittleap1 + fpof.fatigueap1
        dataGeneral['init_pof'] = fpof.thinningap1 + fpof.sccap1 + fpof.htha_ap1 + fpof.brittleap1
        dataGeneral['ext_thinning'] = fpof.externalap1
        dataGeneral['pof_catalog'] = fpof.totaldfap1
        dataGeneral['pof_catalog2'] = fpof.totaldfap2
        dataGeneral['pof_val'] = fpof.pofap1
        dataGeneral['risk'] = fpof.pofap1 * fcof.fcofvalue
        dataGeneral['risk_future'] = fpof.pofap2 * fcof.fcofvalue

        if isTank:
            data1 = models.RwCaTank.objects.get(id=newest.id)
            data2 = models.RwInputCaTank.objects.get(id=newest.id)
            dataGeneral['flamable'] = checkData(data1.component_damage_cost)
            dataGeneral['inj'] = 0
            dataGeneral['business'] = checkData(data1.business_cost)
            dataGeneral['env'] = checkData(data1.fc_environ)
            dataGeneral['consequence'] = checkData(data1.consequence)
            dataGeneral['fluid'] = checkData(data2.api_fluid)
            dataGeneral['fluid_phase'] = 'Liquid'
        else:
            data1 = models.RwCaLevel1.objects.get(id=newest.id)
            data2 = models.RwInputCaLevel1.objects.get(id=newest.id)
            dataGeneral['flamable'] = checkData(data1.fc_cmd)
            dataGeneral['inj'] = checkData(data1.fc_inj)
            dataGeneral['business'] = checkData(data1.fc_prod)
            dataGeneral['env'] = checkData(data1.fc_envi)
            dataGeneral['consequence'] = checkData(data1.fc_total)
            dataGeneral['fluid'] = checkData(data2.api_fluid)
            dataGeneral['fluid_phase'] = data2.system
        return dataGeneral


def getE_risk(idx):
    riskE = []
    listComponent = models.ComponentMaster.objects.filter(equipmentid=idx)
    if listComponent.count() != 0:
        for com in listComponent:
            comRisk = getC_risk(com.componentid)
            riskE.append(comRisk)
        return riskE


def getF_risk(idx):
    riskF = []
    lisEquipment = models.EquipmentMaster.objects.filter(facilityid=idx)
    if lisEquipment.count() != 0:
        for eq in lisEquipment:
            riskF.append(getE_risk(eq.equipmentid))
        return riskF


def getS_risk(idx):
    riskS = []
    lisFacility = models.Facility.objects.filter(siteid=idx)
    if lisFacility.count() != 0:
        for fa in lisFacility:
            riskS.append(getF_risk(fa.facilityid))
        return riskS

def getC_insp(idx):
    data = []
    new = models.RwAssessment.objects.filter(componentid=idx).order_by('-id')
    if new.count() != 0:
        newest = new[0]
        equip = models.EquipmentMaster.objects.get(equipmentid= newest.equipmentid_id)
        insp = models.RwDamageMechanism.objects.filter(id_dm= newest.id)
        if insp.count() > 0:
            for a in insp:
                dataGeneral = {}
                dataGeneral['System'] = 'Inspection ' + str(models.ComponentMaster.objects.get(componentid= newest.componentid_id).componentname)
                dataGeneral['Equipment'] = equip.equipmentname
                dataGeneral['Damage'] = models.DmItems.objects.get(dmitemid= a.dmitemid_id).dmdescription
                dataGeneral['Method'] = 'ACFM'
                dataGeneral['Coverage'] = 'N/A'
                dataGeneral['Avaiable'] = 'online'
                dataGeneral['Last'] = a.lastinspdate.date()
                dataGeneral['Duedate'] = a.inspduedate.date()
                dataGeneral['Interval'] = round((insp[0].inspduedate - insp[0].lastinspdate).days/365 ,2)
                data.append(dataGeneral)
    return data

def getE_insp(idx):
    riskE = []
    listComponent = models.ComponentMaster.objects.filter(equipmentid=idx)
    if listComponent.count() != 0:
        for com in listComponent:
            comRisk = getC_insp(com.componentid)
            riskE.append(comRisk)
        return riskE


def getF_insp(idx):
    riskF = []
    lisEquipment = models.EquipmentMaster.objects.filter(facilityid=idx)
    if lisEquipment.count() != 0:
        for eq in lisEquipment:
            riskF.append(getE_insp(eq.equipmentid))
        return riskF


def getS_insp(idx):
    riskS = []
    lisFacility = models.Facility.objects.filter(siteid=idx)
    if lisFacility.count() != 0:
        for fa in lisFacility:
            riskS.append(getF_insp(fa.facilityid))
        return riskS