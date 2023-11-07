#libraries
rm(list=ls())

library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)
library(ggplot2)
library(gridExtra)
library(ggpattern)
library(UpSetR)

#library(ComplexUpset)


#meat analogues
d1<- read_excel("./data/meat_and_analogues.xlsx", 
                            sheet = "Sheet 1")

#subsets
m1 <- d1 %>% 
  filter((`Product type` == "Burger" | 
            `Product type` == "Balls" |
            `Product type` == "Minced and pulled" |
            `Product type` == "Sausages" |
            `Product type` == "Schnitzel"|
            `Product type` == "Bread toppings" ))
unique(m1$Identifier)
view(m1)

a1 <- d1 %>% 
  filter(!(`Product type` == "Burger" | 
            `Product type` == "Balls" |
            `Product type` == "Minced and pulled" |
            `Product type` == "Sausages" |
            `Product type` == "Schnitzel"|
            `Product type` == "Bread toppings" ))
unique(a1$Identifier)
view(a1)
