ITT World Maps
==============

**What**: Code to produce a series of thematic maps showing yearly Ill-Treatment
and Torture (ITT).

**Date**: January 2012

**By**: Andreas Beger ([adbeger@gmail.com](mailto:adbeger@gmail.com))

Creative Commons BY-NC-SA 3.0 License. Attribution, Non-Commercial, Share Alike.

Data
----

Map data is from [http://thematicmapping.org/downloads/world_borders.php](http://thematicmapping.org/downloads/world_borders.php), CC BY-SA license.

The Ill-Treatment and Torture data is by Courtenay Conrad and Will H. Moore.

Description and running it
--------------------------

1. Edit world_maps.R and change the working directory to the folder's location.

2. Run world_maps.R. This should create .png images of the maps for each year.

3. String images together in iMovie or something like that.

Notes
-----

* The R factor variable for levels of torture includes the 5-point scale, no allegations, and no data. "Allegations, no LoT" is treated as "infrequent", and all other categories are treated as "No Data" (i.e. missing). 

* Running this with data beyond the original 1995 to 2005 range shouldn't be a problem as long as the file and variable names are the same.

Andreas Beger

1. In one directory you will need:
    terror_location.dta
    COW state list.dta
    data_prep.do         # Stata script for 1 year global cross-section
    world_maps.R         # R script to make the maps
    /world               # Folder that contains world shape files 
    /images              # Folder which will contain .png map images

2. Run data_prep.do (change so wd is above directory)
    Should create 4 .csv files for each year you want to plot

3. Run world_map.R
    Should create 4 .png map images in /images

If you want to add more years…
  - Add a block of code in the Stata .do file to create a .csv for that
    year.
  - R script: Add a line like world$tyear <- MapFormat(…) where you see the
    others.
  - R script: Add a block to create the map image at the bottom, like
    the others.
    

