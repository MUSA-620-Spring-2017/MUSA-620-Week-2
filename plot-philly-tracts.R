library(rgdal)
library(maptools)
library(dplyr)

#ADOLE001 = average per capita income

#LOAD DATA
spatialData = readShapeSpatial('D:/philly-census-tract.shp') #, delete_null_obj=TRUE
csv = read.csv("d:/income-by-tract.csv")
tabularData = subset(csv, select=c("GISJOIN", "ADOLE001")) 

#JOIN
spatialData@data <- left_join(spatialData@data, tabularData, by=c("GISJOIN" = "GISJOIN"))

#PLOT MAP
spplot(spatialData, z="ADOLE001")

