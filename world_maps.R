# 
# What: Produce thematic world maps of the Ill-Treatment and Torture (ITT) 
#       country-year data by Will H. Moore and Courtenay Conrad.
# Date: January 2012
# By:   Andreas Beger
#
# Creative Commons BY-NC-SA 3.0 License:
# Attribution, Non-Commercial, Share Alike
#

setwd("/Users/adbeger/Desktop/12 WorldMaps_ITT")

#
# Load neccessary packages and set up data.
#

library(maptools)     # Working with spatial data objects
gpclibPermit()
library(countrycode)  # Convert country codes
library(RColorBrewer) # Need for color legends on maps.
library(shape)        # Need for color legends on maps.

#
# Functions
#

# Merge event data using ISO 3 country codes vector
MapFormat <- function(cy, iso3a, year) {
  # Extract data for one year.
  events <- cy[cy$year == paste(year), c(3, 7)]
  colnames(events) <- c("ISO3", "Events")
  # Left outer join to create data frame of full list of states with events.  
  events <- merge(iso3a, events, all.x=TRUE, by="ISO3")
  events$Events[is.na(events$Events)] <- "No Data"
  # Need to merge again to preserve original order, otherwise map bad
  events <- merge(iso3a, events, by = "ISO3", sort = FALSE)
  # Extract and return vector of correctly sorted event count
  events <- events[,2]
  return(events)
  }
  
#
# Set up the data.
#

# The original data is at http://thematicmapping.org/downloads/world_borders.php
# They ask for a link to their website to be included. CC BY-SA license.
world <- readShapePoly("world/TM_WORLD_BORDERS_SIMPL-0.3",
  proj4string=CRS("+proj=longlat +datum=WGS84"))

# Remove Antarctica
world <- world[world$NAME != "Antarctica", ]

# Extract set of states in the world map. State system membership!!
iso3a <- as.data.frame(world$ISO3)
colnames(iso3a) <- "ISO3"

# Read in country year data on torture levels.
cy <- read.table("CY/CY.csv", header=TRUE, sep=",")

# Create a new factor to use with maps.
# The factor levels include the 5 point scale for levels of torture, 
# no allegations, and missing. "Allegation, No LoT" is treated as "Infrequent" 
# and other exceptions are treated as missing.
cy$levels <- factor(cy$LoT, levels = c("No Data", "No Allegations", "Infrequent", 
  "Several", "Routinely", "Widespread", "Systematic"))
cy$levels[cy$LoT == "Allegation, No LoT"] <- "Infrequent"
cy$levels[is.na(cy$levels)==TRUE] <- "No Data"

#
# Produce maps showing torture in each year.
#

# Color pallette to use with the factor levels.
#   1 is missing, 2 is infrequentent, and so on.
colorpal <- c("#B0B0B0", "#33CC33", brewer.pal(5, "Reds"))

# Corresponding breaks. Make sure these match the factor levels order.
breaks <- c(1, 2, 3, 5, 5, 6, 7)

# Year range
date.range <- seq(min(cy$year), max(cy$year))

# Loop over date range to create an image for each year. These are saved in the
# /images folder.
for(year in date.range) {
  # Pull torture data for each year
  torture <- MapFormat(cy, iso3a, year)
  # Set the appropriate color for each row.
  color <- colorpal[findInterval(torture,breaks)]
  # Plot the map and save as .png.
  png(paste("images/itt", year, ".png", sep=""), width = 1280, height = 720)
  par(mar = c(1, 1, 2, 1), oma = c(0, 0, 3, 0))
  plot(world, col=color)
  title(main = paste(year), cex.main = 2)
  legend(-170, -15, rev(levels(cy$levels)), fill = rev(colorpal))
  dev.off()
  }

# I strung the resulting images together in iMovie to produce the final video.