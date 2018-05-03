cd, '/hudson2/ModelObserver/Parfiles'
fname='coordfile_yflipped'
OPENW, 2, fname
filstr=''
for i=1,10 DO BEGIN
cd, '/hudson2/SourcePts/projected_tumors/with_3_tumors'
filename3='locations__3_'+strtrim(string(i),2)+'.posid' 
openr, 1, filename3 
readf, 1, filstr 
close, 1 
a1=STRMID(filstr,0,3) 
cox1=FIX(ROUND(a1/2)) 
a2=STRMID(filstr,4,3) 
coy1=FIX(ROUND(127 - a2/2)) 
a3=STRMID(filstr,8,3) 
coz1=FIX(ROUND(a3/2)) 
a4=STRMID(filstr,12,3) 
cox2=FIX(ROUND(a4/2)) 
a5=STRMID(filstr,16,3) 
coy2=FIX(ROUND(127 - a5/2)) 
a6=STRMID(filstr,20,3) 
coz2=FIX(ROUND(a6/2))
a7=STRMID(filstr,24,3) 
cox3=FIX(ROUND(a7/2)) 
a8=STRMID(filstr,28,3) 
coy3=FIX(ROUND(127 - a8/2)) 
a9=STRMID(filstr,32,3) 
coz3=FIX(ROUND(a9/2)) 
IF ((cox1 LT 100) AND (cox1 GT 9)) THEN cox1='0'+strtrim(cox1,2) 
IF (cox1 LT 10) THEN cox1='00'+strtrim(cox1,2) 
IF (cox1 GT 99) THEN cox1=strtrim(cox1,2) 
IF ((cox2 LT 100) AND (cox2 GT 9)) THEN cox2='0'+strtrim(cox2,2) 
IF (cox2 LT 10) THEN cox2='00'+strtrim(cox2,2) 
IF (cox2 GT 99) THEN cox2=strtrim(cox2,2) 
IF ((cox3 LT 100) AND (cox3 GT 9)) THEN cox3='0'+strtrim(cox3,2) 
IF (cox3 LT 10) THEN cox3='00'+strtrim(cox3,2) 
IF (cox3 GT 99) THEN cox3=strtrim(cox3,2) 
IF ((coy1 LT 100) AND (coy1 GT 9)) THEN coy1='0'+strtrim(coy1,2) 
IF (coy1 LT 10) THEN coy1='00'+strtrim(coy1,2) 
IF (coy1 GT 99) THEN coy1=strtrim(coy1,2) 
IF ((coy2 LT 100) AND (coy2 GT 9)) THEN coy2='0'+strtrim(coy2,2) 
IF (coy2 LT 10) THEN coy2='00'+strtrim(coy2,2) 
IF (coy2 GT 99) THEN coy2=strtrim(coy2,2) 
IF ((coy3 LT 100) AND (coy3 GT 9)) THEN coy3='0'+strtrim(coy3,2) 
IF (coy3 LT 10) THEN coy3='00'+strtrim(coy3,2) 
IF (coy3 GT 99) THEN coy3=strtrim(coy3,2)
IF ((coz1 LT 100) AND (coz1 GT 9)) THEN coz1='0'+strtrim(coz1,2)
IF (coz1 LT 10) THEN coz1='00'+strtrim(coz1,2)
IF (coz1 GT 99) THEN coz1=strtrim(coz1,2)
IF ((coz2 LT 100) AND (coz2 GT 9)) THEN coz2='0'+strtrim(coz2,2)
IF (coz2 LT 10) THEN coz2='00'+strtrim(coz2,2)
IF (coz2 GT 99) THEN coz2=strtrim(coz2,2)
IF ((coz3 LT 100) AND (coz3 GT 9)) THEN coz3='0'+strtrim(coz3,2)
IF (coz3 LT 10) THEN coz3='00'+strtrim(coz3,2)
IF (coz3 GT 99) THEN coz3=strtrim(coz3,2)
cord=[cox1, coy1, coz1, cox2, coy2, coz2, cox3, coy3, coz3]
cd, '/hudson2/ModelObserver/Parfiles'
PRINTF, 2, '3', cord
ENDFOR 




