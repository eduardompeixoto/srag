esus<-function(){

  library(dplyr)
  library(readr)

  base2 <- read_delim("http://sistemas.saude.rj.gov.br/tabnetbd/dash/resumo_internacoes_sivep2.csv",
                    delim = ";", escape_double = FALSE, locale = locale(encoding = "WINDOWS-1252"),trim_ws = TRUE)

colnames(base2)<-c('Classificação final','tp_idade','Idade','Idade detalhada','Ano epidemiológico de internação','Semana epidemiológica de internação','Número de internações','Número de óbitos por SRAG')

base2<-base2 %>% mutate(   Faixa = case_when(Idade <= 1 ~ "Até 1",
                                             Idade > 1 & Idade <= 4 ~ "1-4",
                                             Idade >= 5 & Idade <= 9 ~ "5-9",
                                             Idade >= 10 & Idade <= 19 ~ "10-19",
                                             Idade >= 20 & Idade <= 29 ~ "20-29",
                                             Idade >= 30 & Idade <= 39 ~ "30-39",
                                             Idade >= 40 & Idade <= 49 ~ "40-49",
                                             Idade >= 50 & Idade <= 59 ~ "50-59",
                                             Idade >= 60 & Idade <= 69 ~ "60-69",
                                             Idade >= 70 & Idade <= 79 ~ "70-79",
                                             Idade >= 80 ~ "80+"))


base2$faixa<-ordered(base2$Faixa,c("Até 1","1-4","5-9","10-19","20-29","30-39","40-49","50-59","60-69","70-79","80+"))
base2$`Semana epidemiológica de internação`<-as.numeric(base2$`Semana epidemiológica de internação`)

base2

}
  
