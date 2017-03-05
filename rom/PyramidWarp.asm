
        ORG     8000h

        DB      41h             ; 'A'
        DB      42h             ; 'B'
        DB      10h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h

        ; Entry Point
        ; --- START PROC L8010 ---
L8010:  call    L9291
        ld      bc,0E201h       ; address or value?
        call    0047h
        call    0069h
        ld      a,0Fh
        ld      b,00h
        ld      c,01h
        call    L933A
        call    L930B
        ld      a,00h
        ld      de,94E4h        ; address or value?
        call    L91D2
        ld      a,01h
        ld      de,9504h        ; address or value?
        call    L91D2
        ld      a,02h
        ld      de,9524h        ; address or value?
        call    L91D2
        ld      a,03h
        ld      de,9544h        ; address or value?
        call    L91D2
        ld      a,04h
        ld      de,9564h        ; address or value?
        call    L91D2
        ld      a,05h
        ld      de,9584h        ; address or value?
        call    L91D2
        ld      a,06h
        ld      de,95A4h        ; address or value?
        call    L91D2
        ld      a,07h
        ld      de,95C4h        ; address or value?
        call    L91D2
        ld      a,08h
        ld      de,95E4h        ; address or value?
        call    L91D2
        ld      a,09h
        ld      de,9604h        ; address or value?
        call    L91D2
        ld      a,0Ah
        ld      de,9624h        ; address or value?
        call    L91D2
        ld      a,0Bh
        ld      de,9644h        ; address or value?
        call    L91D2
        ld      a,0Ch
        ld      de,9664h        ; address or value?
        call    L91D2
        ld      a,0Dh
        ld      de,9684h        ; address or value?
        call    L91D2
        ld      a,0Eh
        ld      de,96A4h        ; address or value?
        call    L91D2
        ld      a,0Fh
        ld      de,96C4h        ; address or value?
        call    L91D2
        ld      a,10h
        ld      de,96E4h        ; address or value?
        call    L91D2
        ld      a,11h
        ld      de,9704h        ; address or value?
        call    L91D2
        ld      a,12h
        ld      de,9744h        ; address or value?
        call    L91D2
        ld      a,13h
        ld      de,9764h        ; address or value?
        call    L91D2
        ld      a,14h
        ld      de,9784h        ; address or value?
        call    L91D2
        ld      a,15h
        ld      de,97A4h        ; address or value?
        call    L91D2
        ld      a,16h
        ld      de,97C4h        ; address or value?
        call    L91D2
        ld      a,17h
        ld      de,97E4h        ; address or value?
        call    L91D2
        ld      a,18h
        ld      de,9804h        ; address or value?
        call    L91D2
        ld      a,19h
        ld      de,9824h        ; address or value?
        call    L91D2
        ld      a,1Ah
        ld      de,9844h        ; address or value?
        call    L91D2
        ld      a,1Bh
        ld      de,9864h        ; address or value?
        call    L91D2
        ld      a,1Ch
        ld      de,9884h        ; address or value?
        call    L91D2
        ld      a,1Dh
        ld      de,98A4h        ; address or value?
        call    L91D2
        ld      a,1Eh
        ld      de,98C4h        ; address or value?
        call    L91D2
        ld      a,1Fh
        ld      de,98E4h        ; address or value?
        call    L91D2
        ld      a,20h           ; ' '
        ld      de,9904h        ; address or value?
        call    L91D2
        ld      a,21h           ; '!'
        ld      de,9924h        ; address or value?
        call    L91D2
        ld      a,22h           ; '"'
        ld      de,9944h        ; address or value?
        call    L91D2
        ld      a,23h           ; '#'
        ld      de,9964h        ; address or value?
        call    L91D2
        ld      a,24h           ; '$'
        ld      de,9984h        ; address or value?
        call    L91D2
        ld      a,30h           ; '0'
        ld      de,99A4h        ; address or value?
        call    L91F5
        ld      a,34h           ; '4'
        ld      de,99E4h        ; address or value?
        call    L91F5
        ld      a,38h           ; '8'
        ld      de,9A24h        ; address or value?
        call    L91F5
        ld      a,3Ch           ; '<'
        ld      de,9A64h        ; address or value?
        call    L91F5
        ld      a,4Ch           ; 'L'
        ld      de,9AA4h        ; address or value?
        call    L91F5
        ld      a,50h           ; 'P'
        ld      de,9AE4h        ; address or value?
        call    L91F5
        ld      a,54h           ; 'T'
        ld      de,9B24h        ; address or value?
        call    L91F5
        ld      a,58h           ; 'X'
        ld      de,9B64h        ; address or value?
        call    L91F5
        ld      a,60h           ; '`'
        ld      de,9BA4h        ; address or value?
        call    L91FA
        ld      a,61h           ; 'a'
        ld      de,9BC4h        ; address or value?
        call    L91FA
        ld      a,62h           ; 'b'
        ld      de,9BD4h        ; address or value?
        call    L91FA
        ld      a,63h           ; 'c'
        ld      de,9BE4h        ; address or value?
        call    L91FA
        ld      a,64h           ; 'd'
        ld      de,9BF4h        ; address or value?
        call    L91FA
        ld      a,0FFh
        ld      de,9BB4h        ; address or value?
        call    L91FA
        ld      hl,9CACh        ; address or value?
        ld      de,080Dh        ; address or value?
        ld      b,03h
        call    L92FC
        ld      hl,9CAFh        ; address or value?
        ld      de,0A09h        ; address or value?
        ld      b,0Ch
        call    L92FC
        ld      hl,9CBBh        ; address or value?
        ld      de,0C05h        ; address or value?
        ld      b,14h
        call    L92FC
        ld      hl,9C9Fh        ; address or value?
        ld      de,1008h        ; address or value?
        ld      b,0Dh
        call    L92FC

        ; Referenced from 820B
L81EC:  call    L9280
        or      a
        jr      nz,L820D
        ld      a,(0C0D8h)
        inc     a
        ld      (0C0D8h),a
        ld      hl,9C9Fh        ; address or value?
        and     80h
        jr      z,L8203
        ld      hl,9C62h        ; address or value?

        ; Referenced from 81FE
L8203:  ld      de,1008h        ; address or value?
        ld      b,0Dh
        call    L92FC
        jr      L81EC

        ; Referenced from 81F0
L820D:  ld      c,07h
        ld      b,04h
        call    0047h
        xor     a
        ld      bc,0000h        ; address or value?
        ld      (0C07Fh),a
        ld      (0C080h),bc
        ld      (0C082h),a
        ld      (0C083h),bc
        ld      hl,9C04h        ; address or value?
        ld      de,0019h        ; address or value?
        ld      b,07h
        call    L92FC
        ld      hl,9C0Bh        ; address or value?
        ld      de,0119h        ; address or value?
        ld      b,07h
        call    L92FC
        ld      hl,9C04h        ; address or value?
        ld      de,0219h        ; address or value?
        ld      b,07h
        call    L92FC
        ld      hl,9C12h        ; address or value?
        ld      de,0419h        ; address or value?
        ld      b,07h
        call    L92FC
        ld      hl,9C19h        ; address or value?
        ld      de,051Bh        ; address or value?
        ld      b,04h
        call    L92FC
        ld      hl,9C1Dh        ; address or value?
        ld      de,0719h        ; address or value?
        ld      b,04h
        call    L92FC
        ld      hl,9C21h        ; address or value?
        ld      de,0A19h        ; address or value?
        ld      b,05h
        call    L92FC
        ld      hl,9C26h        ; address or value?
        ld      de,1019h        ; address or value?
        ld      b,04h
        call    L92FC
        ld      hl,9C2Ah        ; address or value?
        ld      de,0D19h        ; address or value?
        ld      b,03h
        call    L92FC
        ld      hl,9C3Bh        ; address or value?
        ld      de,0001h        ; address or value?
        ld      b,18h
        ld      c,18h

        ; Referenced from 829E
L8293:  push    hl
        push    de
        push    bc
        call    L92FC
        pop     bc
        pop     de
        pop     hl
        inc     d
        dec     c
        jr      nz,L8293
        ld      a,0Fh
        ld      (0C021h),a
        ld      (0C059h),a
        ld      a,09h
        ld      (0C029h),a
        ld      (0C041h),a
        ld      a,01h
        ld      (0C031h),a
        ld      (0C049h),a

        ; Referenced from 8E07
        ; --- START PROC L82B8 ---
L82B8:  ld      b,06h
        ld      de,1719h        ; address or value?
        ld      hl,9C71h        ; address or value?
        call    L92FC
        ld      a,05h
        ld      (0C07Ch),a
        ld      b,a
        ld      de,1719h        ; address or value?
        ld      hl,9C77h        ; address or value?
        call    L92FC
        xor     a
        ld      (0C07Bh),a
        xor     a
        ld      bc,0000h        ; address or value?
        ld      (0C082h),a
        ld      (0C083h),bc
        ld      de,0B19h        ; address or value?
        call    L92D6

        ; Referenced from 8B66
        ; --- START PROC L82E7 ---
L82E7:  xor     a
        ld      (0C085h),a
        call    L8C2E
        and     03h
        inc     a
        ld      b,a
        ld      hl,9EE5h        ; address or value?
        ld      de,0007h        ; address or value?

        ; Referenced from 82F9
L82F8:  add     hl,de
        djnz    L82F8
        ld      b,07h
        ld      ix,0C087h       ; address or value?

        ; Referenced from 8308
L8301:  ld      a,(hl)
        inc     hl
        ld      (ix+00h),a
        inc     ix
        djnz    L8301
        call    L8C2E
        and     03h
        inc     a
        ld      hl,9F03h        ; address or value?
        ld      de,0005h        ; address or value?
        ld      b,a

        ; Referenced from 8318
L8317:  add     hl,de
        djnz    L8317
        ld      b,05h

        ; Referenced from 8323
L831C:  ld      a,(hl)
        inc     hl
        ld      (ix+00h),a
        inc     ix
        djnz    L831C
        call    L8C2E
        and     03h
        inc     a
        ld      hl,9F19h        ; address or value?
        ld      de,0003h        ; address or value?
        ld      b,a

        ; Referenced from 8333
L8332:  add     hl,de
        djnz    L8332
        ld      b,03h

        ; Referenced from 833E
L8337:  ld      a,(hl)
        inc     hl
        ld      (ix+00h),a
        inc     ix
        djnz    L8337
        ld      a,10h
        ld      (ix+00h),a
        ld      hl,9C54h        ; address or value?
        ld      de,1519h        ; address or value?
        ld      b,07h

        ; Referenced from 835D
L834D:  push    hl
        push    de
        push    bc
        call    L92FC
        pop     bc
        pop     de
        pop     hl
        inc     e
        dec     d
        dec     b
        dec     b
        ld      a,01h
        cp      b
        jr      nz,L834D
        ld      de,121Ch        ; address or value?
        ld      a,62h           ; 'b'
        call    L9236
        call    L8F14

        ; Referenced from 8DD5
        ; --- START PROC L836A ---
L836A:  ld      b,05h
        ld      hl,9C71h        ; address or value?
        ld      de,1719h        ; address or value?
        call    L92FC
        ld      a,(0C07Ch)
        dec     a
        ld      (0C07Ch),a
        jp      m,L8DD8
        or      a
        jr      z,L838C
        ld      b,a
        ld      de,1719h        ; address or value?
        ld      hl,9C77h        ; address or value?
        call    L92FC

        ; Referenced from 8380, 89DE
        ; --- START PROC L838C ---
L838C:  call    L8F08
        ld      b,00h
        ld      hl,1B00h        ; address or value?

        ; Referenced from 839D
L8394:  ld      a,0D1h
        call    004Dh
        inc     hl
        inc     hl
        inc     hl
        inc     hl
        djnz    L8394
        ld      a,(0C085h)
        ld      hl,0C087h       ; address or value?
        call    L8C27
        ld      a,(hl)
        ld      (0C076h),a
        ld      de,1518h        ; address or value?
        cp      08h
        jr      c,L83C7
        inc     e
        dec     d
        sub     07h
        cp      06h
        jr      c,L83C7
        inc     e
        dec     d
        sub     05h
        cp      04h
        jr      c,L83C7
        inc     e
        dec     d
        sub     03h

        ; Referenced from 83B1, 83B9, 83C1
L83C7:  add     a,e
        ld      e,a
        ld      (0C097h),de
        ld      a,(0C076h)
        add     a,00h
        daa
        rra
        rra
        rra
        rra
        and     0Fh
        ld      de,101Dh        ; address or value?
        call    L9236
        ld      a,(0C076h)
        add     a,00h
        daa
        and     0Fh
        ld      de,101Eh        ; address or value?
        call    L9236
        ld      hl,9CB6h        ; address or value?
        ld      de,0022h        ; address or value?
        ld      a,(0C076h)
        ld      b,a

        ; Referenced from 83F8
L83F7:  add     hl,de
        djnz    L83F7
        xor     a
        ld      (0C0D8h),a

        ; Referenced from 8439
L83FE:  xor     a
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        inc     hl

        ; Referenced from 842E
L8403:  sla     b
        rl      c
        push    hl
        push    bc
        push    af
        jr      nc,L841C
        inc     a
        add     a,a
        ld      e,a
        ld      a,(0C0D8h)
        add     a,a
        inc     a
        ld      d,a
        ld      a,30h           ; '0'
        call    L9231
        jr      L8428

        ; Referenced from 840A
L841C:  inc     a
        add     a,a
        ld      e,a
        ld      a,(0C0D8h)
        add     a,a
        inc     a
        ld      d,a
        call    L8EEB

        ; Referenced from 841A
L8428:  pop     af
        pop     bc
        pop     hl
        inc     a
        cp      0Bh
        jr      nz,L8403
        ld      a,(0C0D8h)
        inc     a
        ld      (0C0D8h),a
        cp      0Bh
        jr      nz,L83FE
        xor     a
        ld      (0C023h),a
        ld      (0C02Bh),a
        ld      (0C043h),a
        ld      (0C033h),a
        ld      (0C04Bh),a
        ld      (0C03Bh),a
        ld      (0C053h),a
        ld      (0C05Bh),a
        ld      (0C05Fh),a
        ld      (0C070h),a
        ld      (0C06Fh),a
        ld      (0C06Dh),a
        ld      (0C05Eh),a
        ld      a,01h
        ld      (0C060h),a
        ld      a,12h
        ld      (0C02Ch),a
        ld      (0C044h),a
        ld      a,14h
        ld      (0C034h),a
        ld      (0C04Ch),a
        ld      a,16h
        ld      (0C03Ch),a
        ld      (0C054h),a
        ld      a,04h
        ld      (0C02Dh),a
        inc     a
        ld      (0C035h),a
        inc     a
        ld      (0C03Dh),a
        inc     a
        ld      (0C045h),a
        inc     a
        ld      (0C04Dh),a
        inc     a
        ld      (0C055h),a
        jr      L84D1

        ; Referenced from 85E6, 8634, 8A47
        ; --- START PROC L849B ---
