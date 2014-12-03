#!../../bin/linux-x86_64/stanfordDG645

## You may have to change stanfordDG645 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/stanfordDG645.dbd",0,0)
stanfordDG645_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/stanfordDG645.db","user=swilkins")

iocInit()

## Start any sequence programs
#seq sncstanfordDG645,"user=swilkins"
