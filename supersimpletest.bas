100 SCREEN 7:PALETTE 0
110 LOCATE 0,0:PRINT "D-Pad Direction"
115 WHILE INKEY$<>"Q"
120   stick=PAD(0)
140   IF stick=LEFT THEN stick$="left      "
150   IF stick=RIGHT THEN stick$="right     "
160   IF stick=DOWN THEN stick$="down      "
170   IF stick=UP THEN stick$="up        "
180   IF stick=12 THEN stick$="up right  "
190   IF stick=6 THEN stick$="down right"
200   IF stick=3 THEN stick$="down left "
210   IF stick=9 THEN stick$="up left   "
220   IF stick=15 THEN stick$="holy shit "
230   LOCATE 0,2:PRINT stick$;
290   stick$=" NOTHING "
300 WEND
