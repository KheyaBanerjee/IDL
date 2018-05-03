#!/bin/csh

#
# THIS FILE CONVERTS CLASSIFICATION 
# RESULT TO LOCALIZATION
# KHEYA BANERJEE
# FEB, 2018
#

foreach r (0.6 1.0 1.2 1.6)
#foreach r (0.6)

foreach shape (c_1.0 c_0.5)
#foreach shape (c_0.5)

foreach obs (hongwei kheya gifford)
#foreach obs (gifford)

#cd /hudson3/kheya/adaptive_vs_lumpy_bkgd/lumpy_bkgd_pinhole/vs

set fname_area = study_pinhole_${r}_${shape}_${obs}.out
set fname_out = study_pinhole_${r}_${shape}_${obs}_localization.out


echo ".run convert_classification2localization.pro" >! _tmptest.pro
echo "result, fname_area='${fname_area}', fname_out='${fname_out}'" >>! _tmptest.pro
idl < _tmptest.pro

./empiricalLROC_tgtsp -i ${fname_out} -rcl 5 -x >>! horesults_LROC
 
rm -f ${fname_out}

end

end

end

rm -f _tmptest.pro 

foreach r (0.6 1.0)
#foreach r (0.6)

foreach shape (c_1.0 c_0.5)
#foreach shape (c_0.5)

foreach obs (hongwei kheya)
#foreach obs (gifford)

#cd /hudson3/kheya/adaptive_vs_lumpy_bkgd/lumpy_bkgd_pinhole/vs

set fname_area = study_pinhole_${r}_${shape}_${obs}.out1
set fname_out = study_pinhole_${r}_${shape}_${obs}_localization.out1


echo ".run convert_classification2localization.pro" >! _tmptest.pro
echo "result, fname_area='${fname_area}', fname_out='${fname_out}'" >>! _tmptest.pro
idl < _tmptest.pro

./empiricalLROC_tgtsp -i ${fname_out} -rcl 5 -x >>! horesults_LROC
 
rm -f ${fname_out}

end

end

end
rm -f _tmptest.pro
