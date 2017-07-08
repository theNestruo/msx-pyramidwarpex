; -----------------------------------------------------------------------------
; 00				; XXXXXXXXXXXXX
	DB	0D1h, 040h	; XBX^X___X_X_X
	DB	004h, 000h	; X_____X_____X
	DB	0B5h, 0A0h	; XX_XX_X_XX_XX
	DB	080h, 000h	; XX__________X
	DB	02Eh, 0C0h	; X__X_HHH_XX_X
	DB	060h, 080h	; X_XB_____X__X
	DB	06Eh, 0A0h	; X_XX_HHH_X_XX
	DB	000h, 020h	; X__________BX
	DB	075h, 0A0h	; X_XXX_X_XX_XX
	DB	040h, 080h	; X_X______X_NX
	DB	05Ah, 020h 	; X_X_XXvX___XX
				; XXXXXXXXXXXXX
	DB	00h, 00h	; box1
	DB	02h, 05h	; box2
	DB	0Ah, 07h	; box3
	DB	0Ah, 0Ah	; nest
	DB	82h, 00h	; door (^)
	DB	05h, 0Ah	; door (v)
	
; 01
	DB	0AEh, 0A0h	; walls
	DB	08h, 00h
	DB	0BAh, 0C0h
	DB	00h, 80h
	DB	0EEh, 0A0h
	DB	80h, 00h
	DB	0AEh, 0A0h
	DB	88h, 20h 
	DB	0ABh, 0A0h
	DB	80h, 00h
	DB	0AEh, 0A0h
	DB	05h, 00h	; boxes
	DB	00h, 07h
	DB	0Ah, 07h
	DB	00h, 00h	; nest
	DB	01h, 0Ah	; doors
	DB	89h, 00h
	
; 02
	DB	0EEh, 0E0h	; walls
	DB	0AAh, 0A0h
	DB	00h, 00h
	DB	0AAh, 0A0h
	DB	0Eh, 00h
	DB	0A0h, 0A0h
	DB	0Eh, 00h
	DB	0AAh, 0A0h
	DB	80h, 20h 
	DB	0EAh, 0E0h
	DB	0Ah, 00h
	DB	01h, 00h	; boxes
	DB	05h, 00h
	DB	09h, 00h
	DB	08h, 04h	; nest
	DB	05h, 0Ah	; doors
	DB	87h, 00h

; 03
	DB	6Ah, 0C0h	; walls
	DB	00h, 00h
	DB	0BBh, 0A0h
	DB	00h, 00h
	DB	6Eh , 0C0h
	DB	00h, 00h
	DB	6Eh , 0C0h
	DB	00h, 00h
	DB	0BBh, 0A0h
	DB	00h, 00h
	DB	6Ah , 0C0h
	DB	01h, 02h	; boxes
	DB	09h, 02h
	DB	09h, 08h
	DB	00h, 08h	; nest
	DB	85h, 00h	; doors
	DB	05h, 0Ah

; 04
	DB	8Bh, 40h 	; walls
	DB	0A8h, 00h
	DB	0A2h, 0C0h
	DB	0Ah, 00h
	DB	0DEh, 0C0h
	DB	00h, 80h
	DB	5Eh , 20h 
	DB	02h, 80h
	DB	6Bh , 0E0h
	DB	08h, 80h
	DB	62h , 20h 
	DB	05h, 00h	; boxes
	DB	07h, 08h
	DB	0Ah, 08h
	DB	00h, 01h	; nest
	DB	00h, 0Ah	; doors
	DB	8Ah, 00h

; 05
	DB	85h, 00h	; walls
	DB	0DDh, 0C0h
	DB	84h, 00h
	DB	0B1h, 60h 
	DB	1Eh, 00h
	DB	40h , 0C0h
	DB	0EEh, 0C0h
	DB	24h , 00h
	DB	0ADh, 60h 
	DB	04h, 00h
	DB	0F1h, 0C0h
	DB	00h, 00h	; boxes
	DB	01h, 0Ah
	DB	08h, 0Ah
	DB	01h, 06h	; nest
	DB	0Ah, 0Ah	; doors
	DB	86h, 00h

; 06
	DB	0AAh, 0A0h	; walls
	DB	88h, 80h
	DB	0AAh, 0A0h
	DB	22h , 20h 
	DB	0AEh, 80h
	DB	80h, 40h 
	DB	0AEh, 80h
	DB	22h , 20h 
	DB	0EBh, 0A0h
	DB	88h, 80h
	DB	0AAh, 0A0h
	DB	00h, 0Ah	; boxes
	DB	04h, 01h
	DB	07h, 08h
	DB	08h, 05h	; nest
	DB	81h, 00h	; doors
	DB	09h, 0Ah

