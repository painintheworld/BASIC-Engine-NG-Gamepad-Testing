10 dly=100
100 SCREEN 14:PALETTE 0:CPUSPEED 100
105 FONT 2:COLOR 180:LOCATE 0,34:?"Press left/right arrows to control scroll speed";:LOCATE 0,33:?"Press q or Q to quit program"
110 GOSUB &loadfont
120 DIM TST$(10)
140 T1$="This is a very, VERY alpha release of a gamepad testing program for the BASIC Engine NG retro style computer. This initial release will only cover a Super Nintendo Entertainment style controller that has a D pad,"
145 T2$=" four action buttons, a start and select button, as well as left and right shoulder buttons. ALL of these are treated as digital only!"
160 TST$(1)=T1$+T2$
200 t1=LEN(T1$)
210 t2=LEN(T2$)
220 TST=LEN(TST$(1))
300 FOR lp=0 TO TST
310   t1a$=MID$(TST$(1),lp,40)
318   COLOR 176:FONT "arcadelook4"SIZE 12,12
320   LOCATE 0,11:?t1a$;
330   stick=PAD(0)
340   dly2=-(stick=4)+(stick=1)
345   dly=dly+(dly2*10)
350   IF dly<30 THEN dly=30
360   IF dly>1000 THEN dly=1000
364   FONT 2:COLOR (dly/5)+16
365   LOCATE 0,0:?"Delay=";dly;"  ";
368   IF INKEY$="q"OR INKEY$="Q" THEN GOTO 997
370   WAIT dly
400 NEXT lp
997 FONT 2
998 SCREEN 15:LIST
999 END
5000 &loadfont
5005 ON ERROR GOTO 5020
5010 LOAD FONT "/sd/snespad2/assets/fonts/arcadelook4.ttf"
5020 FONT "arcadelook4"SIZE 12,12
5025 COLOR 172
5030 RETURN
