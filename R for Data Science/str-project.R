library(dplyr)
library(stringr)
library(sqldf)
library(RSQLite)
library(ggplot2)
con4=dbConnect(RSQLite::SQLite(),dbname="/Users/liangdameinv/downloads/youtubeData-2.db")
dbListTables(con4)
comment=dbReadTable(con4,"youtubeComments")

m1=comment[which(str_count(comment$Comment, "entertaining")>0),]
m2=comment[which(str_count(comment$Comment, "best")>0),]
m3=comment[which(str_count(comment$Comment, "favorite")>0),]
m4=comment[which(str_count(comment$Comment, "love")>0),]
r3=sqldf("select VideoId,count(VideoId) as n from m4
         group by VideoId
         order by n 
         desc")
r3
r3=as.matrix(r3)
r5=str_sub(r3[,1],1,3)
r6=str_sub(r4[,1],1,3)


r4=sqldf("select VideoId,count(VideoId) as n from m2
         group by VideoId
         order by n 
         desc")
r4
r4=as.matrix(r4)
l=c(rep(0,1000))
for(i in 1:nrow(r4))
l[i]=data[which(data$video.ID==r4[i,1]),4]
data2=l[1:nrow(r4)]
data3=cbind(r4,data2)
r7=sqldf("select data2,sum(n) as t from data3
         group by data2
         order by t 
         desc")
r7
p=ggplot(r7,aes(data2,t,fill=data2))+
  geom_bar(stat='identity')+
  geom_text(aes(label=t),vjust=-0.2)+
  theme(axis.text.x=element_text(angle=30,hjust=1))+
  xlab("category")+
  ylab('numbers of "best" comment')
p+labs(title="numbers of 'best' comment of each category")


l1=c(rep(0,1000))
for(i in 1:nrow(r3))
  l1[i]=data[which(data$video.ID==r3[i,1]),4]
data4=l1[1:nrow(r3)]
data5=cbind(r3,data4)
r8=sqldf("select data4,sum(n) as t from data5
         group by data4
         order by t 
         desc")
r8
p=ggplot(r8,aes(data4,t,fill=data4))+
  geom_bar(stat='identity')+
  geom_text(aes(label=t),vjust=-0.2)+
  theme(axis.text.x=element_text(angle=30,hjust=1))+
  xlab("category")+
  ylab('numbers of "love" comment')
p+labs(title="numbers of 'love' comment of each category")


con5=dbConnect(RSQLite::SQLite(),dbname="/Users/liangdameinv/project.sqlite")
data=read.csv("/Users/liangdameinv/Desktop/0222/newtxt0(1).csv")
RSQLite::initRegExp(con5)
dbWriteTable(conn=con5,name="project",data,append=TRUE,row.names=FALSE)
project=dbReadTable(con5,"project")

data=read.csv("/Users/liangdameinv/Desktop/0222/newtxt0(1).csv")
library(grid)
library(RSQLite)
library(dplyr)
#install.packages("grid")

## x = 0.5, y =0.5, radius = size of circle (use 0.25 for best results),
## timeframe = "Label", dcon = connection to the youtubeData database,
## category = what category to use (probably change this), days = number of days
## total = how many total values to look at
## start = where to start
killer_plot <- function(x, y, radius,timeframe, dcon, category, days, total, start){
  query <- paste0("SELECT Category, round(Age / ", days,") as Month, Age, 
  avg(Views) as Views_AVG, avg(Rate)as Rate_AVG
    FROM project 
    WHERE Uploader IS NOT NULL AND Category = '",
                  category, "'",
                  "GROUP BY Month, Category
     LIMIT ", total)
  res <- dbSendQuery(conn = dcon, query)
  data = dbFetch(res, -1)
  grid.newpage()
  vpCenter <- viewport(x = x, y = y)
  rate = data$Rate_AVG
  labels = data$Month
  views <- data$Views_AVG
  
  ## Color used for Views
  colors = rep(c("blue", "purple"), times=nrow(data))
  
  ## Change the order of which one is first
  if (start <= nrow(data)) {
    rate = c(rate[start:length(rate)], rate[1:start-1])
    labels = c(labels[start:length(labels)], labels[1:start-1])
    views = c(views[start:length(views)], views[1:start-1])
  }
  
  
  
  ## Gets ratio of views
  maxVal = max(data$Views_AVG)
  ratio = maxVal / 0.2
  ratioLabel = maxVal/0.25
  
  ## Circle
  grid.circle(x=x, y=x, r=radius, vp = vpCenter, draw=TRUE)
  
  ## Go through each month
  for (i in 1:nrow(data)){
    ## Viewport shifted 30 degrees
    angle = 360/nrow(data)
    vpTemp <- viewport(x=x, y=y, width  = unit( x*2, 'snpc'), 
                       height = unit( y*2, 'snpc'), angle = angle *i - angle/2)
    
    ## Ratio Rate
    ratioRate = rate[i]/5
    
    ## Assign different colors for each rate based on the value
    if (ratioRate < 0.33) {
      color = "red"
    } else if (ratioRate > 0.66) {
      color = "green"
    } else {
      color = "yellow"
    }
    
    ## Fill in the Rate and View
    for (j in seq(0, angle * (pi/180), by=angle * (pi/180)/500)) {
      ## Both of these are done by drawing lines around the arcs of the circles
      ## with different colors 
      
      ## Circle Filling
      grid.lines(x= c(x, x+(radius) * sin(j)),
                 y= c(y, y +(radius) * cos(j)),
                 vp=vpTemp, gp =gpar(col="lightblue"))
      ## Rate Filling
      grid.lines(x= c(x, x+(radius *ratioRate) * sin(j)),
                 y= c(y, y +(radius *ratioRate) * cos(j)),
                 vp=vpTemp, gp =gpar(col=color))
      
      ## View Filling
      grid.lines(x= c(x + (radius)*sin(j), x+(radius +views[i]/ratio) * sin(j)),
                 y= c(y + (radius)*cos(j), y +(radius + views[i]/ratio) * cos(j)),
                 vp=vpTemp, gp =gpar(col=colors[i]))
    }
    
    
    if (nrow(data) > 1) {
      ## Makes Histogram Heights Based off of data i
      grid.lines(x = c(x, x),
                 y = c(y, y+radius + views[i]/ratio),
                 vp = vpTemp)
      
      ## Even out lines
      vpTemp <- viewport(x = x, y = y, angle = i * angle - angle/2)
      grid.lines(x = c(x, x),
                 y = c(y, y+radius + views[i]/ratio),
                 vp = vpTemp)
    }
    
    vpTemp <- viewport(x=x, y=y, angle = i * angle)
    grid.text(paste0(timeframe, " ", i), x, y +(radius + (maxVal*1.1)/ratio),gp=gpar(fontsize=12, col="black"), vp = vpTemp)
    
  }
}

              