for i=1,50 DO BEGIN
cd, '/hudson2/SourcePts/projected_tumors/with_2_tumors'
filename2='locations__2_'+strtrim(string(i),2)+'.posid' 
openr, 1, filename2 
readf, 1, filstr 
close, 1 
a1=STRMID(filstr,0,3) 
cox1=FIX(ROUND(a1/2)) 
a2=STRMID(filstr,4,3) 
coy1=FIX(ROUND(127 - a2/2)) 
a3=STRMID(filstr,8,3) 
coz1=FIX(ROUND(a3/2)) 
a4=STRMID(filstr,12,3) 
cox2=FIX(ROUND(a4/2)) 
a5=STRMID(filstr,16,3) 
coy2=FIX(ROUND(127 - a5/2)) 
a6=STRMID(filstr,20,3) 
coz2=FIX(ROUND(a6/2)) 
IF ((cox1 LT 100) AND (cox1 GT 9)) THEN cox1='0'+strtrim(cox1,2) 
IF (cox1 LT 10) THEN cox1='00'+strtrim(cox1,2) 
IF (cox1 GT 99) THEN cox1=strtrim(cox1,2) 
IF ((cox2 LT 100) AND (cox2 GT 9)) THEN cox2='0'+strtrim(cox2,2) 
IF (cox2 LT 10) THEN cox2='00'+strtrim(cox2,2) 
IF (cox2 GT 99) THEN cox2=strtrim(cox2,2)  
IF ((coy1 LT 100) AND (coy1 GT 9)) THEN coy1='0'+strtrim(coy1,2) 
IF (coy1 LT 10) THEN coy1='00'+strtrim(coy1,2) 
IF (coy1 GT 99) THEN coy1=strtrim(coy1,2) 
IF ((coy2 LT 100) AND (coy2 GT 9)) THEN coy2='0'+strtrim(coy2,2) 
IF (coy2 LT 10) THEN coy2='00'+strtrim(coy2,2) 
IF (coy2 GT 99) THEN coy2=strtrim(coy2,2) 
IF ((coz1 LT 100) AND (coz1 GT 9)) THEN coz1='0'+strtrim(coz1,2)
IF (coz1 LT 10) THEN coz1='00'+strtrim(coz1,2)
IF (coz1 GT 99) THEN coz1=strtrim(coz1,2)
IF ((coz2 LT 100) AND (coz2 GT 9)) THEN coz2='0'+strtrim(coz2,2)
IF (coz2 LT 10) THEN coz2='00'+strtrim(coz2,2)
IF (coz2 GT 99) THEN coz2=strtrim(coz2,2)
cord=[cox1, coy1, coz1, cox2, coy2, coz2]
cd, '/hudson2/ModelObserver/Parfiles'
PRINTF, 2, '2', cord
ENDFOR 


for i=1,90 DO BEGIN
cd, '/hudson2/SourcePts/projected_tumors/with_1_tumor'
filename1='locations__1_'+strtrim(string(i),2)+'.posid' 
openr, 1, filename1  
readf, 1, filstr 
close, 1 
a1=STRMID(filstr,0,3) 
cox1=FIX(ROUND(a1/2)) 
a2=STRMID(filstr,4,3) 
coy1=FIX(ROUND(127 - a2/2)) 
a3=STRMID(filstr,8,3) 
coz1=FIX(ROUND(a3/2)) 
IF ((cox1 LT 100) AND (cox1 GT 9)) THEN cox1='0'+strtrim(cox1,2) 
IF (cox1 LT 10) THEN cox1='00'+strtrim(cox1,2) 
IF (cox1 GT 99) THEN cox1=strtrim(cox1,2) 
IF ((coy1 LT 100) AND (coy1 GT 9)) THEN coy1='0'+strtrim(coy1,2) 
IF (coy1 LT 10) THEN coy1='00'+strtrim(coy1,2) 
IF (coy1 GT 99) THEN coy1=strtrim(coy1,2) 
IF ((coz1 LT 100) AND (coz1 GT 9)) THEN coz1='0'+strtrim(coz1,2)
IF (coz1 LT 10) THEN coz1='00'+strtrim(coz1,2)
IF (coz1 GT 99) THEN coz1=strtrim(coz1,2)
cord=[cox1, coy1, coz1]
cd, '/hudson2/ModelObserver/Parfiles'
PRINTF, 2, '1', cord
ENDFOR 
cd, '/hudson2/ModelObserver/Parfiles'
CLOSE, 2

END
