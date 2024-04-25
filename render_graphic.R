library(sf)
library(tidyverse)
library(camcorder)
library(ggplot2)
library(glue)


map <- "tidytjomuj"
if (!dir.exists(glue("{map}"))) {
  dir.create(glue("{map}"))
}
pal<-"colpal"
outfile <- str_to_lower(glue("./{map}/{map}_{pal}d1.png"))
dirg <- str_to_lower(glue("./{map}"))

gg_record(dir = dirg, device = "png", width = 8.44, height = 10.5, units = "in", dpi = 320)
#ENOE
#https://www.inegi.org.mx/programas/enoe/15ymas/
# read data
#ruta<-"./data/"
nomfile<-"ocupacionjornada.csv"

ocupagenero<-readr::read_csv(nomfile) 
ocupagenero$PTPOCUP15<-ocupagenero$TPOCUP15/ocupagenero$TPOCUP
ocupagenero$PTPOCUP1634<-ocupagenero$TPOCUP1634/ocupagenero$TPOCUP
ocupagenero$PTPOCUP3548<-ocupagenero$TPOCUP3548/ocupagenero$TPOCUP
ocupagenero$PTPOCUP49<-ocupagenero$TPOCUP49/ocupagenero$TPOCUP
ocupagenero$HTPOCUP15<-ocupagenero$HPOCUP15/ocupagenero$TPOCUP15
ocupagenero$MTPOCUP15<-ocupagenero$MPOCUP15/ocupagenero$TPOCUP15
ocupagenero$HTPOCUP1634<-ocupagenero$HPOCUP1634/ocupagenero$TPOCUP1634
ocupagenero$MTPOCUP1634<-ocupagenero$MPOCUP1634/ocupagenero$TPOCUP1634
ocupagenero$HTPOCUP3548<-ocupagenero$HPOCUP3548/ocupagenero$TPOCUP3548
ocupagenero$MTPOCUP3548<-ocupagenero$MPOCUP3548/ocupagenero$TPOCUP3548
ocupagenero$HTPOCUP49<-ocupagenero$HPOCUP49/ocupagenero$TPOCUP49
ocupagenero$MTPOCUP49<-ocupagenero$MPOCUP49/ocupagenero$TPOCUP49

# plot!

ggplot() +
  geom_area(data=ocupagenero, aes(Periodos, MTPOCUP15*100), fill = "red") +
  geom_area(data=ocupagenero, aes(Periodos, HTPOCUP15*100), fill = "navyblue") +
  geom_line(data=ocupagenero, aes(Periodos, PTPOCUP15*100), color = "yellow", size=1) +
  scale_x_continuous(limits = c(2014,2023), expand = c(0,0)) +
  scale_y_continuous(breaks = c(25, 50, 75, 100), limits = c(0,100), expand = c(0,0)) +
  labs(title = "Porcentaje de empleo menos 15 horas trabajadas") +
  theme_bw() +
  theme(
    plot.title = element_text(colour = "royalblue2"),
    plot.margin = unit(c(1, 1, 0.5, 0.5),"cm"),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    axis.text.x = element_text(color = "gray10", size=rel(1.4), margin = margin(t = 15)),
    axis.text.y = element_text(color = "gray70", size=rel(1.2), margin = margin(r = 5))
  )


