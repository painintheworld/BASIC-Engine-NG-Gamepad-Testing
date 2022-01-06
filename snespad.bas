2 'If, by some weird chance, you want to use it,
3 'please feel free to do so!
5 'This code will be on my Github and
6 'Google Drive repositories
10 BEL=1:BL=0
20 REM LEFT=1:DOWN=2:RIGHT=4:UP=8
25 start=32:select=16
30 squareory=256:crossorb=512
35 circleora=1024:triangleorx=2048
40 leftshoulder1=8192:rightshoulder1=4096
45 leftshoulder2=32768:rightshoulder2=16384
100 SCREEN 14:PALETTE 0
200 GOSUB &loadlogo
210 GOSUB &loadpointer
220 GOSUB &drawsnespad
230 GOSUB &loadbuttons
240 GOSUB &loadspaceship
250 GOSUB &loadbuttonsprites
390 FONT 2:COLOR 172
400 WHILE KY<>1
410   KY$=INKEY$
420   K=VAL(KY$)
430   IF K=81 OR K=113 THEN
440     KY=1
450   ELSE
460     KY=0
470   ENDIF
500   MX=MOUSEX:MY=MOUSEY
510   MOVE SPRITE 30 TO MX,MY
520   GPRINT 0,245,"Mouse X=";MX;"   ";
530   GPRINT 0,253,"Mouse Y=";MY;"   ";
550   STICK=PAD(0)
560   IF STICK=LEFT THEN
565     SPRITE 3 ON
570   ELSE IF STICK=LEFT+UP THEN
575     SPRITE 3 ON:SPRITE 0 ON
580   ELSE IF STICK=LEFT+DOWN THEN
585     SPRITE 3 ON:SPRITE 1 ON
590   ELSE IF STICK=UP THEN
595     SPRITE 0 ON
600   ELSE IF STICK=DOWN THEN
605     SPRITE 1 ON
610   ELSE IF STICK=RIGHT THEN
615     SPRITE 2 ON
620   ELSE IF STICK=RIGHT+UP THEN
625     SPRITE 2 ON:SPRITE 0 ON
630   ELSE IF STICK=RIGHT+DOWN THEN
635     SPRITE 2 ON:SPRITE 1 ON
640   ELSE IF STICK=start THEN
645     SPRITE 6 ON
650   ELSE IF STICK=select THEN
655     SPRITE 7 ON
660   ELSE IF STICK=squareory THEN
665     SPRITE 9 ON
670   ELSE IF STICK=crossorb THEN
675     SPRITE 11 ON
680   ELSE IF STICK=circleora THEN
685     SPRITE 10 ON
690   ELSE IF STICK=triangleorx THEN
695     SPRITE 8 ON
700   ELSE IF STICK=leftshoulder1 THEN
705     SPRITE 4 ON
710   ELSE IF STICK=rightshoulder1 THEN
715     SPRITE 5 ON
730   ENDIF
980   VSYNC
990   FOR LP=0 TO 11:SPRITE LP OFF:NEXT LP
1000 WEND
1010 SCREEN 15:END
4990 REM 
4991 REM Put routines past this point
4992 REM 
4996 REM 
4997 REM This sub loads the mouse pointer sprite
5000 &loadpointer
5010 LOAD IMAGE "assets/mouse/red16x16.png" AS SPRITE 30
5020 SPRITE 30 SIZE 16,16 SCALE 1,1 ON
5030 RETURN
5496 REM 
5497 REM Load 320x180 BASIC Engine NG logo
5498 REM 
5500 &loadlogo
5510 LGX=79:BLGY=271:TLGY=-63
5515 IMGX=320:IMGY=180
5520 LOAD IMAGE "assets/logos/29.png" TO LGX,BLGY
5525 FOR Y=BLGY TO 47 STEP -3
5530   BLIT LGX,Y TO LGX,Y-3 SIZE IMGX,IMGY
5535   VSYNC
5540 NEXT Y
5560 FOR Y=47 TO BLGY STEP 3
5565   BLIT LGX,Y TO LGX,Y+3 SIZE IMGX,IMGY
5570   VSYNC
5575 NEXT Y
5580 LOAD IMAGE "assets/logos/29.png" TO LGX,TLGY
5590 RETURN
5996 REM 
5997 REM This sub draws a simple SNES type pad
5998 REM using CIRCLE and LINE commands
5999 REM 
6000 &drawsnespad
6010 CIRCLE 95,127,60,173,173
6020 CIRCLE 95,127,57,173,0
6030 CIRCLE 303,127,60,173,173
6040 CIRCLE 303,127,57,173,0
6050 LINE 139,91,256,91,173
6060 LINE 137,165,258,165,173
6070 LINE 139,90,256,90,173
6080 LINE 137,166,258,166,173
6090 RETURN
6496 REM 
6497 REM load image buttons to the SNES pad image
6498 REM 
6500 &loadbuttons
6510 LOAD IMAGE "assets/buttons1/upnp.png" TO 80,80
6520 LOAD IMAGE "assets/buttons1/downnp.png" TO 80,142
6530 LOAD IMAGE "assets/buttons1/rightnp.png" TO 111,112
6540 LOAD IMAGE "assets/buttons1/leftnp.png" TO 49,112
6550 LOAD IMAGE "assets/buttons1/leftnp.png" TO 79,35
6560 LOAD IMAGE "assets/buttons1/rightnp.png" TO 288,35
6570 LOAD IMAGE "assets/buttons1/startnp.png" TO 204,112
6580 LOAD IMAGE "assets/buttons1/selectnp.png" TO 164,112
6590 LOAD IMAGE "assets/buttons1/Xnp.png" TO 288,82
6600 LOAD IMAGE "assets/buttons1/Ynp.png" TO 255,112
6610 LOAD IMAGE "assets/buttons1/Anp.png" TO 321,112
6620 LOAD IMAGE "assets/buttons1/Bnp.png" TO 288,139
6630 RETURN
6995 REM 
6996 REM Use this routine??
6997 REM Load sprite image for a spacefighter to move about
6998 REM with pad movements
6999 REM 
7000 &loadspaceship
7010 LOAD IMAGE "assets/kozmick/kozmickraidersbigred1a.png" AS SPRITE 31
7020 SPRITE 31 SIZE 32,32
7030 RETURN
7496 REM 
7497 REM load sprite images for button presses
7498 REM and move them over button images (transparently)
7499 REM 
7500 &loadbuttonsprites
7510 LOAD IMAGE "assets/buttons1/upp.png" AS SPRITE 0
7520 LOAD IMAGE "assets/buttons1/downp.png" AS SPRITE 1
7530 LOAD IMAGE "assets/buttons1/rightp.png" AS SPRITE 2
7540 LOAD IMAGE "assets/buttons1/leftp.png" AS SPRITE 3
7550 LOAD IMAGE "assets/buttons1/leftp.png" AS SPRITE 4
7560 LOAD IMAGE "assets/buttons1/rightp.png" AS SPRITE 5
7570 LOAD IMAGE "assets/buttons1/startp.png" AS SPRITE 6
7580 LOAD IMAGE "assets/buttons1/selectp.png" AS SPRITE 7
7590 LOAD IMAGE "assets/buttons1/Xp.png" AS SPRITE 8
7600 LOAD IMAGE "assets/buttons1/Yp.png" AS SPRITE 9
7610 LOAD IMAGE "assets/buttons1/Ap.png" AS SPRITE 10
7620 LOAD IMAGE "assets/buttons1/Bp.png" AS SPRITE 11
7650 FOR LP=0 TO 11
7660   SPRITE LP SIZE 32,32 OFF
7670 NEXT LP
7700 MOVE SPRITE 0 TO 80,80
7710 MOVE SPRITE 1 TO 80,142
7720 MOVE SPRITE 2 TO 111,112
7730 MOVE SPRITE 3 TO 49,112
7740 MOVE SPRITE 4 TO 79,35
7750 MOVE SPRITE 5 TO 288,35
7760 MOVE SPRITE 6 TO 204,112
7770 MOVE SPRITE 7 TO 164,112
7780 MOVE SPRITE 8 TO 288,82
7790 MOVE SPRITE 9 TO 255,112
7800 MOVE SPRITE 10 TO 321,112
7810 MOVE SPRITE 11 TO 288,139
7820 RETURN
7996 REM run
7997 REM 
7998 REM 
8000 &
