#gapminderMap.r
#andy south 6/9/2013
#www.andysouth.co.uk
#southandy@gmail.com

#to have a go at mapping gapminder example data from rOpenSci workshop

#read data with separator set to tab 
dFgap <- read.table("\\data\\gapminderDataFiveYear.txt", sep="\t", header=TRUE)

str(dFgap)
#'data.frame':  1698 obs. of  6 variables:
#$ country  : Factor w/ 147 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
#$ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
#$ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#$ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
#$ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#$ gdpPercap: num  779 821 853 836 740 ...

#subset one year
dFgap2007 <- dFgap[dFgap$year==2007,]

#using rworldmap
install.packages("rworldmap", dependencies=TRUE)
library(rworldmap)

#to join the data onto a map (a spatialPolygonsDataFrame - sPDF)
sPDFgap2007 <- joinCountryData2Map(dFgap2007, joinCode="NAME", nameJoinColumn="country")

#it tells you this :
# 138 codes from your data successfully matched countries in the map
# 4 codes from your data failed to match with a country code in the map
# 106 codes from the map weren't represented in your data

# to plot the map
mapCountryData(sPDFgap2007, nameColumnToPlot='lifeExp', numCats=5)


#visualise data differently (another rworldmap function)
barplotCountryData(sPDFgap2007, nameColumnToPlot='lifeExp', numCats=5)

#get rid of no data
barplotCountryData(sPDFgap2007[! is.na(sPDFgap2007$lifeExp),], nameColumnToPlot='lifeExp')


#changing colours using colourPalette
# to plot the map
mapCountryData(sPDFgap2007, nameColumnToPlot='lifeExp', numCats=5, colourPalette="topo")
#barplot
barplotCountryData(sPDFgap2007[! is.na(sPDFgap2007$lifeExp),], nameColumnToPlot='lifeExp', numCats=5, colourPalette="topo")