L849B:  ld      bc,03E8h        ; address or value?
        xor     a

        ; Referenced from 84A2
L849F:  sbc     hl,bc
        inc     a
        jr      nc,L849F
        add     hl,bc
        dec     a
        ld      (0C071h),a
        ld      bc,0064h        ; address or value?
        xor     a

        ; Referenced from 84B0
L84AD:  sbc     hl,bc
        inc     a
        jr      nc,L84AD
        add     hl,bc
        dec     a
        ld      (0C072h),a
        ld      bc,000Ah        ; address or value?
        xor     a

        ; Referenced from 84BE
L84BB:  sbc     hl,bc
        inc     a
        jr      nc,L84BB
        add     hl,bc
        dec     a
        ld      (0C073h),a
        ld      a,l
        ld      (0C074h),a
        ld      hl,0C071h       ; address or value?
        ld      b,04h
        jp      L92FC

        ; Referenced from 8499
        ; --- START PROC L84D1 ---
L84D1:  ld      a,(0C076h)
        cp      10h
        jp      z,L85CC
        ld      ix,0C000h       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        call    L8603
        xor     a
        ld      (ix+00h),a
        push    hl
        ld      a,34h           ; '4'
        call    L9231
        pop     hl
        ld      ix,0C005h       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        call    L8603
        xor     a
        ld      (ix+00h),a
        push    hl
        ld      a,34h           ; '4'
        call    L9231
        pop     hl
        ld      ix,0C00Ah       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        call    L8603
        xor     a
        ld      (ix+00h),a
        push    hl
        ld      a,34h           ; '4'
        call    L9231
        pop     hl
        ld      ix,0C05Ch       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        call    L8603
        push    hl
        ld      a,54h           ; 'T'
        call    L9231
        pop     hl
        ld      ix,0C00Fh       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        ld      b,00h
        ld      a,e
        and     7Fh             ; ''
        cp      e
        jr      z,L853E
        inc     b

        ; Referenced from 853B
L853E:  ld      (ix+00h),b
        inc     ix
        ld      e,a
        call    L8603
        inc     ix
        ld      a,03h
        ld      (ix+00h),a
        push    hl
        ld      a,b
        add     a,a
        add     a,18h
        add     a,a
        add     a,a
        ld      (0C012h),a
        ld      de,0C010h       ; address or value?
        ld      a,00h
        call    L91E3
        pop     hl
        ld      ix,0C014h       ; address or value?
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        ld      b,00h
        ld      a,e
        and     7Fh             ; ''
        cp      e
        jr      z,L8572
        inc     b

        ; Referenced from 856F
L8572:  ld      (ix+00h),b
        inc     ix
        ld      e,a
        call    L8603
        inc     ix
        ld      a,03h
        ld      (ix+00h),a
        ld      a,b
        add     a,a
        add     a,18h
        add     a,a
        add     a,a
        ld      (0C017h),a
        ld      de,0C015h       ; address or value?
        ld      a,01h
        call    L91E3
        ld      a,4Ch           ; 'L'
        ld      de,090Ah        ; address or value?
        push    af
        push    de
        call    L9231
        pop     de
        pop     af
        inc     e
        inc     e
        push    af
        push    de
        call    L9231
        pop     de
        pop     af
        inc     e
        inc     e
        push    af
        push    de
        call    L9231
        pop     de
        pop     af
        inc     d
        inc     d
        inc     d
        inc     d
        push    af
        push    de
        call    L9231
        pop     de
        pop     af
        dec     e
        dec     e
        push    af
        push    de
        call    L9231
        pop     de
        pop     af
        dec     e
        dec     e
        call    L9231
        jr      L8622

        ; Referenced from 84D6
L85CC:  ld      de,0B0Ch        ; address or value?
        ld      a,34h           ; '4'
        call    L9231
        ld      hl,0BB8h        ; address or value?
        ld      a,(0C07Bh)
        or      a
        jr      z,L85E0
        ld      hl,07D0h        ; address or value?

        ; Referenced from 85DB
L85E0:  ld      (0C077h),hl
        ld      de,0E19h        ; address or value?
        call    L849B
        ld      a,06h
        ld      de,101Eh        ; address or value?
        call    L9236
        xor     a
        ld      (0C010h),a
        ld      (0C015h),a
        ld      hl,0C019h       ; address or value?
        ld      a,98h
        ld      (hl),a
        inc     hl
        ld      a,60h           ; '`'
        jr      L8640

        ; Referenced from 84E1, 84F7, 850D, 8523, 8544, 8578
        ; --- START PROC L8603 ---
L8603:  ld      a,d
        add     a,a
        inc     a
        add     a,a
        add     a,a
        add     a,a
        ld      (ix+00h),a
        inc     ix
        ld      a,d
        add     a,a
        inc     a
        ld      d,a
        ld      a,e
        inc     a
        add     a,a
        add     a,a
        add     a,a
        add     a,a
        ld      (ix+00h),a
        inc     ix
        ld      a,e
        inc     a
        add     a,a
        ld      e,a
        ret

        ; Referenced from 85CA
        ; --- START PROC L8622 ---
L8622:  ld      hl,0BB8h        ; address or value?
        ld      a,(0C07Bh)
        or      a
        jr      z,L862E
        ld      hl,07D0h        ; address or value?

        ; Referenced from 8629
L862E:  ld      (0C077h),hl
        ld      de,0E19h        ; address or value?
        call    L849B
        ld      hl,0C019h       ; address or value?
        ld      a,58h           ; 'X'
        ld      (hl),a
        inc     hl
        ld      a,60h           ; '`'

        ; Referenced from 8601
        ; --- START PROC L8640 ---
L8640:  ld      (hl),a
        inc     hl
        ld      a,04h
        ld      (hl),a
        inc     hl
        ld      a,0Bh
        ld      (hl),a
        inc     hl
        ld      a,01h
        ld      (hl),a
        ld      de,0C019h       ; address or value?
        ld      a,02h
        call    L91E3
        ld      hl,8EE6h        ; address or value?
        call    L8C2E
        and     03h
        dec     a
        jr      z,L8665
        dec     a
        jr      z,L8664
        inc     hl

        ; Referenced from 8661
L8664:  inc     hl

        ; Referenced from 865E
L8665:  ld      a,(hl)
        inc     hl
        ld      (0C004h),a
        ld      a,(hl)
        inc     hl
        ld      (0C009h),a
        ld      a,(hl)
        ld      (0C00Eh),a
        ld      b,0Ah

        ; Referenced from 867A
L8675:  push    bc
        call    L8C47
        pop     bc
        djnz    L8675

        ; Referenced from 8AB4
        ; --- START PROC L867C ---
L867C:  ld      hl,(0C077h)
        ld      a,40h           ; '@'
        ld      de,03E8h        ; address or value?
        sbc     hl,de
        jr      c,L8691
        add     a,60h           ; '`'
        or      a
        sbc     hl,de
        jr      c,L8691
        add     a,60h           ; '`'

        ; Referenced from 8686, 868D
L8691:  ld      (0C075h),a
        ld      a,(0C05Fh)
        inc     a
        ld      (0C05Fh),a
        call    L8C3C
        ld      de,(0C097h)
        ld      b,63h           ; 'c'
        ld      a,(0C05Fh)
        and     04h
        jr      z,L86AC
        inc     b

        ; Referenced from 86A9
L86AC:  ld      a,b
        call    L9236
        ld      a,0FFh
        ld      (0C06Ah),a
        ld      hl,0C019h       ; address or value?
        ld      d,(hl)
        inc     hl
        ld      e,(hl)
        call    L8B69
        xor     a
        ld      (0C06Ah),a
        call    L926F
        or      a
        jr      z,L86D1
        dec     a
        srl     a
        inc     a
        and     03h
        ld      (0C060h),a

        ; Referenced from 86C6
L86D1:  ld      a,(0C060h)
        ld      hl,0C061h       ; address or value?
        call    L8C27
        ld      a,(hl)
        or      a
        jr      z,L86E4
        ld      a,(0C060h)
        ld      (0C01Dh),a

        ; Referenced from 86DC
L86E4:  ld      a,(0C01Dh)
        ld      hl,0C061h       ; address or value?
        call    L8C27
        ld      a,(hl)
        or      a
        jr      z,L86F3
        ld      a,02h

        ; Referenced from 86EF
L86F3:  ld      b,a
        ld      a,(0C01Dh)
        ld      c,a
        ld      a,b
        ld      hl,0C019h       ; address or value?
        srl     c
        jr      c,L8701
        inc     hl

        ; Referenced from 86FE
L8701:  srl     c
        jr      c,L8707
        neg

        ; Referenced from 8703
L8707:  add     a,(hl)
        ld      (hl),a
        xor     a
        ld      (0C0DAh),a
        ld      hl,0C019h       ; address or value?
        ld      a,(0C010h)
        cp      (hl)
        jr      nz,L873B
        inc     hl
        ld      a,(0C011h)
        cp      (hl)
        jr      nz,L873B
        call    L912A
        ld      hl,(0C015h)
        ld      (0C019h),hl
        ld      a,(0C014h)
        add     a,a
        ld      b,a
        ld      a,01h
        add     a,b
        ld      (0C01Dh),a
        ld      (0C060h),a
        ld      a,0FFh
        ld      (0C0DAh),a
        jr      L8767

        ; Referenced from 8714, 871B
L873B:  ld      hl,0C019h       ; address or value?
        ld      a,(0C015h)
        cp      (hl)
        jr      nz,L8767
        inc     hl
        ld      a,(0C016h)
        cp      (hl)
        jr      nz,L8767
        call    L912A
        ld      hl,(0C010h)
        ld      (0C019h),hl
        ld      a,(0C00Fh)
        add     a,a
        ld      b,a
        ld      a,01h
        add     a,b
        ld      (0C01Dh),a
        ld      (0C060h),a
        ld      a,0FFh
        ld      (0C0DAh),a

        ; Referenced from 8739, 8742, 8749
L8767:  ld      a,(0C01Dh)
        ld      b,a
        ld      a,(0C05Eh)
        add     a,b
        ld      b,a
        ld      a,(0C05Fh)
        and     02h
        jr      z,L877B
        ld      a,04h
        add     a,b
        ld      b,a

        ; Referenced from 8775
L877B:  ld      a,b
        add     a,a
        add     a,a
        ld      (0C01Bh),a
        ld      b,0Bh
        ld      a,(0C05Eh)
        or      a
        jr      z,L878B
        ld      b,0Fh

        ; Referenced from 8787
L878B:  ld      a,b
        ld      (0C01Ch),a
        ld      de,0C019h       ; address or value?
        ld      a,02h
        call    L91E3
        ld      a,(0C0DAh)
        or      a
        call    z,L910C
        ld      a,(0C05Eh)
        or      a
        jr      z,L87E8
        ld      a,(0C05Bh)
        or      a
        jr      nz,L87E8
        call    L9280
        or      a
        jr      z,L87E8
        ld      ix,0C019h       ; address or value?
        ld      iy,0C056h       ; address or value?
        ld      a,(ix+00h)
        add     a,07h
        ld      (iy+00h),a
        ld      a,(ix+01h)
        add     a,07h
        ld      (iy+01h),a
        ld      a,70h           ; 'p'
        ld      (iy+02h),a
        ld      a,0Fh
        ld      (iy+03h),a
        ld      a,(ix+04h)
        ld      (iy+04h),a
        ld      a,0FFh
        ld      (iy+05h),a
        ld      de,0C056h       ; address or value?
        ld      a,0Ah
        call    L91E3
        call    L913C

        ; Referenced from 87A2, 87A8, 87AE
L87E8:  call    L8C3C
        ld      a,(0C023h)
        or      a
        jp      z,L8908
        ld      hl,0C01Eh       ; address or value?
        ld      d,(hl)
        inc     hl
        ld      e,(hl)
        call    L8B69
        ld      hl,0C061h       ; address or value?
        ld      a,(hl)
        inc     hl
        add     a,(hl)
        inc     hl
        add     a,(hl)
        inc     hl
        add     a,(hl)
        inc     a
        jr      z,L8815
        ld      hl,0C061h       ; address or value?
        ld      a,(0C022h)
        xor     02h
        call    L8C27
        xor     a
        ld      (hl),a

        ; Referenced from 8806
L8815:  ld      a,(0C01Ah)
        ld      b,a
        ld      a,(0C01Fh)
        srl     a
        srl     b
        ld      c,02h
        cp      b
        jr      z,L8867
        jr      nc,L8828
        inc     c

        ; Referenced from 8825
L8828:  ld      a,(0C019h)
        ld      b,a
        ld      a,(0C01Eh)
        srl     a
        srl     b
        cp      b
        jr      z,L8898
        jr      nc,L883A
        inc     c
        inc     c

        ; Referenced from 8836
L883A:  dec     c
        dec     c
        jr      z,L884E
        dec     c
        jr      z,L8849
        dec     c
        jr      z,L8853
        ld      a,03h
        call    L88C9

        ; Referenced from 883F
L8849:  ld      a,02h
        call    L88C9

        ; Referenced from 883C
L884E:  ld      a,01h
        call    L88C9

        ; Referenced from 8842
L8853:  ld      a,00h
        call    L88C9
        ld      a,03h
        call    L88C9
        ld      a,02h
        call    L88C9
        ld      a,01h
        call    L88C9

        ; Referenced from 8823
L8867:  ld      a,(0C019h)
        ld      b,a
        ld      a,(0C01Eh)
        srl     a
        srl     b
        cp      b
        jr      nc,L8884
        ld      a,03h
        call    L88C9
        ld      a,00h
        call    L88C9
        ld      a,02h
        call    L88C9

        ; Referenced from 8873
L8884:  ld      a,01h
        call    L88C9
        ld      a,00h
        call    L88C9
        ld      a,02h
        call    L88C9
        ld      a,03h
        call    L88C9

        ; Referenced from 8834
L8898:  ld      a,(0C01Ah)
        ld      b,a
        ld      a,(0C01Fh)
        srl     a
        srl     b
        cp      b
        jr      c,L88B5
        ld      a,00h
        call    L88C9
        ld      a,01h
        call    L88C9
        ld      a,03h
        call    L88C9

        ; Referenced from 88A4
L88B5:  ld      a,02h
        call    L88C9
        ld      a,01h
        call    L88C9
        ld      a,03h
        call    L88C9
        ld      a,00h
        call    L88C9

        ; Referenced from 8846, 884B, 8850, 8855, 885A, 885F, 8864, 8877, 887C, 8881, 8886, 888B, 8890, 8895, 88A8, 88AD, 88B2, 88B7, 88BC, 88C1, 88C6
        ; --- START PROC L88C9 ---
