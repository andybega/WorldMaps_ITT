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
    

