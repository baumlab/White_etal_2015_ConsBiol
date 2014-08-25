

#this script creates a figure that displayed the observation distributions for each species with count data

#call in data
CocosData=read.table("FINAL_Cocos_Dataset_11species.txt",sep=',',header=T)
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)



nf<-layout(matrix(c(1:6), 3, 2, byrow=TRUE),respect=T)

par(oma=c(2,0,0,0))


o<-par(mar=c(2,4,1,0),mgp=c(3,0.6,0))

#histogram with zeros removed from distributions
bbb=hist(CocosData$Hammerhead[CocosData$Hammerhead>0],breaks='Scott',plot=F)
   		plot(bbb,ylim=c(0,8000),ylab='',xlab='',main='',las=1,col='black')
 
mtext('(a)',3,line=-1.5,cex=0.8,font=2,adj=1)




#histogram with zeros removed from distributions
bbb=hist(CocosData$Whitetips[CocosData$Whitetips>0],breaks='Scott',plot=F)
   		plot(bbb,ylab='',xlab='',main='',las=1,col='black',ylim=c(0,6000))
 
mtext('(b)',3,line=-1.5,cex=0.8,font=2,adj=1)




bbb=hist(CocosData$EagleRays[CocosData$EagleRays>0],breaks='Scott',plot=F)
   		plot(bbb,ylim=c(0,3500),xlim=c(0,60),ylab='',xlab='',main='',las=1,col='black')
 
mtext('(c)',3,line=-1.5,cex=0.8,font=2,adj=1)



#################
CocosData=read.table('FINAL_Cocos_Dataset_marblerays.txt',header=T,sep=',')
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)
CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)

bbb=hist(CocosData$MarbleRays[CocosData$MarbleRays>0],breaks='Scott',plot=F)
   		plot(bbb,ylim=c(0,3500),ylab='',xlab='',main='',las=1,col='black')
 
mtext('(d)',3,line=-1.5,cex=0.8,font=2,adj=1)

##########################

#call in data
CocosData=read.table("FINAL_Cocos_Dataset_11species.txt",sep=',',header=T)
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)



bbb=hist(CocosData$MobulaRays[CocosData$MobulaRays>0],breaks='Scott',plot=F)
   		plot(bbb,ylim=c(0,1500),ylab='',xlab='',main='',las=1,col='black')
 
mtext('(e)',3,line=-1.5,cex=0.8,font=2,adj=1)



bbb=hist(CocosData$MantaRays[CocosData$MantaRays>0],breaks='Scott',plot=F)
   		plot(bbb,ylim=c(0,800),xlim=c(0,15),ylab='',xlab='',main='',las=1,col='black')
 
mtext('(f)',3,line=-1.1,cex=0.8,font=2,adj=1)


mtext('Frequency',side=2,outer=T,font=2,line=-3,cex=0.8)
mtext('Number observed per dive',side=1,outer=T,font=2,line=-0.1,cex=0.8)