; 07
	DB	0DEh, 0C0h	; walls
	DB	42h , 00h
	DB	58h , 0A0h
	DB	02h, 0A0h
	DB	5Eh , 00h
	DB	00h, 0C0h
	DB	5Fh , 0C0h
	DB	00h, 00h
	DB	0ADh, 40h 
	DB	05h, 40h 
	DB	0D4h, 60h 
	DB	00h, 00h	; boxes
	DB	00h, 0Ah
	DB	09h, 09h
	DB	05h, 00h	; nest
	DB	8Ah, 00h	; doors
	DB	04h, 0Ah

; 08
	DB	0BBh, 0A0h	; walls
	DB	08h, 00h
	DB	63h , 0C0h
	DB	4Ah , 00h
	DB	7Eh , 0A0h
	DB	00h, 00h
	DB	0AEh, 0E0h
	DB	0EAh, 20h 
	DB	8Ah, 0A0h
	DB	20h , 80h
	DB	0EAh, 0A0h
	DB	01h, 0Ah	; boxes
	DB	0Ah, 07h
	DB	07h, 00h
	DB	01h, 03h	; nest
	DB	85h, 00h	; doors
	DB	05h, 0Ah

; 09
	DB	74h, 60h 	; walls
	DB	15h, 00h
	DB	0D5h, 0C0h
	DB	04h, 20h 
	DB	7Fh , 60h 
	DB	00h, 00h
	DB	0DFh, 60h 
	DB	10h, 40h 
	DB	7Bh , 0C0h
	DB	10h, 40h 
	DB	0DFh, 00h
	DB	02h, 00h	; boxes
	DB	03h, 09h
	DB	0Ah, 00h
	DB	0Ah, 05h	; nest
	DB	0Ah, 02h	; doors
	DB	8Ah, 07h

; 0A
	DB	15h, 00h	; walls
	DB	44h , 40h 
	DB	51h , 40h 
	DB	44h , 40h 
	DB	7Fh , 0C0h
	DB	00h, 00h
	DB	7Fh , 0C0h
	DB	51h , 0C0h
	DB	44h , 40h 
	DB	51h , 40h 
	DB	54h , 00h
	DB	01h, 02h	; boxes
	DB	01h, 09h
	DB	09h, 02h
	DB	05h, 03h	; nest
	DB	04h, 0Ah	; doors
	DB	84h, 00h

; 0B
	DB	2Ah , 80h	; walls
	DB	0A0h, 0C0h
	DB	2Ah , 80h
	DB	7Fh , 0A0h
	DB	1Fh, 00h
	DB	0C0h, 40h 
	DB	1Fh, 00h
	DB	44h , 40h 
	DB	6Fh , 00h
	DB	41h , 40h 
	DB	14h, 00h
	DB	03h, 03h	; boxes
	DB	05h, 03h
	DB	07h, 03h
	DB	05h, 08h	; nest
	DB	85h, 00h	; doors
	DB	04h, 0Ah

; 0C
	DB	0E0h, 0E0h	; walls
	DB	8Ah, 20h 
	DB	2Ah , 80h
	DB	64h , 0C0h
	DB	0Eh, 00h
	DB	0A0h, 0E0h
	DB	0Eh, 00h
	DB	64h , 0C0h
	DB	2Eh , 80h
	DB	8Ah, 20h 
	DB	0E0h, 0E0h
	DB	01h, 00h	; boxes
	DB	01h, 0Ah
	DB	0Ah, 05h
	DB	05h, 07h	; nest
	DB	05h, 02h	; doors
	DB	85h, 09h

; 0D
	DB	50h , 0E0h	; walls
	DB	56h , 0C0h
	DB	06h, 00h
	DB	50h, 0A0h
	DB	1Eh, 20h
	DB	0E0h, 0A0h
	DB	8Eh, 00h
	DB	6Ch, 0C0h
	DB	0Ah, 00h
	DB	60h, 0A0h
	DB	0Eh, 0A0h
	DB	00h, 05h	; boxes
	DB	0Ah, 04h
	DB	05h, 0Ah
	DB	0Ah, 00h	; nest
	DB	80h, 00h	; doors
	DB	07h, 0Ah

; 0E
	DB	0FBh, 0E0h	; walls
	DB	0A0h, 80h
	DB	0AAh, 0A0h
	DB	8Ah, 20h
	DB	2Eh, 0A0h
	DB	60h, 80h
	DB	2Eh, 0C0h
	DB	8Ah, 00h
	DB	0A0h, 0A0h
	DB	2Dh, 80h
	DB	0A0h, 0A0h
	DB	01h, 00h	; box
	DB	02h, 05h
	DB	0Ah, 03h
	DB	00h, 0Ah	; nest
	DB	05h, 03h	; doors
	DB	85h, 07h

; 0F (sphynx room)
	DB	20h, 80h	; walls
	DB	20h, 80h
	DB	20h, 80h
	DB	20h, 80h
	DB	3Bh, 80h
	DB	0Ah, 00h
	DB	00h, 00h
	DB	55h, 40h
	DB	00h, 00h
	DB	00h, 00h
	DB	00h, 00h
; -----------------------------------------------------------------------------

; EOF