L88C9:  ld      hl,0C061h       ; address or value?
        ld      b,a
        call    L8C27
        ld      a,(hl)
        or      a
        ret     z
        ld      a,b
        ld      (0C022h),a
        pop     hl
        ld      hl,0C01Eh       ; address or value?
        ld      a,02h
        srl     b
        jr      c,L88E2
        inc     hl

        ; Referenced from 88DF
L88E2:  srl     b
        jr      c,L88E8
        neg

        ; Referenced from 88E4
L88E8:  add     a,(hl)
        ld      (hl),a
        ld      a,(0C05Fh)
        and     02h
        ld      a,10h
        jr      z,L88F4
        inc     a

        ; Referenced from 88F1
L88F4:  add     a,a
        add     a,a
        ld      (0C020h),a
        ld      a,03h
        ld      de,0C01Eh       ; address or value?
        call    L91E3
        ld      ix,0C01Eh       ; address or value?
        call    L8DAC

        ; Referenced from 87EF
        ; --- START PROC L8908 ---
L8908:  call    L8C3C
        ld      a,(0C05Bh)
        or      a
        jr      z,L8969
        inc     a
        jr      nz,L8969
        ld      a,(0C05Ah)
        ld      b,a
        ld      a,04h
        ld      hl,0C056h       ; address or value?
        srl     b
        jr      c,L8922
        inc     hl

        ; Referenced from 891F
L8922:  srl     b
        jr      c,L8928
        neg

        ; Referenced from 8924
L8928:  add     a,(hl)
        ld      (hl),a
        ld      a,(0C05Fh)
        and     08h
        ld      a,1Ch
        jr      z,L8934
        inc     a

        ; Referenced from 8931
L8934:  add     a,a
        add     a,a
        ld      (0C058h),a
        ld      hl,0C056h       ; address or value?
        ld      d,(hl)
        inc     hl
        ld      e,(hl)
        call    L8BE2
        or      a
        jr      nz,L8961
        ld      hl,0C056h       ; address or value?
        ld      a,(hl)
        sub     07h
        ld      (hl),a
        inc     hl
        ld      a,(hl)
        sub     07h
        ld      (hl),a
        inc     hl
        ld      a,78h           ; 'x'
        ld      (hl),a
        inc     hl
        ld      a,06h
        ld      (hl),a
        inc     hl
        inc     hl
        ld      a,06h
        ld      (hl),a
        call    L9133

        ; Referenced from 8943
L8961:  ld      de,0C056h       ; address or value?
        ld      a,0Ah
        call    L91E3

        ; Referenced from 890F, 8912
L8969:  call    L8C3C
        ld      a,(0C076h)
        cp      10h
        jp      z,L8AB7
        ld      ix,0C026h       ; address or value?
        call    L8C50
        ld      ix,0C000h       ; address or value?
        call    L8E0A
        ld      ix,0C02Eh       ; address or value?
        call    L8C50
        ld      a,(0C070h)
        or      a
        jr      z,L89E1
        ld      a,(0C06Eh)
        dec     a
        ld      (0C06Eh),a
        jr      nz,L89B4
        ld      a,0Ah
        ld      (0C06Eh),a
        ld      a,(0C06Fh)
        cpl
        ld      (0C06Fh),a
        ld      de,0B0Ch        ; address or value?
        or      a
        jr      z,L89B1
        ld      a,50h           ; 'P'
        call    L9231
        jr      L89B4

        ; Referenced from 89A8
L89B1:  call    L8EEB

        ; Referenced from 8996, 89AF
L89B4:  ld      hl,0C019h       ; address or value?
        ld      a,58h           ; 'X'
        cp      (hl)
        jr      nz,L89E1
        inc     hl
        ld      a,60h           ; '`'
        cp      (hl)
        jr      nz,L89E1
        ld      a,(0C085h)
        inc     a
        ld      (0C085h),a
        ld      de,(0C097h)
        ld      a,61h           ; 'a'
        call    L9236
        call    L9070
        ld      de,0500h        ; address or value?
        call    L9296
        call    L8F08
        jp      L838C

        ; Referenced from 898D, 89BA, 89C0
L89E1:  call    L8C3C
        ld      ix,0C005h       ; address or value?
        call    L8E0A
        ld      ix,0C03Eh       ; address or value?
        call    L8C50
        ld      ix,0C046h       ; address or value?
        call    L8C50
        ld      ix,0C00Ah       ; address or value?
        call    L8E0A
        ld      ix,0C056h       ; address or value?
        ld      a,(ix+05h)
        or      a
        jr      z,L8A3A
        inc     a
        jr      z,L8A3A
        dec     a
        dec     a
        ld      (ix+05h),a
        jr      z,L8A2D
        ld      b,1Eh
        cp      04h
        jr      c,L8A1B
        inc     b

        ; Referenced from 8A18
L8A1B:  cp      02h
        jr      c,L8A20
        inc     b

        ; Referenced from 8A1D
L8A20:  ld      a,b
        add     a,a
        add     a,a
        ld      (ix+02h),a
        ld      a,06h
        ld      (ix+03h),a
        jr      L8A32

        ; Referenced from 8A12
L8A2D:  ld      a,0D1h
        ld      (ix+00h),a

        ; Referenced from 8A2B
L8A32:  ld      de,0C056h       ; address or value?
        ld      a,0Ah
        call    L91E3

        ; Referenced from 8A08, 8A0B
L8A3A:  call    L8C3C
        ld      hl,(0C077h)
        dec     hl
        ld      (0C077h),hl
        ld      de,0E19h        ; address or value?
        call    L849B
        ld      hl,(0C077h)
        ld      a,h
        or      l
        call    z,L8DCA
        ld      a,(0C05Fh)
        and     04h
        ld      b,54h           ; 'T'
        jr      z,L8A5D
        ld      b,58h           ; 'X'

        ; Referenced from 8A59
L8A5D:  ld      a,(0C05Ch)
        srl     a
        srl     a
        srl     a
        ld      d,a
        ld      a,(0C05Dh)
        srl     a
        srl     a
        srl     a
        ld      e,a
        ld      a,b
        call    L9231
        ld      a,(0C06Dh)
        or      a
        jr      z,L8A8B
        ld      hl,(0C077h)
        ld      de,(0C079h)
        xor     a
        sbc     hl,de
        jr      nc,L8A88
        dec     a

        ; Referenced from 8A85
L8A88:  ld      (0C070h),a

        ; Referenced from 8A79
L8A8B:  ld      a,(0C05Fh)
        and     04h
        jr      z,L8A98
        ld      b,07h
        ld      c,08h
        jr      L8A9C

        ; Referenced from 8A90
L8A98:  ld      b,08h
        ld      c,07h

        ; Referenced from 8A96
L8A9C:  ld      a,b
        ld      (0C013h),a
        ld      a,c
        ld      (0C018h),a
        ld      de,0C010h       ; address or value?
        ld      a,00h
        call    L91E3
        ld      de,0C015h       ; address or value?
        ld      a,01h
        call    L91E3

        ; Referenced from 8ABD, 8AC3
L8AB4:  jp      L867C

        ; Referenced from 8971
L8AB7:  ld      hl,0C019h       ; address or value?
        ld      a,58h           ; 'X'
        cp      (hl)
        jr      nz,L8AB4
        inc     hl
        ld      a,60h           ; '`'
        cp      (hl)
        jr      nz,L8AB4
        call    L9121
        ld      c,01h
        ld      b,0E3h
        call    0047h
        ld      de,9F28h        ; address or value?
        ld      a,00h
        call    L91E3
        ld      de,9F2Ch        ; address or value?
        ld      a,01h
        call    L91E3
        ld      de,9F30h        ; address or value?
        ld      a,02h
        call    L91E3
        ld      de,9F34h        ; address or value?
        ld      a,03h
        call    L91E3
        ld      a,62h           ; 'b'
        ld      de,121Ch        ; address or value?
        call    L9236
        ld      b,01h
        ld      c,07h
        call    0047h
        call    L9067
        ld      de,2000h        ; address or value?
        call    L9296
        call    L8F08
        ld      de,1206h        ; address or value?
        ld      b,0Eh
        ld      hl,9C7Dh        ; address or value?
        call    L92FC
        ld      hl,9C8Bh        ; address or value?
        ld      de,1403h        ; address or value?
        ld      b,14h
        call    L92FC
        ld      hl,9C9Fh        ; address or value?
        ld      de,1606h        ; address or value?
        ld      b,0Dh
        call    L92FC

        ; Referenced from 8B4A
L8B2B:  call    L9280
        or      a
        jr      nz,L8B4C
        ld      a,(0C0D8h)
        inc     a
        ld      (0C0D8h),a
        ld      hl,9C9Fh        ; address or value?
        and     80h
        jr      z,L8B42
        ld      hl,9C62h        ; address or value?

        ; Referenced from 8B3D
L8B42:  ld      de,1606h        ; address or value?
        ld      b,0Dh
        call    L92FC
        jr      L8B2B

        ; Referenced from 8B2F
L8B4C:  ld      c,01h
        ld      b,0E2h
        call    0047h
        ld      c,07h
        ld      b,04h
        call    0047h
        ld      a,(0C07Ch)
        inc     a
        ld      (0C07Ch),a
        ld      a,0FFh
        ld      (0C07Bh),a
        jp      L82E7

        ; Referenced from 86BB, 87F8, 8CAB
        ; --- START PROC L8B69 ---
L8B69:  push    de
        dec     e
        ld      ix,0C061h       ; address or value?
        call    L8BE2
        ld      (ix+00h),a
        pop     de
        push    de
        ld      a,0Fh
        add     a,d
        ld      d,a
        dec     e
        call    L8BE2
        and     (ix+00h)
        ld      (ix+00h),a
        inc     ix
        pop     de
        push    de
        dec     d
        call    L8BE2
        ld      (ix+00h),a
        pop     de
        push    de
        dec     d
        ld      a,0Fh
        add     a,e
        ld      e,a
        call    L8BE2
        and     (ix+00h)
        ld      (ix+00h),a
        inc     ix
        pop     de
        push    de
        ld      a,10h
        add     a,e
        ld      e,a
        call    L8BE2
        ld      (ix+00h),a
        pop     de
        push    de
        ld      a,10h
        add     a,e
        ld      e,a
        ld      a,0Fh
        add     a,d
        ld      d,a
        call    L8BE2
        and     (ix+00h)
        ld      (ix+00h),a
        inc     ix
        pop     de
        push    de
        ld      a,10h
        add     a,d
        ld      d,a
        call    L8BE2
        ld      (ix+00h),a
        pop     de
        ld      a,10h
        add     a,d
        ld      d,a
        ld      a,0Fh
        add     a,e
        ld      e,a
        call    L8BE2
        and     (ix+00h)
        ld      (ix+00h),a
        ret

        ; Referenced from 8B6F, 8B7C, 8B8A, 8B97, 8BA8, 8BB8, 8BC9, 8BD8, 893F
        ; --- START PROC L8BE2 ---
L8BE2:  srl     e
        srl     e
        srl     e
        srl     d
        srl     d
        srl     d
        ld      hl,1800h        ; address or value?
        ld      bc,0020h        ; address or value?
        inc     d

        ; Referenced from 8BF9
L8BF5:  dec     d
        jr      z,L8BFB
        add     hl,bc
        jr      L8BF5

        ; Referenced from 8BF6
L8BFB:  add     hl,de
        call    004Ah
        ld      b,a
        ld      a,(0C06Ah)
        or      a
        jr      z,L8C20
        ld      a,33h           ; '3'
        cp      b
        jr      nc,L8C13
        ld      a,37h           ; '7'
        cp      b
        jr      c,L8C13
        ld      a,0FFh
        ret

        ; Referenced from 8C09, 8C0E
L8C13:  ld      a,4Fh           ; 'O'
        cp      b
        jr      nc,L8C20
        ld      a,53h           ; 'S'
        cp      b
        jr      c,L8C20
        ld      a,0FFh
        ret

        ; Referenced from 8C04, 8C16, 8C1B
L8C20:  ld      a,0FFh
        cp      b
        jr      z,L8C26
        xor     a

        ; Referenced from 8C23
        ; --- START PROC L8C26 ---
L8C26:  ret

        ; Referenced from 83A5, 86D7, 86EA, 8810, 88CD, 8CC7, 8D01
        ; --- START PROC L8C27 ---
L8C27:  add     a,l
        ld      l,a
        ld      a,00h
        adc     a,h
        ld      h,a
        ret

        ; Referenced from 82EB, 830A, 8325, 8658, 8CCC, 8C67
        ; --- START PROC L8C2E ---
L8C2E:  ld      iy,0FC9Eh       ; address or value?
        ld      a,r
        add     a,(iy+00h)
        add     a,a
        add     a,(iy+00h)
        ret

        ; Referenced from 869B, 87E8, 8908, 8969, 8C64, 8E22, 89E1, 8C6C, 8EDD, 8A3A
        ; --- START PROC L8C3C ---
L8C3C:  ld      b,04h

        ; Referenced from 8C44
L8C3E:  ld      a,(0C075h)

        ; Referenced from 8C42
L8C41:  dec     a
        jr      nz,L8C41
        djnz    L8C3E
        ret

        ; Referenced from 8FB0, 8676, 9088, 9109, 9064
        ; --- START PROC L8C47 ---
L8C47:  ld      hl,3000h        ; address or value?

        ; Referenced from 8C4D
L8C4A:  dec     hl
        ld      a,h
        or      l
        jr      nz,L8C4A
        ret

        ; Referenced from 8978, 8986, 89EF, 89F6
        ; --- START PROC L8C50 ---
L8C50:  ld      (0C065h),ix
        ld      a,(ix+05h)
        or      a
        jr      nz,L8CA5
        ld      a,(0C069h)
        or      a
        jr      z,L8C67
        dec     a
        ld      (0C069h),a
        jp      L8C3C

        ; Referenced from 8C5E
L8C67:  call    L8C2E
        cp      80h
        jp      c,L8C3C
        ld      a,20h           ; ' '
        ld      (0C069h),a
        ld      bc,(0C05Ch)
        ld      (ix+00h),c
        ld      (ix+01h),b
        ld      a,0FFh
        ld      (ix+05h),a
        xor     a
        ld      (ix+04h),a
        ld      b,(ix+06h)
        ld      a,(0C05Fh)
        and     04h
        jr      z,L8C92
        inc     b

        ; Referenced from 8C8F
L8C92:  ld      a,b
        add     a,a
        add     a,a
        ld      (ix+02h),a
        ld      a,(ix+07h)
        ld      de,(0C065h)
        call    L91E3
        jp      L8D3C

        ; Referenced from 8C58
L8CA5:  ld      d,(ix+00h)
        ld      e,(ix+01h)
        call    L8B69
        ld      ix,(0C065h)
        ld      hl,0C061h       ; address or value?
        ld      a,(hl)
        inc     hl
        add     a,(hl)
        inc     hl
        add     a,(hl)
        inc     hl
        add     a,(hl)
        inc     a
        jr      z,L8CCC
        ld      a,(ix+04h)
        xor     02h
        ld      hl,0C061h       ; address or value?
        call    L8C27
        xor     a
        ld      (hl),a

        ; Referenced from 8CBD
