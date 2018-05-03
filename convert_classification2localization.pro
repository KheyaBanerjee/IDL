;
pro result, FNAME_AREA=fname_area, FNAME_OUT=fname_out

; INITIALIZING VARIABLES

areaset = strarr(1,400)
areasettemp = strarr(1)
aind = 0


; OPENING  OUTPUT

openr, 1, fname_area


; READING OUTPUT

while ~ eof(1) do begin
   readf, 1, areasettemp
   areaset(*,aind) = areasettemp
   aind = aind+1
endwhile
free_lun,1

; STORING ONLY NON-ZERO VALUES

areaset = areaset(*,0:aind-1)

OPENU, 1, fname_out, /append 

; CONVERT THE TARGET SPECIFIC FIELD TO 1
; WRITE THE RESULTS TO FILE

FOR i=0,aind-1,2 DO BEGIN

IF ((i mod 2) eq 0) THEN BEGIN
val = STRSPLIT(areaset[i+1],/EXTRACT)
IF (val[1] ne 0) THEN val[1] = ' 1'
;PRINTF, 1, areaset[i], FIX(val[0]), FIX(val[1])+ ' 1', FIX(val[3]), FIX(val[4]), FIX(val[5]), FIX(val[6])
PRINTF, 1, areaset[i], (val[0])+' '+ (val[1])+ ' 1'+' '+ (val[3])+' '+ (val[4])+' '+ (val[5])+' '+ (val[6])
;print, areaset[i]
ENDIF

ENDFOR

CLOSE, 1

end
