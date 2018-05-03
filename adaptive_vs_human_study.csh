#!/bin/csh
# DBT acq opt: SPIE 2008,2013
# This file creates the human interface for 
# lumpy background images (with pinhole) for adaptive vs model
# March, 2016
#

if ( $#argv != 2 ) then
  echo "Usage: $0 [relative pinhole aperture] [username]"
  echo "    Available relative pinhole aperture: 0.6, 1.0, 1.2, 1.6"
  exit 
else
  set aperture = ${argv[1]}
  set obsname = ${argv[2]}
endif
echo $0 ${aperture} ${obsname}


# Define parameters
set thresh = 0.0
set seed = `date | sed "s/://g;" | awk '{print($4)}'`
set info = " relative pinhole aperture ${aperture}"
#set idim = [128,128]
set fmt = 'float'
set charsz = 1.5


# Set the type of study here
#
#set type                  #training set only
#set type = debug          #study set only
set type = full            #both

if ( ${type} == debug ) then
  set sessiontype = ( Study )
  set RESNAMES = ( "study_pinhole_${aperture}_${obsname}.out" )
  set i = 2
else if ( ${type} == full ) then
  set sessiontype = ( Training Study )
  set RESNAMES = ( "train_pinhole_${aperture}_${obsname}.out" "study_pinhole_${aperture}_${obsname}.out" )
  set i = 1
else
  set sessiontype = ( Training )
  set RESNAMES = ( "train_pinhole_${aperture}_${obsname}.out" )
  set i = 1
endif


foreach resname  (${RESNAMES}) 

# Specify parfile
# parfile has 2 image/bkgd address pair per line
rm -f parfil
set train = null
set test = null
if (${resname} == train_pinhole_${aperture}_${obsname}.out) then
set parfil = parfile_pinhole_${aperture}_train
set train = loclist_pinhole_${aperture}_train
else if (${resname} == study_pinhole_${aperture}_${obsname}.out) then
set parfil = parfile_pinhole_${aperture}_test
set test = loclist_pinhole_${aperture}_test
endif



#Check output file name
set kk
while (-f ${resname}${kk} )
@ kk ++
end
echo " Results file= ${resname}${kk}"
set resname = ${resname}${kk}

# Specify coordinate text file
# all the lines in coordinate file
#rm -f loclist.txt
#set train = null
#if ( ${i} == 1 ) then
#set train = loclist_pinhole_${aperture}_train
#endif 


echo ${train}
echo ${parfil}
#echo ${thresh}

#Begin reading

 cd /hudson3/kheya/adaptive_vs_lumpy_bkgd/lumpy_bkgd_pinhole/human_observer_lumpy_bkgd_pinhole
#echo date
#echo ${i}
echo ".run lrocviewer_test_tomo.pro" >! _tmp.pro
echo "lrocviewer, '${parfil}',128, '${resname}','${train}', '${test}', seed=${seed},info='${info}',thresh=${thresh},fmt='${fmt}',charsz=${charsz}" >> _tmp.pro
idl < _tmp.pro
#echo "lrocviewer, parfil='${parfil}',idim=128, resfil='${resname}',train='${train}',seed=${seed},info='${info}',thresh=${thresh},fmt='${fmt}',charsz=${charsz}" >> _tmp.pro
#echo `sed -n 1p ${resname}`
#cat<<end_file >! tmp.pro
#.compile ./lrocviewer_test_tomo.pro
#lrocviewer, parfil = ${parfil}, train = ${train}
#end_file
#  idl < tmp.pro
#rm -f tmp.pro
#
#lrocviewer, parfil='${parfil}',idim=[128,128],resfil='${resname}',train='${TRAIN}',seed=${seed},info='${info}',thresh=${thresh},fmt='${fmt}',charsz=${charsz}
  if (! (-f ${resname}) ) then
    echo "Problem with session: no ${sessiontype[$i]} results file written"
    exit
  endif
  #cp -p ${resname} ./.Results
  #mv ${resname} ./ObsParFiles
@ i = $i + 1
end
#rm parfil loclist.txt
rm _tmp.pro


