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
DeviazioneStandardGP<-aggregate(pingtime_SEC ~ gasprice_GWEI, data=Datas, FUN=sd)
DeviazioneStandardGP
DeviazioneStandardGP<-rename(DeviazioneStandardGP, deviazione_standard='pingtime_SEC')
plot(DeviazioneStandardGP$gasprice_GWEI,DeviazioneStandardGP$deviazione_standard,type='h',col='blue',lwd=4)


ModelloDecentralizzato<- seq(0,13,1.34)
ModelloCentralizzato<- c(6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95,6.95)
giorni<-c(1,2,3,4,5,6,7,8,9,10)
dataframe1<- tbl_df(data.frame(giorni,ModelloDecentralizzato,ModelloCentralizzato))


ggplot()+
  geom_line(data=dataframe1,aes(y=ModelloDecentralizzato,x= giorni,colour="darkblue"),size=1 )+
  geom_line(data=dataframe1,aes(y=ModelloCentralizzato,x= giorni,colour="green"),size=1) +  scale_x_continuous(breaks = seq(0,10,1)) +
  scale_color_discrete(name = "Tipologia modello", labels = c("Modello decentralizzato", "Modello centralizzato")) + labs(
    x = "Giornate trascorse",
    y = "Costi complessivi (€)"
  )   

