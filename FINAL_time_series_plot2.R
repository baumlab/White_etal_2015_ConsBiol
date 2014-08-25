
#Created by Easton R. White
#Last edited: 21-Jul-2014
#Created: 19-Jun-2014

#this script creates a multi panel plot with 12 elasmobranch species found at Cocos Island



#layout for 12 time series plots plus a legend
#nf<-layout(matrix(c(0,1,1,2,2,3,3,0,4,4,5,5,6,6,7,7,0,0,8,8,9,9,13,13,0,10,10,11,11,12,12,0), 4, 8, byrow=TRUE),respect=T)
#nf<-layout(matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), 3,4, byrow=TRUE),respect=T)
#nf<-layout(matrix(c(1,1,2,2,3,3,0,0,4,4,5,5,6,6,7,7,8,8,9,9,13,13,0,0,10,10,11,11,12,12,0,0), 4, 8, byrow=TRUE),respect=T)
nf<-layout(matrix(c(1,1,2,2,3,3,0,0,4,4,5,5,6,6,7,7,8,8,9,9,0,0,0,0,10,10,11,11,12,12,13,13), 4, 8, byrow=TRUE),respect=T)

#12 species plots

#call in data
CocosData=read.table("FINAL_Cocos_Dataset_11species.txt",sep=',',header=T)
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)


par(oma=c(2,4,2,2))

#Hammerhead plot
o<-par(mar=c(2,4,1,0.5),mgp=c(3,0.7,0))
plot(aggregate(exp(predict(Hammerhead_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,160),col='black',lty=1)
points(aggregate(CocosData$Hammerhead,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('scalloped hammerhead',3,line=0.1,cex=0.6,font=2)
mtext('(a)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

mtext('pelagic sharks',2,line=5,font=3,cex=0.72)


#tiger plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(Tiger_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',col='black',lty=1,ylim=c(0,0.18))
points(aggregate(CocosData$Tiger,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('tiger',3,line=0.1,cex=0.6,font=2)
mtext('(b)',3,line=-1.1,cex=0.8,font=2,at=2012.5)


#silky plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(Silky_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,0.35),col='black',lty=1)
points(aggregate(CocosData$Silky,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('silky',3,line=0.1,cex=0.6,font=2)
mtext('(c)',3,line=-1.1,cex=0.8,font=2,at=2012.5)


#whitetips plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(Whitetips_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,80),col='black',lty=1)
points(aggregate(CocosData$Whitetips,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('whitetip reef',3,line=0.1,cex=0.6,font=2)
mtext('(d)',3,line=-1.1,cex=0.8,font=2,at=2012.5)
mtext('reef-associated sharks',2,line=5,font=3,cex=0.72)

#blacktip plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(Blacktip_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',col='black',lty=1,ylim=c(0,0.1))
points(aggregate(CocosData$Blacktip,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('blacktip',3,line=0.1,cex=0.6,font=2)
mtext('(e)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

#Galapagos plot
o<-par(mar=c(2,4,1,0.45))
plot(aggregate(exp(predict(Galapagos_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',col='black',lty=1,ylim=c(0,0.5))
points(aggregate(CocosData$Galapagos,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('Galapagos',3,line=0.1,cex=0.6,font=2)
mtext('(f)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

#Silvertip plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(Silvertip_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',col='black',lty=1,ylim=c(0,0.1))
points(aggregate(CocosData$Silvertip,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('silvertip',3,line=0.1,cex=0.6,font=2)
mtext('(g)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

#eagle rays plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(EagleRays_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,2.5),col='black',lty=1)
points(aggregate(CocosData$EagleRays,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('eagle ray',3,line=0.1,cex=0.6,font=2)
mtext('(h)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

mtext('bottom-feeding rays',2,line=5,font=3,cex=0.72)

#call in data
CocosData=read.table("FINAL_Cocos_Dataset_marblerays.txt",sep=',',header=T)
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)


#marble rays plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(MarbleRays_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,20),col='black',lty=1)
points(aggregate(CocosData$MarbleRays,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('marble ray',3,line=0.1,cex=0.6,font=2)
mtext('(i)',3,line=-1.1,cex=0.8,font=2,at=2011.5)


#call in data
CocosData=read.table("FINAL_Cocos_Dataset_11species.txt",sep=',',header=T)
CocosData$SiteCode <- as.factor(CocosData$SiteCode)
CocosData$CurrentCode <- as.factor(CocosData$CurrentCode)
CocosData$DiverCode <- as.factor(CocosData$DiverCode)

CocosData$SIN_TIME=sin(2*pi*CocosData$StudyJulianDate/365.25)
CocosData$COS_TIME=cos(2*pi*CocosData$StudyJulianDate/365.25)


#Whale shark plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(WhaleShark_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',col='black',lty=1,ylim=c(0,0.05))
points(aggregate(CocosData$Whale.Shark,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Probability of occurrence',2,line=2.8,cex=0.6,font=2)
mtext('whale shark',3,line=0.1,cex=0.6,font=2)
mtext('(j)',3,line=-1.1,cex=0.8,font=2,at=2012.5)
mtext('planktivores',2,line=5,font=3,cex=0.72)


#mobula rays plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(MobulaRays_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,1.75),col='black',lty=1)
points(aggregate(CocosData$MobulaRays,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('mobula ray',3,line=0.1,cex=0.6,font=2)
mtext('(k)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

#manta rays plot
o<-par(mar=c(2,4,1,0.5))
plot(aggregate(exp(predict(MantaRays_Final_Model)),by=list(CocosData$Year),FUN=mean),las=1,type='o',pch=17,ylab='',xlab='',ylim=c(0,0.2),col='black',lty=1)
points(aggregate(CocosData$MantaRays,by=list(CocosData$Year),FUN=mean),col='black',type='o',pch=16)
mtext('Number of individuals',2,line=2.8,cex=0.6,font=2)
mtext('manta ray',3,line=0.1,cex=0.6,font=2)
mtext('(l)',3,line=-1.1,cex=0.8,font=2,at=2012.5)

###############
plot(1, type="n", axes=F, xlab="", ylab="")
legend(0.6,1.2,legend=c('Data','Model estimates'),pch=c(16,17),lty=c(1,1),col=c('black','black'),cex=1.2)

mtext('Year',side=1,outer=T,line=-0.5,cex=1,font=2)


