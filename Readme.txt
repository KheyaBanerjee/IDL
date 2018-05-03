This file describes the files in IDL repository.


The example scripts are included here: 
1. adaptive_vs_human_study.csh
	1. lrocviewer_test_tomo.pro
2. chanvstgt.pro
3. convert_classification2localization.csh
	1. convert_classification2localization.pro
4. create_coordfile.pro
	1. locations__3_1.posid
	2. coordfile
5. create_coordfile_yflipped.pro
	1. locations__3_1.posid
	2. coordfile_yflipped




The description for file "adaptive_vs_human_study.csh"

This file calls the .pro file "lrocviewer_test_tomo.pro" and creates a GUI for human observers to read images.




The description for file "chanvstgt.pro"

This file opens 2D images and plots some line plot through the center of the image to compare the intensity and FWHM of Gaussian functions.




The description for file "convert_classification2localization.csh"

This file takes an input file which has 2 different tumor type and separates them into 2 different files with the tumor type set to 1. The .pro file 
is the main file here.




The description for file "create_coordfile.pro"

This file takes the individual coordinate (.posid) files as input to form a single output "coordfile"  which has all the coordinates of an image set.
It also converts all the coordinates to 3 digit number and adds number "999" where there is no coordinate.




The description for file "create_coordfile_yflipped.csh"

This file is similar to the previous file but the y coordinate is flipped: y=127-y
