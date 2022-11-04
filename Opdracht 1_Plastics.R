library(readxl)
PlasticData <- read_excel("vul het excelbestand 'Plastieken resultaten.xlsx' hier in", 
                          sheet = "Blad1")
View(PlasticData)





# Analyse op de totale PlasticData
attach(PlasticData)
summary(PlasticData)

# load ggplot2
library(ggplot2)
library(hrbrthemes)

#correlatie tussen het hoogteverschil en de luchtdruk
ggplot(PlasticData, aes(x=`hoogte (mm)`, y=`luchtdruk (psi)`, color=materiaal), main = "Luchtdruk in functie van het hoogteverschil") + geom_point(size=6) + theme_ipsum()
#rechte lijnen te vinden in de correlatie, we zullen met de ratio werken

#analyse van de luchtdruk per milimeter bij verschillende materialen
boxplot(`ratio (psi/mm)`~materiaal, horizontal = TRUE, main = "Benodigde luchtdruk per millimeter bij verschillende materialen", col = "orange", border = "brown")

#analyse van de luchtdruk per milimeter met of zonder gewicht
boxplot(`ratio (psi/mm)`~gewicht, horizontal = TRUE, main = "Benodigde luchtdruk per millimeter bij verschillende gewichten", col = "orange", border = "brown")
# Klopt dit ook nog als we deze boxplot gaan opsplitsen in verschillende materialen?
detach(PlasticData)





# Analyse verschil met of zonder gewicht, bij elke materiaalkeuze.
# Zo wordt de PlasticData eerst gesorteerd in subets volgens materiaal, waarna een multiple boxplot wordt uitgezet volgens het al dan niet gebruiken van een gewichtje.


LDPE <- subset(PlasticData, materiaal == "LDPE")
attach(LDPE)
boxplot(`ratio (psi/mm)`~gewicht, horizontal = TRUE, main = "LDPE: luchtdruk per millimeter bij verschillende gewichten", col = "orange", border = "brown", xlab = "luchtdruk per hoogteverschil (psi/mm)")
# Ter controle, hoe constant is de luchtdruk bij het LDPE-zakje?
hist(`luchtdruk (psi)`, col = "lightblue", main = "LDPE: constantheid van de luchtdruk")
summary(LDPE)
detach(LDPE)


PP <- subset(PlasticData, materiaal == "PP")
attach(PP)
boxplot(`ratio (psi/mm)`~gewicht, horizontal = TRUE, main = "PP: luchtdruk per millimeter bij verschillende gewichten", col = "orange", border = "brown", xlab = "luchtdruk per hoogteverschil (psi/mm)")
# Ter controle, hoe constant is de luchtdruk bij het PP-zakje?
hist(`luchtdruk (psi)`, col = "lightblue", main = "PP: constantheid van de luchtdruk")
summary(PP)
detach(PP)


HDPE <- subset(PlasticData, materiaal == "HDPE")
attach(HDPE)
boxplot(`ratio (psi/mm)`~gewicht, horizontal = TRUE, main = "HDPE: luchtdruk per millimeter bij verschillende gewichten", col = "orange", border = "brown", xlab = "luchtdruk per hoogteverschil (psi/mm)")
# Ter controle, hoe constant is de luchtdruk bij het HDPE-zakje?
hist(`luchtdruk (psi)`, col = "lightblue", main = "HDPE: constantheid van de luchtdruk")
summary(HDPE)
detach(HDPE)




