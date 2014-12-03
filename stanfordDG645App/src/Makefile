TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = stanfordDG645
# stanfordDG645.dbd will be created and installed
DBD += stanfordDG645.dbd

# stanfordDG645.dbd will be made up from these files:
stanfordDG645_DBD += base.dbd

# Include dbd files from all support applications:
stanfordDG645_DBD += caPutLog.dbd
stanfordDG645_DBD += asyn.dbd
stanfordDG645_DBD += stream.dbd
stanfordDG645_DBD += drvAsynIPPort.dbd
stanfordDG645_DBD += system.dbd
stanfordDG645_DBD += asSupport.dbd
stanfordDG645_DBD += devIocStats.dbd


# Add all the support libraries needed by this IOC
stanfordDG645_LIBS += caPutLog
stanfordDG645_LIBS += stream
stanfordDG645_LIBS += asyn
stanfordDG645_LIBS += devIocStats
stanfordDG645_LIBS += autosave

# stanfordDG645_registerRecordDeviceDriver.cpp derives from stanfordDG645.dbd
stanfordDG645_SRCS += stanfordDG645_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
stanfordDG645_SRCS_DEFAULT += stanfordDG645Main.cpp
stanfordDG645_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#stanfordDG645_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
stanfordDG645_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

