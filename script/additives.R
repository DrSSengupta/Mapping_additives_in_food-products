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
#-Meat products
m1 <- d1 %>% 
  filter((`Product type` == "Burger" | 
            `Product type` == "Balls" |
            `Product type` == "Minced and pulled" |
            `Product type` == "Sausages" |
            `Product type` == "Schnitzel"|
            `Product type` == "Bread toppings" ))
unique(m1$Identifier)
view(m1)

#-Meat analogues
a1 <- d1 %>% 
  filter(!(`Product type` == "Burger" | 
            `Product type` == "Balls" |
            `Product type` == "Minced and pulled" |
            `Product type` == "Sausages" |
            `Product type` == "Schnitzel"|
            `Product type` == "Bread toppings" ))
unique(a1$Identifier)
view(a1)



#upset plot

#Lists of E numbers for each product type
burger_m <- m1 %>% 
  filter(`Product type` == "Burger") %>% 
  pull(`E number`)

sausage_m <- m1 %>% 
  filter(`Product type` == "Sausages") %>% 
  pull(`E number`)

minced_m <- m1 %>% 
  filter(`Product type` == "Minced and pulled") %>% 
  pull(`E number`)

balls_m <- m1 %>% 
  filter(`Product type` == "Balls") %>% 
  pull(`E number`) #output shows that there are no additives in meat balls

schnitzel_m <- m1 %>% 
  filter(`Product type`== "Schnitzel") %>% 
  pull(`E number`)

toppings_m <- m1 %>% 
  filter(`Product type` == "Bread toppings") %>% 
  pull(`E number`)



toppings_v <- a1 %>% 
  filter(`Product type` == "Bread toppings, plant-based") %>% 
  pull(`E number`)

burger_ma <- a1 %>% 
  filter(`Product type` == "Burger, plant-based") %>% 
  pull(`E number`)

sausage_ma <- a1 %>% 
  filter(`Product type` == "Sausages, plant-based") %>% 
  pull(`E number`)

minced_ma <- a1 %>% 
  filter(`Product type` == "Minced and pulled, plant-based") %>% 
  pull(`E number`)

balls_ma <- a1 %>% 
  filter(`Product type` == "Balls, plant-based") %>% 
  pull(`E number`)

shnitz_ma <- a1 %>% 
  filter(`Product type` == "Schnitzel, plant-based") %>% 
  pull(`E number`)

#Comibined list for meat products
meat_v00a_list <- list(`Bread toppings` =toppings_m[!is.na(toppings_m)], Burger = burger_m[!is.na(burger_m)], Sausages = sausage_m[!is.na(sausage_m)], 
                       `Minced and pulled`= minced_m[!is.na(minced_m)], Balls = balls_m[!is.na(balls_m)], 
                       Schnitzel = schnitzel_m[!is.na(schnitzel_m)]) 

#Combined list for meat analogues
ma_v00a_list <- list(`Bread toppings (p)` =toppings_v[!is.na(toppings_v)], `Burger (p)`= burger_ma[!is.na(burger_ma)], `Sausages (p)`=sausage_ma[!is.na(sausage_ma)], 
                     `Minced and pulled (p)` = minced_ma[!is.na(minced_ma)], `Balls (p)` = balls_ma[!is.na(balls_ma)], 
                     `Schnitzel (p)` = shnitz_ma[!is.na(shnitz_ma)])

#All meat products and plant-based meat analogue products combined
ma_meat_comb_list <- c(meat_v00a_list, ma_v00a_list)

#Creating UpsetR plot object
fig_meat <- UpSetR::upset(fromList(ma_meat_comb_list), sets = names(ma_meat_comb_list), order.by = "freq", 
                          keep.order = TRUE, set_size.scale_max = 30)

#Plot to size
png(filename = "./output/meat_and_analogues.png", width = 18, height = 12, units = "cm", bg = "white",res = 300)
fig_meat
dev.off()
