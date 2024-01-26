## -----------------------------------------------------------------------------
## *********** Flipped class problems for script 05
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------
## **** `cat` and `paste`, loops and conditional evaluation
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------
## ** Open the following address in a browser to verify it works OK
##       https://www.advfn.com/stock-market/NASDAQ/COST/stock-price
##    1) What you need to do is, starting from the example above,
##       use `paste` to generate correct calls to show the corresponding
##       financial data of the tickers of the following companies that trade
##       in the exchanges in parentheses:
##          IBM(NYSE)
##          COST (NASDAQ)
##          BRK.B (NYSE)
##          AAL (NASDAQ)
##       The idea is that your data should be a two column `data.frame` with
##       as many rows as necessary (consider that your real data would have
##       hundreds of companies, not only these 4), and you should be able
##       with a single call to `paste` or `paste0`, to generate *all* the correct
##       web addresses, that a web crawler could use to visit the web pages to
##       scrape info from them (we are going to do this in a future lecture).
##    2) You are going to download (`download.file`) each of the web pages to a
##       folder called "tmpweb". You need to first check if it exists. If it
##       does not, create it (see functions starting with `dir.`).
##       [Note: To avoid that an unwanted mistake could erase all your data in
##              your 405/605 folder, we are going to avoid any programmatic
##              deletions of files and folders
##              (do it manually after you are done with this problem).
##    3) Download (`download.file`) each of the files to the created folder,
##       naming them consistently using the exchange and ticker of your
##       data.frame (and extension "html"), and outputting which file is
##       being downloaded, together with which number of download is this
##       in relation to the total (1/4, 2/4,...). Each output must be done
##       with a single call to `cat` before the download of the corresponding
##       page. After each is downloaded, output "Done!" 
##    4) Forgetting that you have the `data.frame`, find a function that allows 
##       to get all the file names in a given path (search the web to find it),
##       and, using `readLines` show the first line (should be the same for
##       each file) after outputting the name of the file. Only output cases
##       that belong to the NYSE exchange
##       (Hint: function `substr` can be of help).
##


## * Begin solution
a=c("IBM","COST","BRK.B","AAL")
b=c("NYSE","NASDAQ","NYSE","NASDAQ")
d=c(rep(0,4))
for(i in 1:4)
  d[i]=paste(b[i],a[i],sep="/")
d
e=c(rep(0,4))
for(i in 1:4)
  e[i]=paste("https:/","www.advfn.com","stock-market",d[i],"stock-price",sep="/")
e

getwd()
dir.create(path="/Users/liangdameinv/Desktop/tmpweb", recursive = T)

f=data.frame(a,b)
for(i in 1:4)
  {fi=paste(a[i],b[i])
  download.file(e[i],destfile=paste("/Users/liangdameinv/Desktop/tmpweb/",fi,".html",sep=""),quiet=FALSE)
  cat(i,4,sep="/")
  if(i==4)
     cat("Done!")}

setwd(dir="/Users/liangdameinv/Desktop/tmpweb")
a=list.files()
cc=function(n){
  found=FALSE
  for(i in 1:nchar(n)-4)
    if(substr(n,i,i+3)=="NYSE")
      found=TRUE
  return(found)
}
b=c(rep(0,4))
for(i in 1:4)
  if(cc(a[i])==TRUE)
    b[i]=readLines(a[i],n=1)
b

  
  
## * End solution


## -----------------------------------------------------------------------------
## **** `ifelse`
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------
## ** Using
library(UsingR)
data(father.son)
fheight <- father.son$fheight
sheight <- father.son$sheight
##    make a scatter plot of son's height on father's height, but coloring
##    the points in the following fashion:
##       * All points withing two standard deviations from the father's
##         height and son's height (in their corresponding axes), in black
##       * Between 2 and 3 standard deviations from the corresponding means,
##         in blue
##       * more than 3 standard deviations, in red.
##    You decide which color correspond to the boundaries, but the
##    visualization must be done in a single call to `plot` and using `ifelse`.
##    Also, with a single call to `abline`, create a vertical and horizontal
##    dotted gray grid delimiting the regions where the colors change.
##    Finally, with a single call to `text` and using `paste` or `paste0`,
##    on the bottom of the plot, corresponding to the vertical grid,
##    display the number of SDs they are away from the corresponding mean.


