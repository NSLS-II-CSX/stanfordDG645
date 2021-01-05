#!../../bin/linux-x86_64/stanfordDG645

## You may have to change stanfordDG645 to something else
## everywhere it appears in this file

< envPaths
< /epics/common/xf23id1-ioc3-netsetup.cmd


## Register all support components
dbLoadDatabase("../../dbd/stanfordDG645.dbd",0,0)
stanfordDG645_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/proto")
drvAsynIPPortConfigure("IP1", "xf23id1-dlgn1.nsls2.bnl.local:5025")
#asynSetTraceMask("IP1", 0, 0x9)
#asynSetTraceIOMask("IP1", 0, 0x2)
drvAsynIPPortConfigure("IP2", "xf23id1-dlgn2.nsls2.bnl.local:5025")
#asynSetTraceMask("IP2", 0, 0x9)
#asynSetTraceIOMask("IP2", 0, 0x2)

# Change into TOP
cd("$(TOP)")

## Load record instances
dbLoadTemplate("db/dg645.substitutions")

asSetFilename("/epics/common/xf23id.acf")

system("install -m 777 -d $(TOP)/as/save") 
system("install -m 777 -d $(TOP)/as/req")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")
set_pass0_restoreFile("info_positions.sav")
set_pass1_restoreFile("info_settings.sav")

iocInit()

caPutLogInit("xf23id-ca.cs.nsls2.local:7004", 0)

cd ${TOP}/as/req
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

dbl > ${TOP}/records.dbl
system("cp ${TOP}/records.dbl /cf-update/xf23id1-ioc3.es-dg645.dbl")


