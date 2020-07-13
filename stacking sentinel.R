##********************important sentinel libraries**********3
#library(sen2r) this library  helps to download and preprocess Sentinel-2 optical images.


#start by importing the necessary libraries
#incase  you have not installed the bellow libraries uncoment the lines bellow and run the code
#install.packages("raster")
#install.packages("rgdat")

library(raster) #this is used for raster data handling and  processing
library(rgdal)#solves difficulties by reading the variouse formats


#set working directry
#be careful to change the foward slashes to back slashes
setwd("C:/Users/ShellHunter.DESKTOP-EO423F6/Desktop/jubilee oil field/S1B_IW_GRDH_1SDV_20200304T182503_20200304T182528_020546_026EF1_1E6C/S1B_IW_GRDH_1SDV_20200304T182503_20200304T182528_020546_026EF1_1E6C.SAFE/measurement")

#getting all the files of the 
bands<- list.files(recursive = TRUE, full.names = TRUE,pattern = ".tif")#this depende of the file format of the bands whether its .tiff, .grd e.t.c

#enquiring about the number of .tif, .jpg files in the directory
length(bands)

#this will display for you the top bands in the working directory
head(bands)

#reading and ploting a specific band
#reading an individual band 
band2<-bands[2]# specifying the band number
plot(band2)#ploting the band

#the above two lines can be simply done using
plot(bands[[1]])

#lets now use the stack function inorder to create a layerstack
#here the stacks function doese the 
sentinelstack<-stack(bands)

######
# eqnuiring info abour the data in this case its about the stack
sentinelstack
#class      : RasterStack 
#dimensions : 16800, 25244, 424099200, 2  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 25244, 0, 16800  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +datum=WGS84 +no_defs 
#names      : s1b.iw.grd.vh.20200304t182503.20200304t182528.020546.026ef1.002, s1b.iw.grd.vv.20200304t182503.20200304t182528.020546.026ef1.001 
#min values :                                                               0,                                                               0 
#max values :                                                           65535,  

#now lets try and plot the layerstack usong the plot function

plot(sentinelstack)

#use the write function to write the data to youe woriking directory
#this is done by using the  write function where you give the name  of the
write(sentinelstack,"bahati.tif",driver="GTiff",overwrite=TRUE)

#specifying the layout while ploting two rows and two columns
par(mfrow=c(2,2))

#plotting true color
plotRGB(sentinelstack, 4,3,2, scale=65535, stretch='lin')
#plotting rgb images


