claims<-read.csv("c:/users/shivam/desktop/hertage health/hhp_release1/claims_y1.csv")

table(claims$LengthOfStay)
claims2<-claims
library(car)


#Member ID and Length of Stay
claims3<-recode(claims$LengthOfStay,'c("1- 2 weeks")=11;c("1 day")=1;c("12-26 weeks")=126;c("2- 4 weeks")=21;c("2 days")=2;c("26+ weeks")=180;c("3 days")=3;c("4- 8 weeks")=42;c("4 days")=4;c("5 days")=5;c("6 days")=6;c("8-12 weeks")=84;c("")=0')
claims2$LengthOfStay<-as.numeric(levels(claims3))[claims3]
cl4<-data.frame(as.factor(claims2$MemberID),claims2$LengthOfStay)
names(cl4)<-c("MemberID","LengthOfStay")
cl<-aggregate(. ~ MemberID,data=cl4,sum)
cl
names(claims2)

#Specialty and Length of Stay
spl<-data.frame(claims2$specialty,claims2$LengthOfStay)
names(spl)<-c("specialty","LengthOfStay")
spl1<-aggregate(. ~ specialty,data=spl,sum)
spl


#Place of Service and Length of Stay
pos<-data.frame(claims2$placesvc,claims2$LengthOfStay)
names(pos)<-c("placesvc","LengthOfStay")
pos1<-aggregate(. ~ placesvc,data=pos,sum)
pos1  


#Length of stay and Paydelay
pay<-data.frame(claims2$paydelay,claims2$LengthOfStay)
cor(pay,use="pairwise.complete.obs")


#Primary Condition Group and Length of Stay
pcg<-data.frame(claims2$PrimaryConditionGroup,claims2$LengthOfStay)
names(pcg)<-c("PrimaryConditionGroup","LengthOfStay")
pcg1<-aggregate(. ~ PrimaryConditionGroup,data=pcg,sum)
pcg1  

dum<-claims2$PrimaryConditionGroup
dum2<-model.matrix(~dum)


claimss<-claims2