## * Begin solution
data=father.son
plot(x=data$fheight,y=data$sheight)
x=data$fheight
y=data$sheight
sd=sd(data$fheight)
sd1=sd(y)
a1=mean(x)-2*sd
a2=mean(x)+2*sd
a3=mean(x)-3*sd
a4=mean(x)+3*sd
b1=mean(y)-2*sd1
b2=mean(y)+2*sd1
b3=mean(y)-3*sd1
b4=mean(y)+3*sd1
for(i in 1:length(x))
  {if((a1<x[i]&x[i]<a2)&(b1<y[i]&y[i]<b2))
    points(x[i],y[i],col="black")
  if((a3<x[i]&x[i]<a1)|(a2<x[i]&x[i]<a4)|b3<y[i]&y[i]<b1|b2<y[i]&y[i]<b4)
    points(x[i],y[i],col="blue")
  if(x[i]<a3|x[i]>a4|y[i]<b3|y[i]>b4) 
    points(x[i],y[i],col="red")}

b=c(b1,b2,b3,b4)
a=c(a1,a2,a3,a4)
c=c(rep(59,4))
for(i in 1:4)
 abline(h=b[i],
       v=a[i],lty=2,col="darkgray")
text(a,c,
     labels=paste(c(-3,-2,2,3),"SD",sep=""),
      col=c("red","blue","blue","red"))
   

  
## * End solution


## -----------------------------------------------------------------------------
## **** Data science (analysis) using Base R tools (revisited)
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------
## ** If you did not do 4) and 5) from last flipped class script 3, do it
##    in this class (using both `for` loops and `sapply`.
##    Below is the whole problem for reference.
##
##    Analyze the Chick Weight data provided by R, that can be invoked as
data("ChickWeight")
##    1) Inspect it (`str`, `summary`, `View`, see the help) until you form
##       a mental picture of it. Note the type of data of each column,
##       considering if some of the could be a potential problem if not
##       treating with care.
##    2) Determine how many chicks were checked at each `Time`. Create a
##       visualization (in this and all visualizations create proper labels
##       and titles.
##    3) Plot, in different colors, the trajectories of the weights of chicks
##       15, 20 and 27. Make sure all info is shown. Put a legend to identify
##       to which chick each line corresponds.
##    4) (Intermediate) Generalize 3) so you plot the trajectories of all the
##       chicks. One approach would be to use a for loop (seen in near future).
##       Another is to use `sapply` (you can use `invisible` to silence the
##       returned values. Here, a legend will be too involved.
##    5) (Intermediate) Same as 4) but color according to Diet.
##    6) Perform an ANOVA to conclude if there is a difference in the means
##       by Diet of the difference of weight between time 0 and 21 (only
##       consider chicks that have a weight at time 21...)


## * Begin solution
## * End solution


## -----------------------------------------------------------------------------
## ** Using both a `for` loop and `sapply` (meaning do both different approaches),
##    1) Obtain the same result as doing
table(ChickWeight$Chick)
##    2) Find out reasonable explanation(s) for which the creator
##       of this ChickWeight `data.frame` decided on the in principle illogical
##       order of the chick numbers ordered factor, as it can be seen by doing
str(ChickWeight$Chick)
## and
levels(ChickWeight$Chick)
##    3) Using `apply` find out the difference between the last weight and
##       the maximum weight of each chick.
##    4) Which are the chicks whose final weight was less than
##       the maximum they achieved at some point


## * Begin solution
data1=ChickWeight
ch=data1$Chick
freq=c(rep(0,50))
for(i in 1:50)
  for(j in 1:length(ch))
    {if(ch[j]==i)
      freq[i]=freq[i]+1}
freq
y=rep(0,nrow(data1))
y=as.vector(data1$Chick)[1:nrow(data1)]
y=as.numeric(y)
dify=unique(y)
dify
count=function(x){
  n=0
  for(i in 1:length(y))
    if(y[i]==x)
      n=n+1
  return(n)
}
w=sapply(dify,count)
q=cbind(chick=dify,count=w)



freq2=sort(freq,decreasing=FALSE)
freq2=data.frame(freq2)
freq2[2,1]
ch2=c(rep(0,50))
for(i in 1:50)
  ch2[i]=q[which(q[,2]==freq2[i,1]),]
ch2

cha=function(i){
 ch=c(which(data1$Chick==i))
 ch=cbind(ch,data1[which(data1$Chick==i),1])
ch
max=max(ch[,2])
last=ch[length(ch[,2]),2]
diff=max-last
return(diff)
}
cha1=c(rep(0,50))
for(i in 1:50)
  cha1[i]=cha(i)
cha1

getcha=function(x){
  last1=x[length(x)]
  max1=max(x)
  return(max1-last1)
}
w=c(rep(0,50))
for(i in 1:50){
  ch=data1[which(data1$Chick==i),1]
  dify=matrix(ch,ncol=1)
  w[i]=apply(dify,2,FUN=getcha)
}
w


which(cha1>0)
## * End solution