L8CCC:  call    L8C2E
        and     03h
        or      a
        jr      z,L8CE9
        dec     a
        jr      z,L8CE4
        dec     a
        jr      z,L8CDF
        ld      a,03h
        call    L8CFD

        ; Referenced from 8CD8
L8CDF:  ld      a,02h
        call    L8CFD

        ; Referenced from 8CD5
L8CE4:  ld      a,01h
        call    L8CFD

        ; Referenced from 8CD2
L8CE9:  ld      a,00h
        call    L8CFD
        ld      a,03h
        call    L8CFD
        ld      a,02h
        call    L8CFD
        ld      a,01h
        call    L8CFD

        ; Referenced from 8CDC, 8CE1, 8CE6, 8CEB, 8CF0, 8CF5, 8CFA
        ; --- START PROC L8CFD ---
L8CFD:  ld      hl,0C061h       ; address or value?
        ld      b,a
        call    L8C27
        ld      a,(hl)
        or      a
        ret     z
        pop     hl
        ld      hl,(0C065h)
        ld      (ix+04h),b
        ld      a,02h
        srl     b
        jr      c,L8D15
        inc     hl

        ; Referenced from 8D12
L8D15:  srl     b
        jr      c,L8D1B
        neg

        ; Referenced from 8D17
L8D1B:  add     a,(hl)
        ld      (hl),a
        ld      ix,(0C065h)
        ld      b,(ix+06h)
        ld      a,(0C05Fh)
        and     04h
        jr      z,L8D2C
        inc     b

        ; Referenced from 8D29
L8D2C:  ld      a,b
        add     a,a
        add     a,a
        ld      (ix+02h),a
        ld      a,(ix+07h)
        ld      de,(0C065h)
        call    L91E3

        ; Referenced from 8CA2
        ; --- START PROC L8D3C ---
L8D3C:  ld      a,(0C05Bh)
        or      a
        jr      z,L8DAC
        ld      ix,(0C065h)
        ld      a,(ix+00h)
        add     a,08h
        ld      b,a
        ld      a,(0C056h)
        inc     a
        sub     b
        jr      nc,L8D55
        neg

        ; Referenced from 8D51
L8D55:  cp      05h
        jr      nc,L8DAC
        ld      a,(ix+01h)
        add     a,08h
        ld      b,a
        ld      a,(0C057h)
        inc     a
        sub     b
        jr      nc,L8D68
        neg

        ; Referenced from 8D64
L8D68:  cp      05h
        jr      nc,L8DAC
        ld      hl,0C056h       ; address or value?
        ld      a,(ix+00h)
        ld      (hl),a
        inc     hl
        ld      a,(ix+01h)
        ld      (hl),a
        inc     hl
        ld      a,78h           ; 'x'
        ld      (hl),a
        inc     hl
        ld      a,06h
        ld      (hl),a
        inc     hl
        inc     hl
        ld      a,06h
        ld      (hl),a
        ld      de,0C056h       ; address or value?
        ld      a,0Ah
        call    L91E3
        call    L9133
        ld      de,0030h        ; address or value?
        call    L9296
        call    L8F08
        xor     a
        ld      (ix+05h),a
        ld      a,0D1h
        ld      (ix+00h),a
        ld      de,(0C065h)
        ld      a,(ix+07h)
        jp      L91E3

        ; Referenced from 8905, 8D40, 8D57, 8D6A
        ; --- START PROC L8DAC ---
L8DAC:  ld      a,(0C019h)
        ld      d,a
        ld      a,(0C01Ah)
        ld      e,a
        ld      a,(ix+00h)
        sub     d
        jr      nc,L8DBC
        neg

        ; Referenced from 8DB8
L8DBC:  cp      08h
        ret     nc
        ld      a,(ix+01h)
        sub     e
        jr      nc,L8DC7
        neg

        ; Referenced from 8DC3
L8DC7:  cp      08h
        ret     nc

        ; Referenced from 8A4F
        ; --- START PROC L8DCA ---
L8DCA:  pop     hl
        call    L8FB3
        ld      b,04h
        ld      c,07h
        call    0047h
        jp      L836A

        ; Referenced from 837C
        ; --- START PROC L8DD8 ---
L8DD8:  call    L9145
        ld      hl,9CCFh        ; address or value?
        ld      de,0808h        ; address or value?
        ld      b,09h
        call    L92FC

        ; Referenced from 8E05
L8DE6:  call    L9280
        or      a
        jr      nz,L8E07
        ld      a,(0C0D8h)
        inc     a
        ld      (0C0D8h),a
        ld      hl,9C9Fh        ; address or value?
        and     80h
        jr      z,L8DFD
        ld      hl,9C62h        ; address or value?

        ; Referenced from 8DF8
L8DFD:  ld      de,0C06h        ; address or value?
        ld      b,0Dh
        call    L92FC
        jr      L8DE6

        ; Referenced from 8DEA
        ; --- START PROC L8E07 ---
L8E07:  jp      L82B8

        ; Referenced from 897F, 89E8, 89FD
        ; --- START PROC L8E0A ---
L8E0A:  ld      a,(ix+02h)
        or      a
        jp      nz,L8EB8
        ld      hl,0C019h       ; address or value?
        ld      a,(ix+00h)
        cp      (hl)
        ret     nz
        inc     hl
        ld      a,(ix+01h)
        cp      (hl)
        ret     nz
        call    L9121
        call    L8C3C
        ld      a,0FFh
        ld      (ix+02h),a
        ld      a,32h           ; '2'
        ld      (ix+03h),a
        ld      d,(ix+00h)
        ld      e,(ix+01h)
        ld      a,(ix+04h)
        or      a
        jr      z,L8E89
        srl     d
        srl     d
        srl     d
        srl     e
        srl     e
        srl     e
        cp      38h             ; '8'
        jr      z,L8E76
        ld      a,0FFh
        ld      (0C06Dh),a
        ld      a,01h
        ld      (0C06Bh),a
        ld      (0C06Eh),a
        xor     a
        ld      (0C06Ch),a
        ld      a,3Ch           ; '<'
        call    L9231
        ld      hl,(0C077h)
        ld      bc,0002h        ; address or value?
        xor     a
        sbc     hl,bc
        ld      (0C079h),hl
        ld      de,0300h        ; address or value?
        call    L9296
        jp      L8F08

        ; Referenced from 8E49
L8E76:  ld      a,08h
        ld      (0C05Eh),a
        ld      a,38h           ; '8'
        call    L9231
        ld      de,0100h        ; address or value?
        call    L9296
        jp      L8F08

        ; Referenced from 8E39
L8E89:  ld      hl,0C01Eh       ; address or value?
        push    de
        ld      (hl),d
        inc     hl
        ld      (hl),e
        inc     hl
        ld      a,40h           ; '@'
        ld      (hl),a
        inc     hl
        ld      a,0Fh
        ld      (hl),a
        inc     hl
        xor     a
        ld      (hl),a
        inc     hl
        inc     hl
        ld      a,10h
        ld      (hl),a
        inc     hl
        ld      a,03h
        ld      (hl),a
        ld      de,0C01Eh       ; address or value?
        ld      a,03h
        call    L91E3
        ld      de,0200h        ; address or value?
        call    L9296
        call    L8F08
        pop     de
        jr      L8ECE

        ; Referenced from 8E0E
L8EB8:  ld      a,(ix+03h)
        or      a
        ret     z
        dec     a
        ld      (ix+03h),a
        ret     nz
        ld      d,(ix+00h)
        ld      e,(ix+01h)
        ld      a,(ix+04h)
        or      a
        jr      z,L8EE0

        ; Referenced from 8EB6
L8ECE:  srl     d
        srl     d
        srl     d
        srl     e
        srl     e
        srl     e
        call    L8EEB
        jp      L8C3C

        ; Referenced from 8ECC
L8EE0:  ld      a,0FFh
        ld      (0C023h),a
        ret

L8EE6:  DB      38h             ; '8'
        DB      3Ch             ; '<'
        DB      00h
        DB      38h             ; '8'
        DB      3Ch             ; '<'


        ; Referenced from 8425, 89B1, 8EDA
        ; --- START PROC L8EEB ---
L8EEB:  push    de
        ld      a,0FFh
        call    L9236
        pop     de
        push    de
        ld      a,0FFh
        inc     e
        call    L9236
        pop     de
        inc     d
        push    de
        ld      a,0FFh
        call    L9236
        pop     de
        inc     e
        ld      a,0FFh
        jp      L9236

        ; Referenced from 838C, 8B07, 8E73, 89DB, 8D96, 8EB2, 8E86
        ; --- START PROC L8F08 ---
L8F08:  ld      de,0B19h        ; address or value?
        call    L92D6
        ld      de,0819h        ; address or value?
        jp      L92A9

        ; Referenced from 8367
        ; --- START PROC L8F14 ---
L8F14:  ld      ix,0C099h       ; address or value?
        ld      b,03h

        ; Referenced from 8F30
L8F1A:  push    bc
        ld      a,0Ah
        call    L8F49
        ld      a,14h
        call    L8F49
        ld      a,1Eh
        call    L8F49
        ld      a,14h
        call    L8F49
        pop     bc
        djnz    L8F1A
        ld      a,0Ah
        call    L8F49
        ld      b,03h

        ; Referenced from 8F41
L8F39:  ld      hl,0000h        ; address or value?

        ; Referenced from 8F3F
L8F3C:  dec     hl
        ld      a,h
        or      l
        jr      nz,L8F3C
        djnz    L8F39
        ld      hl,9F38h        ; address or value?
        jp      L9264

        ; Referenced from 8F1D, 8F22, 8F27, 8F2C, 8F34
        ; --- START PROC L8F49 ---
L8F49:  ld      b,0Ah
        ld      (ix+00h),b
        ld      c,a
        ld      b,00h
        ld      (ix+01h),b
        ld      (ix+02h),a
        inc     b
        ld      a,01h
        ld      (ix+03h),b
        ld      (ix+04h),a
        inc     b
        ld      a,05h
        add     a,c
        ld      (ix+05h),b
        ld      (ix+06h),a
        inc     b
        ld      a,02h
        ld      (ix+07h),b
        ld      (ix+08h),a
        inc     b
        ld      a,0Ah
        add     a,c
        ld      (ix+09h),b
        ld      (ix+0Ah),a
        ld      a,03h
        inc     b
        ld      (ix+0Bh),b
        ld      (ix+0Ch),a
        inc     b
        inc     b
        ld      a,0B8h
        ld      (ix+0Dh),b
        ld      (ix+0Eh),a
        inc     b
        ld      a,0Ch
        ld      (ix+0Fh),b
        ld      (ix+10h),a
        inc     b
        ld      (ix+11h),b
        ld      (ix+12h),a
        inc     b
        ld      (ix+13h),b
        ld      (ix+14h),a
        call    L9145
        ld      hl,0C099h       ; address or value?
        call    L9264
        jp      L8C47

        ; Referenced from 8DCB
        ; --- START PROC L8FB3 ---
L8FB3:  xor     a
        ld      (0C0DCh),a
        ld      a,0Ah
        ld      ix,0C0AEh       ; address or value?

        ; Referenced from 8FC6
L8FBD:  push    af
        call    L8FE8
        pop     af
        add     a,14h
        cp      0E6h
        jr      nz,L8FBD
        ld      c,07h
        ld      b,06h
        call    0047h
        ld      b,03h

        ; Referenced from 8FD9
L8FD1:  ld      hl,0000h        ; address or value?

        ; Referenced from 8FD7
L8FD4:  dec     hl
        ld      a,h
        or      l
        jr      nz,L8FD4
        djnz    L8FD1
        ld      c,07h
        ld      b,04h
        call    0047h
        ld      hl,9F38h        ; address or value?
        jp      L9264

        ; Referenced from 8FBE
        ; --- START PROC L8FE8 ---
L8FE8:  ld      b,0Ah
        ld      (ix+00h),b
        ld      c,a
        ld      b,00h
        ld      (ix+01h),b
        ld      (ix+02h),a
        inc     b
        ld      a,01h
        ld      (ix+03h),b
        ld      (ix+04h),a
        inc     b
        ld      a,0Ah
        add     a,c
        ld      (ix+05h),b
        ld      (ix+06h),a
        inc     b
        ld      a,02h
        ld      (ix+07h),b
        ld      (ix+08h),a
        inc     b
        ld      a,14h
        add     a,c
        ld      (ix+09h),b
        ld      (ix+0Ah),a
        inc     b
        ld      a,03h
        ld      (ix+0Bh),b
        ld      (ix+0Ch),a
        inc     b
        inc     b
        ld      a,0B8h
        ld      (ix+0Dh),b
        ld      (ix+0Eh),a
        inc     b
        ld      a,0Ch
        ld      (ix+0Fh),b
        ld      (ix+10h),a
        inc     b
        ld      (ix+11h),b
        ld      (ix+12h),a
        inc     b
        ld      (ix+13h),b
        ld      (ix+14h),a
        call    L9145
        ld      hl,0C0AEh       ; address or value?
        call    L9264
        ld      a,(0C0DCh)
        cpl
        or      a
        ld      (0C0DCh),a
        jr      z,L905D
        ld      b,04h
        jr      L905F

        ; Referenced from 9057
L905D:  ld      b,06h

        ; Referenced from 905B
L905F:  ld      c,07h
        call    0047h
        jp      L8C47

        ; Referenced from 8AFE
        ; --- START PROC L9067 ---
L9067:  call    L9145
        ld      hl,9F3Bh        ; address or value?
        jp      L9264

        ; Referenced from 89D2
        ; --- START PROC L9070 ---
L9070:  call    L9145
        ld      c,07h
        ld      b,03h
        call    0047h
        ld      a,0F0h

        ; Referenced from 9083
L907C:  push    af
        call    L909B
        pop     af
        sub     14h
        jr      nz,L907C
        ld      b,0Ch

        ; Referenced from 908C
L9087:  push    bc
        call    L8C47
        pop     bc
        djnz    L9087
        ld      hl,9F38h        ; address or value?
        call    L9264
        ld      c,07h
        ld      b,04h
        jp      0047h

        ; Referenced from 907D
        ; --- START PROC L909B ---
