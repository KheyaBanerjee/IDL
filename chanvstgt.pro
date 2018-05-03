; THIS FILE PLOTS THE TARGETS AGAINST THE DOG CHANNELS

rat = 0.2*(findgen(18)+1)
shape = ['c_1.0','c_0.5']
dim = 128 & hd = dim/2

tgtc = fltarr(128,128,18)
tgtchalf = fltarr(128,128,18)
tgt = fltarr(128,128)

tgtch = fltarr(128,128) & tgtch[*,*]= 0
chan= fltarr(2*128,2*128,3)

openr, 1, 'psfs128'
readu, 1, chan
close, 1

chan= chan[hd:(hd+dim-1),hd:(hd+dim-1),*]
tgtch = chan[*,*,0]

cd, '/hudson3/kheya/lumpy_bkgd_classification/Image'


FOR m=0,17 DO BEGIN

fname_tgtc = 'tgt_'+strtrim(shape[0],2)+'_r_'+string(rat[m],FORMAT='(F3.1)')
fname_tgtchalf = 'tgt_'+strtrim(shape[1],2)+'_r_'+string(rat[m],FORMAT='(F3.1)')

openr, 1, fname_tgtc
readu, 1, tgt
close, 1
tgtc[*,*,m] = tgt

openr, 1, fname_tgtchalf
readu, 1, tgt
close, 1
tgtchalf[*,*,m] = tgt

ENDFOR

cd, '/hudson3/kheya/plots/lumpy_bkgd_classification_varN'

;TVSCL, tgtc[*,*,5], 0
;TVSCL, tgtchalf[*,*,11], 1
;TVSCL, tgtch, 2

p = PLOT(tgtch[*,64], SYMBOL='*',TITLE='Channel 1 vs Full target')
p1 = PLOT(tgtc[*,64,0],'b',/OVERPLOT)
p2 = PLOT(tgtc[*,64,1],'g',/OVERPLOT)
p3 = PLOT(tgtc[*,64,2],'r',/OVERPLOT)
p4 = PLOT(tgtc[*,64,3],'c',/OVERPLOT)
p5 = PLOT(tgtc[*,64,4],'m',/OVERPLOT)
p6 = PLOT(tgtc[*,64,5],'y',/OVERPLOT)
p7 = PLOT(tgtc[*,64,6],'k',/OVERPLOT)
p8 = PLOT(tgtc[*,64,7],COLOR='chocolate',/OVERPLOT)
p9 = PLOT(tgtc[*,64,8],COLOR='dark_olive_green',/OVERPLOT)
p10 = PLOT(tgtc[*,64,9],COLOR='dark_salmon',/OVERPLOT)
p11 = PLOT(tgtc[*,64,10],COLOR='dark_violet',/OVERPLOT)
p12 = PLOT(tgtc[*,64,11],COLOR='deep_pink',/OVERPLOT)
p13 = PLOT(tgtc[*,64,12],COLOR='firebrick',/OVERPLOT)
p14 = PLOT(tgtc[*,64,13],COLOR='gainsboro',/OVERPLOT)
p15 = PLOT(tgtc[*,64,14],COLOR='green_yellow',/OVERPLOT)
p16 = PLOT(tgtc[*,64,15],COLOR='hot_pink',/OVERPLOT)
p17 = PLOT(tgtc[*,64,16],COLOR='lavender_blush',/OVERPLOT)
p18 = PLOT(tgtc[*,64,17],COLOR='lemon_chiffon',/OVERPLOT)

p.Save, "chan1vsfulltgt.eps", BORDER=10, RESOLUTION=300, /TRANSPARENT



END
