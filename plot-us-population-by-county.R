library(rgdal)
library(maptools)
library(dplyr)


#LOAD DATA
spatialData = readShapeSpatial('D:/usa-county.shp') #, delete_null_obj=TRUE
csv = read.csv("d:/county-population-simplified.csv")
tabularData = subset(csv, select=c("GISJOIN", "POPULATION")) 

#JOIN
spatialData@data <- left_join(spatialData@data, tabularData, by=c("GISJOIN" = "GISJOIN"))

#PLOT MAP
spplot(spatialData, z="POPULATION")

