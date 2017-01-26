# Week-2
Working with Census data ([notes](https://github.com/MUSA-620-Fall-2017/Week-2/blob/master/week-2-census-data.pptx))

The data file used in the microdata.r script can be downloaded [here](https://drive.google.com/file/d/0B7vEPueW9lKEdEI5c3JDRVE4WjQ/view?usp=sharing).

# Useful links

Census Data:
- [MPC: National Historical Geographic Information System](http://www.nhgis.org/) - for summary-level ACS data and boundary files
- [MPC: Integrated Public Use Microdata Series](https://usa.ipums.org/usa/) - for ACS microdata

GIS Boundaries:
- [Natural Earth](http://www.naturalearthdata.com/) - clean, simple shapefiles for commonly-used boundaries
- [Global Administrative Areas](http://www.gadm.org/) - detailed boundary files for a range of administrative levels

Map Simplification:
- [Mapshaper](http://www.mapshaper.org/) - great tool for reducing the size of large GIS files. Before using, it is usually best to make sure your file uses the standard latitude, longitude coordinate system ("WGS 84"), and is in GEOJSON format (otherwise your attribute table may be lost).


# Assignment

This weeks assignment is optional. You may turn it in by email (galkamaxd at gmail) or in person at class.

**Due:** by the end of class next week, 1-Feb

**Task:** Choose a variable from ACS microdata and plot it on a map

**Deliverable:** The map itself (image, PDF or other format) and a description of what is plotted, the tools/applications used, and the steps taken. If everything was done with R, please include a copy of the script(s) used.

This assignment is not about mapping (that will come later), so the map itself doesn't have to be pretty and doesn't need to have a legend. The purpose is to understand the basic steps for working with Census microdata.
- Downloading the raw data using [IPUMS](https://usa.ipums.org/usa/)
- Putting it into a usable format and calculating summary-level stats. The R scripts here may be helpful, though you are welcome to use other tools/applications instead, such as Excel, Access, or ArcGIS.
- Joining the summary-level data to a GIS boundary file. You will likely need to create a "GeoID" or similar field in one of the two files. Data joins are a simple but important concept, which we will be using throughout the course.


