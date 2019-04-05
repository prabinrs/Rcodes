library(RCurl)
library(jsonlite)
if(!require(rvest)) install.packages("rvest")
library(rvest)
devtools::install_github("cpsievert/rdom")
library(rdom)
rinstall.packages("phantomjs")
library(XML2)
library(data.table)
if(!require(RSelenium)) install.packages("RSelenium")
library(RSelenium)
# update_data<-function(token,city){
#   url<-as.character(paste("https://api.waqi.info/feed/",city,"/?token=",token, sep = ""))
#   liveData<-getURL(url)
#   liveData<-fromJSON(liveData, flatten = T)
#   date<-paste(liveData$data$time$s)
#   pm1<-liveData$data$iaqi$pm1
#   pm10<-liveData$data$iaqi$pm10
#   pm25<-liveData$data$iaqi$pm25
#   pollData<-data.frame(cbind(date,pm1,pm10,pm25))
#   return(pollData)
# }
# liveData<-getURL("https://api.waqi.info/feed/kathmandu/?token=aaa549bd7c1b0aeee74ad2725703bf418cf46d5b")
# liveData<-fromJSON(liveData, flatten = T)

#from pollution.gov.np
#for pulchowk
pulchCurrent<-read_html("http://pollution.gov.np/station/5")
pulpulchCurrent%>% 
  html_node(".table2")%>%
  html_table(header = T)
a<-html_node(pulchCurrent,"table.table2")
##Test URL importer
read_html("http://pollution.gov.np/station/5")%>%
  html_nodes(".middle, b")%>%head
a<-readHTMLTable("http://pollution.gov.np/station/5")
b<html_nodes(pulchCurrent,"
             /main/div/div[2]/div/div[2]/table[1]/tbody/tr[1]/td[2]")

#with dom method

rdom("http://pollution.gov.np/station/5")%>%
  html_node(".table2") %>% html_table()

#with xpath method 
urls<-"http://pollution.gov.np/station/5"
PM_current<-rbindlist(apply(urls,1,function(url){
  doc1<-htmlParse(url)
  pmCurrent<-getNodeSet(doc1, '//*[@id="app"]/main/div/div[2]/div/div[2]/table[1]/tbody/tr[1]/td[2]/b')
  data.frame(sapply(locations,function(x){xmlValue(x)}))
}), fill=T)


#with Rselenium
checkForServer()