L909B:  ld      ix,0C0C3h       ; address or value?
        ld      b,0Ah
        ld      (ix+00h),b
        ld      b,00h
        ld      c,a
        ld      (ix+01h),b
        ld      (ix+02h),a
        inc     b
        ld      a,01h
        ld      (ix+03h),b
        ld      (ix+04h),a
        inc     b
        ld      a,05h
        add     a,c
        ld      (ix+05h),b
        ld      (ix+06h),a
        inc     b
        ld      a,01h
        ld      (ix+07h),b
        ld      (ix+08h),a
        inc     b
        ld      a,0Ah
        add     a,c
        ld      (ix+09h),b
        ld      (ix+0Ah),a
        inc     b
        ld      a,01h
        ld      (ix+0Bh),b
        ld      (ix+0Ch),a
        inc     b
        inc     b
        ld      a,0B8h
        ld      (ix+0Dh),b
        ld      (ix+0Eh),a
        inc     b
        ld      a,0Ch
        ld      (ix+0Fh),b
        ld      (ix+10h),a
        inc     b
        ld      (ix+11h),b
        ld      (ix+12h),a
        inc     b
        ld      (ix+13h),b
        ld      (ix+14h),a
        ld      hl,9F38h        ; address or value?
        call    L9264
        ld      hl,0C0C3h       ; address or value?
        call    L9264
        jp      L8C47

        ; Referenced from 879B
        ; --- START PROC L910C ---
L910C:  call    L9145
        ld      a,(0C05Fh)
        and     04h
        jr      nz,L911B
        ld      hl,914Bh        ; address or value?
        jr      L911E

        ; Referenced from 9114
L911B:  ld      hl,915Ah        ; address or value?

        ; Referenced from 9119
        ; --- START PROC L911E ---
L911E:  jp      L9264

        ; Referenced from 8AC5, 8E1F
        ; --- START PROC L9121 ---
L9121:  call    L9145
        ld      hl,9169h        ; address or value?
        jp      L9264

        ; Referenced from 871D, 874B
        ; --- START PROC L912A ---
L912A:  call    L9145
        ld      hl,9184h        ; address or value?
        jp      L9264

        ; Referenced from 895E, 8D8D
        ; --- START PROC L9133 ---
L9133:  call    L9145
        ld      hl,9193h        ; address or value?
        jp      L9264

        ; Referenced from 87E5
        ; --- START PROC L913C ---
L913C:  call    L9145
        ld      hl,91A2h        ; address or value?
        jp      L9264

        ; Referenced from 8DD8, 8FA7, 912A, 910C, 913C, 9133, 9121, 9067, 9070, 9046
        ; --- START PROC L9145 ---
L9145:  ld      hl,91B7h        ; address or value?
        jp      L9264

L914B:  DB      07h
        DB      00h
        DB      0FDh
        DB      01h
        DB      00h
        DB      07h
        DB      0B8h
        DB      08h
        DB      08h
        DB      0Bh
        DB      22h             ; '"'
        DB      0Ch
        DB      02h
        DB      0Dh
        DB      0Fh
        DB      07h
        DB      00h
        DB      3Fh             ; '?'
        DB      01h
        DB      01h
        DB      07h
        DB      0B8h
        DB      08h
        DB      08h
        DB      0Bh
        DB      22h             ; '"'
        DB      0Ch
        DB      05h
        DB      0Dh
        DB      09h
        DB      0Dh
        DB      00h
        DB      0FDh
        DB      01h
        DB      00h
        DB      02h
        DB      0D5h
        DB      03h
        DB      00h
        DB      04h
        DB      3Fh             ; '?'
        DB      05h
        DB      00h
        DB      07h
        DB      0B8h
        DB      08h
        DB      10h
        DB      09h
        DB      10h
        DB      0Ah
        DB      10h
        DB      0Bh
        DB      9Eh
        DB      0Ch
        DB      0Ah
        DB      0Dh
        DB      09h
        DB      07h
        DB      00h
        DB      0E0h
        DB      01h
        DB      04h
        DB      07h
        DB      0B8h
        DB      08h
        DB      0Fh
        DB      0Bh
        DB      92h
        DB      0Ch
        DB      05h
        DB      0Dh
        DB      05h
        DB      07h
        DB      06h
        DB      1Fh
        DB      07h
        DB      87h
        DB      08h
        DB      0Fh
        DB      09h
        DB      0Fh
        DB      0Bh
        DB      0Bh
        DB      0Ch
        DB      02h
        DB      0Dh
        DB      0Fh
        DB      0Ah
        DB      00h
        DB      0C0h
        DB      01h
        DB      09h
        DB      06h
        DB      1Fh
        DB      07h
        DB      80h
        DB      08h
        DB      0Ch
        DB      09h
        DB      0Ch
        DB      0Ah
        DB      10h
        DB      0Bh
        DB      0Bh
        DB      0Ch
        DB      06h
        DB      0Dh
        DB      00h
        DB      0Eh
        DB      00h
        DB      00h
        DB      01h
        DB      00h
        DB      02h
        DB      00h
        DB      03h
        DB      00h
        DB      05h
        DB      00h
        DB      06h
        DB      00h
        DB      07h
        DB      80h
        DB      08h
        DB      00h
        DB      09h
        DB      00h
        DB      0Ah
        DB      00h
        DB      0Bh
        DB      00h
        DB      0Ch
        DB      00h
        DB      0Dh
        DB      00h


        ; Referenced from 802D, 8035, 803D, 8045, 804D, 8055, 805D, 8065, 806D, 8075, 807D, 8085, 808D, 8095, 809D, 80A5, 80AD, 80B5, 80BD, 80C5, 80CD, 80D5, 80DD, 80E5, 80ED, 80F5, 80FD, 8105, 810D, 8115, 811D, 8125, 812D, 8135, 813D, 8145, 814D
        ; --- START PROC L91D2 ---
L91D2:  ld      hl,3800h        ; address or value?
        ld      bc,0020h        ; address or value?
        inc     a

        ; Referenced from 91DD
L91D9:  dec     a
        jr      z,L91DF
        add     hl,bc
        jr      L91D9

        ; Referenced from 91DA
L91DF:  ex      de,hl
        jp      005Ch

        ; Referenced from 855D, 8590, 8652, 8794, 87E2, 88FE, 8966, 8AD4, 8ADC, 8AE4, 8AEC, 8D39, 8D8A, 8DA9, 8C9F, 8EA9, 8A37, 8AA9, 8AB1
        ; --- START PROC L91E3 ---
L91E3:  ld      hl,1B00h        ; address or value?
        ld      bc,0004h        ; address or value?
        inc     a

        ; Referenced from 91EF
L91EA:  dec     a
        jp      z,L91F1
        add     hl,bc
        jr      L91EA

        ; Referenced from 91EB
L91F1:  ex      de,hl
        jp      005Ch

        ; Referenced from 8155, 815D, 8165, 816D, 8175, 817D, 8185, 818D
        ; --- START PROC L91F5 ---
L91F5:  ld      hl,0020h        ; address or value?
        jr      L91FD

        ; Referenced from 8195, 819D, 81A5, 81AD, 81B5, 81BD
        ; --- START PROC L91FA ---
L91FA:  ld      hl,0008h        ; address or value?

        ; Referenced from 91F8
        ; --- START PROC L91FD ---
L91FD:  ld      (0C07Dh),hl
        ld      hl,0000h        ; address or value?
        ld      bc,0008h        ; address or value?
        inc     a

        ; Referenced from 920B
L9207:  dec     a
        jr      z,L920D
        add     hl,bc
        jr      L9207

        ; Referenced from 9208
L920D:  ld      a,06h

        ; Referenced from 9225, 922F
L920F:  push    af
        ex      de,hl
        push    hl
        push    de
        ld      bc,(0C07Dh)
        call    005Ch
        pop     hl
        pop     de
        ld      bc,0800h        ; address or value?
        add     hl,bc
        pop     af
        dec     a
        ret     z
        cp      03h
        jr      nz,L920F
        add     hl,bc
        ex      de,hl
        ld      bc,(0C07Dh)
        add     hl,bc
        ex      de,hl
        jr      L920F

        ; Referenced from 8417, 84EB, 8501, 8517, 8529, 859A, 85A3, 85AC, 85B7, 85C0, 85C7, 85D1, 89AC, 8E5E, 8E7D, 8A72
        ; --- START PROC L9231 ---
L9231:  ex      af,af'
        ld      a,04h
        jr      L9239

        ; Referenced from 9300, 8364, 83DC, 83EA, 92E5, 92F1, 8EEE, 8EF6, 8EFE, 8F05, 85EE, 86AD, 8AF4, 89CF
        ; --- START PROC L9236 ---
L9236:  ex      af,af'
        ld      a,01h

        ; Referenced from 9234
        ; --- START PROC L9239 ---
L9239:  ld      (0C07Dh),a
        ex      af,af'
        ld      hl,1800h        ; address or value?
        ld      bc,0020h        ; address or value?

        ; Referenced from 9248
L9243:  dec     d
        jp      m,L924A
        add     hl,bc
        jr      L9243

        ; Referenced from 9244
L924A:  inc     d
        add     hl,de
        ld      c,a
        ld      a,(0C07Dh)
        ld      b,a

        ; Referenced from 925C, 9262
L9251:  ld      a,c
        call    004Dh
        dec     b
        ret     z
        inc     hl
        inc     c
        ld      a,02h
        cp      b
        jr      nz,L9251
        ld      de,001Eh        ; address or value?
        add     hl,de
        jr      L9251

        ; Referenced from 8F46, 8FAD, 9148, 9130, 9142, 9139, 911E, 8FE5, 9127, 906D, 9091, 904C, 9100, 9106
        ; --- START PROC L9264 ---
L9264:  ld      b,(hl)

        ; Referenced from 926C
L9265:  inc     hl
        ld      a,(hl)
        inc     hl
        ld      e,(hl)
        call    0093h
        djnz    L9265
        ret

        ; Referenced from 86C2
        ; --- START PROC L926F ---
L926F:  xor     a
        call    00D5h
        or      a
        ret     nz
        inc     a
        call    00D5h
        and     a
        ret     nz
        ld      a,02h
        jp      00D5h

        ; Referenced from 81EC, 8DE6, 87AA, 8B2B
        ; --- START PROC L9280 ---
L9280:  xor     a
        call    00D8h
        or      a
        ret     nz
        inc     a
        call    00D8h
        and     a
        ret     nz
        ld      a,02h
        jp      00D8h

        ; Referenced from 8010
        ; --- START PROC L9291 ---
L9291:  ld      a,02h
        jp      005Fh

        ; Referenced from 8B04, 8E70, 89D8, 8D93, 8EAF, 8E83
        ; --- START PROC L9296 ---
L9296:  ld      hl,0C084h       ; address or value?
        ld      a,e
        add     a,(hl)
        daa
        ld      (hl),a
        dec     hl
        ld      a,d
        adc     a,(hl)
        daa
        ld      (hl),a
        dec     hl
        ld      a,00h
        adc     a,(hl)
        daa
        ld      (hl),a
        ret

        ; Referenced from 8F11
        ; --- START PROC L92A9 ---
L92A9:  ld      hl,0C082h       ; address or value?
        ld      a,(0C07Fh)
        cp      (hl)
        jr      c,L92C3
        ret     nz
        inc     hl
        ld      a,(0C080h)
        cp      (hl)
        jr      c,L92C3
        ret     nz
        inc     hl
        ld      a,(0C081h)
        cp      (hl)
        jr      z,L92C3
        ret     nc

        ; Referenced from 92B0, 92B8, 92C0
L92C3:  ld      bc,(0C082h)
        ld      (0C07Fh),bc
        ld      a,(0C084h)
        ld      (0C081h),a
        ld      hl,0C07Fh       ; address or value?
        jr      L92D9

        ; Referenced from 82E4, 8F0B
        ; --- START PROC L92D6 ---
L92D6:  ld      hl,0C082h       ; address or value?

        ; Referenced from 92D4
        ; --- START PROC L92D9 ---
L92D9:  call    L92DF
        call    L92DF

        ; Referenced from 92D9, 92DC
        ; --- START PROC L92DF ---
L92DF:  push    hl
        push    de
        xor     a
        rld
        push    af
        call    L9236
        pop     af
        pop     de
        pop     hl
        push    hl
        inc     e
        push    de
        rld
        push    af
        call    L9236
        pop     af
        pop     de
        pop     hl
        rld
        inc     hl
        inc     e
        ret

        ; Referenced from 81C8, 81D3, 81DE, 81E9, 8208, 9308, 822E, 8239, 8244, 824F, 825A, 8265, 8270, 827B, 8286, 8296, 82C0, 82CF, 8350, 8372, 8389, 8DE3, 8E02, 84CE, 8B12, 8B1D, 8B28, 8B47
        ; --- START PROC L92FC ---
L92FC:  push    bc
        push    de
        push    hl
        ld      a,(hl)
        call    L9236
        pop     hl
        pop     de
        pop     bc
        inc     hl
        inc     e
        djnz    L92FC
        ret

        ; Referenced from 8025
        ; --- START PROC L930B ---
L930B:  ld      a,2Fh           ; '/'
        ld      hl,1800h        ; address or value?
        ld      bc,0300h        ; address or value?
        call    0056h
        ld      hl,9364h        ; address or value?
        ld      de,0000h        ; address or value?
        ld      bc,0180h        ; address or value?
        call    005Ch
        ld      hl,9364h        ; address or value?
        ld      de,0800h        ; address or value?
        ld      bc,0180h        ; address or value?
        call    005Ch
        ld      hl,9364h        ; address or value?
        ld      de,1000h        ; address or value?
        ld      bc,0180h        ; address or value?
        jp      005Ch

        ; Referenced from 8022
        ; --- START PROC L933A ---
L933A:  ld      (0F3E9h),a
        ld      a,b
        ld      (0F3EAh),a
        ld      a,c
        ld      (0F3EBh),a
        call    0062h
        ld      a,(0F3EAh)
        ld      b,a
        ld      a,(0F3E9h)
        sla     b
        rla
        sla     b
        rla
        sla     b
        rla
        sla     b
        rla
        ld      hl,2000h        ; address or value?
        ld      bc,1800h        ; address or value?
        jp      0056h

