#!/bin/env Rscript


#Created by: Easton R. White
#Last edited: 21-May-2014 

#this script contains codes for basic analyses using ADMB in R for Cocos data set

#require pacakges
require(glmmADMB)
require(MuMIn)


#######################################################################
#######################################################################
######Setup for Westgird#####

CocosData=read.csv('/home/erwhite1/data/FINAL_Cocos_Dataset_11species.txt',header=T,sep=',')

CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)


#Run basic models


## Whitetips (GLMM with negative binomial error function)
Whitetips_NB_GLMM_full_model <- glmmadmb(formula=Whitetips~StudyYear+CurrentCode+SeaTempCelsius+VisibilityMeters+ElNinoIndex+SIN_TIME+COS_TIME+(1|DiverCode)+(1|SiteCode),data=CocosData,family="nbinom",extra.args="-ndi 30000",zeroInflation=FALSE)
Whitetips_NB_GLMM_mumin <- dredge(Whitetips_NB_GLMM_full_model,rank="AIC",subset=(COS_TIME | !SIN_TIME) && (!COS_TIME | SIN_TIME))
#subset(Whitetips_ZINB_GLMM_mumin,delta<5)
#model.avg(Whitetips_ZINB_GLMM_mumin, delta<2)
#summary(get.models(Whitetips_ZINB_GLMM_mumin,1)[[1]])

save(Whitetips_NB_GLMM_mumin,file='/home/erwhite1/data/Whitetips_NB_GLMM_mumin.Rdata')






