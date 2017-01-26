library(dplyr)
library(rgdal)
library(maptools)


#LOAD THE RAW DATA
microdata <- read.fwf('d:/usa_00051.dat', widths = c(2,3,10,2))
colnames(microdata) <- c("STATEFIP","COUNTYFIPS","PERWT","UHRSWORK")



#*******FOR STATE-LEVEL DATA
#CALCULATE SUMMARY LEVEL DATA (IN THIS CASE, WORKING HOURS PER CAPITA)
statedata <- microdata %>% 
  group_by(STATEFIP) %>% 
  summarise(WMEAN_UHRSWORK = weighted.mean(UHRSWORK, PERWT))

#LOAD THE BOUNDARY FILE AND JOIN THE SUMMARY LEVEL DATA
usstates = readShapeSpatial('D:/usa-state.shp')
usstates@data <- mutate(usstates@data, GEOID = as.numeric(as.character(GEOID)) )
usstates@data <- left_join(usstates@data, statedata, by=c("GEOID" = "STATEFIP" ))

#PLOT THE MAP
spplot(usstates, z="WMEAN_UHRSWORK")




#*******FOR COUNTY-LEVEL DATA -- NOTE: MOST COUNTIES WILL BE SUPPRESSED

#ADD A COLUMN TO BE USED LATER FOR JOINING TO THE BOUNDARY FILE
microdata <- mutate(microdata, GEOID = STATEFIP*1000 + COUNTYFIPS )

#CALCULATE SUMMARY LEVEL DATA (IN THIS CASE, WORKING HOURS PER CAPITA)
countydata <- microdata %>% 
  group_by(GEOID) %>% 
  summarise(WMEAN_UHRSWORK = weighted.mean(UHRSWORK, PERWT))

#LOAD THE BOUNDARY FILE AND JOIN THE SUMMARY LEVEL DATA
uscounties = readShapeSpatial('D:/usa-county.shp')
uscounties@data <- mutate(uscounties@data, GEOID = as.numeric(as.character(GEOID)) )
uscounties@data <- left_join(uscounties@data, countydata, by=c("GEOID" = "GEOID" ))

#PLOT THE MAP
spplot(uscounties, z="WMEAN_UHRSWORK")

