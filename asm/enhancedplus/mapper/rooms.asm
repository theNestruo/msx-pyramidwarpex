    ; ------------------------------
    ; room 00        
    ; walls         ; XXXXXXXXXXXXX
    DB 01Dh, 000h    ; X___XXX^X___X
    DB 040h, 040h    ; X_X___N___X_X
    DB 05Fh, 040h    ; X_X_XXXXX_X_X
    DB 000h, 000h    ; X_____B_____X
    DB 06Eh, 0A0h    ; X_XX_HHH_X_XX
    DB 020h, 0A0h    ; X__X_____X_XX
    DB 08Eh, 000h    ; XX___HHH____X
    DB 020h, 0C0h    ; X__X__B__XX_X
    DB 06Eh, 0C0h    ; X_XX_XXX_XXvX
    DB 040h, 060h    ; X_X___B___XXX
    DB 01Fh, 000h    ; X___XXXXX___X
    ; objects       ; XXXXXXXXXXXXX
    DB 005h, 003h    ; box1
    DB 005h, 007h    ; box2
    DB 005h, 009h    ; box3
    DB 005h, 001h    ; nest
    DB 086h, 000h    ; door (^)
    DB 00Ah, 008h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 01        
    ; walls         ; XXXXXXXXXXXXX
    DB 0EAh, 000h    ; XXXX^X_X____X
    DB 088h, 0C0h    ; XX___X___XX_X
    DB 0BAh, 0C0h    ; XX_XXX_X_XX_X
    DB 002h, 000h    ; XB_____X____X
    DB 0EEh, 0A0h    ; XXXX_HHH_XBXX
    DB 000h, 000h    ; XN__________X
    DB 0AEh, 0E0h    ; XX_X_HHH_XXXX
    DB 008h, 000h    ; X____X_____BX
    DB 06Bh, 0A0h    ; X_XX_X_XXX_XX
    DB 062h, 020h    ; X_XX___X___XX
    DB 00Ah, 0E0h    ; X____XvX_XXXX
    ; objects       ; XXXXXXXXXXXXX
    DB 000h, 003h    ; box1
    DB 009h, 004h    ; box2
    DB 00Ah, 007h    ; box3
    DB 000h, 005h    ; nest
    DB 083h, 000h    ; door (^)
    DB 005h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 02        
    ; walls         ; XXXXXXXXXXXXX
    DB 000h, 040h    ; X_____B___X_X
    DB 06Fh, 000h    ; X_XX_XXXX___X
    DB 000h, 040h    ; X_________X_X
    DB 07Ah, 080h    ; X_XXXXvX_X__X
    DB 00Eh, 020h    ; X____HHH___XX
    DB 0A0h, 080h    ; XX_X_____X_BX
    DB 02Eh, 0A0h    ; XN_X_HHH_X_XX
    DB 0A8h, 020h    ; XX_X_X_____XX
    DB 003h, 080h    ; X______XXX__X
    DB 076h, 0C0h    ; X_XXX_XX^XX_X
    DB 000h, 000h    ; X__B________X
    ; objects       ; XXXXXXXXXXXXX
    DB 005h, 000h    ; box1
    DB 00Ah, 005h    ; box2
    DB 002h, 00Ah    ; box3
    DB 000h, 006h    ; nest
    DB 087h, 009h    ; door (^)
    DB 005h, 003h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 03        
    ; walls         ; XXXXXXXXXXXXX
    DB 05Fh, 000h    ; XBX_XXXXX_B_X
    DB 00Ah, 040h    ; X____X^X__X_X
    DB 06Ah, 0C0h    ; X_XX_X_X_XX_X
    DB 000h, 000h    ; X___________X
    DB 05Eh, 0E0h    ; X_X_XHHH_XXXX
    DB 000h, 000h    ; X___________X
    DB 0BFh, 040h    ; XX_XXHHHX_X_X
    DB 000h, 000h    ; X___________X
    DB 06Ah, 0C0h    ; X_XX_X_X_XX_X
    DB 02Ah, 000h    ; X__X_XvX____X
    DB 08Eh, 0A0h    ; XX_N_XXX_XBXX
    ; objects       ; XXXXXXXXXXXXX
    DB 000h, 000h    ; box1
    DB 009h, 000h    ; box2
    DB 009h, 00Ah    ; box3
    DB 002h, 00Ah    ; nest
    DB 085h, 001h    ; door (^)
    DB 005h, 009h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 04        
    ; walls         ; XXXXXXXXXXXXX
    DB 08Ah, 020h    ; XX___X^X___XX
    DB 028h, 080h    ; X__X_X___X__X
    DB 062h, 0C0h    ; X_XX___X_XXBX
    DB 02Ah, 080h    ; X__X_X_X_X__X
    DB 08Eh, 020h    ; XX___HHH___XX
    DB 020h, 0E0h    ; XN_X_____XXXX
    DB 08Eh, 020h    ; XX___HHH___XX
    DB 02Ah, 080h    ; X__X_X_X_X__X
    DB 062h, 0C0h    ; XBXX___X_XXBX
    DB 028h, 080h    ; X__X_X___X__X
    DB 08Ah, 020h    ; XX___XvX___XX
    ; objects       ; XXXXXXXXXXXXX
    DB 00Ah, 002h    ; box1
    DB 000h, 008h    ; box2
    DB 00Ah, 008h    ; box3
    DB 000h, 005h    ; nest
    DB 085h, 000h    ; door (^)
    DB 005h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 05        
    ; walls         ; XXXXXXXXXXXXX
    DB 0AAh, 0A0h    ; XX_X^X_XBX_XX
    DB 000h, 000h    ; X___________X
    DB 0BBh, 0A0h    ; XX_XXX_XXX_XX
    DB 000h, 000h    ; XN__________X
    DB 0EEh, 0E0h    ; XXXX_HHH_XXXX
    DB 000h, 000h    ; X___________X
    DB 0EEh, 0E0h    ; XXXX_HHH_XXXX
    DB 000h, 000h    ; X__________BX
    DB 0BBh, 0A0h    ; XX_XXX_XXX_XX
    DB 000h, 000h    ; X___________X
    DB 0AAh, 0A0h    ; XX_XBX_XvX_XX
    ; objects       ; XXXXXXXXXXXXX
    DB 007h, 000h    ; box1
    DB 00Ah, 007h    ; box2
    DB 003h, 00Ah    ; box3
    DB 000h, 003h    ; nest
    DB 083h, 000h    ; door (^)
    DB 007h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 06        
    ; walls         ; XXXXXXXXXXXXX
    DB 0AAh, 0A0h    ; XX_X_X_XBX^XX
    DB 082h, 0A0h    ; XX_____X_X_XX
    DB 0AAh, 0A0h    ; XX_X_X_X_X_XX
    DB 028h, 000h    ; XB_X_X______X
    DB 0AEh, 0A0h    ; XX_X_HHH_X_XX
    DB 080h, 080h    ; XX_______X_NX
    DB 0AEh, 0A0h    ; XX_X_HHH_X_XX
    DB 022h, 020h    ; X__X___X___XX
    DB 0AAh, 0A0h    ; XX_X_X_X_X_XX
    DB 088h, 080h    ; XX___X___X__X
    DB 0AAh, 0A0h    ; XX_XvX_XBX_XX
    ; objects       ; XXXXXXXXXXXXX
    DB 007h, 000h    ; box1
    DB 000h, 003h    ; box2
    DB 007h, 00Ah    ; box3
    DB 00Ah, 005h    ; nest
    DB 089h, 000h    ; door (^)
    DB 003h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 07        
    ; walls         ; XXXXXXXXXXXXX
    DB 021h, 0A0h    ; X_BX____XX^XX
    DB 06Ch, 000h    ; X_XX_XX_____X
    DB 00Dh, 0A0h    ; X____XX_XX_XX
    DB 061h, 0A0h    ; X_XX____XX_XX
    DB 06Eh, 000h    ; X_XX_HHH____X
    DB 000h, 0C0h    ; X________XX_X
    DB 0BEh, 0C0h    ; XX_XXHHH_XX_X
    DB 0B0h, 000h    ; XX_XXN______X
    DB 003h, 060h    ; X______XX_XXX
    DB 05Bh, 040h    ; XBX_XX_XX_XBX
    DB 0D8h, 000h    ; XXXvXX______X
    ; objects       ; XXXXXXXXXXXXX
    DB 001h, 000h    ; box1
    DB 000h, 009h    ; box2
    DB 00Ah, 009h    ; box3
    DB 004h, 007h    ; nest
    DB 089h, 000h    ; door (^)
    DB 002h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 08        
    ; walls         ; XXXXXXXXXXXXX
    DB 0BAh, 0A0h    ; XX_XXX^XBX_XX
    DB 008h, 000h    ; X____X______X
    DB 063h, 0C0h    ; X_XX___XXXX_X
    DB 00Ah, 000h    ; X_N__X_X____X
    DB 07Eh, 0A0h    ; X_XXXHHH_X_XX
    DB 000h, 000h    ; X___________X
    DB 0AEh, 0E0h    ; XX_X_HHH_XXXX
    DB 0EAh, 000h    ; XXXX_X_X___BX
    DB 08Ah, 0A0h    ; XX___X_X_X_XX
    DB 020h, 080h    ; X__X_____X__X
    DB 0AAh, 0A0h    ; XXBX_XvX_X_XX
    ; objects       ; XXXXXXXXXXXXX
    DB 007h, 000h    ; box1
    DB 00Ah, 007h    ; box2
    DB 001h, 00Ah    ; box3
    DB 001h, 003h    ; nest
    DB 085h, 000h    ; door (^)
    DB 005h, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 09        
    ; walls         ; XXXXXXXXXXXXX
    DB 050h, 000h    ; X_XBX______BX
    DB 015h, 040h    ; X___X_X_X_X_X
    DB 054h, 040h    ; X_X_X_X___X_X
    DB 001h, 000h    ; X_______X___X
    DB 07Fh, 0A0h    ; X_XXXHHHXXNXX
    DB 040h, 000h    ; XvX_________X
    DB 0EEh, 0E0h    ; XXXX_HHH_XXXX
    DB 000h, 040h    ; X_________X^X
    DB 0DBh, 040h    ; XXX_XX_XX_X_X
    DB 008h, 040h    ; XB___X____X_X
    DB 0A3h, 000h    ; XX_X___XX___X
    ; objects       ; XXXXXXXXXXXXX
    DB 002h, 000h    ; box1
    DB 00Ah, 000h    ; box2
    DB 000h, 009h    ; box3
    DB 009h, 004h    ; nest
    DB 08Ah, 007h    ; door (^)
    DB 000h, 005h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 10        
    ; walls         ; XXXXXXXXXXXXX
    DB 010h, 020h    ; X___X______XX
    DB 046h, 080h    ; X_X___XX_XB_X
    DB 06Ah, 0C0h    ; X_XX_X^X_XX_X
    DB 000h, 040h    ; X_________X_X
    DB 0BFh, 000h    ; XX_XXHHHX___X
    DB 0A0h, 0A0h    ; XXBX_____XNXX
    DB 00Eh, 000h    ; X____HHH____X
    DB 060h, 0A0h    ; X_XX_____X_XX
    DB 04Ah, 080h    ; X_X__XvX_X__X
    DB 02Eh, 0C0h    ; X__X_XXX_XX_X
    DB 080h, 000h    ; XX_______B__X
    ; objects       ; XXXXXXXXXXXXX
    DB 009h, 001h    ; box1
    DB 001h, 005h    ; box2
    DB 008h, 00Ah    ; box3
    DB 009h, 005h    ; nest
    DB 085h, 002h    ; door (^)
    DB 005h, 008h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 11        
    ; walls         ; XXXXXXXXXXXXX
    DB 02Ah, 080h    ; X__X_XBX_X__X
    DB 060h, 0C0h    ; X_XX_____XX_X
    DB 02Ah, 040h    ; X__XBX_X_BX_X
    DB 0BBh, 0C0h    ; XX_XXXvXXXX_X
    DB 01Fh, 000h    ; X___XHHHX___X
    DB 040h, 040h    ; X_X_______X_X
    DB 01Fh, 040h    ; X___XHHHX_X_X
    DB 055h, 040h    ; X_X_XNX^X_X_X
    DB 040h, 000h    ; X_X_________X
    DB 05Dh, 040h    ; X_X_XXX_X_X_X
    DB 000h, 000h    ; X___________X
    ; objects       ; XXXXXXXXXXXXX
    DB 005h, 000h    ; box1
    DB 003h, 002h    ; box2
    DB 008h, 002h    ; box3
    DB 004h, 007h    ; nest
    DB 086h, 007h    ; door (^)
    DB 005h, 003h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 12        
    ; walls         ; XXXXXXXXXXXXX
    DB 060h, 0C0h    ; XBXX_____XXBX
    DB 04Eh, 040h    ; X_X__XXX__X_X
    DB 01Bh, 000h    ; X___XX^XX___X
    DB 040h, 040h    ; X_X_______X_X
    DB 06Eh, 0C0h    ; X_XX_HHH_XX_X
    DB 000h, 000h    ; X___________X
    DB 06Eh, 0C0h    ; X_XX_HHH_XX_X
    DB 040h, 040h    ; X_X_______X_X
    DB 01Bh, 000h    ; X___XXNXX___X
    DB 04Eh, 040h    ; X_X__XXX__X_X
    DB 060h, 0C0h    ; XBXX_____XXvX
    ; objects       ; XXXXXXXXXXXXX
    DB 000h, 000h    ; box1
    DB 00Ah, 000h    ; box2
    DB 000h, 00Ah    ; box3
    DB 005h, 008h    ; nest
    DB 085h, 002h    ; door (^)
    DB 00Ah, 00Ah    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 13        
    ; walls         ; XXXXXXXXXXXXX
    DB 003h, 040h    ; X______XX_X^X
    DB 078h, 040h    ; XvXXXX____X_X
    DB 0C2h, 0C0h    ; XXX____X_XX_X
    DB 028h, 000h    ; XN_X_X______X
    DB 0AEh, 0E0h    ; XX_X_HHH_XXXX
    DB 000h, 000h    ; X__________BX
    DB 0EEh, 0E0h    ; XXXX_HHH_XXXX
    DB 044h, 000h    ; XBX___X_____X
    DB 015h, 0A0h    ; X___X_X_XX_XX
    DB 071h, 000h    ; X_XXX___X___X
    DB 004h, 040h    ; X_____X___XBX
    ; objects       ; XXXXXXXXXXXXX
    DB 00Ah, 005h    ; box1
    DB 000h, 007h    ; box2
    DB 00Ah, 00Ah    ; box3
    DB 000h, 003h    ; nest
    DB 08Ah, 000h    ; door (^)
    DB 000h, 001h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 14        
    ; walls         ; XXXXXXXXXXXXX
    DB 0BBh, 0E0h    ; XXBXXX_XXXXXX
    DB 0A0h, 080h    ; XX_X_____X__X
    DB 0AAh, 0A0h    ; XX_X_X_X_X_XX
    DB 08Ah, 000h    ; XX___XvX___BX
    DB 02Eh, 0A0h    ; X__X_HHH_X_XX
    DB 040h, 080h    ; X_XB_____X__X
    DB 02Eh, 0C0h    ; X__X_HHH_XX_X
    DB 08Ah, 000h    ; XX___X^X____X
    DB 0A0h, 0A0h    ; XX_X_____X_XX
    DB 02Dh, 080h    ; X__X_XX_XX__X
    DB 020h, 0A0h    ; XN_X_____X_XX
    ; objects       ; XXXXXXXXXXXXX
    DB 001h, 000h    ; box1
    DB 00Ah, 003h    ; box2
    DB 002h, 005h    ; box3
    DB 000h, 00Ah    ; nest
    DB 085h, 007h    ; door (^)
    DB 005h, 003h    ; door (v)
    ; ------------------------------

    ; ------------------------------
    ; room 15        
    ; walls         ; XXXXXXXXXXXXX
    DB 000h, 000h    ; X___________X
    DB 000h, 000h    ; X___________X
    DB 000h, 000h    ; X___________X
    DB 000h, 000h    ; X___________X
    DB 0FBh, 0E0h    ; XXXXXX_XXXXXX
    DB 01Bh, 000h    ; X___XX_XX___X
    DB 040h, 040h    ; X_X_______X_X
    DB 075h, 0C0h    ; X_XXX_X_XXX_X
    DB 000h, 000h    ; X___________X
    DB 000h, 000h    ; X___________X
    DB 000h, 000h    ; X___________X
    ; objects       ; XXXXXXXXXXXXX
    DB 00Fh, 00Fh    ; box1
    DB 00Fh, 00Fh    ; box2
    DB 00Fh, 00Fh    ; box3
    DB 00Fh, 00Fh    ; nest
    DB 08Fh, 00Fh    ; door (^)
    DB 00Fh, 00Fh    ; door (v)
    ; ------------------------------

