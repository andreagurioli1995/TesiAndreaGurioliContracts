library(datasets)
library(dplyr)
library(stats)
library(stats4)
library(ggplot2)
library(readr)
library(fBasics)
library(plotrix)
Datas <- read_csv("C:\\Users\\bigfo\\Desktop\\progetto tech\\TesiAndreaGurioliContracts\\Dati_ping_tesi_Andrea_Gurioli_rilevazioni_01_02_2020_02_02_2020.csv")
View(Datas)
meanTime<-aggregate(pingtime_SEC ~ gasprice_GWEI, data=Datas, FUN=mean)
meanTime
plot(meanTime$gasprice_GWEI,meanTime$pingtime_SEC,type='o',col='red',lwd=2)
DeviazioneStandard<-aggregate(pingtime_SEC ~ gasprice_GWEI, data=Datas, FUN=sd)
DeviazioneStandard
DeviazioneStandard<-rename(DeviazioneStandard, deviazione_standard_SEC='pingtime_SEC')
DeviazioneStandard
plot(DeviazioneStandard$gasprice_GWEI,DeviazioneStandard$deviazione_standard_SEC,type='h',col='blue',lwd=4)


ModelloDecentralizzato<- seq(0,14,1.34)
ModelloCentralizzato<- c(6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95)
giorni<-c(0,1,2,3,4,5,6,7,8,9,10)
dataframe1<- tbl_df(data.frame(giorni,ModelloDecentralizzato,ModelloCentralizzato))


ggplot()+
  geom_line(data=dataframe1,aes(y=ModelloDecentralizzato,x= giorni,colour="darkblue"),size=1 )+
  geom_line(data=dataframe1,aes(y=ModelloCentralizzato,x= giorni,colour="green"),size=1) +  scale_x_continuous(breaks = seq(0,10,1)) + scale_y_continuous(breaks = seq(0,15,1))+
  scale_color_discrete(name = "Tipologia modello", labels = c("Modello decentralizzato (Ethereum)", "Modello centralizzato (Fineco)")) + labs(
    x = "Giornate trascorse",
    y = "Costi complessivi (€)"
  )   +  coord_cartesian(xlim = c(0, 10), expand = FALSE) 



ggplot()+
  geom_line(data=meanTime,aes(y=meanTime$pingtime_SEC,x=meanTime$gasprice_GWEI,colour="darkblue"),size=1 )+
  geom_line(data=DeviazioneStandardGP,aes(y=DeviazioneStandardGP$deviazione_standard,x= DeviazioneStandardGP$gasprice_GWEI,colour="green"),size=1) +  scale_x_continuous() + scale_y_continuous()+
  scale_color_discrete(name = "Tipologia di analisi", labels = c("tempi medi", "deviazione standard")) + labs(
    x = "gas price (GWEI)",
    y = "ping time (SEC)"
  )  

