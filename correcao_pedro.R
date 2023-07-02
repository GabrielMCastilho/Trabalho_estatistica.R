
library(package="agricolae")
data(package="agricolae")
data("frijol")
View(frijol)
?"frijol"
str(frijol)
?lm
?ggplot

Tratamentos <- frijol[,1]
Tratamentos

Produção <- frijol[,2]
Produção

prodesp <- c( 975.25,  310.25, 1041.00,  568.75, 1380.50, 1367.75, 1517.25,  989.25,  791.50,  666.00, 1029.00,  778.00, 501.00, 1664.75,  690.75,  699.00,  497.75, 1985.00, 1271.75, 1077.25)
prodesp

prodA <- c( 1036,  364, 1019,  447, 1532, 1161, 1309,  834,  729,  749,  918,  668,  460, 1446,  770,  675,  515, 2110, 1046,  517, 1002)
prodA

prodB <- c(1272,  249, 1019,  780, 1214, 1521, 1477, 1087,  787,  543, 1214,  835,  566, 1794,  527,  992,  606, 1987, 1993,  559, 1302)

prodC<- c(787,  258,  911,  717, 1246, 1410, 1626, 1065,  844,  700, 1055,  818,  508, 1688,  960,  401,  422, 1706,  958,  527, 1020)

prodD<- c(806,  370, 1215,  331, 1530, 1379, 1657,  971,  806,  672,  929,  791,  470, 1731,  506,  728,  448, 2137, 1090,  612 , 985)

dados <- data.frame(Tratamentos, Produção)

modelo <- lm(Produção ~ as.character(Tratamentos), dados)

library(ggplot2)

ggplot(modelo,
       aes(Tratamentos, Produção, 
       )) +
  geom_point(pch = 16, size = 2.5) +
  geom_smooth(method = lm, col="black") + #Essa função insere a regressão
  theme_light() +
  labs(x = "Tratamentos
               ", y = "Produção", 
       title = paste("Gráfico de dispersão")) +
  theme(legend.position = "right", 
        legend.title = element_text(size = 11, face = "bold"),
        plot.title = element_text(color="black", size=18,
                                  face="bold", hjust = 0.5, vjust = 0.5)) +
  guides(color = guide_legend(title = "Origem"))