L9364:  DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      46h             ; 'F'
        DB      5Ah             ; 'Z'
        DB      62h             ; 'b'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      08h
        DB      18h
        DB      28h             ; '('
        DB      08h
        DB      08h
        DB      08h
        DB      3Eh             ; '>'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      02h
        DB      1Ch
        DB      20h             ; ' '
        DB      40h             ; '@'
        DB      7Eh             ; '~'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      02h
        DB      0Ch
        DB      02h
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      04h
        DB      0Ch
        DB      14h
        DB      24h             ; '$'
        DB      7Eh             ; '~'
        DB      04h
        DB      04h
        DB      00h
        DB      7Eh             ; '~'
        DB      40h             ; '@'
        DB      7Ch             ; '|'
        DB      02h
        DB      02h
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      1Ch
        DB      20h             ; ' '
        DB      40h             ; '@'
        DB      7Ch             ; '|'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      7Fh             ; ''
        DB      42h             ; 'B'
        DB      04h
        DB      08h
        DB      10h
        DB      10h
        DB      10h
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Eh             ; '>'
        DB      02h
        DB      04h
        DB      38h             ; '8'
        DB      00h
        DB      18h
        DB      24h             ; '$'
        DB      42h             ; 'B'
        DB      7Eh             ; '~'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      00h
        DB      7Ch             ; '|'
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      3Ch             ; '<'
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      7Ch             ; '|'
        DB      00h
        DB      1Ch
        DB      22h             ; '"'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      22h             ; '"'
        DB      1Ch
        DB      00h
        DB      78h             ; 'x'
        DB      24h             ; '$'
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      24h             ; '$'
        DB      78h             ; 'x'
        DB      00h
        DB      7Eh             ; '~'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      78h             ; 'x'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      7Eh             ; '~'
        DB      00h
        DB      7Eh             ; '~'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      78h             ; 'x'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      00h
        DB      1Ch
        DB      22h             ; '"'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      4Eh             ; 'N'
        DB      22h             ; '"'
        DB      1Ch
        DB      00h
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      7Eh             ; '~'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      00h
        DB      1Ch
        DB      08h
        DB      08h
        DB      08h
        DB      08h
        DB      08h
        DB      1Ch
        DB      00h
        DB      0Eh
        DB      04h
        DB      04h
        DB      04h
        DB      04h
        DB      44h             ; 'D'
        DB      38h             ; '8'
        DB      00h
        DB      42h             ; 'B'
        DB      44h             ; 'D'
        DB      48h             ; 'H'
        DB      70h             ; 'p'
        DB      48h             ; 'H'
        DB      44h             ; 'D'
        DB      42h             ; 'B'
        DB      00h
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      7Eh             ; '~'
        DB      00h
        DB      42h             ; 'B'
        DB      66h             ; 'f'
        DB      5Ah             ; 'Z'
        DB      5Ah             ; 'Z'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      00h
        DB      42h             ; 'B'
        DB      62h             ; 'b'
        DB      52h             ; 'R'
        DB      4Ah             ; 'J'
        DB      46h             ; 'F'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      7Ch             ; '|'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      7Ch             ; '|'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      4Ah             ; 'J'
        DB      44h             ; 'D'
        DB      3Ah             ; ':'
        DB      00h
        DB      7Ch             ; '|'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      7Ch             ; '|'
        DB      48h             ; 'H'
        DB      44h             ; 'D'
        DB      42h             ; 'B'
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      40h             ; '@'
        DB      3Ch             ; '<'
        DB      02h
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      3Eh             ; '>'
        DB      08h
        DB      08h
        DB      08h
        DB      08h
        DB      08h
        DB      08h
        DB      00h
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      24h             ; '$'
        DB      24h             ; '$'
        DB      18h
        DB      18h
        DB      00h
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      5Ah             ; 'Z'
        DB      5Ah             ; 'Z'
        DB      66h             ; 'f'
        DB      42h             ; 'B'
        DB      00h
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      24h             ; '$'
        DB      18h
        DB      24h             ; '$'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      00h
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      1Ch
        DB      08h
        DB      08h
        DB      08h
        DB      00h
        DB      7Eh             ; '~'
        DB      02h
        DB      04h
        DB      18h
        DB      20h             ; ' '
        DB      40h             ; '@'
        DB      7Eh             ; '~'
        DB      00h
        DB      30h             ; '0'
        DB      48h             ; 'H'
        DB      48h             ; 'H'
        DB      30h             ; '0'
        DB      4Ah             ; 'J'
        DB      44h             ; 'D'
        DB      3Ah             ; ':'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      08h
        DB      08h
        DB      10h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      18h
        DB      18h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      7Eh             ; '~'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      04h
        DB      08h
        DB      10h
        DB      10h
        DB      10h
        DB      08h
        DB      04h
        DB      00h
        DB      20h             ; ' '
        DB      10h
        DB      08h
        DB      08h
        DB      08h
        DB      10h
        DB      20h             ; ' '
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      3Eh             ; '>'
        DB      40h             ; '@'
        DB      3Ch             ; '<'
        DB      02h
        DB      7Ch             ; '|'
        DB      00h
        DB      00h
        DB      00h
        DB      3Ch             ; '<'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      0Ch
        DB      12h
        DB      10h
        DB      7Ch             ; '|'
        DB      10h
        DB      10h
        DB      10h
        DB      00h
        DB      10h
        DB      10h
        DB      7Ch             ; '|'
        DB      10h
        DB      10h
        DB      12h
        DB      0Ch
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Fh
        DB      17h
        DB      19h
        DB      3Eh             ; '>'
        DB      17h
        DB      3Fh             ; '?'
        DB      1Fh
        DB      40h             ; '@'
        DB      7Dh             ; '}'
        DB      07h
        DB      18h
        DB      1Fh
        DB      1Ch
        DB      1Ch
        DB      0FCh
        DB      0FCh
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      04h
        DB      0F8h
        DB      0F8h
        DB      0F0h
        DB      0Eh
        DB      0FAh
        DB      0FAh
        DB      0Ah
        DB      0F8h
        DB      30h             ; '0'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      00h
        DB      0Fh
        DB      0Fh
        DB      1Eh
        DB      0Fh
        DB      3Fh             ; '?'
        DB      0Fh
        DB      0Fh
        DB      08h
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      23h             ; '#'
        DB      1Ch
        DB      1Ch
        DB      0F0h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0F8h
        DB      0FCh
        DB      0FBh
        DB      0F3h
        DB      09h
        DB      0FCh
        DB      0FEh
        DB      0FAh
        DB      06h
        DB      0FEh
        DB      0FCh
        DB      00h
        DB      00h
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      20h             ; ' '
        DB      1Fh
        DB      1Fh
        DB      0Fh
        DB      70h             ; 'p'
        DB      5Fh             ; '_'
        DB      5Fh             ; '_'
        DB      50h             ; 'P'
        DB      1Fh
        DB      0Fh
        DB      0FCh
        DB      0FCh
        DB      00h
        DB      0F0h
        DB      0E8h
        DB      98h
        DB      7Ch             ; '|'
        DB      0E8h
        DB      0FCh
        DB      0F8h
        DB      02h
        DB      0BEh
        DB      0E0h
        DB      18h
        DB      0F8h
        DB      0F8h
        DB      38h             ; '8'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Dh
        DB      33h             ; '3'
        DB      0Fh
        DB      0Bh
        DB      07h
        DB      18h
        DB      3Fh             ; '?'
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      23h             ; '#'
        DB      1Ch
        DB      1Ch
        DB      0F0h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0B8h
        DB      0CCh
        DB      0F0h
        DB      0D6h
        DB      0E6h
        DB      1Ah
        DB      0FCh
        DB      0FAh
        DB      06h
        DB      0FEh
        DB      0FCh
        DB      00h
        DB      00h
        DB      0Fh
        DB      17h
        DB      19h
        DB      3Eh             ; '>'
        DB      17h
        DB      3Fh             ; '?'
        DB      1Fh
        DB      00h
        DB      1Bh
        DB      1Fh
        DB      10h
        DB      1Fh
        DB      1Fh
        DB      0FCh
        DB      0FCh
        DB      00h
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      04h
        DB      0F8h
        DB      0F8h
        DB      0F0h
        DB      08h
        DB      0F8h
        DB      0F8h
        DB      48h             ; 'H'
        DB      0F8h
        DB      0F8h
        DB      78h             ; 'x'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Fh
        DB      3Fh             ; '?'
        DB      0DFh
        DB      0CFh
        DB      90h
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      0F0h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0F8h
        DB      0FCh
        DB      0F8h
        DB      0F0h
        DB      08h
        DB      0FCh
        DB      0FEh
        DB      0FAh
        DB      06h
        DB      0FEh
        DB      0C4h
        DB      38h             ; '8'
        DB      38h             ; '8'
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      20h             ; ' '
        DB      1Fh
        DB      1Fh
        DB      0Fh
        DB      10h
        DB      1Fh
        DB      1Fh
        DB      11h
        DB      1Fh
        DB      1Fh
        DB      0Eh
        DB      0FCh
        DB      0FCh
        DB      0F0h
        DB      0E8h
        DB      98h
        DB      7Ch             ; '|'
        DB      0E8h
        DB      0FCh
        DB      0F8h
        DB      00h
        DB      0D8h
        DB      0F8h
        DB      08h
        DB      0F8h
        DB      0F8h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      00h
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Dh
        DB      33h             ; '3'
        DB      0Fh
        DB      6Bh             ; 'k'
        DB      67h             ; 'g'
        DB      58h             ; 'X'
        DB      3Fh             ; '?'
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      0F8h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0B8h
        DB      0CCh
        DB      0F0h
        DB      0D0h
        DB      0E0h
        DB      18h
        DB      0FCh
        DB      0FAh
        DB      06h
        DB      0FEh
        DB      0C4h
        DB      38h             ; '8'
        DB      38h             ; '8'
        DB      0Fh
        DB      17h
        DB      19h
        DB      3Eh             ; '>'
        DB      17h
        DB      3Fh             ; '?'
        DB      1Fh
        DB      00h
        DB      7Fh             ; ''
        DB      02h
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      0FCh
        DB      0FCh
        DB      00h
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      04h
        DB      0F8h
        DB      0F8h
        DB      0F0h
        DB      04h
        DB      0FEh
        DB      0EFh
        DB      5Eh             ; '^'
        DB      0BCh
        DB      0F8h
        DB      78h             ; 'x'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Fh
        DB      3Fh             ; '?'
        DB      0DFh
        DB      0CFh
        DB      90h
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      0F0h
        DB      0F8h
        DB      7Ah             ; 'z'
        DB      0FAh
        DB      0FEh
        DB      0FAh
        DB      0F2h
        DB      0Ah
        DB      0FCh
        DB      0FEh
        DB      0FBh
        DB      06h
        DB      0FEh
        DB      0C4h
        DB      38h             ; '8'
        DB      38h             ; '8'
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      20h             ; ' '
        DB      1Fh
        DB      1Fh
        DB      2Fh             ; '/'
        DB      70h             ; 'p'
        DB      0FDh
        DB      77h             ; 'w'
        DB      3Ah             ; ':'
        DB      1Dh
        DB      0Fh
        DB      0FCh
        DB      0FCh
        DB      00h
        DB      0F0h
        DB      0E8h
        DB      98h
        DB      7Ch             ; '|'
        DB      0E8h
        DB      0FCh
        DB      0F8h
        DB      00h
        DB      0FEh
        DB      40h             ; '@'
        DB      0F8h
        DB      0F8h
        DB      0F8h
        DB      38h             ; '8'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Dh
        DB      33h             ; '3'
        DB      0Fh
        DB      0Bh
        DB      07h
        DB      38h             ; '8'
        DB      7Fh             ; ''
        DB      0CFh
        DB      4Ch             ; 'L'
        DB      2Bh             ; '+'
        DB      2Fh             ; '/'
        DB      1Ch
        DB      1Ch
        DB      0F0h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0B8h
        DB      0CCh
        DB      0F0h
        DB      0D6h
        DB      0E6h
        DB      1Ah
        DB      0FCh
        DB      3Eh             ; '>'
        DB      0FEh
        DB      0FEh
        DB      0FCh
        DB      00h
        DB      00h
        DB      0Fh
        DB      17h
        DB      19h
        DB      3Eh             ; '>'
        DB      17h
        DB      3Fh             ; '?'
        DB      1Fh
        DB      00h
        DB      7Fh             ; ''
        DB      02h
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Ch
        DB      0FCh
        DB      0FCh
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      04h
        DB      0F8h
        DB      0F8h
        DB      0F4h
        DB      0Eh
        DB      0BFh
        DB      0EEh
        DB      5Ch             ; '\'
        DB      0B8h
        DB      0F0h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      00h
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Fh
        DB      3Fh             ; '?'
        DB      1Fh
        DB      0Fh
        DB      10h
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      5Fh             ; '_'
        DB      60h             ; '`'
        DB      7Fh             ; ''
        DB      23h             ; '#'
        DB      1Ch
        DB      1Ch
        DB      0F0h
        DB      0F8h
        DB      7Ah             ; 'z'
        DB      0FAh
        DB      0FEh
        DB      0FBh
        DB      0F3h
        DB      09h
        DB      0FCh
        DB      0FEh
        DB      0FBh
        DB      06h
        DB      0FEh
        DB      0FCh
        DB      00h
        DB      00h
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      20h             ; ' '
        DB      1Fh
        DB      1Fh
        DB      0Fh
        DB      20h             ; ' '
        DB      7Fh             ; ''
        DB      0F7h
        DB      7Ah             ; 'z'
        DB      3Dh             ; '='
        DB      1Fh
        DB      1Eh
        DB      0FCh
        DB      0FCh
        DB      0F0h
        DB      0E8h
        DB      98h
        DB      7Ch             ; '|'
        DB      0E8h
        DB      0FCh
        DB      0F8h
        DB      00h
        DB      0FEh
        DB      40h             ; '@'
        DB      0F8h
        DB      0F8h
        DB      0F8h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      00h
        DB      0Fh
        DB      1Fh
        DB      1Eh
        DB      1Dh
        DB      33h             ; '3'
        DB      0Fh
        DB      6Bh             ; 'k'
        DB      67h             ; 'g'
        DB      58h             ; 'X'
        DB      3Fh             ; '?'
        DB      4Fh             ; 'O'
        DB      0CCh
        DB      6Bh             ; 'k'
        DB      2Fh             ; '/'
        DB      00h
        DB      00h
        DB      0F0h
        DB      0F8h
        DB      78h             ; 'x'
        DB      0B8h
        DB      0CCh
        DB      0F0h
        DB      0D0h
        DB      0E0h
        DB      18h
        DB      0FCh
        DB      3Eh             ; '>'
        DB      0FEh
        DB      0FEh
        DB      0C4h
        DB      38h             ; '8'
        DB      38h             ; '8'
        DB      0Fh
        DB      1Fh
        DB      3Dh             ; '='
        DB      39h             ; '9'
        DB      31h             ; '1'
        DB      31h             ; '1'
        DB      33h             ; '3'
        DB      1Fh
        DB      0CFh
        DB      33h             ; '3'
        DB      0Ch
        DB      03h
        DB      00h
        DB      0Fh
        DB      30h             ; '0'
        DB      0C0h
        DB      0F0h
        DB      0F8h
        DB      0BCh
        DB      9Ch
        DB      8Ch
        DB      8Ch
        DB      9Ch
        DB      0F8h
        DB      0F0h
        DB      0C0h
        DB      0C7h
        DB      38h             ; '8'
        DB      0C0h
        DB      00h
        DB      0C7h
        DB      38h             ; '8'
        DB      0Fh
        DB      1Fh
        DB      3Eh             ; '>'
        DB      3Ch             ; '<'
        DB      38h             ; '8'
        DB      38h             ; '8'
        DB      3Ch             ; '<'
        DB      1Fh
        DB      0Fh
        DB      03h
        DB      0E3h
        DB      1Ch
        DB      00h
        DB      03h
        DB      0E3h
        DB      1Ch
        DB      0F0h
        DB      0F8h
        DB      0BCh
        DB      9Ch
        DB      8Ch
        DB      8Ch
        DB      0CCh
        DB      0F8h
        DB      0F3h
        DB      0CCh
        DB      30h             ; '0'
        DB      0C0h
        DB      00h
        DB      0F0h
        DB      0Ch
        DB      03h
        DB      2Ch             ; ','
        DB      18h
        DB      0ACh
        DB      46h             ; 'F'
        DB      5Eh             ; '^'
        DB      0C1h
        DB      2Ah             ; '*'
        DB      0C2h
        DB      0C2h
        DB      0C1h
        DB      8Ah
        DB      0CCh
        DB      60h             ; '`'
        DB      00h
        DB      02h
        DB      0ACh
        DB      2Ch             ; ','
        DB      2Ch             ; ','
        DB      19h
        DB      22h             ; '"'
        DB      46h             ; 'F'
        DB      4Fh             ; 'O'
        DB      0C1h
        DB      2Ah             ; '*'
        DB      0C2h
        DB      0C2h
        DB      0C1h
        DB      92h
        DB      64h             ; 'd'
        DB      60h             ; '`'
        DB      00h
        DB      02h
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      78h             ; 'x'
        DB      0FCh
        DB      0FCh
        DB      0FEh
        DB      0FDh
        DB      79h             ; 'y'
        DB      33h             ; '3'
        DB      32h             ; '2'
        DB      0Fh
        DB      00h
        DB      01h
        DB      02h
        DB      01h
        DB      00h
        DB      0Ch
        DB      0Ch
        DB      1Eh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      0BFh
        DB      9Eh
        DB      0CCh
        DB      4Ch             ; 'L'
        DB      0B0h
        DB      40h             ; '@'
        DB      84h
        DB      4Eh             ; 'N'
        DB      9Ah
        DB      0E1h
        DB      84h
        DB      84h
        DB      84h
        DB      0CCh
        DB      0CCh
        DB      0CEh
        DB      79h             ; 'y'
        DB      79h             ; 'y'
        DB      33h             ; '3'
        DB      32h             ; '2'
        DB      0Dh
        DB      02h
        DB      21h             ; '!'
        DB      72h             ; 'r'
        DB      59h             ; 'Y'
        DB      87h
        DB      21h             ; '!'
        DB      21h             ; '!'
        DB      21h             ; '!'
        DB      33h             ; '3'
        DB      33h             ; '3'
        DB      73h             ; 's'
        DB      9Eh
        DB      9Eh
        DB      0CCh
        DB      0CCh
        DB      0B0h
        DB      40h             ; '@'
        DB      80h
        DB      40h             ; '@'
        DB      80h
        DB      00h
        DB      0Ch
        DB      19h
        DB      13h
        DB      3Ah             ; ':'
        DB      79h             ; 'y'
        DB      7Fh             ; ''
        DB      0FEh
        DB      0FDh
        DB      0FBh
        DB      0F7h
        DB      0B5h
        DB      0D5h
        DB      0C8h
        DB      0C4h
        DB      40h             ; '@'
        DB      20h             ; ' '
        DB      30h             ; '0'
        DB      98h
        DB      0C8h
        DB      5Ch             ; '\'
        DB      9Eh
        DB      0FEh
        DB      7Fh             ; ''
        DB      0BFh
        DB      0DFh
        DB      0EFh
        DB      0AFh
        DB      0ABh
        DB      13h
        DB      23h             ; '#'
        DB      02h
        DB      04h
        DB      06h
        DB      1Dh
        DB      13h
        DB      3Ah             ; ':'
        DB      39h             ; '9'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Eh             ; '>'
        DB      37h             ; '7'
        DB      35h             ; '5'
        DB      35h             ; '5'
        DB      15h
        DB      1Ah
        DB      0Ah
        DB      0Dh
        DB      05h
        DB      60h             ; '`'
        DB      0B8h
        DB      0C8h
        DB      5Ch             ; '\'
        DB      9Ch
        DB      0FCh
        DB      0FCh
        DB      7Ch             ; '|'
        DB      0ECh
        DB      0ACh
        DB      0ACh
        DB      0A8h
        DB      58h             ; 'X'
        DB      50h             ; 'P'
        DB      0B0h
        DB      0A0h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0B0h
        DB      0B0h
        DB      98h
        DB      0DCh
        DB      0DEh
        DB      0CFh
        DB      0E0h
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Dh
        DB      0Dh
        DB      19h
        DB      3Bh             ; ';'
        DB      7Bh             ; '{'
        DB      0F3h
        DB      07h
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0E0h
        DB      0CFh
        DB      0DEh
        DB      0DCh
        DB      98h
        DB      0B0h
        DB      0B0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      07h
        DB      0F3h
        DB      7Bh             ; '{'
        DB      3Bh             ; ';'
        DB      19h
        DB      0Dh
        DB      0Dh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0C0h
        DB      20h             ; ' '
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      03h
        DB      01h
        DB      01h
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      20h             ; ' '
        DB      60h             ; '`'
        DB      80h
        DB      0C0h
        DB      20h             ; ' '
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      10h
        DB      1Ch
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      07h
        DB      0Fh
        DB      08h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0F0h
        DB      0C0h
        DB      0C0h
        DB      80h
        DB      0C0h
        DB      0E0h
        DB      30h             ; '0'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      11h
        DB      89h
        DB      8Fh
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      0FFh
        DB      7Fh             ; ''
        DB      7Fh             ; ''
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      4Fh             ; 'O'
        DB      0Fh
        DB      0Ch
        DB      18h
        DB      80h
        DB      81h
        DB      03h
        DB      0Eh
        DB      1Eh
        DB      7Ch             ; '|'
        DB      0FCh
        DB      0FFh
        DB      0FEh
        DB      0FEh
        DB      0F0h
        DB      0F0h
        DB      0F8h
        DB      3Ch             ; '<'
        DB      0Eh
        DB      03h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      00h
        DB      03h
        DB      03h
        DB      08h
        DB      04h
        DB      06h
        DB      16h
        DB      10h
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      08h
        DB      70h             ; 'p'
        DB      0E0h
        DB      0FCh
        DB      9Eh
        DB      0F8h
        DB      30h             ; '0'
        DB      0FCh
        DB      0FEh
        DB      00h
        DB      00h
        DB      0C0h
        DB      0E0h
        DB      0F8h
        DB      0E2h
        DB      0FFh
        DB      7Fh             ; ''
        DB      1Ch
        DB      07h
        DB      0F7h
        DB      60h             ; '`'
        DB      07h
        DB      07h
        DB      00h
        DB      07h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0C0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      30h             ; '0'
        DB      0F0h
        DB      07h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      1Eh
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      0FFh
        DB      0D7h
        DB      57h             ; 'W'
        DB      0ECh
        DB      2Eh             ; '.'
        DB      0E2h
        DB      6Fh             ; 'o'
        DB      0Fh
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      7Fh             ; ''
        DB      7Fh             ; ''
        DB      3Fh             ; '?'
        DB      0B0h
        DB      0EFh
        DB      0DFh
        DB      0BFh
        DB      0B5h
        DB      0D5h
        DB      17h
        DB      36h             ; '6'
        DB      77h             ; 'w'
        DB      0F7h
        DB      0F7h
        DB      0F9h
        DB      0FCh
        DB      0F8h
        DB      0C7h
        DB      0DFh
        DB      3Fh             ; '?'
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0F0h
        DB      00h
        DB      0F8h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0BFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      9Ah
        DB      0FFh
        DB      80h
        DB      9Fh
        DB      0AFh
        DB      0B7h
        DB      0B8h
        DB      0BBh
        DB      0BBh
        DB      0FFh
        DB      01h
        DB      0F9h
        DB      0F5h
        DB      0EDh
        DB      1Dh
        DB      0DDh
        DB      0DDh
        DB      0BBh
        DB      0BBh
        DB      0B8h
        DB      0B7h
        DB      0AFh
        DB      9Fh
        DB      80h
        DB      0FFh
        DB      0DDh
        DB      0DDh
        DB      1Dh
        DB      0DDh
        DB      0EDh
        DB      0F5h
        DB      01h
        DB      0FFh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      0CAh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      3Fh             ; '?'
        DB      1Fh
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      0FFh
        DB      0FFh
        DB      0F0h
        DB      0F0h
        DB      1Ah
        DB      1Ah
        DB      38h             ; '8'
        DB      3Fh             ; '?'
        DB      78h             ; 'x'
        DB      0F8h
        DB      00h
        DB      00h
        DB      80h
        DB      80h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      07h
        DB      1Fh
        DB      0Fh
        DB      07h
        DB      0Fh
        DB      11h
        DB      11h
        DB      20h             ; ' '
        DB      0E0h
        DB      0F8h
        DB      0F0h
        DB      0E0h
        DB      0F0h
        DB      88h
        DB      88h
        DB      04h
        DB      20h             ; ' '
        DB      20h             ; ' '
        DB      10h
        DB      10h
        DB      08h
        DB      07h
        DB      00h
        DB      00h
        DB      04h
        DB      04h
        DB      08h
        DB      08h
        DB      10h
        DB      0E0h
        DB      00h
        DB      00h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0E0h
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      0CCh
        DB      33h             ; '3'
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      9Dh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      0FEh
        DB      01h
        DB      03h
        DB      06h
        DB      0Dh
        DB      1Ah
        DB      35h             ; '5'
        DB      6Ah             ; 'j'
        DB      0D4h
        DB      80h
        DB      0C0h
        DB      60h             ; '`'
        DB      0B0h
        DB      58h             ; 'X'
        DB      0ACh
        DB      56h             ; 'V'
        DB      2Bh             ; '+'
        DB      0D4h
        DB      6Ah             ; 'j'
        DB      35h             ; '5'
        DB      1Ah
        DB      0Dh
        DB      06h
        DB      03h
        DB      01h
        DB      2Bh             ; '+'
        DB      56h             ; 'V'
        DB      0ACh
        DB      58h             ; 'X'
        DB      0B0h
        DB      60h             ; '`'
        DB      0C0h
        DB      80h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      01h
        DB      03h
        DB      06h
        DB      0Ch
        DB      19h
        DB      32h             ; '2'
        DB      65h             ; 'e'
        DB      0CBh
        DB      80h
        DB      0C0h
        DB      60h             ; '`'
        DB      30h             ; '0'
        DB      98h
        DB      4Ch             ; 'L'
        DB      0A6h
        DB      0D3h
        DB      0CBh
        DB      65h             ; 'e'
        DB      32h             ; '2'
        DB      19h
        DB      0Ch
        DB      06h
        DB      03h
        DB      01h
        DB      0D3h
        DB      0A6h
        DB      4Ch             ; 'L'
        DB      98h
        DB      30h             ; '0'
        DB      60h             ; '`'
        DB      0C0h
        DB      80h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      90h
        DB      18h
        DB      3Ch             ; '<'
        DB      3Ch             ; '<'
        DB      18h
        DB      7Eh             ; '~'
        DB      0BDh
        DB      7Eh             ; '~'
        DB      0C3h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      0B0h
        DB      00h
        DB      00h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      10h
        DB      00h
        DB      00h
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      70h             ; 'p'
        DB      27h             ; '''
        DB      27h             ; '''
        DB      27h             ; '''
        DB      27h             ; '''
        DB      27h             ; '''
        DB      27h             ; '''
        DB      27h             ; '''
        DB      19h
        DB      22h             ; '"'
        DB      1Bh
        DB      0Ah
        DB      16h
        DB      12h
        DB      0Dh
        DB      1Dh
        DB      24h             ; '$'
        DB      0Eh
        DB      2Bh             ; '+'
        DB      2Ch             ; ','
        DB      2Dh             ; '-'
        DB      2Eh             ; '.'
        DB      01h
        DB      09h
        DB      08h
        DB      03h
        DB      11h
        DB      12h
        DB      10h
        DB      11h
        DB      1Ch
        DB      0Ch
        DB      18h
        DB      1Bh
        DB      0Eh
        DB      1Bh
        DB      18h
        DB      18h
        DB      16h
        DB      0Ah
        DB      12h
        DB      1Bh
        DB      0Dh
        DB      12h
        DB      0Ah
        DB      16h
        DB      18h
        DB      17h
        DB      0Dh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      30h             ; '0'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      63h             ; 'c'
        DB      0Dh
        DB      12h
        DB      0Ah
        DB      16h
        DB      18h
        DB      17h
        DB      0Dh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      0Ch
        DB      18h
        DB      17h
        DB      10h
        DB      1Bh
        DB      0Ah
        DB      1Dh
        DB      1Eh
        DB      15h
        DB      0Ah
        DB      1Dh
        DB      12h
        DB      18h
        DB      17h
        DB      1Dh
        DB      1Bh
        DB      22h             ; '"'
        DB      0FFh
        DB      1Dh
        DB      11h
        DB      0Eh
        DB      0FFh
        DB      17h
        DB      0Eh
        DB      21h             ; '!'
        DB      1Dh
        DB      0FFh
        DB      19h
        DB      22h             ; '"'
        DB      1Bh
        DB      0Ah
        DB      16h
        DB      12h
        DB      0Dh
        DB      11h
        DB      12h
        DB      1Dh
        DB      0FFh
        DB      1Ch
        DB      19h
        DB      0Ah
        DB      0Ch
        DB      0Eh
        DB      0FFh
        DB      14h
        DB      0Eh
        DB      22h             ; '"'
        DB      16h
        DB      1Ch
        DB      21h             ; '!'
        DB      19h
        DB      22h             ; '"'
        DB      1Bh
        DB      0Ah
        DB      16h
        DB      12h
        DB      0Dh
        DB      0FFh
        DB      20h             ; ' '
        DB      0Ah
        DB      1Bh
        DB      19h
        DB      28h             ; '('
        DB      0Ch
        DB      29h             ; ')'
        DB      0FFh
        DB      01h
        DB      09h
        DB      08h
        DB      03h
        DB      0FFh
        DB      0Bh
        DB      22h             ; '"'
        DB      0FFh
        DB      1Dh
        DB      24h             ; '$'
        DB      0Eh
        DB      0FFh
        DB      1Ch
        DB      18h
        DB      0Fh
        DB      1Dh
        DB      10h
        DB      0Ah
        DB      16h
        DB      0Eh
        DB      0FFh
        DB      18h
        DB      1Fh
        DB      0Eh
        DB      1Bh
        DB      0D1h
        DB      40h             ; '@'
        DB      04h
        DB      00h
        DB      0B5h
        DB      0A0h
        DB      80h
        DB      00h
        DB      2Eh             ; '.'
        DB      0C0h
        DB      60h             ; '`'
        DB      80h
        DB      6Eh             ; 'n'
        DB      0A0h
        DB      00h
        DB      20h             ; ' '
        DB      75h             ; 'u'
        DB      0A0h
        DB      40h             ; '@'
        DB      80h
        DB      5Ah             ; 'Z'
        DB      20h             ; ' '
        DB      00h
        DB      00h
        DB      02h
        DB      05h
        DB      0Ah
        DB      07h
        DB      0Ah
        DB      0Ah
        DB      82h
        DB      00h
        DB      05h
        DB      0Ah
        DB      0AEh
        DB      0A0h
        DB      08h
        DB      00h
        DB      0BAh
        DB      0C0h
        DB      00h
        DB      80h
        DB      0EEh
        DB      0A0h
        DB      80h
        DB      00h
        DB      0AEh
        DB      0A0h
        DB      88h
        DB      20h             ; ' '
        DB      0ABh
        DB      0A0h
        DB      80h
        DB      00h
        DB      0AEh
        DB      0A0h
        DB      05h
        DB      00h
        DB      00h
        DB      07h
        DB      0Ah
        DB      07h
        DB      00h
        DB      00h
        DB      01h
        DB      0Ah
        DB      89h
        DB      00h
        DB      0EEh
        DB      0E0h
        DB      0AAh
        DB      0A0h
        DB      00h
        DB      00h
        DB      0AAh
        DB      0A0h
        DB      0Eh
        DB      00h
        DB      0A0h
        DB      0A0h
        DB      0Eh
        DB      00h
        DB      0AAh
        DB      0A0h
        DB      80h
        DB      20h             ; ' '
        DB      0EAh
        DB      0E0h
        DB      0Ah
        DB      00h
        DB      01h
        DB      00h
        DB      05h
        DB      00h
        DB      09h
        DB      00h
        DB      08h
        DB      04h
        DB      05h
        DB      0Ah
        DB      87h
        DB      00h
        DB      6Ah             ; 'j'
        DB      0C0h
        DB      00h
        DB      00h
        DB      0BBh
        DB      0A0h
        DB      00h
        DB      00h
        DB      6Eh             ; 'n'
        DB      0C0h
        DB      00h
        DB      00h
        DB      6Eh             ; 'n'
        DB      0C0h
        DB      00h
        DB      00h
        DB      0BBh
        DB      0A0h
        DB      00h
        DB      00h
        DB      6Ah             ; 'j'
        DB      0C0h
        DB      01h
        DB      02h
        DB      09h
        DB      02h
        DB      09h
        DB      08h
        DB      00h
        DB      08h
        DB      85h
        DB      00h
        DB      05h
        DB      0Ah
        DB      8Bh
        DB      40h             ; '@'
        DB      0A8h
        DB      00h
        DB      0A2h
        DB      0C0h
        DB      0Ah
        DB      00h
        DB      0DEh
        DB      0C0h
        DB      00h
        DB      80h
        DB      5Eh             ; '^'
        DB      20h             ; ' '
        DB      02h
        DB      80h
        DB      6Bh             ; 'k'
        DB      0E0h
        DB      08h
        DB      80h
        DB      62h             ; 'b'
        DB      20h             ; ' '
        DB      05h
        DB      00h
        DB      07h
        DB      08h
        DB      0Ah
        DB      08h
        DB      00h
        DB      01h
        DB      00h
        DB      0Ah
        DB      8Ah
        DB      00h
        DB      85h
        DB      00h
        DB      0DDh
        DB      0C0h
        DB      84h
        DB      00h
        DB      0B1h
        DB      60h             ; '`'
        DB      1Eh
        DB      00h
        DB      40h             ; '@'
        DB      0C0h
        DB      0EEh
        DB      0C0h
        DB      24h             ; '$'
        DB      00h
        DB      0ADh
        DB      60h             ; '`'
        DB      04h
        DB      00h
        DB      0F1h
        DB      0C0h
        DB      00h
        DB      00h
        DB      01h
        DB      0Ah
        DB      08h
        DB      0Ah
        DB      01h
        DB      06h
        DB      0Ah
        DB      0Ah
        DB      86h
        DB      00h
        DB      0AAh
        DB      0A0h
        DB      88h
        DB      80h
        DB      0AAh
        DB      0A0h
        DB      22h             ; '"'
        DB      20h             ; ' '
        DB      0AEh
        DB      80h
        DB      80h
        DB      40h             ; '@'
        DB      0AEh
        DB      80h
        DB      22h             ; '"'
        DB      20h             ; ' '
        DB      0EBh
        DB      0A0h
        DB      88h
        DB      80h
        DB      0AAh
        DB      0A0h
        DB      00h
        DB      0Ah
        DB      04h
        DB      01h
        DB      07h
        DB      08h
        DB      08h
        DB      05h
        DB      81h
        DB      00h
        DB      09h
        DB      0Ah
        DB      0DEh
        DB      0C0h
        DB      42h             ; 'B'
        DB      00h
        DB      58h             ; 'X'
        DB      0A0h
        DB      02h
        DB      0A0h
        DB      5Eh             ; '^'
        DB      00h
        DB      00h
        DB      0C0h
        DB      5Fh             ; '_'
        DB      0C0h
        DB      00h
        DB      00h
        DB      0ADh
        DB      40h             ; '@'
        DB      05h
        DB      40h             ; '@'
        DB      0D4h
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      00h
        DB      0Ah
        DB      09h
        DB      09h
        DB      05h
        DB      00h
        DB      8Ah
        DB      00h
        DB      04h
        DB      0Ah
        DB      0BBh
        DB      0A0h
        DB      08h
        DB      00h
        DB      63h             ; 'c'
        DB      0C0h
        DB      4Ah             ; 'J'
        DB      00h
        DB      7Eh             ; '~'
        DB      0A0h
        DB      00h
        DB      00h
        DB      0AEh
        DB      0E0h
        DB      0EAh
        DB      20h             ; ' '
        DB      8Ah
        DB      0A0h
        DB      20h             ; ' '
        DB      80h
        DB      0EAh
        DB      0A0h
        DB      01h
        DB      0Ah
        DB      0Ah
        DB      07h
        DB      07h
        DB      00h
        DB      01h
        DB      03h
        DB      85h
        DB      00h
        DB      05h
        DB      0Ah
        DB      74h             ; 't'
        DB      60h             ; '`'
        DB      15h
        DB      00h
        DB      0D5h
        DB      0C0h
        DB      04h
        DB      20h             ; ' '
        DB      7Fh             ; ''
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      0DFh
        DB      60h             ; '`'
        DB      10h
        DB      40h             ; '@'
        DB      7Bh             ; '{'
        DB      0C0h
        DB      10h
        DB      40h             ; '@'
        DB      0DFh
        DB      00h
        DB      02h
        DB      00h
        DB      03h
        DB      09h
        DB      0Ah
        DB      00h
        DB      0Ah
        DB      05h
        DB      0Ah
        DB      02h
        DB      8Ah
        DB      07h
        DB      15h
        DB      00h
        DB      44h             ; 'D'
        DB      40h             ; '@'
        DB      51h             ; 'Q'
        DB      40h             ; '@'
        DB      44h             ; 'D'
        DB      40h             ; '@'
        DB      7Fh             ; ''
        DB      0C0h
        DB      00h
        DB      00h
        DB      7Fh             ; ''
        DB      0C0h
        DB      51h             ; 'Q'
        DB      0C0h
        DB      44h             ; 'D'
        DB      40h             ; '@'
        DB      51h             ; 'Q'
        DB      40h             ; '@'
        DB      54h             ; 'T'
        DB      00h
        DB      01h
        DB      02h
        DB      01h
        DB      09h
        DB      09h
        DB      02h
        DB      05h
        DB      03h
        DB      04h
        DB      0Ah
        DB      84h
        DB      00h
        DB      2Ah             ; '*'
        DB      80h
        DB      0A0h
        DB      0C0h
        DB      2Ah             ; '*'
        DB      80h
        DB      7Fh             ; ''
        DB      0A0h
        DB      1Fh
        DB      00h
        DB      0C0h
        DB      40h             ; '@'
        DB      1Fh
        DB      00h
        DB      44h             ; 'D'
        DB      40h             ; '@'
        DB      6Fh             ; 'o'
        DB      00h
        DB      41h             ; 'A'
        DB      40h             ; '@'
        DB      14h
        DB      00h
        DB      03h
        DB      03h
        DB      05h
        DB      03h
        DB      07h
        DB      03h
        DB      05h
        DB      08h
        DB      85h
        DB      00h
        DB      04h
        DB      0Ah
        DB      0E0h
        DB      0E0h
        DB      8Ah
        DB      20h             ; ' '
        DB      2Ah             ; '*'
        DB      80h
        DB      64h             ; 'd'
        DB      0C0h
        DB      0Eh
        DB      00h
        DB      0A0h
        DB      0E0h
        DB      0Eh
        DB      00h
        DB      64h             ; 'd'
        DB      0C0h
        DB      2Eh             ; '.'
        DB      80h
        DB      8Ah
        DB      20h             ; ' '
        DB      0E0h
        DB      0E0h
        DB      01h
        DB      00h
        DB      01h
        DB      0Ah
        DB      0Ah
        DB      05h
        DB      05h
        DB      07h
        DB      05h
        DB      02h
        DB      85h
        DB      09h
        DB      50h             ; 'P'
        DB      0E0h
        DB      56h             ; 'V'
        DB      0C0h
        DB      06h
        DB      00h
        DB      50h             ; 'P'
        DB      0A0h
        DB      1Eh
        DB      20h             ; ' '
        DB      0E0h
        DB      0A0h
        DB      8Eh
        DB      00h
        DB      6Ch             ; 'l'
        DB      0C0h
        DB      0Ah
        DB      00h
        DB      60h             ; '`'
        DB      0A0h
        DB      0Eh
        DB      0A0h
        DB      00h
        DB      05h
        DB      0Ah
        DB      04h
        DB      05h
        DB      0Ah
        DB      0Ah
        DB      00h
        DB      80h
        DB      00h
        DB      07h
        DB      0Ah
        DB      0FBh
        DB      0E0h
        DB      0A0h
        DB      80h
        DB      0AAh
        DB      0A0h
        DB      8Ah
        DB      20h             ; ' '
        DB      2Eh             ; '.'
        DB      0A0h
        DB      60h             ; '`'
        DB      80h
        DB      2Eh             ; '.'
        DB      0C0h
        DB      8Ah
        DB      00h
        DB      0A0h
        DB      0A0h
        DB      2Dh             ; '-'
        DB      80h
        DB      0A0h
        DB      0A0h
        DB      01h
        DB      00h
        DB      02h
        DB      05h
        DB      0Ah
        DB      03h
        DB      00h
        DB      0Ah
        DB      05h
        DB      03h
        DB      85h
        DB      07h
        DB      20h             ; ' '
        DB      80h
        DB      20h             ; ' '
        DB      80h
        DB      20h             ; ' '
        DB      80h
        DB      20h             ; ' '
        DB      80h
        DB      3Bh             ; ';'
        DB      80h
        DB      0Ah
        DB      00h
        DB      00h
        DB      00h
        DB      55h             ; 'U'
        DB      40h             ; '@'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      05h
        DB      03h
        DB      02h
        DB      06h
        DB      04h
        DB      07h
        DB      04h
        DB      05h
        DB      01h
        DB      07h
        DB      03h
        DB      06h
        DB      02h
        DB      05h
        DB      02h
        DB      06h
        DB      04h
        DB      01h
        DB      07h
        DB      03h
        DB      06h
        DB      01h
        DB      04h
        DB      05h
        DB      02h
        DB      03h
        DB      07h
        DB      08h
        DB      0Ch
        DB      0Ah
        DB      09h
        DB      0Bh
        DB      0Bh
        DB      08h
        DB      0Ah
        DB      09h
        DB      0Ch
        DB      0Ch
        DB      0Ah
        DB      09h
        DB      0Bh
        DB      08h
        DB      0Ah
        DB      09h
        DB      08h
        DB      0Ch
        DB      0Bh
        DB      0Dh
        DB      0Eh
        DB      0Fh
        DB      0Eh
        DB      0Dh
        DB      0Fh
        DB      0Fh
        DB      0Eh
        DB      0Dh
        DB      0Dh
        DB      0Fh
        DB      0Eh
        DB      07h
        DB      50h             ; 'P'
        DB      84h
        DB      04h
        DB      07h
        DB      70h             ; 'p'
        DB      88h
        DB      04h
        DB      27h             ; '''
        DB      50h             ; 'P'
        DB      8Ch
        DB      04h
        DB      27h             ; '''
        DB      70h             ; 'p'
        DB      90h
        DB      04h
        DB      01h
        DB      07h
        DB      0BFh
        DB      0Dh
        DB      00h
        DB      01h
        DB      01h
        DB      01h
        DB      02h
        DB      05h
        DB      03h
        DB      02h
        DB      04h
        DB      0Fh
        DB      05h
        DB      03h
        DB      06h
        DB      05h
        DB      07h
        DB      0B0h
        DB      08h
        DB      10h
        DB      09h
        DB      10h
        DB      0Ah
        DB      10h
        DB      0Ch
        DB      0FFh
        DB      0Dh
        DB      00h
        DB      20h             ; ' '
        DB      50h             ; 'P'
        DB      59h             ; 'Y'
        DB      52h             ; 'R'
        DB      41h             ; 'A'
        DB      4Dh             ; 'M'
        DB      49h             ; 'I'
        DB      44h             ; 'D'
        DB      20h             ; ' '
        DB      57h             ; 'W'
        DB      41h             ; 'A'
        DB      52h             ; 'R'
        DB      50h             ; 'P'
        DB      0A0h
        DB      20h             ; ' '
        DB      31h             ; '1'
        DB      39h             ; '9'
        DB      38h             ; '8'
        DB      33h             ; '3'
        DB      2Eh             ; '.'
        DB      20h             ; ' '
        DB      39h             ; '9'
        DB      2Eh             ; '.'
        DB      20h             ; ' '
        DB      31h             ; '1'
        DB      35h             ; '5'
        DB      0A0h
        DB      20h             ; ' '
        DB      62h             ; 'b'
        DB      79h             ; 'y'
        DB      20h             ; ' '
        DB      54h             ; 'T'
        DB      26h             ; '&'
        DB      45h             ; 'E'
        DB      20h             ; ' '
        DB      53h             ; 'S'
        DB      4Fh             ; 'O'
        DB      46h             ; 'F'
        DB      54h             ; 'T'
        DB      0A0h
        DB      20h             ; ' '
        DB      45h             ; 'E'
        DB      49h             ; 'I'
        DB      5Ah             ; 'Z'
        DB      49h             ; 'I'
        DB      20h             ; ' '
        DB      4Bh             ; 'K'
        DB      41h             ; 'A'
        DB      54h             ; 'T'
        DB      4Fh             ; 'O'
        DB      20h             ; ' '
        DB      21h             ; '!'
        DB      21h             ; '!'
        DB      0A0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
