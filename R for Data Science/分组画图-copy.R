install.packages("patchwork")
library(ggplot2)
library(dplyr)
library(patchwork)#这个包可以把多个图形放在一起

newdata=data.frame(category=data$category,views=data$views,
                   comments=data$comments)

new_um=subset(newdata,newdata$category==" UNA "|newdata$category=="Music")
new_um$category=factor(new_um$category)
nrow(new_um)
p=ggplot(new_um,aes(comments,views,fill=category))+
  geom_point(aes(color=category,shape=category),size=3)+
  ylim(0,max(new_um$views))+
  ggtitle("comparison between UNA and Music")
p

new_um1=subset(new_um,new_um$comments<=4000&new_um$views<=30000)
new_um2=subset(new_um,new_um$comments>4000&new_um$views>30000)
new_um3=subset(new_um,new_um$comments<=4000&new_um$views>30000)
new_um4=subset(new_um,new_um$comments>4000&new_um$views<=30000)
nrow(new_um1)
nrow(new_um2)
nrow(new_um3)
nrow(new_um4)
p1=ggplot(new_um1,aes(comments,views,fill=category))+
  geom_point(aes(color=category,shape=category),size=3)+
  ylim(0,max(new_um1$views)*1.05)+
  ggtitle("comparison between UNA and Music")+
  xlab("comments(<1500)")+
  ylab("views<=30000")
p1

p2=ggplot(new_um2,aes(comments,views,fill=category))+
  geom_point(aes(color=category,shape=category),size=3)+
  xlim(1000,max(new_um2$comments))+
  ylim(10000,max(new_um2$views)+1.05)+
  ggtitle("comparison between UNA and Music")+
  xlab("comments(>4000)")+
  ylab("views>30000")
p2

p3=ggplot(new_um3,aes(comments,views,fill=category))+
  geom_point(aes(color=category,shape=category),size=3)+
  ylim(0,max(new_um3$views))+
  ggtitle("comparison between UNA and Music")+
  xlab("comments(<4000)")+
  ylab("views>30000")
p3

p=p1+p2+p3
p