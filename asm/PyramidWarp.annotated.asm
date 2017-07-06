; -----------------------------------------------------------------------------
; MSX BIOS
	; CHKRAM:	equ $0000 ; Power-up, check RAM
	; CGTABL:	equ $0004 ; Two bytes, address of ROM character set
	; VDP_DR:	equ $0006 ; One byte, VDP Data Port number (read)
	; VDP_DW:	equ $0007 ; One byte, VDP Data Port number (write)
	; SYNCHR:	equ $0008 ; Check BASIC program character
	; RDSLT:	equ $000c ; Read RAM in any slot
	; CHRGTR:	equ $0010 ; Get next BASIC program character
	; WRSLT:	equ $0014 ; Write to RAM in any slot
	; OUTDO:	equ $0018 ; Output to current device
	; CALSLT:	equ $001c ; Call routine in any slot
	; DCOMPR:	equ $0020 ; Compare register pairs HL and DE
	; ENASLT:	equ $0024 ; Enable any slot permanently
	; GETYPR:	equ $0028 ; Get BASIC operand type
	; MSXID1:	equ $002b ; Frecuency (1b), date format (3b) and charset (4b)
	; MSXID2:	equ $002c ; Basic version (4b) and Keybaord type (4b)
	; MSXID3:	equ $002d ; MSX version number
	; MSXID4:	equ $002e ; Bit 0: if 1 then MSX-MIDI is present internally (MSX turbo R only)
	; MSXID5:	equ $002f ; Reserved
	; CALLF:	equ $0030 ; Call routine in any slot
	; KEYINT:	equ $0038 ; Interrupt handler, keyboard scan
	; INITIO:	equ $003b ; Initialize I/O devices
	; INIFNK:	equ $003e ; Initialize function key strings
	; DISSCR:	equ $0041 ; Disable screen
	; ENASCR:	equ $0044 ; Enable screen
	WRTVDP:	equ $0047 ; Write to any VDP register
	RDVRM:	equ $004a ; Read byte from VRAM
	WRTVRM:	equ $004d ; Write byte to VRAM
	; SETRD:	equ $0050 ; Set up VDP for read
	; SETWRT:	equ $0053 ; Set up VDP for write
	FILVRM:	equ $0056 ; Fill block of VRAM with data byte
	; LDIRMV:	equ $0059 ; Copy block to memory from VRAM
	LDIRVM:	equ $005c ; Copy block to VRAM, from memory
	CHGMOD:	equ $005f ; Change VDP mode
	CHGCLR:	equ $0062 ; Change VDP colours
	; NMI:		equ $0066 ; Non Maskable Interrupt handler
	CLRSPR:	equ $0069 ; Clear all sprites
	; INITXT:	equ $006c ; Initialize VDP to 40x24 Text Mode
	; INIT32:	equ $006f ; Initialize VDP to 32x24 Text Mode
	; INIGRP:	equ $0072 ; Initialize VDP to Graphics Mode
	; INIMLT:	equ $0075 ; Initialize VDP to Multicolour Mode
	; SETTXT:	equ $0078 ; Set VDP to 40x24 Text Mode
	; SETT32:	equ $007b ; Set VDP to 32x24 Text Mode
	; SETGRP:	equ $007e ; Set VDP to Graphics Mode
	; SETMLT:	equ $0081 ; Set VDP to Multicolour Mode
	; CALPAT:	equ $0084 ; Calculate address of sprite pattern
	; CALATR:	equ $0087 ; Calculate address of sprite attribute
	; GSPSIZ:	equ $008a ; Get sprite size
	; GRPPRT:	equ $008d ; Print character on graphic screen
	; GICINI:	equ $0090 ; Initialize PSG (GI Chip)
	; WRTPSG:	equ $0093 ; Write to any PSG register
	; RDPSG:	equ $0096 ; Read from any PSG register
	; STRTMS:	equ $0099 ; Start music dequeueing
	; CHSNS:	equ $009c ; Sense keyboard buffer for character
	; CHGET:	equ $009f ; Get character from keyboard buffer (wait)
	; CHPUT:	equ $00a2 ; Screen character output
	; LPTOUT:	equ $00a5 ; Line printer character output
	; LPTSTT:	equ $00a8 ; Line printer status test
	; CNVCHR:	equ $00ab ; Convert character with graphic header
	; PINLIN:	equ $00ae ; Get line from console (editor)
	; INLIN:	equ $00b1 ; Get line from console (editor)
	; QINLIN:	equ $00b4 ; Display "?", get line from console (editor)
	; BREAKX:	equ $00b7 ; Check CTRL-STOP key directly
	; ISCNTC:	equ $00ba ; Check CRTL-STOP key
	; CKCNTC:	equ $00bd ; Check CTRL-STOP key
	; BEEP:		equ $00c0 ; Go beep
	; CLS:		equ $00c3 ; Clear screen
	; POSIT:	equ $00c6 ; Set cursor position
	; FNKSB:	equ $00c9 ; Check if function key display on
	; ERAFNK:	equ $00cc ; Erase function key display
	; DSPFNK:	equ $00cf ; Display function keys
	; TOTEXT:	equ $00d2 ; Return VDP to text mode
	GTSTCK:	equ $00d5 ; Get joystick status
	GTTRIG:	equ $00d8 ; Get trigger status
	; GTPAD:	equ $00db ; Get touch pad status
	; GTPDL:	equ $00de ; Get paddle status
	; TAPION:	equ $00e1 ; Tape input ON
	; TAPIN:	equ $00e4 ; Tape input
	; TAPIOF:	equ $00e7 ; Tape input OFF
	; TAPOON:	equ $00ea ; Tape output ON
	; TAPOUT:	equ $00ed ; Tape output
	; TAPOOF:	equ $00f0 ; Tape output OFF
	; STMOTR:	equ $00f3 ; Turn motor ON/OFF
	; LFTQ:		equ $00f6 ; Space left in music queue
	; PUTQ:		equ $00f9 ; Put byte in music queue
	; RIGHTC:	equ $00fc ; Move current pixel physical address right
	; LEFTC:	equ $00ff ; Move current pixel physical address left
	; UPC:		equ $0102 ; Move current pixel physical address up
	; TUPC:		equ $0105 ; Test then UPC if legal
	; DOWNC:	equ $0108 ; Move current pixel physical address down
	; TDOWNC:	equ $010b ; Test then DOWNC if legal
	; SCALXY:	equ $010e ; Scale graphics coordinates
	; MAPXYC:	equ $0111 ; Map graphic coordinates to physical address
	; FETCHC:	equ $0114 ; Fetch current pixel physical address
	; STOREC:	equ $0117 ; Store current pixel physical address
	; SETATR:	equ $011a ; Set attribute byte
	; READC:	equ $011d ; Read attribute of current pixel
	; SETC:		equ $0120 ; Set attribute of current pixel
	; NSETCX:	equ $0123 ; Set attribute of number of pixels
	; GTASPC:	equ $0126 ; Get aspect ratio
	; PNTINI:	equ $0129 ; Paint initialize
	; SCANR:	equ $012c ; Scan pixels to right
	; SCANL:	equ $012f ; Scan pixels to left
	; CHGCAP:	equ $0132 ; Change Caps Lock LED
	; CHGSND:	equ $0135 ; Change Key Click sound output
	; RSLREG:	equ $0138 ; Read Primary Slot Register
	; WSLREG:	equ $013b ; Write to Primary Slot Register
	; RDVDP:	equ $013e ; Read VDP Status Register
	; SNSMAT:	equ $0141 ; Read row of keyboard matrix
	; PHYDIO:	equ $0144 ; Disk, no action
	; FORMAT:	equ $0147 ; Disk, no action
	; ISFLIO:	equ $014a ; Check for file I/O
	; OUTDLP:	equ $014d ; Formatted output to line printer
	; GETVCP:	equ $0150 ; Get music voice pointer
	; GETVC2:	equ $0153 ; Get music voice pointer
	; KILBUF:	equ $0156 ; Clear keyboard buffer
	; CALBAS:	equ $0159 ; Call to BASIC from any slot

; MSX system variables
	; CLIKSW:	equ $f3db ; Keyboard click sound
	; RG0SAV:	equ $f3df ; Content of VDP(0) register (R#0)
	; RG1SAV:	equ $f3e0 ; Content of VDP(1) register (R#1)
	; RG2SAV:	equ $f3e1 ; Content of VDP(2) register (R#2)
	; RG3SAV:	equ $f3e2 ; Content of VDP(3) register (R#3)
	; RG4SAV:	equ $f3e3 ; Content of VDP(4) register (R#4)
	; RG5SAV:	equ $f3e4 ; Content of VDP(5) register (R#5)
	; RG6SAV:	equ $f3e5 ; Content of VDP(6) register (R#6)
	; RG7SAV:	equ $f3e6 ; Content of VDP(7) register (R#7)
	; TRGFLG:	equ $f3e8 ; State of the four joystick trigger inputs and the space key
	FORCLR:	equ $f3e9 ; Foreground colour
	BAKCLR:	equ $f3ea ; Background colour
	BDRCLR:	equ $f3eb ; Border colour
	; OLDKEY:	equ $fbda ; Previous state of the keyboard matrix (11b)
	; NEWKEY:	equ $fbe5 ; Current state of the keyboard matrix (11b)
	; HIMEM:	equ $fc4a ; High free RAM address available (init stack with)
	; EXPTBL:	equ $fcc1 ; Set to $80 during power-up if Primary Slot is expanded (4b)
	; SLTTBL:	equ $fcc5 ; Mirror of the four possible Secondary Slot Registers (4b)

; VRAM addresses
	CHRTBL:		equ $0000 ; Pattern table
	.BANK_SIZE:	equ 256 * 8
	.BANK_0:	equ CHRTBL + 0 * CHRTBL.BANK_SIZE
	.BANK_1:	equ CHRTBL + 1 * CHRTBL.BANK_SIZE
	.BANK_2:	equ CHRTBL + 2 * CHRTBL.BANK_SIZE
	.SIZE:		equ 3 * .BANK_SIZE
	NAMTBL:		equ $1800 ; Name table
	CLRTBL:		equ $2000 ; Color table
	.BANK_SIZE:	equ 256 * 8
	.BANK_0:	equ CLRTBL + 0 * CLRTBL.BANK_SIZE
	.BANK_1:	equ CLRTBL + 1 * CLRTBL.BANK_SIZE
	.BANK_2:	equ CLRTBL + 2 * CLRTBL.BANK_SIZE
	.SIZE:		equ 3 * .BANK_SIZE
	SPRATR:		equ $1B00 ; Sprite attributes table
	SPRTBL:		equ $3800 ; Sprite pattern table

; VDP symbolic constants
	SCR_WIDTH:	equ 32
	; SCR_HEIGHT:	equ 24
	; NAMTBL_SIZE:	equ 32 * 24
	; CHRTBL_SIZE:	equ 256 * 8
	; SPRTBL_SIZE:	equ 32 * 64
	; SPRATR_SIZE:	equ 32 * 4
	; SPAT_END:	equ $d0 ; Sprite attribute table end marker
	SPAT_OB:	equ $d1 ; Sprite out of bounds marker (not standard)
	; SPAT_EC:	equ $80 ; Early clock bit (32 pixels)
; -----------------------------------------------------------------------------
	
; -----------------------------------------------------------------------------
; ROM header and entry point
	org	$8000, $bfff
ROM_START:
	db	"AB"		; ID ("AB")
	dw	.INIT		; INIT
	ds	$8010 - $, $00	; STATEMENT, DEVICE, TEXT, Reserved

; Entry Point
.INIT:
; screen 2
L8010:	call	SCREEN_2
	
; screen ,2
	ld	bc,0E201h	; address or value?
	call	WRTVDP
	call	CLRSPR
	
; color 15, 0, 1
	ld	a,0Fh
	ld	b,00h
	ld	c,01h
	call	COLOR_A_B_C
	
; init font
	call	INIT_FONT
	
; init sprites
	ld	a,00h
	ld	de,DATA_SPRTBL + 0 * 32
	call	INIT_SPRTBL
	ld	a,01h
	ld	de,DATA_SPRTBL + 1 * 32
	call	INIT_SPRTBL
	ld	a,02h
	ld	de,DATA_SPRTBL + 2 * 32
	call	INIT_SPRTBL
	ld	a,03h
	ld	de,DATA_SPRTBL + 3 * 32
	call	INIT_SPRTBL
	ld	a,04h
	ld	de,DATA_SPRTBL + 4 * 32
	call	INIT_SPRTBL
	ld	a,05h
	ld	de,DATA_SPRTBL + 5 * 32
	call	INIT_SPRTBL
	ld	a,06h
	ld	de,DATA_SPRTBL + 6 * 32
	call	INIT_SPRTBL
	ld	a,07h
	ld	de,DATA_SPRTBL + 7 * 32
	call	INIT_SPRTBL
	ld	a,08h
	ld	de,DATA_SPRTBL + 8 * 32
	call	INIT_SPRTBL
	ld	a,09h
	ld	de,DATA_SPRTBL + 9 * 32
	call	INIT_SPRTBL
	ld	a,0Ah
	ld	de,DATA_SPRTBL + 10 * 32
	call	INIT_SPRTBL
	ld	a,0Bh
	ld	de,DATA_SPRTBL + 11 * 32
	call	INIT_SPRTBL
	ld	a,0Ch
	ld	de,DATA_SPRTBL + 12 * 32
	call	INIT_SPRTBL
	ld	a,0Dh
	ld	de,DATA_SPRTBL + 13 * 32
	call	INIT_SPRTBL
	ld	a,0Eh
	ld	de,DATA_SPRTBL + 14 * 32
	call	INIT_SPRTBL
	ld	a,0Fh
	ld	de,DATA_SPRTBL + 15 * 32
	call	INIT_SPRTBL
	ld	a,10h
	ld	de,DATA_SPRTBL + 16 * 32
	call	INIT_SPRTBL
	ld	a,11h
	ld	de,DATA_SPRTBL + 17 * 32
	call	INIT_SPRTBL
	ld	a,12h
	ld	de,DATA_SPRTBL + 19 * 32 ; !!!
	call	INIT_SPRTBL
	ld	a,13h
	ld	de,DATA_SPRTBL + 20 * 32
	call	INIT_SPRTBL
	ld	a,14h
	ld	de,DATA_SPRTBL + 21 * 32
	call	INIT_SPRTBL
	ld	a,15h
	ld	de,DATA_SPRTBL + 22 * 32
	call	INIT_SPRTBL
	ld	a,16h
	ld	de,DATA_SPRTBL + 23 * 32
	call	INIT_SPRTBL
	ld	a,17h
	ld	de,DATA_SPRTBL + 24 * 32
	call	INIT_SPRTBL
	ld	a,18h
	ld	de,DATA_SPRTBL + 25 * 32
	call	INIT_SPRTBL
	ld	a,19h
	ld	de,DATA_SPRTBL + 26 * 32
	call	INIT_SPRTBL
	ld	a,1Ah
	ld	de,DATA_SPRTBL + 27 * 32
	call	INIT_SPRTBL
	ld	a,1Bh
	ld	de,DATA_SPRTBL + 28 * 32
	call	INIT_SPRTBL
	ld	a,1Ch
	ld	de,DATA_SPRTBL + 29 * 32
	call	INIT_SPRTBL
	ld	a,1Dh
	ld	de,DATA_SPRTBL + 30 * 32
	call	INIT_SPRTBL
	ld	a,1Eh
	ld	de,DATA_SPRTBL + 31 * 32
	call	INIT_SPRTBL
	ld	a,1Fh
	ld	de,DATA_SPRTBL + 32 * 32
	call	INIT_SPRTBL
	ld	a,20h
	ld	de,DATA_SPRTBL + 33 * 32
	call	INIT_SPRTBL
	ld	a,21h
	ld	de,DATA_SPRTBL + 34 * 32
	call	INIT_SPRTBL
	ld	a,22h
	ld	de,DATA_SPRTBL + 35 * 32
	call	INIT_SPRTBL
	ld	a,23h
	ld	de,DATA_SPRTBL + 36 * 32
	call	INIT_SPRTBL
	ld	a,24h
	ld	de,DATA_SPRTBL + 37 * 32
	call	INIT_SPRTBL
	
; Init 2x2 blocks CHRTBL/CLRTBL
	ld	a,30h		; '0'
	ld	de,DATA_CHARSET_4x + 0 * 64
	call	INIT_4xCXRTBL
	ld	a,34h ; ($34 = box)
	ld	de,DATA_CHARSET_4x + 1 * 64
	call	INIT_4xCXRTBL
	ld	a,38h		; '8'
	ld	de,DATA_CHARSET_4x + 2 * 64
	call	INIT_4xCXRTBL
	ld	a,3Ch		; '<'
	ld	de,DATA_CHARSET_4x + 3 * 64
	call	INIT_4xCXRTBL
	ld	a,4Ch		; 'L'
	ld	de,DATA_CHARSET_4x + 4 * 64
	call	INIT_4xCXRTBL
	ld	a,50h		; 'P'
	ld	de,DATA_CHARSET_4x + 5 * 64
	call	INIT_4xCXRTBL
	ld	a,54h		; 'T'
	ld	de,DATA_CHARSET_4x + 6 * 64
	call	INIT_4xCXRTBL
	ld	a,58h		; 'X'
	ld	de,DATA_CHARSET_4x + 7 * 64
	call	INIT_4xCXRTBL
	
; Init other CHRTBL/CLRTBL
	ld	a,60h		; '`'
	ld	de,DATA_CHARSET_1x + 0 * 16
	call	INIT_1xCXRTBL
	ld	a,61h		; 'a'
	ld	de,DATA_CHARSET_1x + 2 * 16 ; !!!
	call	INIT_1xCXRTBL
	ld	a,62h ; ($62 = sphynx room)
	ld	de,DATA_CHARSET_1x + 3 * 16
	call	INIT_1xCXRTBL
	ld	a,63h ; ($63 = non visited room)
	ld	de,DATA_CHARSET_1x + 4 * 16
	call	INIT_1xCXRTBL
	ld	a,64h ; ($64 = current room)
	ld	de,DATA_CHARSET_1x + 5 * 16
	call	INIT_1xCXRTBL
	ld	a,0FFh
	ld	de,DATA_CHARSET_1x + 1 * 16 ; !!!
	call	INIT_1xCXRTBL
	
	ld	hl,LITERAL.MSX
	ld	de,080Dh
	ld	b,03h
	call	WRTVRM_CHARS
	
; Init on-screen texts
	ld	hl,LITERAL.PYRAMID_WARP
	ld	de,0A09h
	ld	b,0Ch
	call	WRTVRM_CHARS
	ld	hl,LITERAL.COPYRIGHT
	ld	de,0C05h
	ld	b,14h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.HIT_SPACE_KEY
	ld	de,1008h
	ld	b,0Dh
	call	WRTVRM_CHARS

; Waits for trigger
.L81EC: call	GTTRIG_ANY
	or	a
	jr	nz,NEW_GAME_ONCE
	
; Increases counter
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
; Blinks text
	ld	hl,LITERAL.HIT_SPACE_KEY
	and	80h
	jr	z,.L8203
	ld	hl,LITERAL.BLANK_x21
.L8203: ld	de,1008h
	ld	b,0Dh
	call	WRTVRM_CHARS
	jr	.L81EC
; -----------------------------------------------------------------------------

	; Referenced from 81F0

; -----------------------------------------------------------------------------
NEW_GAME_ONCE:
; color ,,4
L820D:	ld	c,07h
	ld	b,04h
	call	WRTVDP
	
; Score, high score = 0
	xor	a
	ld	bc,0000h
	ld	(game.high_score_bcd),a
	ld	(game.high_score_bcd +1),bc
	ld	(game.score_bcd),a
	ld	(game.score_bcd +1),bc
	
; Prints HUD
	ld	hl,LITERAL.DASHES
	ld	de,0019h
	ld	b,07h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.PYRAMID
	ld	de,0119h
	ld	b,07h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.DASHES
	ld	de,0219h
	ld	b,07h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.TnESOFT
	ld	de,0419h
	ld	b,07h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.Y1983
	ld	de,051Bh
	ld	b,04h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.HIGH
	ld	de,0719h
	ld	b,04h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.SCORE
	ld	de,0A19h
	ld	b,05h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.ROOM
	ld	de,1019h
	ld	b,04h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.AIR
	ld	de,0D19h
	ld	b,03h
	call	WRTVRM_CHARS

	; Referenced from 829E

; Fills in playground
	ld	hl,LITERAL.WALL_x25
	ld	de,0001h
	ld	b,18h
	ld	c,18h
.L8293: push	hl
	push	de
	push	bc
	call	WRTVRM_CHARS
	pop	bc
	pop	de
	pop	hl
	inc	d
	dec	c
	jr	nz,.L8293
	
; Sprite colors
	ld	a,0Fh
	ld	(skull.spratr_color),a
	ld	(bullet.spratr_color),a
	ld	a,09h
	ld	(scorpion1.spratr_color),a
	ld	(scorpion2.spratr_color),a
	ld	a,01h
	ld	(bat1.spratr_color),a
	ld	(bat2.spratr_color),a
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8E07
	; --- START PROC L82B8 ---

; -----------------------------------------------------------------------------
NEW_GAME:
; Erases lives
L82B8:	ld	b,06h
	ld	de,1719h
	ld	hl,LITERAL.BLANK_x6
	call	WRTVRM_CHARS
; Five lives
	ld	a,05h
	ld	(game.lives),a
; Draws lives in screen
	ld	b,a
	ld	de,1719h
	ld	hl,LITERAL.LIVES_x6
	call	WRTVRM_CHARS
; First pyramid (extra time)
	xor	a
	ld	(game.first_pyramid),a
; Score to 0 (and prints score)
	xor	a
	ld	bc,0000h
	ld	(game.score_bcd),a
	ld	(game.score_bcd +1),bc
	ld	de,0B19h
	call	PRINT_SCORE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8B66
	; --- START PROC L82E7 ---

; -----------------------------------------------------------------------------
NEW_PYRAMID:
; Room 0
L82E7:	xor	a
	ld	(pyramid.room_index),a
	
; Chooses a random first floor
	call	RANDOMIZE
	and	03h
	inc	a
	ld	b,a ; b = 1..4
	ld	hl,DATA_RANDOMIZE_PYRAMID_FLOOR1 -7
	ld	de,0007h ; 7 rooms
.L82F8: add	hl,de
	djnz	.L82F8
; Copies the random first floor
	ld	b,07h ; 7 rooms
	ld	ix,pyramid.room_array
.L8301:	ld	a,(hl)
	inc	hl
	ld	(ix+00h),a
	inc	ix
	djnz	.L8301
; Chooses a random second floor
	call	RANDOMIZE
	and	03h
	inc	a
	ld	hl,DATA_RANDOMIZE_PYRAMID_FLOOR2 -5
	ld	de,0005h ; 5 rooms
	ld	b,a ; b = 1..4
.L8317:	add	hl,de
	djnz	.L8317
; Copies the random first floor
	ld	b,05h ; 5 rooms
.L831C:	ld	a,(hl)
	inc	hl
	ld	(ix+00h),a
	inc	ix
	djnz	.L831C
; Chooses a random third floor
	call	RANDOMIZE
	and	03h
	inc	a
	ld	hl,DATA_RANDOMIZE_PYRAMID_FLOOR3 -3
	ld	de,0003h ; 3 rooms
	ld	b,a ; b = 1..4
.L8332:	add	hl,de
	djnz	.L8332
; Copies the random third floor
	ld	b,03h ; 3 rooms
.L8337:	ld	a,(hl)
	inc	hl
	ld	(ix+00h),a
	inc	ix
	djnz	.L8337
; Sets the sphynx room in the fourth floor
	ld	a,10h
	ld	(ix+00h),a
	
; Prints the pyramid in the HUD
	ld	hl,LITERAL.ROOMS_x7
	ld	de,1519h
	ld	b,07h ; 7 rooms
.L834D:	push	hl
	push	de
	push	bc
	call	WRTVRM_CHARS
	pop	bc
	pop	de
	pop	hl
	inc	e ; destination += (+1, 1)
	dec	d
	dec	b ; length -= 2
	dec	b
	ld	a,01h ; if more than one room, loops
	cp	b
	jr	nz,.L834D
; Prints the sphynx room
	ld	de,121Ch	; address or value?
	ld	a,62h ; ($62 = sphynx room)
	call	WRTVRM_1x1_CHAR
	
; Plays "Start game" music
	call	L8F14
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8DD5
	; --- START PROC L836A ---

; -----------------------------------------------------------------------------
DEC_LIVES_AND_NEW_ROOM:
; Clear lives
L836A:	ld	b,05h
	ld	hl,LITERAL.BLANK_x6
	ld	de,1719h	; address or value?
	call	WRTVRM_CHARS
; Decreases lives
	ld	a,(game.lives)
	dec	a
	ld	(game.lives),a
; If no lives, go to GAME OVER
	jp	m,GAME_OVER
; Prints lives
	or	a
	jr	z,NEW_ROOM ; (no lives to print)
	ld	b,a
	ld	de,1719h
	ld	hl,LITERAL.LIVES_x6
	call	WRTVRM_CHARS
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8380, 89DE
	; --- START PROC L838C ---
	
; -----------------------------------------------------------------------------
NEW_ROOM:
; Print score and updates high score
L838C:	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

; Hides the sprites (one by one)
	ld	b,00h ; 256 sprites (!?)
	ld	hl,SPRATR
.L8394:	ld	a,SPAT_OB
	call	WRTVRM
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	djnz	.L8394
	
; Reads the current room index
	ld	a,(pyramid.room_index)
	ld	hl,0C087h	; address or value?
	call	ADD_HL_A
	ld	a,(hl)
	ld	(game.current_room),a
	
; Points to the correct map position
	ld	de,1518h	; address or value?
; a < 8?
	cp	08h
	jr	c,.L83C7 ; yes
; no: (+1, -1)
	inc	e
	dec	d
; a-7 < 6?
	sub	07h
	cp	06h
	jr	c,.L83C7 ; yes
; no: (+1, -1)
	inc	e
	dec	d
; a-7-5 < 4?
	sub	05h
	cp	04h
	jr	c,.L83C7 ; yes
; no: (+1, -1)
	inc	e
	dec	d
	sub	03h
.L83C7:	add	a,e
	ld	e,a
; Saves the NAMTBL pointer of the current room
	ld	(pyramid.room_namtbl_ptr),de
	
; Prints the room number
	ld	a,(game.current_room)
	add	a,00h
	daa
	rra
	rra
	rra
	rra
	and	0Fh
	ld	de,101Dh
	call	WRTVRM_1x1_CHAR
; Prints the room number (units)
	ld	a,(game.current_room)
	add	a,00h
	daa
	and	0Fh
	ld	de,101Eh
	call	WRTVRM_1x1_CHAR
	
; Points to the right room data
	ld	hl,DATA_ROOMS - $0022
	ld	de,0022h	; address or value?
	ld	a,(game.current_room)
	ld	b,a
.L83F7:	add	hl,de
	djnz	.L83F7

; Prints the room

; param hl: room data pointer
	xor	a
	ld	(aux.frame_counter_2),a
; For each row
.L83FE:	xor	a ; (for the character counter)
; Reads first two bytes in BC
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
; For each character
.L8403:	sla	b ; rotates BC to left (first bit to carry)
	rl	c
; (preserves everything)
	push	hl
	push	bc
	push	af
; carry?
	jr	nc,.L841C ; no carry
; yes: e = 2*a (x)
	inc	a
	add	a,a
	ld	e,a
; d = 2*aux (y)
	ld	a,(aux.frame_counter_2)
	add	a,a
	inc	a
	ld	d,a
; Prints wall
	ld	a,30h		; '0'
	call	WRTVRM_2x2_CHAR
	jr	.L8428

; no carry: e = 2*a (x)
.L841C:	inc	a
	add	a,a
	ld	e,a
; d = 2*aux (y)
	ld	a,(aux.frame_counter_2)
	add	a,a
	inc	a
	ld	d,a
; Prints blank space
	call	WRTVRM_2x2_BLANK

; (restores everything)
.L8428:	pop	af
	pop	bc
	pop	hl
; Next character (up to 11)
	inc	a
	cp	0Bh
	jr	nz,.L8403
; Next row (up to 11)
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
	cp	0Bh
	jr	nz,.L83FE
	
; Initializes game vars

	xor	a
	ld	(skull.status),a
	ld	(scorpion1.status),a
	ld	(scorpion2.status),a
	ld	(bat1.status),a
	ld	(bat2.status),a
	ld	(0C03Bh),a
	ld	(0C053h),a
	ld	(bullet.status),a
	ld	(aux.frame_counter),a
	ld	(exit.is_open),a
	ld	(exit.blink_flag),a
	ld	(0C06Dh),a
	ld	(player_has_gun),a
	ld	a,01h
	ld	(new_player_direction),a
	ld	a,12h
	ld	(0C02Ch),a
	ld	(0C044h),a
	ld	a,14h
	ld	(0C034h),a
	ld	(0C04Ch),a
	ld	a,16h
	ld	(0C03Ch),a
	ld	(0C054h),a
	ld	a,04h
	ld	(0C02Dh),a
	inc	a
	ld	(0C035h),a
	inc	a
	ld	(0C03Dh),a
	inc	a
	ld	(0C045h),a
	inc	a
	ld	(0C04Dh),a
	inc	a
	ld	(0C055h),a
	jr	PRINT_ROOM_DECORATION
; -----------------------------------------------------------------------------

	; Referenced from 85E6, 8634, 8A47
	; --- START PROC L849B ---

; -----------------------------------------------------------------------------
; param hl: game.air_left value
; param de: VRAM destination
PRINT_AIR_LEFT:
; Computes air_left_bcd (first digit)
L849B:	ld	bc,03E8h ; 1000
	xor	a
.L849F:	sbc	hl,bc
	inc	a
	jr	nc,.L849F
	add	hl,bc
	dec	a
	ld	(game.air_left_bcd),a
; (second digit)
	ld	bc,0064h ; 100
	xor	a
.L84AD:	sbc	hl,bc
	inc	a
	jr	nc,.L84AD
	add	hl,bc
	dec	a
	ld	(game.air_left_bcd +1),a
; (third digit)
	ld	bc,000Ah ; 10
	xor	a
.L84BB:	sbc	hl,bc
	inc	a
	jr	nc,.L84BB
	add	hl,bc
	dec	a
	ld	(game.air_left_bcd +2),a
; (last digit)
	ld	a,l
	ld	(game.air_left_bcd +3),a
; Prints air left (BCD)
	ld	hl,game.air_left_bcd
	ld	b,04h
	jp	WRTVRM_CHARS
; -----------------------------------------------------------------------------

	; Referenced from 8499
	; --- START PROC L84D1 ---

; -----------------------------------------------------------------------------
PRINT_ROOM_DECORATION:
; param hl: room data pointer (after walls definition)
; Is sphynx room?
L84D1:	ld	a,(game.current_room)
	cp	10h
	jp	z,PRINT_SPHYNX_ROOM_DECORATION ; yes
	
; no: Prints box1 in screen
	ld	ix,box1
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	call	TO_VRAM_COORDINATES
	xor	a
	ld	(ix+00h),a
	push	hl
	ld	a,34h ; ($34 = box)
	call	WRTVRM_2x2_CHAR
	pop	hl
	
; Prints box2 in screen
	ld	ix,box2
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	call	TO_VRAM_COORDINATES
	xor	a
	ld	(ix+00h),a
	push	hl
	ld	a,34h ; ($34 = box)
	call	WRTVRM_2x2_CHAR
	pop	hl
	
; Prints box3 in screen
	ld	ix,box3
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	call	TO_VRAM_COORDINATES
	xor	a
	ld	(ix+00h),a
	push	hl
	ld	a,34h ; ($34 = box)
	call	WRTVRM_2x2_CHAR
	pop	hl
	
; Prints nest in screen
	ld	ix,nest
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	call	TO_VRAM_COORDINATES
	push	hl
	ld	a,54h		; 'T'
	call	WRTVRM_2x2_CHAR
	pop	hl
	
; Prints door1 in screen
	ld	ix,door1
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,00h ; b = 0 = door down (v)
; Is the upper bit set?
	ld	a,e ; (preserves e)
	and	7Fh
	cp	e
	jr	z,.L853E ; no
; yes
	inc	b ; b = 1 = door up (^)
; saves door type
.L853E: ld	(ix+00h),b
	inc	ix
; saves door coordinates
	ld	e,a
	call	TO_VRAM_COORDINATES
	inc	ix
; saves door color
	ld	a,03h
	ld	(ix+00h),a
; saves door1 pattern based on b
	push	hl
	ld	a,b
	add	a,a
	add	a,18h
	add	a,a
	add	a,a
	ld	(door1.spratr_pat),a
	ld	de,door1.spratr_y
	ld	a,00h
	call	PUT_SPRITE
	pop	hl

; Prints door2 in screen
	ld	ix,door2
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,00h ; b = 0 = door down (v)
; Is the upper bit set?
	ld	a,e ; (preserves e)
	and	7Fh
	cp	e
	jr	z,.L8572 ; no
; yes
	inc	b ; b = 1 = door up (^)
; saves door type
.L8572:	ld	(ix+00h),b
	inc	ix
; saves door coordinates
	ld	e,a
	call	TO_VRAM_COORDINATES
	inc	ix
; saves door color
	ld	a,03h
	ld	(ix+00h),a
; saves door2 pattern based on b
	ld	a,b
	add	a,a
	add	a,18h
	add	a,a
	add	a,a
	ld	(door2.spratr_pat),a
	ld	de,door2.spratr_y
	ld	a,01h
	call	PUT_SPRITE
	
; Prints exit zone
	ld	a,4Ch		; 'L'
	ld	de,090Ah	; address or value?
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
; (+2,+0)
	inc	e
	inc	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
; (+2,+0)
	inc	e
	inc	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
; (+0,+4)
	inc	d
	inc	d
	inc	d
	inc	d
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
; (-2,+0)
	dec	e
	dec	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
; (-2,+0)
	dec	e
	dec	e
	call	WRTVRM_2x2_CHAR
	jr	INIT_GAME_LOOP_NO_SPHYNX
; -----------------------------------------------------------------------------

	; Referenced from 84D6
	
; -----------------------------------------------------------------------------
PRINT_SPHYNX_ROOM_DECORATION:
; Prints single box
L85CC:	ld	de,0B0Ch	; address or value?
	ld	a,34h ; ($34 = box)
	call	WRTVRM_2x2_CHAR
; Prints air value
	ld	hl,0BB8h ; 3000
	ld	a,(game.first_pyramid)
	or	a
	jr	z,.L85E0
	ld	hl,07D0h ; 2000
.L85E0:	ld	(game.air_left),hl
	ld	de,0E19h
	call	PRINT_AIR_LEFT
; Prints...
	ld	a,06h
	ld	de,101Eh	; address or value?
	call	WRTVRM_1x1_CHAR
; Do not use doors
	xor	a
	ld	(door1.spratr_y),a
	ld	(door2.spratr_y),a
; Player initial position
	ld	hl,player.spratr_y
	ld	a,98h
	ld	(hl),a
	inc	hl ; player.spratr_x
	ld	a,60h
; ...
	jr	INIT_GAME_LOOP
; -----------------------------------------------------------------------------

	; Referenced from 84E1, 84F7, 850D, 8523, 8544, 8578
	; --- START PROC L8603 ---
	
; -----------------------------------------------------------------------------
; Translates logical coordinates into NAMTBL and SPRATR coordinates
; param ix: SPRATR buffer pointer
; param de: logical coordinates (0..10)
; return [ix  ]: SPRATR y (16d+8)
; return [ix+1]: SPRATR x (16e+16)
; return ix:	ix+2
; return de:	NAMTBL yx (d=2d+1, e=2e+2)
TO_VRAM_COORDINATES:
; [ix++] = 16d+8
L8603:	ld	a,d
	add	a,a
	inc	a
	add	a,a
	add	a,a
	add	a,a
	ld	(ix+00h),a
	inc	ix
; d = 2d+1
	ld	a,d
	add	a,a
	inc	a
	ld	d,a
; [ix++] = 16e+16 
	ld	a,e
	inc	a
	add	a,a
	add	a,a
	add	a,a
	add	a,a
	ld	(ix+00h),a
	inc	ix
; e = 2e+2
	ld	a,e
	inc	a
	add	a,a
	ld	e,a
	ret
; -----------------------------------------------------------------------------

	; Referenced from 85CA
	; --- START PROC L8622 ---

; -----------------------------------------------------------------------------
INIT_GAME_LOOP_NO_SPHYNX:
; Initializes air_left (fisrt_pyramid ? 3000 : 2000)
L8622:	ld	hl,0BB8h ; 3000
	ld	a,(game.first_pyramid)
	or	a
	jr	z,.L862E
	ld	hl,07D0h ; 2000
.L862E:	ld	(game.air_left),hl
	ld	de,0E19h	; address or value?
	call	PRINT_AIR_LEFT
; Initial player coordinates	
	ld	hl,player.spratr_y
	ld	a,58h		; 'X'
	ld	(hl),a
	inc	hl
	ld	a,60h		; '`'
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8601
	; --- START PROC L8640 ---

; -----------------------------------------------------------------------------
; param hl: player.spratr_x
; param a: value for player.spratr_x
INIT_GAME_LOOP:
L8640:	ld	(hl),a
; Sets player pattern
	inc	hl
	ld	a,04h
	ld	(hl),a
; Sets player color
	inc	hl
	ld	a,0Bh
	ld	(hl),a
; Sets player direction
	inc	hl
	ld	a,01h
	ld	(hl),a
; Put player sprite
	ld	de,player.spratr_y
	ld	a,02h
	call	PUT_SPRITE
	
; Initializes the box contents
	ld	hl,DATA_RANDOMIZE_BOX_CONTENTS
	call	RANDOMIZE
	and	03h
	dec	a
	jr	z,.L8665
	dec	a
	jr	z,.L8664
	inc	hl
.L8664:	inc	hl
.L8665:	ld	a,(hl)
	inc	hl
	ld	(box1.content),a
	ld	a,(hl)
	inc	hl
	ld	(box2.content),a
	ld	a,(hl)
	ld	(box3.content),a

; Initial pause
	ld	b,0Ah
	; Referenced from 867A
.L8675:	push	bc
	call	LONG_DELAY
	pop	bc
	djnz	.L8675
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8AB4
	; --- START PROC L867C ---
	
; -----------------------------------------------------------------------------
GAME_LOOP:
; Configures game speed according air left
L867C:	ld	hl,(game.air_left)
	ld	a,40h ; speed = 40
	ld	de,03E8h ; 1000
	sbc	hl,de
	jr	c,.L8691 ; air left < 1000
	add	a,60h ; speed += 60
	or	a
	sbc	hl,de
	jr	c,.L8691 ; air left < 2000
	add	a,60h ; speed += 60
.L8691: ld	(game.short_delay),a
; Next frame
	ld	a,(aux.frame_counter)
	inc	a
	ld	(aux.frame_counter),a
	call	SHORT_DELAY
	
; Each 4 frames, blinks the current room
	ld	de,(pyramid.room_namtbl_ptr)
	ld	b,63h ; ($63 = non visited room)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L86AC
	inc	b ; ($64 = current room)
.L86AC:	ld	a,b
	call	WRTVRM_1x1_CHAR
	
; Sets flag to check wall for player
	ld	a,0FFh
	ld	(check_wall_for_player),a
; Checks walls for player
	ld	hl,player.spratr_y
	ld	d,(hl)
	inc	hl ; player.spratr_x
	ld	e,(hl)
	call	CHECK_ALL_WALLS
; Resets flag to check wall for player
	xor	a
	ld	(check_wall_for_player),a
	
; Reads input
	call	GTSTCK_ANY
	or	a
	jr	z,.L86D1 ; no input
; Input: translates to direction values
	dec	a	; 0..7
	srl	a	; 0..3
	inc	a	; 1..4
	and	03h	; 0..3
	ld	(new_player_direction),a
; Checks if the player can walk in the new direction
.L86D1:	ld	a,(new_player_direction)
	ld	hl,direction_table
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	jr	z,.L86E4 ; no
; yes: stores the new direction
	ld	a,(new_player_direction)
	ld	(player.direction),a

; Checks if the player can walk in the current direction
.L86E4:	ld	a,(player.direction)
	ld	hl,direction_table
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	jr	z,.L86F3 ; no:  a = 0
	ld	a,02h	 ; yes: a = 2

; Updates player coordinates
.L86F3:	ld	b,a
	ld	a,(player.direction)
	ld	c,a ; direction in c
	ld	a,b ; displacement in b
	ld	hl,player.spratr_y
	srl	c
	jr	c,.L8701
	inc	hl ; player.spratr_x
.L8701:	srl	c
	jr	c,.L8707
	neg
.L8707:	add	a,(hl)
	ld	(hl),a
	
; Checks entering door conditions
	xor	a
	ld	(player_entering_door),a ; (not entering)
; Compares coordinates with door1
	ld	hl,player.spratr_y
	ld	a,(door1.spratr_y)
	cp	(hl)
	jr	nz,.L873B ; not the same
	inc	hl ; player.spratr_x
	ld	a,(door1.spratr_x)
	cp	(hl)
	jr	nz,.L873B ; not the same
; yes
	call	PLAY_SOUND_DOOR
; Sets the door2 coordinates to the player
	ld	hl,(door2.spratr_y)
	ld	(player.spratr_y),hl
; Sets the player direction
	ld	a,(door2.type)
	add	a,a
	ld	b,a
	ld	a,01h
	add	a,b
	ld	(player.direction),a
	ld	(new_player_direction),a
; Sets the flag about the player entering a door
	ld	a,0FFh
	ld	(player_entering_door),a ; (entering)
; Skips the checks with the other door
	jr	GAME_LOOP.DOORS_OK

; Compares coordinates with door2
.L873B:	ld	hl,player.spratr_y
	ld	a,(door2.spratr_y)
	cp	(hl)
	jr	nz,GAME_LOOP.DOORS_OK ; not the same
	inc	hl ; player.spratr_x
	ld	a,(door2.spratr_x)
	cp	(hl)
	jr	nz,GAME_LOOP.DOORS_OK ; not the same
; yes
	call	PLAY_SOUND_DOOR
; Sets the door1 coordinates to the player
	ld	hl,(door1.spratr_y)
	ld	(player.spratr_y),hl
; Sets the player direction
	ld	a,(door1.type)
	add	a,a
	ld	b,a
	ld	a,01h
	add	a,b
	ld	(player.direction),a
	ld	(new_player_direction),a
; Sets the flag about the player entering a door
	ld	a,0FFh
	ld	(player_entering_door),a
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
GAME_LOOP.DOORS_OK:
	; Referenced from 8739, 8742, 8749
L8767:	ld	a,(player.direction)
	ld	b,a ; b = 0..3
	ld	a,(player_has_gun) ; b += 0/8
	add	a,b
	ld	b,a
; Animates the player sprite each two frames (b += 0/4)
	ld	a,(aux.frame_counter)
	and	02h
	jr	z,.L877B
	ld	a,04h
	add	a,b
	ld	b,a
; Computes and sets the sprite pattern (a *= 4)
.L877B:	ld	a,b
	add	a,a
	add	a,a
	ld	(player.spratr_pat),a
; Computes and sets the sprite color
	ld	b,0Bh ; yellow (without gun)
	ld	a,(player_has_gun)
	or	a
	jr	z,.L878B
	ld	b,0Fh ; white (with gun)
.L878B:	ld	a,b
	ld	(player.spratr_color),a
; Prints the player sprite	
	ld	de,player.spratr_y
	ld	a,02h
	call	PUT_SPRITE
	
; If not through a door, plays ingame "music"
	ld	a,(player_entering_door)
	or	a
	call	z,PLAY_SOUND_INGAME
	
; Carrying gun...
	ld	a,(player_has_gun)
	or	a
	jr	z,GAME_LOOP.GUN_OK ; no gun
; ...and bullet not already shot...
	ld	a,(bullet.status)
	or	a
	jr	nz,GAME_LOOP.GUN_OK ; bullet already shot
; ...and trigger?
	call	GTTRIG_ANY
	or	a
	jr	z,GAME_LOOP.GUN_OK ; no trigger
; Copies player coordinates into the bullet
	ld	ix,player
	ld	iy,bullet
	ld	a,(ix+00h) ; (y+7 for centering the bullet)
	add	a,07h
	ld	(iy+00h),a
	ld	a,(ix+01h) ; (x+7 for centering the bullet)
	add	a,07h
	ld	(iy+01h),a
	ld	a,70h ; bullet pattern
	ld	(iy+02h),a
	ld	a,0Fh; bullet color
	ld	(iy+03h),a
	ld	a,(ix+04h) ; direction
	ld	(iy+04h),a
	ld	a,0FFh ; bullet status active
	ld	(iy+05h),a
; Put bullet sprite
	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
	call	PLAY_SOUND_BULLET
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
GAME_LOOP.GUN_OK:
L87E8:	call	SHORT_DELAY

; Is the skull active?
	ld	a,(skull.status)
	or	a
	jp	z,GAME_LOOP.SKULL_OK ; no
	
; Reads skull coordinates in de
	ld	hl,skull.spratr_y
	ld	d,(hl)
	inc	hl ; skull,spratr_x
	ld	e,(hl)
; Checks available directions
	call	CHECK_ALL_WALLS
	ld	hl,direction_table
	ld	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
; Only one direction available?
	inc	a ; $ff +1 = $00
	jr	z,.L8815 ; yes
; no: avoids moving back faking a wall in the incoming direction
	ld	hl,direction_table
	ld	a,(skull.direction)
	xor	02h ; (reverses direction)
	call	ADD_HL_A
	xor	a
	ld	(hl),a ; (fakes the wall)
; Compares player and skull coordinates
.L8815:	ld	a,(player.spratr_x)
	ld	b,a
	ld	a,(skull.spratr_x)
	srl	a
	srl	b
	ld	c,02h ; c = 2
	cp	b
	jr	z,.L8867 ; same X coordinate
	jr	nc,.L8828 ; skull.x > player.x
	inc	c ; if (skull.x < player.x) c = 3
.L8828:	ld	a,(player.spratr_y)
	ld	b,a
	ld	a,(skull.spratr_y)
	srl	a
	srl	b
	cp	b
	jr	z,.L8898 ; same Y coordinate
	jr	nc,.L883A ; skull.y > player.y
	inc	c ; c += 2
	inc	c
.L883A:	dec	c ; c -= 2
	dec	c
; Determines skull behaviour
	jr	z,.L884E ; c = 0
	dec	c
	jr	z,.L8849 ; c = 1
	dec	c
	jr	z,.L8853 ; c = 2
; player is down and right
	ld	a,03h ; down
	call	MOVE_SKULL
; player is up and right
.L8849:	ld	a,02h ; right
	call	MOVE_SKULL
; player is up and left
.L884E:	ld	a,01h ; up
	call	MOVE_SKULL
; player is down and left
.L8853:	ld	a,00h ; left
	call	MOVE_SKULL
	ld	a,03h ; down
	call	MOVE_SKULL
	ld	a,02h ; right
	call	MOVE_SKULL
	ld	a,01h ; up
	call	MOVE_SKULL
	; (control never reaches here)

; Player is at the same X
; Compares player and skull Y coordinates
.L8867:	ld	a,(player.spratr_y)
	ld	b,a
	ld	a,(skull.spratr_y)
	srl	a
	srl	b
	cp	b
	jr	nc,.L8884 ; skull.y > player.y
; player is down
	ld	a,03h ; down
	call	MOVE_SKULL
	ld	a,00h ; left
	call	MOVE_SKULL
	ld	a,02h ; right
	call	MOVE_SKULL
; player is up
.L8884:	ld	a,01h ; up
	call	MOVE_SKULL
	ld	a,00h ; left
	call	MOVE_SKULL
	ld	a,02h ; right
	call	MOVE_SKULL
	ld	a,03h ; down
	call	MOVE_SKULL
	; (control never reaches here)

; Player is at the same Y
; Compares player and skull X coordinates
.L8898:	ld	a,(player.spratr_x)
	ld	b,a
	ld	a,(skull.spratr_x)
	srl	a
	srl	b
	cp	b
	jr	c,.L88B5 ; skull.x > player.x
; player is to the left
	ld	a,00h ; left
	call	MOVE_SKULL
	ld	a,01h ; up
	call	MOVE_SKULL
	ld	a,03h ; down
	call	MOVE_SKULL
; player is to the right
.L88B5:	ld	a,02h ; right
	call	MOVE_SKULL
	ld	a,01h ; up
	call	MOVE_SKULL
	ld	a,03h ; down
	call	MOVE_SKULL
	ld	a,00h ; left
	call	MOVE_SKULL
	; (control never reaches here)
; -----------------------------------------------------------------------------

	; Referenced from 8846, 884B, 8850, 8855, 885A, 885F, 8864, 8877, 887C, 8881, 8886, 888B, 8890, 8895, 88A8, 88AD, 88B2, 88B7, 88BC, 88C1, 88C6
	; --- START PROC L88C9 ---
	
; -----------------------------------------------------------------------------
; param a: direction to try (0..3 = left, up, right, down)
; ret: if the skull could not be moved in that direction
; continues below: if the skull was moved
MOVE_SKULL:
; Wall in that direction?
L88C9:	ld	hl,direction_table
	ld	b,a
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	ret	z; yes
; no: sets the skull direction
	ld	a,b
	ld	(skull.direction),a
; (no ret)
	pop	hl
; Moves the skull
	ld	hl,skull.spratr_y
	ld	a,02h ; (two pixels)
	srl	b
	jr	c,.L88E2
	inc	hl ; skull.spratrxz
.L88E2:	srl	b
	jr	c,.L88E8
	neg
.L88E8:	add	a,(hl)
	ld	(hl),a
; Animates the skull each two frames
	ld	a,(aux.frame_counter)
	and	02h
	ld	a,10h
	jr	z,.L88F4
	inc	a
; (computes skull pattern)
.L88F4:	add	a,a
	add	a,a
	ld	(skull.spratr_pat),a
; Puts the skull sprite
	ld	a,03h
	ld	de,skull
	call	PUT_SPRITE
; 
	ld	ix,skull
	call	L8DAC
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 87EF
	; --- START PROC L8908 ---

; -----------------------------------------------------------------------------
GAME_LOOP.SKULL_OK:
L8908:	call	SHORT_DELAY
; Is bullet shot?
	ld	a,(bullet.status)
	or	a
	jr	z,GAME_LOOP.BULLET_OK ; no
	inc	a
	jr	nz,GAME_LOOP.BULLET_OK ; no (?)
; Updates bullet coordinates
	ld	a,(bullet.direction)
	ld	b,a
	ld	a,04h ; (4 pixels)
	ld	hl,bullet.spratr_y
	srl	b
	jr	c,.L8922
	inc	hl ; bullet.spratr_x
.L8922:	srl	b
	jr	c,.L8928
	neg
.L8928:	add	a,(hl)
	ld	(hl),a
; Animates the bullet each eight frames
	ld	a,(aux.frame_counter)
	and	08h
	ld	a,1Ch
	jr	z,.L8934
	inc	a
; (computes bullet pattern)
.L8934:	add	a,a
	add	a,a
	ld	(bullet.spratr_pat),a
; Checks if the bullet has hit a wall
	ld	hl,bullet.spratr_y
	ld	d,(hl)
	inc	hl ; bullet.spratr_x
	ld	e,(hl)
	call	CHECK_WALL
	or	a
	jr	nz,.L8961 ; no
; yes: uses explosion sprite
	ld	hl,bullet.spratr_y
	ld	a,(hl)
	sub	07h ; (aligns the explosion sprite)
	ld	(hl),a
	inc	hl ; bullet.spratr_x
	ld	a,(hl)
	sub	07h ; (aligns the explosion sprite)
	ld	(hl),a
	inc	hl ; bullet.spratr_pat
	ld	a,78h
	ld	(hl),a
	inc	hl ; bullet.spratr_color
	ld	a,06h
	ld	(hl),a
	inc	hl ; bullet.direction
	inc	hl ; bullet.status
	ld	a,06h
	ld	(hl),a
; Sound
	call	PLAY_SOUND_BULLET_HIT
; Puts the bullet sprite
.L8961:	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 890F, 8912
	
; -----------------------------------------------------------------------------
GAME_LOOP.BULLET_OK:
L8969:	call	SHORT_DELAY
; Sphynx room?
	ld	a,(game.current_room)
	cp	10h
	jp	z,CHECK_SPHYNX_ROOM_BOX ; yes
; no: updates scorpion1, box1 and bat1
	ld	ix,scorpion1
	call	UPDATE_ENEMY
	ld	ix,box1
	call	UPDATE_BOX
	ld	ix,bat1
	call	UPDATE_ENEMY
; Is the exit open?
	ld	a,(exit.is_open)
	or	a
	jr	z,GAME_LOOP.EXIT_OK ; no
; yes: makes the exit blink
	ld	a,(exit.blink_counter)
	dec	a
	ld	(exit.blink_counter),a
	jr	nz,.L89B4
; (each 10 frames)
	ld	a,0Ah
	ld	(exit.blink_counter),a
	ld	a,(exit.blink_flag)
	cpl
	ld	(exit.blink_flag),a
	ld	de,0B0Ch
	or	a
	jr	z,.L89B1
; (prints the exit)
	ld	a,50h		; 'P'
	call	WRTVRM_2x2_CHAR
	jr	.L89B4
; (clears the exit)
.L89B1:	call	WRTVRM_2x2_BLANK

; Compares player and exit coordinates
.L89B4:	ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
	inc	hl
	ld	a,60h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
; yes: increases room index
	ld	a,(pyramid.room_index)
	inc	a
	ld	(pyramid.room_index),a
; prints the room as visited
	ld	de,(pyramid.room_namtbl_ptr)
	ld	a,61h
	call	WRTVRM_1x1_CHAR
; Plays exit sound
	call	PLAY_SOUND_EXIT
; Scores 500 points
	ld	de,0500h
	call	ADD_SCORE
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
; Starts next room
	jp	NEW_ROOM
; -----------------------------------------------------------------------------

	; Referenced from 898D, 89BA, 89C0
	
; -----------------------------------------------------------------------------
GAME_LOOP.EXIT_OK:
L89E1:	call	SHORT_DELAY
; Updates box2, scorpion2, bat2 and box3
	ld	ix,box2
	call	UPDATE_BOX
	ld	ix,scorpion2
	call	UPDATE_ENEMY
	ld	ix,bat2
	call	UPDATE_ENEMY
	ld	ix,box3
	call	UPDATE_BOX
; Updates bullet explosion
	ld	ix,bullet
	ld	a,(ix+05h) ; bullet.status
	or	a
	jr	z,GAME_LOOP.EVERYTHING_OK ; $00 = no bullet
	inc	a
	jr	z,GAME_LOOP.EVERYTHING_OK ; $ff = bullet flying
; Decreases counter
	dec	a
	dec	a
	ld	(ix+05h),a
; if 0, removes explosion
	jr	z,.L8A2D
; if < 4, makes explosion smaller
	ld	b,1Eh
	cp	04h
	jr	c,.L8A1B
	inc	b
; if < 2, makes explosion smaller
.L8A1B:	cp	02h
	jr	c,.L8A20
	inc	b
; (computes pattern)
.L8A20:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a ; bullet.spratr_pat
	ld	a,06h
	ld	(ix+03h),a ; bullet.spratr_color
	jr	.L8A32

; Removes bullet
.L8A2D:	ld	a,SPAT_OB
	ld	(ix+00h),a

; Puts bullet sprite
.L8A32:	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8A08, 8A0B
	
; -----------------------------------------------------------------------------
GAME_LOOP.EVERYTHING_OK:
L8A3A:	call	SHORT_DELAY
; Decreases air counter
	ld	hl,(game.air_left)
	dec	hl
	ld	(game.air_left),hl
; Updates HUD
	ld	de,0E19h
	call	PRINT_AIR_LEFT
; If air is 0
	ld	hl,(game.air_left)
	ld	a,h
	or	l
	call	z,AIR_OVER
; Animates the enemies nest each four frames
	ld	a,(aux.frame_counter)
	and	04h
	ld	b,54h
	jr	z,.L8A5D
	ld	b,58h
; Prints nest
.L8A5D:	ld	a,(nest.spratr_y)
	srl	a
	srl	a
	srl	a
	ld	d,a
	ld	a,(nest.spratr_x)
	srl	a
	srl	a
	srl	a
	ld	e,a
	ld	a,b
	call	WRTVRM_2x2_CHAR
	
	ld	a,(0C06Dh)
	or	a
	jr	z,L8A8B
	ld	hl,(game.air_left)
	ld	de,(0C079h)
	xor	a
	sbc	hl,de
	jr	nc,L8A88
	dec	a

	; Referenced from 8A85
L8A88:	ld	(exit.is_open),a

	; Referenced from 8A79
L8A8B:	ld	a,(aux.frame_counter)
	and	04h
	jr	z,L8A98
	ld	b,07h
	ld	c,08h
	jr	L8A9C

	; Referenced from 8A90
L8A98:	ld	b,08h
	ld	c,07h

	; Referenced from 8A96
L8A9C:	ld	a,b
	ld	(door1.spratr_color),a
	ld	a,c
	ld	(door2.spratr_color),a
	ld	de,door1.spratr_y
	ld	a,00h
	call	PUT_SPRITE
	ld	de,door2.spratr_y
	ld	a,01h
	call	PUT_SPRITE
	
	; Referenced from 8ABD, 8AC3
L8AB4:	jp	GAME_LOOP
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
	; Referenced from 8971
CHECK_SPHYNX_ROOM_BOX:
; Is the player at ($60,$58)?
L8AB7:	ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,L8AB4 ; no
	inc	hl ; player.spratr_x
	ld	a,60h
	cp	(hl)
	jr	nz,L8AB4 ; no
; yes	
	call	PLAY_SOUND_BOX
; screen ,3
	ld	c,01h
	ld	b,0E3h
	call	WRTVDP
; Prints sphynx sprites	
	ld	de,DATA_SPHYNX_SPRATR + 0 *4
	ld	a,00h
	call	PUT_SPRITE
	ld	de,DATA_SPHYNX_SPRATR + 1 *4
	ld	a,01h
	call	PUT_SPRITE
	ld	de,DATA_SPHYNX_SPRATR + 2 *4
	ld	a,02h
	call	PUT_SPRITE
	ld	de,DATA_SPHYNX_SPRATR + 3 *4
	ld	a,03h
	call	PUT_SPRITE
; Prints the sphynx room in the map
	ld	a,62h ; ($62 = sphynx room)
	ld	de,121Ch	; address or value?
	call	WRTVRM_1x1_CHAR
; color ,,1
	ld	b,01h
	ld	c,07h
	call	WRTVDP
; Sphynx sound	
	call	PLAY_SOUND_SPHYNX
; Increase score
	ld	de,2000h ; 2000 points (BCD)
	call	ADD_SCORE
; Prints literal
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
	ld	de,1206h
	ld	b,0Eh
	ld	hl,LITERAL.CONGRATULATIONS
	call	WRTVRM_CHARS
	ld	hl,LITERAL.TRY_THE_NEXT_PYRAMID
	ld	de,1403h
	ld	b,14h
	call	WRTVRM_CHARS
	ld	hl,LITERAL.HIT_SPACE_KEY
	ld	de,1606h
	ld	b,0Dh
	call	WRTVRM_CHARS

; "HIT SPACE KEY" blinking
.L8B2B:	call	GTTRIG_ANY
	or	a
	jr	nz,.L8B4C
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
	ld	hl,LITERAL.HIT_SPACE_KEY
	and	80h
	jr	z,.L8B42
	ld	hl,LITERAL.BLANK_x21
.L8B42:	ld	de,1606h	; address or value?
	ld	b,0Dh
	call	WRTVRM_CHARS
	jr	.L8B2B

; screen ,2
.L8B4C:	ld	c,01h
	ld	b,0E2h
	call	WRTVDP
; color ,,4
	ld	c,07h
	ld	b,04h
	call	WRTVDP
; Extra life
	ld	a,(game.lives)
	inc	a
	ld	(game.lives),a
; Increases difficulty
	ld	a,0FFh
	ld	(game.first_pyramid),a
; Enters a new pyramid
	jp	NEW_PYRAMID
; -----------------------------------------------------------------------------

	; Referenced from 86BB, 87F8, 8CAB
	; --- START PROC L8B69 ---

; -----------------------------------------------------------------------------
; param de: SPRATR coordinates
; ret: direction_table values are filled
CHECK_ALL_WALLS:
; up (left character)
L8B69:	push	de
	dec	e ; (y--)
	ld	ix,direction_table
	call	CHECK_WALL
	ld	(ix+00h),a
	pop	de
; up (right character)
	push	de
	ld	a,0Fh ; (x +=15 pixels)
	add	a,d
	ld	d,a
	dec	e ; (y--)
	call	CHECK_WALL
	and	(ix+00h) ; (cobine)
	ld	(ix+00h),a
	inc	ix
	pop	de
	
; left (upper character)
	push	de
	dec	d ; (x--)
	call	CHECK_WALL
	ld	(ix+00h),a
	pop	de
; left (lower character)
	push	de
	dec	d ; (x--)
	ld	a,0Fh ; (y += 15 pixels)
	add	a,e
	ld	e,a
	call	CHECK_WALL
	and	(ix+00h) ; (cobine)
	ld	(ix+00h),a
	inc	ix
	pop	de
	
; down (left character)
	push	de
	ld	a,10h
	add	a,e
	ld	e,a
	call	CHECK_WALL
	ld	(ix+00h),a
	pop	de
; down (right character)
	push	de
	ld	a,10h
	add	a,e
	ld	e,a
	ld	a,0Fh
	add	a,d
	ld	d,a
	call	CHECK_WALL
	and	(ix+00h)
	ld	(ix+00h),a
	inc	ix
	pop	de
	
; right (upper character)
	push	de
	ld	a,10h
	add	a,d
	ld	d,a
	call	CHECK_WALL
	ld	(ix+00h),a
	pop	de
; right (lower character)
	ld	a,10h
	add	a,d
	ld	d,a
	ld	a,0Fh
	add	a,e
	ld	e,a
	call	CHECK_WALL
	and	(ix+00h)
	ld	(ix+00h),a
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8B6F, 8B7C, 8B8A, 8B97, 8BA8, 8BB8, 8BC9, 8BD8, 893F
	; --- START PROC L8BE2 ---

; -----------------------------------------------------------------------------
; param de: SPRATR coordinates
; ret a: $00 = wall, $FF = not a wall
CHECK_WALL:
; (d, e) /= 8
L8BE2:	srl	e
	srl	e
	srl	e
	srl	d
	srl	d
	srl	d
; Calculates NAMTBL coordinates: y
	ld	hl,NAMTBL
	ld	bc,SCR_WIDTH
	inc	d
.L8BF5:	dec	d
	jr	z,L8BFB
	add	hl,bc ; y++
	jr	.L8BF5
L8BFB:	add	hl,de ; += x (d = 0, e = x)
; Reads the character
	call	RDVRM
	ld	b,a
; Is checking player?
	ld	a,(check_wall_for_player)
	or	a
	jr	z,.L8C20 ; no
	
; Checks for box (player only)
	ld	a,33h ; > $33?
	cp	b
	jr	nc,.L8C13 ; no
	ld	a,37h ; and <= $37?
	cp	b
	jr	c,.L8C13 ; no
; yes: box, not a wall
	ld	a,0FFh
	ret

; Checks for exit (player only)
.L8C13:	ld	a,4Fh ; >$4f?
	cp	b
	jr	nc,.L8C20 ; no
	ld	a,53h ; and <= $53?
	cp	b
	jr	c,.L8C20 ; no
; yes: exit, not a wall
	ld	a,0FFh
	ret

; Blank space?
.L8C20:	ld	a,0FFh
	cp	b
	jr	z,.L8C26 ; yes: not a wall
; no: a wall
	xor	a
.L8C26:	ret
; -----------------------------------------------------------------------------

	; Referenced from 83A5, 86D7, 86EA, 8810, 88CD, 8CC7, 8D01
	; --- START PROC L8C27 ---
	
; -----------------------------------------------------------------------------
ADD_HL_A:
L8C27:	add	a,l
	ld	l,a
	ld	a,00h
	adc	a,h
	ld	h,a
	ret
; -----------------------------------------------------------------------------

	; Referenced from 82EB, 830A, 8325, 8658, 8CCC, 8C67
	; --- START PROC L8C2E ---
	
; -----------------------------------------------------------------------------
; ret a: random value
RANDOMIZE:
L8C2E:	ld	iy,0FC9Eh	; address or value?
	ld	a,r
	add	a,(iy+00h)
	add	a,a
	add	a,(iy+00h)
	ret
; -----------------------------------------------------------------------------

	; Referenced from 869B, 87E8, 8908, 8969, 8C64, 8E22, 89E1, 8C6C, 8EDD, 8A3A
	; --- START PROC L8C3C ---

; -----------------------------------------------------------------------------
SHORT_DELAY:
L8C3C:	ld	b,04h
.L8C3E:	ld	a,(game.short_delay)
.L8C41:	dec	a
	jr	nz,.L8C41
	djnz	.L8C3E
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8FB0, 8676, 9088, 9109, 9064
	; --- START PROC L8C47 ---

; -----------------------------------------------------------------------------
LONG_DELAY:
L8C47:	ld	hl,3000h	; address or value?
.L8C4A:	dec	hl
	ld	a,h
	or	l
	jr	nz,.L8C4A
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8978, 8986, 89EF, 89F6
	; --- START PROC L8C50 ---
	
; -----------------------------------------------------------------------------
UPDATE_ENEMY:
L8C50:	ld	(current_enemy_ptr),ix
	ld	a,(ix+05h)
	or	a
	jr	nz,L8CA5
	ld	a,(0C069h)
	or	a
	jr	z,L8C67
	dec	a
	ld	(0C069h),a
	jp	SHORT_DELAY

	; Referenced from 8C5E
L8C67:	call	RANDOMIZE
	cp	80h
	jp	c,SHORT_DELAY
	ld	a,20h		; ' '
	ld	(0C069h),a
	ld	bc,(nest)
	ld	(ix+00h),c
	ld	(ix+01h),b
	ld	a,0FFh
	ld	(ix+05h),a
	xor	a
	ld	(ix+04h),a
	ld	b,(ix+06h)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,L8C92
	inc	b

	; Referenced from 8C8F
L8C92:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a
	ld	a,(ix+07h)
	ld	de,(current_enemy_ptr)
	call	PUT_SPRITE
	jp	L8D3C

	; Referenced from 8C58
L8CA5:	ld	d,(ix+00h)
	ld	e,(ix+01h)
	call	CHECK_ALL_WALLS
	ld	ix,(current_enemy_ptr)
	ld	hl,direction_table
	ld	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
	inc	a
	jr	z,L8CCC
	ld	a,(ix+04h)
	xor	02h
	ld	hl,direction_table
	call	ADD_HL_A
	xor	a
	ld	(hl),a

	; Referenced from 8CBD
L8CCC:	call	RANDOMIZE
	and	03h
	or	a
	jr	z,L8CE9
	dec	a
	jr	z,L8CE4
	dec	a
	jr	z,L8CDF
	ld	a,03h
	call	L8CFD

	; Referenced from 8CD8
L8CDF:	ld	a,02h
	call	L8CFD

	; Referenced from 8CD5
L8CE4:	ld	a,01h
	call	L8CFD

	; Referenced from 8CD2
L8CE9:	ld	a,00h
	call	L8CFD
	ld	a,03h
	call	L8CFD
	ld	a,02h
	call	L8CFD
	ld	a,01h
	call	L8CFD

	; Referenced from 8CDC, 8CE1, 8CE6, 8CEB, 8CF0, 8CF5, 8CFA
	; --- START PROC L8CFD ---
L8CFD:	ld	hl,direction_table
	ld	b,a
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	ret	z
	pop	hl
	ld	hl,(current_enemy_ptr)
	ld	(ix+04h),b
	ld	a,02h
	srl	b
	jr	c,L8D15
	inc	hl

	; Referenced from 8D12
L8D15:	srl	b
	jr	c,L8D1B
	neg

	; Referenced from 8D17
L8D1B:	add	a,(hl)
	ld	(hl),a
	ld	ix,(current_enemy_ptr)
	ld	b,(ix+06h)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,L8D2C
	inc	b

	; Referenced from 8D29
L8D2C:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a
	ld	a,(ix+07h)
	ld	de,(current_enemy_ptr)
	call	PUT_SPRITE

	; Referenced from 8CA2
	; --- START PROC L8D3C ---
L8D3C:	ld	a,(bullet.status)
	or	a
	jr	z,L8DAC
	ld	ix,(current_enemy_ptr)
	ld	a,(ix+00h)
	add	a,08h
	ld	b,a
	ld	a,(bullet.spratr_y)
	inc	a
	sub	b
	jr	nc,L8D55
	neg

	; Referenced from 8D51
L8D55:	cp	05h
	jr	nc,L8DAC
	ld	a,(ix+01h)
	add	a,08h
	ld	b,a
	ld	a,(bullet.spratr_x)
	inc	a
	sub	b
	jr	nc,L8D68
	neg

	; Referenced from 8D64
L8D68:	cp	05h
	jr	nc,L8DAC
	ld	hl,bullet
	ld	a,(ix+00h)
	ld	(hl),a
	inc	hl
	ld	a,(ix+01h)
	ld	(hl),a
	inc	hl
	ld	a,78h		; 'x'
	ld	(hl),a
	inc	hl
	ld	a,06h
	ld	(hl),a
	inc	hl
	inc	hl
	ld	a,06h
	ld	(hl),a
	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
	call	PLAY_SOUND_BULLET_HIT
	ld	de,0030h	; address or value?
	call	ADD_SCORE
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
	xor	a
	ld	(ix+05h),a
	ld	a,SPAT_OB
	ld	(ix+00h),a
	ld	de,(current_enemy_ptr)
	ld	a,(ix+07h)
	jp	PUT_SPRITE

	; Referenced from 8905, 8D40, 8D57, 8D6A
	; --- START PROC L8DAC ---
L8DAC:	ld	a,(player.spratr_y)
	ld	d,a
	ld	a,(player.spratr_x)
	ld	e,a
	ld	a,(ix+00h)
	sub	d
	jr	nc,L8DBC
	neg

	; Referenced from 8DB8
L8DBC:	cp	08h
	ret	nc
	ld	a,(ix+01h)
	sub	e
	jr	nc,L8DC7
	neg

	; Referenced from 8DC3
L8DC7:	cp	08h
	ret	nc
; -----------------------------------------------------------------------------

	; Referenced from 8A4F
	; --- START PROC L8DCA ---

; -----------------------------------------------------------------------------
AIR_OVER:
L8DCA:	pop	hl ; (invoked with CALL, acts as a JP)
	call	L8FB3
; color ,,4
	ld	b,04h
	ld	c,07h
	call	WRTVDP
	jp	DEC_LIVES_AND_NEW_ROOM

	; Referenced from 837C
	; --- START PROC L8DD8 ---
	
; -----------------------------------------------------------------------------
GAME_OVER:
L8DD8:	call	RESET_SOUND
	ld	hl,LITERAL.GAME_OVER
	ld	de,0808h	; address or value?
	ld	b,09h
	call	WRTVRM_CHARS

	; Referenced from 8E05
L8DE6:	call	GTTRIG_ANY
	or	a
	jr	nz,L8E07
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
	ld	hl,LITERAL.HIT_SPACE_KEY
	and	80h
	jr	z,L8DFD
	ld	hl,LITERAL.BLANK_x21

	; Referenced from 8DF8
L8DFD:	ld	de,0C06h	; address or value?
	ld	b,0Dh
	call	WRTVRM_CHARS
	jr	L8DE6

	; Referenced from 8DEA
	; --- START PROC L8E07 ---
L8E07:	jp	L82B8

	; Referenced from 897F, 89E8, 89FD
	; --- START PROC L8E0A ---
	
; -----------------------------------------------------------------------------
UPDATE_BOX:
L8E0A:	ld	a,(ix+02h)
	or	a
	jp	nz,L8EB8
	ld	hl,player.spratr_y
	ld	a,(ix+00h)
	cp	(hl)
	ret	nz
	inc	hl ; hl = player.spratr_x
	ld	a,(ix+01h)
	cp	(hl)
	ret	nz
	call	PLAY_SOUND_BOX
	call	SHORT_DELAY
	ld	a,0FFh
	ld	(ix+02h),a
	ld	a,32h		; '2'
	ld	(ix+03h),a
	ld	d,(ix+00h)
	ld	e,(ix+01h)
	ld	a,(ix+04h)
	or	a
	jr	z,L8E89
	srl	d
	srl	d
	srl	d
	srl	e
	srl	e
	srl	e
	cp	38h		; '8'
	jr	z,L8E76
	ld	a,0FFh
	ld	(0C06Dh),a
	ld	a,01h
	ld	(0C06Bh),a
	ld	(exit.blink_counter),a
	xor	a
	ld	(0C06Ch),a
	ld	a,3Ch		; '<'
	call	WRTVRM_2x2_CHAR
	ld	hl,(game.air_left)
	ld	bc,0002h	; address or value?
	xor	a
	sbc	hl,bc
	ld	(0C079h),hl
	ld	de,0300h	; address or value?
	call	ADD_SCORE
	jp	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

	; Referenced from 8E49
L8E76:	ld	a,08h
	ld	(player_has_gun),a
	ld	a,38h		; '8'
	call	WRTVRM_2x2_CHAR
	ld	de,0100h	; address or value?
	call	ADD_SCORE
	jp	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

	; Referenced from 8E39
L8E89:	ld	hl,skull.spratr_y
	push	de
	ld	(hl),d
	inc	hl ; skull.spratr_x
	ld	(hl),e
	inc	hl ; skull.spratr_pattern
	ld	a,40h
	ld	(hl),a
	inc	hl ; skull.spratr_color
	ld	a,0Fh
	ld	(hl),a
	inc	hl ; skull.direction
	xor	a
	ld	(hl),a
	inc	hl ; skull.status
	inc	hl ; skull. ???
	ld	a,10h
	ld	(hl),a
	inc	hl ; skull. ???
	ld	a,03h
	ld	(hl),a
	ld	de,skull
	ld	a,03h
	call	PUT_SPRITE
	ld	de,0200h	; address or value?
	call	ADD_SCORE
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
	pop	de
	jr	L8ECE

	; Referenced from 8E0E
L8EB8:	ld	a,(ix+03h)
	or	a
	ret	z
	dec	a
	ld	(ix+03h),a
	ret	nz
	ld	d,(ix+00h)
	ld	e,(ix+01h)
	ld	a,(ix+04h)
	or	a
	jr	z,L8EE0

	; Referenced from 8EB6
L8ECE:	srl	d
	srl	d
	srl	d
	srl	e
	srl	e
	srl	e
	call	WRTVRM_2x2_BLANK
	jp	SHORT_DELAY

	; Referenced from 8ECC
L8EE0:	ld	a,0FFh
	ld	(skull.status),a
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_RANDOMIZE_BOX_CONTENTS:
L8EE6:	DB	38h ; gun
	DB	3Ch ; jewel
	DB	00h ; skull
	DB	38h ; gun
	DB	3Ch ; jewel
; -----------------------------------------------------------------------------

	; Referenced from 8425, 89B1, 8EDA
	; --- START PROC L8EEB ---

; -----------------------------------------------------------------------------
WRTVRM_2x2_BLANK:
L8EEB:	push	de
	ld	a,0FFh
	call	WRTVRM_1x1_CHAR
	pop	de
	push	de
	ld	a,0FFh
	inc	e
	call	WRTVRM_1x1_CHAR
	pop	de
	inc	d
	push	de
	ld	a,0FFh
	call	WRTVRM_1x1_CHAR
	pop	de
	inc	e
	ld	a,0FFh
	jp	WRTVRM_1x1_CHAR
; -----------------------------------------------------------------------------

	; Referenced from 838C, 8B07, 8E73, 89DB, 8D96, 8EB2, 8E86
	; --- START PROC L8F08 ---

; -----------------------------------------------------------------------------
PRINT_SCORE_AND_UPDATE_HIGH_SCORE:
L8F08:	ld	de,0B19h	; address or value?
	call	PRINT_SCORE
	ld	de,0819h	; address or value?
	jp	UPDATE_HIGH_SCORE
; -----------------------------------------------------------------------------

	; Referenced from 8367
	; --- START PROC L8F14 ---
L8F14:	ld	ix,sound_buffer.start
	ld	b,03h

	; Referenced from 8F30
L8F1A:	push	bc
	ld	a,0Ah
	call	L8F49
	ld	a,14h
	call	L8F49
	ld	a,1Eh
	call	L8F49
	ld	a,14h
	call	L8F49
	pop	bc
	djnz	L8F1A
	ld	a,0Ah
	call	L8F49
	ld	b,03h

	; Referenced from 8F41
L8F39:	ld	hl,0000h	; address or value?

	; Referenced from 8F3F
L8F3C:	dec	hl
	ld	a,h
	or	l
	jr	nz,L8F3C
	djnz	L8F39
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	jp	PLAY_SOUND

	; Referenced from 8F1D, 8F22, 8F27, 8F2C, 8F34
	; --- START PROC L8F49 ---
L8F49:	ld	b,0Ah
	ld	(ix+00h),b
	ld	c,a
	ld	b,00h
	ld	(ix+01h),b
	ld	(ix+02h),a
	inc	b
	ld	a,01h
	ld	(ix+03h),b
	ld	(ix+04h),a
	inc	b
	ld	a,05h
	add	a,c
	ld	(ix+05h),b
	ld	(ix+06h),a
	inc	b
	ld	a,02h
	ld	(ix+07h),b
	ld	(ix+08h),a
	inc	b
	ld	a,0Ah
	add	a,c
	ld	(ix+09h),b
	ld	(ix+0Ah),a
	ld	a,03h
	inc	b
	ld	(ix+0Bh),b
	ld	(ix+0Ch),a
	inc	b
	inc	b
	ld	a,0B8h
	ld	(ix+0Dh),b
	ld	(ix+0Eh),a
	inc	b
	ld	a,0Ch
	ld	(ix+0Fh),b
	ld	(ix+10h),a
	inc	b
	ld	(ix+11h),b
	ld	(ix+12h),a
	inc	b
	ld	(ix+13h),b
	ld	(ix+14h),a
	call	RESET_SOUND
	ld	hl,sound_buffer.start
	call	PLAY_SOUND
	jp	LONG_DELAY

	; Referenced from 8DCB
	; --- START PROC L8FB3 ---
L8FB3:	xor	a
	ld	(0C0DCh),a
	ld	a,0Ah
	ld	ix,sound_buffer.unknown

	; Referenced from 8FC6
L8FBD:	push	af
	call	L8FE8
	pop	af
	add	a,14h
	cp	0E6h
	jr	nz,L8FBD
; color ,,6
	ld	c,07h
	ld	b,06h
	call	WRTVDP
	ld	b,03h

	; Referenced from 8FD9
L8FD1:	ld	hl,0000h	; address or value?

	; Referenced from 8FD7
L8FD4:	dec	hl
	ld	a,h
	or	l
	jr	nz,L8FD4
	djnz	L8FD1
; color ,,4
	ld	c,07h
	ld	b,04h
	call	WRTVDP
; mute
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	jp	PLAY_SOUND

	; Referenced from 8FBE
	; --- START PROC L8FE8 ---
L8FE8:	ld	b,0Ah
	ld	(ix+00h),b
	ld	c,a
	ld	b,00h
	ld	(ix+01h),b
	ld	(ix+02h),a
	inc	b
	ld	a,01h
	ld	(ix+03h),b
	ld	(ix+04h),a
	inc	b
	ld	a,0Ah
	add	a,c
	ld	(ix+05h),b
	ld	(ix+06h),a
	inc	b
	ld	a,02h
	ld	(ix+07h),b
	ld	(ix+08h),a
	inc	b
	ld	a,14h
	add	a,c
	ld	(ix+09h),b
	ld	(ix+0Ah),a
	inc	b
	ld	a,03h
	ld	(ix+0Bh),b
	ld	(ix+0Ch),a
	inc	b
	inc	b
	ld	a,0B8h
	ld	(ix+0Dh),b
	ld	(ix+0Eh),a
	inc	b
	ld	a,0Ch
	ld	(ix+0Fh),b
	ld	(ix+10h),a
	inc	b
	ld	(ix+11h),b
	ld	(ix+12h),a
	inc	b
	ld	(ix+13h),b
	ld	(ix+14h),a
	call	RESET_SOUND
	ld	hl,sound_buffer.unknown
	call	PLAY_SOUND
	ld	a,(0C0DCh)
	cpl
	or	a
	ld	(0C0DCh),a
	jr	z,L905D
	ld	b,04h
	jr	L905F

	; Referenced from 9057
L905D:	ld	b,06h

	; Referenced from 905B
; color ,,b
L905F:	ld	c,07h
	call	WRTVDP
	jp	LONG_DELAY

	; Referenced from 8AFE
	; --- START PROC L9067 ---
	
; -----------------------------------------------------------------------------
PLAY_SOUND_SPHYNX:
L9067:	call	RESET_SOUND
	ld	hl,DATA_SOUND.SPHYNX
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 89D2
	; --- START PROC L9070 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_EXIT:
L9070:	call	RESET_SOUND
; color ,,3
	ld	c,07h
	ld	b,03h
	call	WRTVDP
; Ascending arpegio
	ld	a,0F0h
.L907C:	push	af
	call	.L909B
	pop	af
	sub	14h
	jr	nz,.L907C
	ld	b,0Ch
; Keeps last note a little longer
.L9087:	push	bc
	call	LONG_DELAY
	pop	bc
	djnz	.L9087
; mute
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	call	PLAY_SOUND
; color ,,4
	ld	c,07h
	ld	b,04h
	jp	WRTVDP

; Prepares one note of the arpeggio
.L909B:	ld	ix,sound_buffer.end
	ld	b,0Ah ; lenght
	ld	(ix+00h),b
	ld	b,00h
	ld	c,a
	ld	(ix+01h),b
	ld	(ix+02h),a
	inc	b
	ld	a,01h
	ld	(ix+03h),b
	ld	(ix+04h),a
	inc	b
	ld	a,05h
	add	a,c
	ld	(ix+05h),b
	ld	(ix+06h),a
	inc	b
	ld	a,01h
	ld	(ix+07h),b
	ld	(ix+08h),a
	inc	b
	ld	a,0Ah
	add	a,c
	ld	(ix+09h),b
	ld	(ix+0Ah),a
	inc	b
	ld	a,01h
	ld	(ix+0Bh),b
	ld	(ix+0Ch),a
	inc	b
	inc	b
	ld	a,0B8h
	ld	(ix+0Dh),b
	ld	(ix+0Eh),a
	inc	b
	ld	a,0Ch
	ld	(ix+0Fh),b
	ld	(ix+10h),a
	inc	b
	ld	(ix+11h),b
	ld	(ix+12h),a
	inc	b
	ld	(ix+13h),b
	ld	(ix+14h),a
; mute
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	call	PLAY_SOUND
; Plays the one note of the arpeggio
	ld	hl,sound_buffer.end
	call	PLAY_SOUND
	jp	LONG_DELAY
; -----------------------------------------------------------------------------

	; Referenced from 879B
	; --- START PROC L910C ---

; -----------------------------------------------------------------------------
PLAY_SOUND_INGAME:
L910C:	call	RESET_SOUND
	ld	a,(aux.frame_counter)
	and	04h
	jr	nz,.L911B
	ld	hl,DATA_SOUND.INGAME_A
	jr	.L911E
.L911B:	ld	hl,DATA_SOUND.INGAME_B
.L911E:	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 8AC5, 8E1F
	; --- START PROC L9121 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_BOX:
L9121:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BOX
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 871D, 874B
	; --- START PROC L912A ---
	
; -----------------------------------------------------------------------------
PLAY_SOUND_DOOR:
L912A:	call	RESET_SOUND
	ld	hl,DATA_SOUND.DOOR
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 895E, 8D8D
	; --- START PROC L9133 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_BULLET_HIT:
L9133:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BULLET_HIT
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 87E5
	; --- START PROC L913C ---

; -----------------------------------------------------------------------------
PLAY_SOUND_BULLET:
L913C:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BULLET
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 8DD8, 8FA7, 912A, 910C, 913C, 9133, 9121, 9067, 9070, 9046
	; --- START PROC L9145 ---

; -----------------------------------------------------------------------------
RESET_SOUND:
L9145:	ld	hl,DATA_SOUND.RESET
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SOUND:
.INGAME_A: ; 914BH
	DB	07h ; length
	DB	00h, 0FDh
	DB	01h, 00h
	DB	07h, 0B8h
	DB	08h, 08h
	DB	0Bh, 22h
	DB	0Ch, 02h
	DB	0Dh, 0Fh
.INGAME_B: ; 915AH
	DB	07h ; length
	DB	00h, 3Fh
	DB	01h, 01h
	DB	07h, 0B8h
	DB	08h, 08h
	DB	0Bh, 22h
	DB	0Ch, 05h
	DB	0Dh, 09h

.BOX: ; 9169H
	DB	0Dh ; length
	DB	00h, 0FDh
	DB	01h, 00h
	DB	02h, 0D5h
	DB	03h, 00h
	DB	04h, 3Fh
	DB	05h, 00h
	DB	07h, 0B8h
	DB	08h, 10h
	DB	09h, 10h
	DB	0Ah, 10h
	DB	0Bh, 9Eh
	DB	0Ch, 0Ah
	DB	0Dh, 09h

.DOOR: ; 9184H	
	DB	07h ; length
	DB	00h, 0E0h
	DB	01h, 04h
	DB	07h, 0B8h
	DB	08h, 0Fh
	DB	0Bh, 92h
	DB	0Ch, 05h
	DB	0Dh, 05h

.BULLET_HIT: ; 9193H
	DB	07h ; length
	DB	06h, 1Fh
	DB	07h, 87h
	DB	08h, 0Fh
	DB	09h, 0Fh
	DB	0Bh, 0Bh
	DB	0Ch, 02h
	DB	0Dh, 0Fh
	
.BULLET: ; 91A2H
	DB	0Ah ; length
	DB	00h, 0C0h
	DB	01h, 09h
	DB	06h, 1Fh
	DB	07h, 80h
	DB	08h, 0Ch
	DB	09h, 0Ch
	DB	0Ah, 10h
	DB	0Bh, 0Bh
	DB	0Ch, 06h
	DB	0Dh, 00h
	
.RESET: ; 91B7H
	DB	0Eh ; length
	DB	00h, 00h
	DB	01h, 00h
	DB	02h, 00h
	DB	03h, 00h
	DB	05h, 00h
	DB	06h, 00h
	DB	07h, 80h
	DB	08h, 00h
	DB	09h, 00h
	DB	0Ah, 00h
	DB	0Bh, 00h
	DB	0Ch, 00h
	DB	0Dh, 00h
; -----------------------------------------------------------------------------

	; Referenced from 802D, 8035, 803D, 8045, 804D, 8055, 805D, 8065, 806D, 8075, 807D, 8085, 808D, 8095, 809D, 80A5, 80AD, 80B5, 80BD, 80C5, 80CD, 80D5, 80DD, 80E5, 80ED, 80F5, 80FD, 8105, 810D, 8115, 811D, 8125, 812D, 8135, 813D, 8145, 814D
	; --- START PROC L91D2 ---
	
; -----------------------------------------------------------------------------
; param a: sprite index
; param de: ROM/RAM source SPRTBL data
INIT_SPRTBL:
L91D2:	ld	hl,SPRTBL
	ld	bc,0020h	; address or value?
	inc	a
.L91D9: dec	a
	jr	z,.L91DF
	add	hl,bc
	jr	.L91D9
.L91DF: ex	de,hl
	jp	LDIRVM
; -----------------------------------------------------------------------------

	; Referenced from 855D, 8590, 8652, 8794, 87E2, 88FE, 8966, 8AD4, 8ADC, 8AE4, 8AEC, 8D39, 8D8A, 8DA9, 8C9F, 8EA9, 8A37, 8AA9, 8AB1
	; --- START PROC L91E3 ---
	
; -----------------------------------------------------------------------------
; param a: sprite index
; param de: ROM/RAM source SPRATR data
PUT_SPRITE:
L91E3:	ld	hl,SPRATR
	ld	bc,4 ; 4b per sprite
	inc	a
.L91EA: dec	a
	jp	z,.L91F1
	add	hl,bc
	jr	.L91EA
.L91F1: ex	de,hl
	jp	LDIRVM
; -----------------------------------------------------------------------------

	; Referenced from 8155, 815D, 8165, 816D, 8175, 817D, 8185, 818D
	; --- START PROC L91F5 ---
	
	; Referenced from 8195, 819D, 81A5, 81AD, 81B5, 81BD
	; --- START PROC L91FA ---
	
; -----------------------------------------------------------------------------
INIT_4xCXRTBL:
L91F5:	ld	hl,0020h	; address or value?
	jr	L91FD

INIT_1xCXRTBL:
L91FA:	ld	hl,0008h	; address or value?

	; Referenced from 91F8
	; --- START PROC L91FD ---
L91FD:	ld	(aux.how_many_bytes),hl
	ld	hl,0000h	; address or value?
	ld	bc,0008h	; address or value?
	inc	a
.L9207: dec	a
	jr	z,.L920D
	add	hl,bc
	jr	.L9207
.L920D: ld	a,06h
.L920F: push	af
	ex	de,hl
	push	hl
	push	de
	ld	bc,(aux.how_many_bytes)
	call	LDIRVM
	pop	hl
	pop	de
	ld	bc,0800h	; address or value?
	add	hl,bc
	pop	af
	dec	a
	ret	z
	cp	03h
	jr	nz,.L920F
	add	hl,bc
	ex	de,hl
	ld	bc,(aux.how_many_bytes)
	add	hl,bc
	ex	de,hl
	jr	.L920F
; -----------------------------------------------------------------------------

	; Referenced from 8417, 84EB, 8501, 8517, 8529, 859A, 85A3, 85AC, 85B7, 85C0, 85C7, 85D1, 89AC, 8E5E, 8E7D, 8A72
	; --- START PROC L9231 ---

	; Referenced from 9300, 8364, 83DC, 83EA, 92E5, 92F1, 8EEE, 8EF6, 8EFE, 8F05, 85EE, 86AD, 8AF4, 89CF
	; --- START PROC L9236 ---
	
; -----------------------------------------------------------------------------
WRTVRM_2x2_CHAR:
L9231:	ex	af,af'
	ld	a,04h
	jr	L9239

WRTVRM_1x1_CHAR:
L9236:	ex	af,af'
	ld	a,01h

	; Referenced from 9234
	; --- START PROC L9239 ---
L9239:	ld	(aux.how_many_bytes),a
	ex	af,af'
	ld	hl,1800h	; address or value?
	ld	bc,0020h	; address or value?
.L9243: dec	d
	jp	m,.L924A
	add	hl,bc
	jr	.L9243
.L924A: inc	d
	add	hl,de
	ld	c,a
	ld	a,(aux.how_many_bytes)
	ld	b,a
.L9251: ld	a,c
	call	WRTVRM
	dec	b
	ret	z
	inc	hl
	inc	c
	ld	a,02h
	cp	b
	jr	nz,.L9251
	ld	de,001Eh	; address or value?
	add	hl,de
	jr	.L9251
; -----------------------------------------------------------------------------

	; Referenced from 8F46, 8FAD, 9148, 9130, 9142, 9139, 911E, 8FE5, 9127, 906D, 9091, 904C, 9100, 9106
	; --- START PROC L9264 ---
	
; -----------------------------------------------------------------------------
; param hl: sound data pointer
PLAY_SOUND:
L9264:	ld	b,(hl)
.L9265:	inc	hl
	ld	a,(hl)
	inc	hl
	ld	e,(hl)
	call	0093h
	djnz	.L9265
	ret
; -----------------------------------------------------------------------------

	; Referenced from 86C2
	; --- START PROC L926F ---

; -----------------------------------------------------------------------------
GTSTCK_ANY:
L926F:	xor	a
	call	GTSTCK
	or	a
	ret	nz
	inc	a
	call	GTSTCK
	and	a
	ret	nz
	ld	a,02h
	jp	GTSTCK
; -----------------------------------------------------------------------------

	; Referenced from 81EC, 8DE6, 87AA, 8B2B
	; --- START PROC L9280 ---

; -----------------------------------------------------------------------------
GTTRIG_ANY:
L9280:	xor	a
	call	GTTRIG
	or	a
	ret	nz
	inc	a
	call	GTTRIG
	and	a
	ret	nz
	ld	a,02h
	jp	GTTRIG
; -----------------------------------------------------------------------------

	; Referenced from 8010
	; --- START PROC L9291 ---

; -----------------------------------------------------------------------------
SCREEN_2:
L9291:	ld	a,02h
	jp	CHGMOD
; -----------------------------------------------------------------------------

	; Referenced from 8B04, 8E70, 89D8, 8D93, 8EAF, 8E83
	; --- START PROC L9296 ---

; -----------------------------------------------------------------------------
; param de: score to add (BCD)
ADD_SCORE:
L9296:	ld	hl,0C084h	; address or value?
	ld	a,e
	add	a,(hl)
	daa
	ld	(hl),a
	dec	hl
	ld	a,d
	adc	a,(hl)
	daa
	ld	(hl),a
	dec	hl
	ld	a,00h
	adc	a,(hl)
	daa
	ld	(hl),a
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8F11
	; --- START PROC L92A9 ---
	
; -----------------------------------------------------------------------------
UPDATE_HIGH_SCORE:
; Compares score (BCD) with high score (BCD)
L92A9:	ld	hl,game.score_bcd
	ld	a,(game.high_score_bcd)
	cp	(hl)
	jr	c,.L92C3
	ret	nz
; (next digit)
	inc	hl
	ld	a,(game.high_score_bcd +1)
	cp	(hl)
	jr	c,.L92C3
	ret	nz
; (next digit)
	inc	hl
	ld	a,(game.high_score_bcd +2)
	cp	(hl)
	jr	z,.L92C3
	ret	nc
; Copies score (BCD) to high_score (BCD)
.L92C3:	ld	bc,(game.score_bcd)
	ld	(game.high_score_bcd),bc
	ld	a,(game.score_bcd +2)
	ld	(game.high_score_bcd +2),a
; Prints high score
	ld	hl,game.high_score_bcd
	jr	WRTVRM_6x_BCD
; -----------------------------------------------------------------------------

	; Referenced from 82E4, 8F0B
	; --- START PROC L92D6 ---

; -----------------------------------------------------------------------------
PRINT_SCORE:
L92D6:	ld	hl,game.score_bcd
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 92D4
	; --- START PROC L92D9 ---

; -----------------------------------------------------------------------------
; Writes 6 BCD characters
; param hl: ROM/RAM source data
; param de: yx
WRTVRM_6x_BCD:
; 3 times 2 characters
L92D9:	call	.L92DF
	call	.L92DF
; First digit
.L92DF: push	hl
	push	de
	xor	a
	rld
	push	af
	call	WRTVRM_1x1_CHAR
	pop	af
	pop	de
	pop	hl
; Next digit
	push	hl
	inc	e
	push	de
	rld
	push	af
	call	WRTVRM_1x1_CHAR
	pop	af
	pop	de
	pop	hl
; Restores (hl)
	rld
; Moves pointers forward
	inc	hl
	inc	e
	ret
; -----------------------------------------------------------------------------

	; Referenced from 81C8, 81D3, 81DE, 81E9, 8208, 9308, 822E, 8239, 8244, 824F, 825A, 8265, 8270, 827B, 8286, 8296, 82C0, 82CF, 8350, 8372, 8389, 8DE3, 8E02, 84CE, 8B12, 8B1D, 8B28, 8B47
	; --- START PROC L92FC ---

; -----------------------------------------------------------------------------
; param hl: ROM/RAM source
; param b: number of chars
WRTVRM_CHARS:
; Writes (hl)
L92FC:	push	bc
	push	de
	push	hl
	ld	a,(hl)
	call	WRTVRM_1x1_CHAR
	pop	hl
	pop	de
	pop	bc
; Moves source and target pointers forward
	inc	hl
	inc	e
	djnz	WRTVRM_CHARS
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8025
	; --- START PROC L930B ---

; -----------------------------------------------------------------------------
INIT_FONT:
; FILVRM with '/' character
L930B:	ld	a,2Fh		; '/'
	ld	hl,1800h	; address or value?
	ld	bc,0300h	; address or value?
	call	FILVRM
; Blits to CHRTBL three times
	ld	hl,DATA_FONT
	ld	de,CHRTBL.BANK_0
	ld	bc,DATA_FONT.SIZE
	call	LDIRVM
	ld	hl,DATA_FONT
	ld	de,CHRTBL.BANK_1
	ld	bc,DATA_FONT.SIZE
	call	LDIRVM
	ld	hl,DATA_FONT
	ld	de,CHRTBL.BANK_2
	ld	bc,DATA_FONT.SIZE
	jp	LDIRVM
; -----------------------------------------------------------------------------

	; Referenced from 8022
	; --- START PROC L933A ---

; -----------------------------------------------------------------------------
COLOR_A_B_C:
; color a,b,c
L933A:	ld	(FORCLR),a
	ld	a,b
	ld	(BAKCLR),a
	ld	a,c
	ld	(BDRCLR),a
	call	CHGCLR
; FILVRM the CLRTBL with (a << 4 | b)
	ld	a,(BAKCLR)
	ld	b,a
	ld	a,(FORCLR)
	sla	b
	rla
	sla	b
	rla
	sla	b
	rla
	sla	b
	rla
	ld	hl,CLRTBL
	ld	bc,CLRTBL.SIZE
	jp	FILVRM
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_FONT:
L9364:	DB	3Ch, 42h, 46h, 5Ah, 62h, 42h, 3Ch, 00h ; 00
	DB	08h, 18h, 28h, 08h, 08h, 08h, 3Eh, 00h ; 01
	DB	3Ch, 42h, 02h, 1Ch, 20h, 40h, 7Eh, 00h ; 02
	DB	3Ch, 42h, 02h, 0Ch, 02h, 42h, 3Ch, 00h ; 03
	DB	04h, 0Ch, 14h, 24h, 7Eh, 04h, 04h, 00h ; 04
	DB	7Eh, 40h, 7Ch, 02h, 02h, 42h, 3Ch, 00h ; 05
	DB	1Ch, 20h, 40h, 7Ch, 42h, 42h, 3Ch, 00h ; 06
	DB	7Fh, 42h, 04h, 08h, 10h, 10h, 10h, 00h ; 07
	DB	3Ch, 42h, 42h, 3Ch, 42h, 42h, 3Ch, 00h ; 08
	DB	3Ch, 42h, 42h, 3Eh, 02h, 04h, 38h, 00h ; 09
	DB	18h, 24h, 42h, 7Eh, 42h, 42h, 42h, 00h ; 0A
	DB	7Ch, 22h, 22h, 3Ch, 22h, 22h, 7Ch, 00h ; 0B
	DB	1Ch, 22h, 40h, 40h, 40h, 22h, 1Ch, 00h ; 0C
	DB	78h, 24h, 22h, 22h, 22h, 24h, 78h, 00h ; 0D
	DB	7Eh, 40h, 40h, 78h, 40h, 40h, 7Eh, 00h ; 0E
	DB	7Eh, 40h, 40h, 78h, 40h, 40h, 40h, 00h ; 0F
	DB	1Ch, 22h, 40h, 40h, 4Eh, 22h, 1Ch, 00h ; 10
	DB	42h, 42h, 42h, 7Eh, 42h, 42h, 42h, 00h ; 11
	DB	1Ch, 08h, 08h, 08h, 08h, 08h, 1Ch, 00h ; 12
	DB	0Eh, 04h, 04h, 04h, 04h, 44h, 38h, 00h ; 13
	DB	42h, 44h, 48h, 70h, 48h, 44h, 42h, 00h ; 14
	DB	40h, 40h, 40h, 40h, 40h, 40h, 7Eh, 00h ; 15
	DB	42h, 66h, 5Ah, 5Ah, 42h, 42h, 42h, 00h ; 16
	DB	42h, 62h, 52h, 4Ah, 46h, 42h, 42h, 00h ; 17
	DB	3Ch, 42h, 42h, 42h, 42h, 42h, 3Ch, 00h ; 18
	DB	7Ch, 42h, 42h, 7Ch, 40h, 40h, 40h, 00h ; 19
	DB	3Ch, 42h, 42h, 42h, 4Ah, 44h, 3Ah, 00h ; 1A
	DB	7Ch, 42h, 42h, 7Ch, 48h, 44h, 42h, 00h ; 1B
	DB	3Ch, 42h, 40h, 3Ch, 02h, 42h, 3Ch, 00h ; 1C
	DB	3Eh, 08h, 08h, 08h, 08h, 08h, 08h, 00h ; 1D
	DB	42h, 42h, 42h, 42h, 42h, 42h, 3Ch, 00h ; 1E
	DB	42h, 42h, 42h, 24h, 24h, 18h, 18h, 00h ; 1F
	DB	42h, 42h, 42h, 5Ah, 5Ah, 66h, 42h, 00h ; 20
	DB	42h, 42h, 24h, 18h, 24h, 42h, 42h, 00h ; 21
	DB	22h, 22h, 22h, 1Ch, 08h, 08h, 08h, 00h ; 22
	DB	7Eh, 02h, 04h, 18h, 20h, 40h, 7Eh, 00h ; 23
	DB	30h, 48h, 48h, 30h, 4Ah, 44h, 3Ah, 00h ; 24
	DB	00h, 00h, 00h, 00h, 08h, 08h, 10h, 00h ; 25
	DB	00h, 00h, 00h, 00h, 00h, 18h, 18h, 00h ; 26
	DB	00h, 00h, 00h, 7Eh, 00h, 00h, 00h, 00h ; 27
	DB	04h, 08h, 10h, 10h, 10h, 08h, 04h, 00h ; 28
	DB	20h, 10h, 08h, 08h, 08h, 10h, 20h, 00h ; 29
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; 2A
	DB	00h, 00h, 3Eh, 40h, 3Ch, 02h, 7Ch, 00h ; 2B
	DB	00h, 00h, 3Ch, 42h, 42h, 42h, 3Ch, 00h ; 2C
	DB	0Ch, 12h, 10h, 7Ch, 10h, 10h, 10h, 00h ; 2D
	DB	10h, 10h, 7Ch, 10h, 10h, 12h, 0Ch, 00h ; 2E
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h ; 2F
DATA_FONT.SIZE:	equ $ - DATA_FONT
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SPRTBL:
; 00
L94E4:	DB	0Fh, 17h, 19h, 3Eh, 17h, 3Fh, 1Fh, 40h		   ; '@'
	DB	7Dh, 07h, 18h, 1Fh, 1Ch, 1Ch, 0FCh, 0FCh
	DB	0F0h, 0F8h, 0F8h, 04h, 0F8h, 0F8h, 0F0h, 0Eh
	DB	0FAh, 0FAh, 0Ah, 0F8h, 30h, 3Fh, 3Fh, 00h

; 01
	DB	0Fh, 0Fh, 1Eh, 0Fh, 3Fh, 0Fh, 0Fh, 08h
	DB	3Fh, 7Fh, 5Fh, 60h, 7Fh, 23h, 1Ch, 1Ch
	DB	0F0h, 0F8h, 78h, 0F8h, 0FCh, 0FBh, 0F3h, 09h
	DB	0FCh, 0FEh, 0FAh, 06h, 0FEh, 0FCh, 00h, 00h

; 02
	DB	0Fh, 1Fh, 1Fh, 20h, 1Fh, 1Fh, 0Fh, 70h 
	DB	5Fh, 5Fh, 50h, 1Fh, 0Fh, 0FCh, 0FCh, 00h
	DB	0F0h, 0E8h, 98h, 7Ch, 0E8h, 0FCh, 0F8h, 02h
	DB	0BEh, 0E0h, 18h, 0F8h, 0F8h, 38h, 3Fh, 3Fh 

; 03
	DB	0Fh, 1Fh, 1Eh, 1Dh, 33h, 0Fh, 0Bh, 07h
	DB	18h, 3Fh, 5Fh, 60h, 7Fh, 23h, 1Ch, 1Ch
	DB	0F0h, 0F8h, 78h, 0B8h, 0CCh, 0F0h, 0D6h, 0E6h
	DB	1Ah, 0FCh, 0FAh, 06h, 0FEh, 0FCh, 00h, 00h

; 04
	DB	0Fh, 17h, 19h, 3Eh, 17h, 3Fh, 1Fh, 00h
	DB	1Bh, 1Fh, 10h, 1Fh, 1Fh, 0FCh, 0FCh, 00h
	DB	0F0h, 0F8h, 0F8h, 04h, 0F8h, 0F8h, 0F0h, 08h
	DB	0F8h, 0F8h, 48h, 0F8h, 0F8h, 78h, 3Fh, 3Fh

; 05
	DB	0Fh, 1Fh, 1Eh, 1Fh, 3Fh, 0DFh, 0CFh, 90h
	DB	3Fh, 7Fh, 5Fh, 60h, 7Fh, 3Fh, 00h, 00h
	DB	0F0h, 0F8h, 78h, 0F8h, 0FCh, 0F8h, 0F0h, 08h
	DB	0FCh, 0FEh, 0FAh, 06h, 0FEh, 0C4h, 38h, 38h 

; 06
	DB	0Fh, 1Fh, 1Fh, 20h, 1Fh, 1Fh, 0Fh, 10h
	DB	1Fh, 1Fh, 11h, 1Fh, 1Fh, 0Eh, 0FCh, 0FCh
	DB	0F0h, 0E8h, 98h, 7Ch, 0E8h, 0FCh, 0F8h, 00h
	DB	0D8h, 0F8h, 08h, 0F8h, 0F8h, 3Fh, 3Fh, 00h

; 07
	DB	0Fh, 1Fh, 1Eh, 1Dh, 33h, 0Fh, 6Bh, 67h 
	DB	58h, 3Fh, 5Fh, 60h, 7Fh, 3Fh, 00h, 00h
	DB	0F8h, 0F8h, 78h, 0B8h, 0CCh, 0F0h, 0D0h, 0E0h
	DB	18h, 0FCh, 0FAh, 06h, 0FEh, 0C4h, 38h, 38h 

; 08
	DB	0Fh, 17h, 19h, 3Eh, 17h, 3Fh, 1Fh, 00h
	DB	7Fh, 02h, 1Fh, 1Fh, 1Fh, 0FCh, 0FCh, 00h
	DB	0F0h, 0F8h, 0F8h, 04h, 0F8h, 0F8h, 0F0h, 04h
	DB	0FEh, 0EFh, 5Eh, 0BCh, 0F8h, 78h, 3Fh, 3Fh 

; 09
	DB	0Fh, 1Fh, 1Eh, 1Fh, 3Fh, 0DFh, 0CFh, 90h
	DB	3Fh, 7Fh, 5Fh, 60h, 7Fh, 3Fh, 00h, 00h
	DB	0F0h, 0F8h, 7Ah, 0FAh, 0FEh, 0FAh, 0F2h, 0Ah
	DB	0FCh, 0FEh, 0FBh, 06h, 0FEh, 0C4h, 38h, 38h 

; 0A
	DB	0Fh, 1Fh, 1Fh, 20h, 1Fh, 1Fh, 2Fh, 70h 
	DB	0FDh, 77h, 3Ah, 1Dh, 0Fh, 0FCh, 0FCh, 00h
	DB	0F0h, 0E8h, 98h, 7Ch, 0E8h, 0FCh, 0F8h, 00h
	DB	0FEh, 40h, 0F8h, 0F8h, 0F8h, 38h, 3Fh, 3Fh 

; 0B
	DB	0Fh, 1Fh, 1Eh, 1Dh, 33h, 0Fh, 0Bh, 07h
	DB	38h, 7Fh, 0CFh, 4Ch, 2Bh, 2Fh, 1Ch, 1Ch
	DB	0F0h, 0F8h, 78h, 0B8h, 0CCh, 0F0h, 0D6h, 0E6h
	DB	1Ah, 0FCh, 3Eh, 0FEh, 0FEh, 0FCh, 00h, 00h

; 0C
	DB	0Fh, 17h, 19h, 3Eh, 17h, 3Fh, 1Fh, 00h
	DB	7Fh, 02h, 1Fh, 1Fh, 1Fh, 1Ch, 0FCh, 0FCh
	DB	0F0h, 0F8h, 0F8h, 04h, 0F8h, 0F8h, 0F4h, 0Eh
	DB	0BFh, 0EEh, 5Ch, 0B8h, 0F0h, 3Fh, 3Fh, 00h

; 0D
	DB	0Fh, 1Fh, 1Eh, 1Fh, 3Fh, 1Fh, 0Fh, 10h
	DB	3Fh, 7Fh, 5Fh, 60h, 7Fh, 23h, 1Ch, 1Ch
	DB	0F0h, 0F8h, 7Ah, 0FAh, 0FEh, 0FBh, 0F3h, 09h
	DB	0FCh, 0FEh, 0FBh, 06h, 0FEh, 0FCh, 00h, 00h

; 0E
	DB	0Fh, 1Fh, 1Fh, 20h, 1Fh, 1Fh, 0Fh, 20h 
	DB	7Fh, 0F7h, 7Ah, 3Dh, 1Fh, 1Eh, 0FCh, 0FCh
	DB	0F0h, 0E8h, 98h, 7Ch, 0E8h, 0FCh, 0F8h, 00h
	DB	0FEh, 40h, 0F8h, 0F8h, 0F8h, 3Fh, 3Fh, 00h

; 0F
	DB	0Fh, 1Fh, 1Eh, 1Dh, 33h, 0Fh, 6Bh, 67h 
	DB	58h, 3Fh, 4Fh, 0CCh, 6Bh, 2Fh, 00h, 00h
	DB	0F0h, 0F8h, 78h, 0B8h, 0CCh, 0F0h, 0D0h, 0E0h
	DB	18h, 0FCh, 3Eh, 0FEh, 0FEh, 0C4h, 38h, 38h 

; 10
	DB	0Fh, 1Fh, 3Dh, 39h, 31h, 31h, 33h, 1Fh
	DB	0CFh, 33h, 0Ch, 03h, 00h, 0Fh, 30h, 0C0h
	DB	0F0h, 0F8h, 0BCh, 9Ch, 8Ch, 8Ch, 9Ch, 0F8h
	DB	0F0h, 0C0h, 0C7h, 38h, 0C0h, 00h, 0C7h, 38h 

; 11
	DB	0Fh, 1Fh, 3Eh, 3Ch, 38h, 38h, 3Ch, 1Fh
	DB	0Fh, 03h, 0E3h, 1Ch, 00h, 03h, 0E3h, 1Ch
	DB	0F0h, 0F8h, 0BCh, 9Ch, 8Ch, 8Ch, 0CCh, 0F8h
	DB	0F3h, 0CCh, 30h, 0C0h, 00h, 0F0h, 0Ch, 03h

; unused
	DB	2Ch, 18h, 0ACh, 46h, 5Eh, 0C1h, 2Ah, 0C2h
	DB	0C2h, 0C1h, 8Ah, 0CCh, 60h, 00h, 02h, 0ACh
	DB	2Ch, 2Ch, 19h, 22h, 46h, 4Fh, 0C1h, 2Ah 
	DB	0C2h, 0C2h, 0C1h, 92h, 64h, 60h, 00h, 02h

; 12
	DB	30h, 30h , 78h , 0FCh, 0FCh, 0FEh, 0FDh, 79h 
	DB	33h , 32h , 0Fh, 00h, 01h, 02h, 01h, 00h
	DB	0Ch, 0Ch, 1Eh, 3Fh , 3Fh , 7Fh , 0BFh, 9Eh
	DB	0CCh, 4Ch , 0B0h, 40h , 84h, 4Eh , 9Ah, 0E1h

; 13
	DB	84h, 84h, 84h, 0CCh, 0CCh, 0CEh, 79h, 79h
	DB	33h, 32h, 0Dh, 02h, 21h, 72h, 59h, 87h
	DB	21h, 21h, 21h, 33h, 33h, 73h, 9Eh, 9Eh
	DB	0CCh, 0CCh, 0B0h, 40h, 80h, 40h, 80h, 00h

; 14
	DB	0Ch, 19h, 13h, 3Ah, 79h, 7Fh, 0FEh, 0FDh
	DB	0FBh, 0F7h, 0B5h, 0D5h, 0C8h, 0C4h, 40h, 20h
	DB	30h, 98h, 0C8h, 5Ch, 9Eh, 0FEh, 7Fh, 0BFh
	DB	0DFh, 0EFh, 0AFh, 0ABh, 13h, 23h, 02h, 04h

; 15
	DB	06h, 1Dh, 13h, 3Ah, 39h, 3Fh, 3Fh, 3Eh
	DB	37h, 35h, 35h, 15h, 1Ah, 0Ah, 0Dh, 05h
	DB	60h, 0B8h, 0C8h, 5Ch, 9Ch, 0FCh, 0FCh, 7Ch
	DB	0ECh, 0ACh, 0ACh, 0A8h, 58h, 50h, 0B0h, 0A0h

; 16
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh

; 17
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh

; 18
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0B0h, 0B0h, 98h, 0DCh, 0DEh, 0CFh, 0E0h, 0FFh
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0Dh, 0Dh, 19h, 3Bh, 7Bh, 0F3h, 07h, 0FFh

; 19
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh

; 1A
	DB	0FFh, 0E0h, 0CFh, 0DEh, 0DCh, 98h, 0B0h, 0B0h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0FFh, 07h, 0F3h, 7Bh, 3Bh, 19h, 0Dh, 0Dh
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

; 1B
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

; 1C
	DB	80h, 60h, 60h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

; 1D
	DB	0C0h, 0C0h, 20h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

; 1E
	DB	00h, 00h, 00h, 00h, 00h, 00h, 03h, 03h
	DB	01h, 01h, 02h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 20h, 60h, 80h
	DB	0C0h, 20h, 00h, 00h, 00h, 00h, 00h, 00h

; 1F
	DB	00h, 00h, 00h, 10h, 1Ch, 0Fh, 0Fh, 0Fh
	DB	07h, 0Fh, 08h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 0C0h, 0F0h, 0C0h, 0C0h, 80h
	DB	0C0h, 0E0h, 30h, 00h, 00h, 00h, 00h, 00h

; 20
	DB	00h, 11h, 89h, 8Fh, 7Fh, 3Fh, 7Fh, 0FFh
	DB	7Fh, 7Fh, 7Fh, 3Fh, 4Fh, 0Fh, 0Ch, 18h
	DB	80h, 81h, 03h, 0Eh, 1Eh, 7Ch, 0FCh, 0FFh
	DB	0FEh, 0FEh, 0F0h, 0F0h, 0F8h, 3Ch, 0Eh, 03h

; 21
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 01h, 00h, 03h, 03h
	DB	08h, 04h, 06h, 16h, 10h, 3Fh, 7Fh, 08h
	DB	70h, 0E0h, 0FCh, 9Eh, 0F8h, 30h, 0FCh, 0FEh

; 22
	DB	00h, 00h, 0C0h, 0E0h, 0F8h, 0E2h, 0FFh, 7Fh
	DB	1Ch, 07h, 0F7h, 60h, 07h, 07h, 00h, 07h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 0C0h, 0C0h, 0E0h, 0E0h, 0E0h, 30h, 0F0h

; 23
	DB	07h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 1Eh, 3Fh, 7Fh, 0FFh, 0D7h, 57h
	DB	0ECh, 2Eh, 0E2h, 6Fh, 0Fh, 7Fh, 3Fh, 7Fh
	DB	7Fh, 3Fh, 0B0h, 0EFh, 0DFh, 0BFh, 0B5h, 0D5h

; 24
	DB	17h, 36h, 77h, 0F7h, 0F7h, 0F9h, 0FCh, 0F8h
	DB	0C7h, 0DFh, 3Fh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
	DB	0F0h, 00h, 0F8h, 0FFh, 0FFh, 0FFh, 0FFh, 3Fh
	DB	3Fh, 0BFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_CHARSET_4x:
; 30 (wall)
L99A4:	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h

	DB	9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah
	DB	9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah
	DB	9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah
	DB	9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah, 9Ah

; 34 (box)
	DB	0FFh, 80h, 9Fh, 0AFh, 0B7h, 0B8h, 0BBh, 0BBh
	DB	0FFh, 01h, 0F9h, 0F5h, 0EDh, 1Dh, 0DDh, 0DDh
	DB	0BBh, 0BBh, 0B8h, 0B7h, 0AFh, 9Fh, 80h, 0FFh
	DB	0DDh, 0DDh, 1Dh, 0DDh, 0EDh, 0F5h, 01h, 0FFh

	DB	0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh
	DB	0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh
	DB	0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh
	DB	0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh, 0CAh

; 38 (gun)
	DB	00h, 00h, 00h, 00h, 0FFh, 0FFh, 3Fh, 1Fh
	DB	00h, 00h, 00h, 01h, 0FFh, 0FFh, 0F0h, 0F0h
	DB	1Ah, 1Ah, 38h, 3Fh, 78h, 0F8h, 00h, 00h
	DB	80h, 80h, 80h, 00h, 00h, 00h, 00h, 00h

	DB	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
	DB	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
	DB	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
	DB	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h

; 3C (jewel)
	DB	07h, 1Fh, 0Fh, 07h, 0Fh, 11h, 11h, 20h
	DB	0E0h, 0F8h, 0F0h, 0E0h, 0F0h, 88h, 88h, 04h
	DB	20h, 20h, 10h, 10h, 08h, 07h, 00h, 00h
	DB	04h, 04h, 08h, 08h, 10h, 0E0h, 00h, 00h

	DB	0B0h, 0B0h, 0B0h, 0B0h, 0E0h, 0E0h, 0E0h, 0E0h
	DB	0B0h, 0B0h, 0B0h, 0B0h, 0E0h, 0E0h, 0E0h, 0E0h
	DB	0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h
	DB	0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h, 0E0h

; 4C (exit wall)
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h
	DB	0CCh, 33h, 0CCh, 33h, 0CCh, 33h, 0CCh, 33h

	DB	9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh
	DB	9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh
	DB	9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh
	DB	9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh, 9Dh

; 50 (warp)
	DB	0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh
	DB	0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh
	DB	0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh
	DB	0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh

	DB	0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh
	DB	0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh
	DB	0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh
	DB	0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh, 0FEh

; 54 (nest #1)
	DB	01h, 03h, 06h, 0Dh, 1Ah, 35h, 6Ah, 0D4h
	DB	80h, 0C0h, 60h, 0B0h, 58h, 0ACh, 56h, 2Bh
	DB	0D4h, 6Ah, 35h, 1Ah, 0Dh, 06h, 03h, 01h
	DB	2Bh, 56h, 0ACh, 58h, 0B0h, 60h, 0C0h, 80h

	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h

; 58 (nest #2)
	DB	01h, 03h, 06h, 0Ch, 19h, 32h, 65h, 0CBh
	DB	80h, 0C0h, 60h, 30h, 98h, 4Ch, 0A6h, 0D3h
	DB	0CBh, 65h, 32h, 19h, 0Ch, 06h, 03h, 01h
	DB	0D3h, 0A6h, 4Ch, 98h, 30h, 60h, 0C0h, 80h

; unused
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
	DB	90h, 90h, 90h, 90h, 90h, 90h, 90h, 90h
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_CHARSET_1x:
; 60 (life)
L9BA4:	DB	18h, 3Ch, 3Ch, 18h, 7Eh, 0BDh, 7Eh, 0C3h
	DB	0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h, 0F0h
	
; FF
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	DB	00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

; 61
	DB	00h, 00h, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	DB	0B0h, 0B0h, 0B0h, 0B0h, 0B0h, 0B0h, 0B0h, 0B0h

; ($62 = sphynx room)
	DB	00h, 00h, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	DB	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h

; ($63 = non visited room)
	DB	00h, 00h, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	DB	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h

; ($64 = current room)
	DB	00h, 00h, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh, 3Fh
	DB	70h, 70h, 70h, 70h, 70h, 70h, 70h, 70h
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
LITERAL:
.DASHES: ; 9C04
	DB	$27, $27, $27, $27, $27, $27, $27	; -------
.PYRAMID: ; 9C0B
	DB	$19, $22, $1B, $0A, $16, $12, $0D	; PYRAMID
.TnESOFT: ; 9C12
	DB	$1D, $24, $0E, $2B, $2C, $2D, $2E	; T&Esoft
.Y1983: ; 9C19
	DB	$01, $09, $08, $03			; 1983
.HIGH: ; 9C1D
	DB	$11, $12, $10, $11			; HIGH
.SCORE: ; 9C21
	DB	$1C, $0C, $18, $1B, $0E			; SCORE
.ROOM: ; 9C26
	DB	$1B, $18, $18, $16			; ROOM
.AIR: ; 9C2A
	DB	$0A, $12, $1B				; AIR

; 9C2D (unused)
	DB	$0D, $12, $0A, $16, $18, $17, $0D	; DIAMOND (unused)
; 9C34 (unused)
	DB	$00, $00, $00, $00, $00, $00, $00	; 7x $00 (unused)
	
.WALL_x25: ; 9C3B
	DB	$30, $30, $30, $30, $30, $30, $30, $30	; 25x wall
	DB	$30, $30, $30, $30, $30, $30, $30, $30
	DB	$30, $30, $30, $30, $30, $30, $30, $30
	DB	$30
.ROOMS_x7:	; 9C54
	DB	$63, $63, $63, $63, $63, $63, $63	; 7x black room
	
; 9C5B (unused)
	DB	$0D, $12, $0A, $16, $18, $17, $0D	; DIAMOND (unused)

.BLANK_x21: ; 9C62
	DB	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	DB	$FF, $FF, $FF, $FF, $FF, $FF, $FF
.BLANK_x6: ; 9C71
	DB	$FF, $FF, $FF, $FF, $FF, $FF
	
.LIVES_x6: ; 9C77
	DB	$60, $60, $60, $60, $60, $60		; 6x life
	
.CONGRATULATIONS: ; 9C7D
	DB	$0C, $18, $17, $10, $1B, $0A, $1D, $1E
	DB	$15, $0A, $1D, $12, $18, $17		; CONGRATULATION
.TRY_THE_NEXT_PYRAMID: ; 9C8B
	DB	$1D, $1B, $22, $FF			; TRY_
	DB	$1D, $11, $0E, $FF			; THE_
	DB	$17, $0E, $21, $1D, $FF			; NEXT_
	DB	$19, $22, $1B, $0A, $16, $12, $0D	; PYRAMID
.HIT_SPACE_KEY: ; 9C9F
	DB	$11, $12, $1D, $FF			; HIT_
	DB	$1C, $19, $0A, $0C, $0E, $FF		; SPACE_
	DB	$14, $0E, $22				; KEY
.MSX: ; 9CAC
	DB	$16, $1C, $21				; MSX
.PYRAMID_WARP: ; 9CAF
	DB	$19, $22, $1B, $0A, $16, $12, $0D, $FF	; PYRAMID_
	DB	$20, $0A, $1B, $19			; WARP
.COPYRIGHT: ; 9CBB
	DB	$28, $0C, $29, $FF			; (C)_
	DB	$01, $09, $08, $03, $FF			; 1983_
	DB	$0B, $22, $FF				; BY_
	DB	$1D, $24, $0E, $FF			; T&E_
	DB	$1C, $18, $0F, $1D			; SOFT
.GAME_OVER: ; 9CCF
	DB	$10, $0A, $16, $0E, $FF			; GAME_
	DB	$18, $1F, $0E, $1B			; OVER
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_ROOMS:
; 00				; XXXXXXXXXXXXX
L9CD8:	DB	0D1h, 040h	; XBX^X___X_X_X
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

; -----------------------------------------------------------------------------
DATA_RANDOMIZE_PYRAMID_FLOOR1:
L9EEB:	DB	01h, 05h, 03h, 02h, 06h, 04h, 07h
	DB	04h, 05h, 01h, 07h, 03h, 06h, 02h
	DB	05h, 02h, 06h, 04h, 01h, 07h, 03h
	DB	06h, 01h, 04h, 05h, 02h, 03h, 07h
	
DATA_RANDOMIZE_PYRAMID_FLOOR2:
L9F03:	DB	08h, 0Ch, 0Ah, 09h, 0Bh
	DB	0Bh, 08h, 0Ah, 09h, 0Ch
	DB	0Ch, 0Ah, 09h, 0Bh, 08h
	DB	0Ah, 09h, 08h, 0Ch, 0Bh
	
DATA_RANDOMIZE_PYRAMID_FLOOR3:
L9F19:	DB	0Dh, 0Eh, 0Fh
	DB	0Eh, 0Dh, 0Fh
	DB	0Fh, 0Eh, 0Dh
	DB	0Dh, 0Fh, 0Eh
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SPHYNX_SPRATR:
L9F28:	DB	07h, 50h, 84h, 04h
	DB	07h, 70h, 88h, 04h
	DB	27h, 50h, 8Ch, 04h
	DB	27h, 70h, 90h, 04h
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SOUND.MUTE_CHANNELS:
L9F38:	DB	01h ; length
	DB	07h, 0BFh
	
DATA_SOUND.SPHYNX:
L9F3B:	DB	0Dh ; length
	DB	00h, 01h
	DB	01h, 01h
	DB	02h, 05h
	DB	03h, 02h
	DB	04h, 0Fh
	DB	05h, 03h
	DB	06h, 05h
	DB	07h, 0B0h
	DB	08h, 10h
	DB	09h, 10h
	DB	0Ah, 10h
	DB	0Ch, 0FFh
	DB	0Dh, 00h
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
L9F56:	db	" PYRAMID WARP", $a0
	db	" 1983. 9. 15", $a0
	db	" by T&E SOFT", $a0
	db	" EIZI KATO !!", $a0
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Padding to a 8kB boundary
L9F8C:	ds	($ OR $1fff) -$ +1, $00
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; RAM
	org	$c000, $f380
	
box1: ; C000H
	.data:		rb 4	; C000H
	.content:	rb 1	; C004H
box2: ; C005H
	.data:		rb 4	; C005H
	.content:	rb 1	; C009H
box3: ; C00AH
	.data:		rb 4	; C00AH
	.content:	rb 1	; C00EH
door1: ; C00FH
	.type:		rb 1	; C00FH ; (0 = v, 1 = ^)
	.spratr_y:	rb 1	; C010H
	.spratr_x:	rb 1	; C011H
	.spratr_pat:	rb 1	; C012H
	.spratr_color:	rb 1	; C013H
door2: ; c014H
	.type:		rb 1	; C014H ; (0 = v, 1 = ^)
	.spratr_y:	rb 1	; C015H
	.spratr_x:	rb 1	; C016H
	.spratr_pat:	rb 1	; C017H
	.spratr_color:	rb 1	; C018H
player: ; C019H
	.spratr_y:	rb 1	; C019H
	.spratr_x:	rb 1	; C01AH
	.spratr_pat:	rb 1	; C01BH
	.spratr_color:	rb 1	; C01CH
	.direction:	rb 1	; C01DH
skull: ; C01EH
	.spratr_y:	rb 1	; C01EH
	.spratr_x:	rb 1	; C01FH
	.spratr_pat:	rb 1	; C020H
	.spratr_color:	rb 1	; C021H
	.direction:	rb 1	; C022H
	.status:	rb 1	; C023H
			rb 1	; C024H (skull related)
			rb 1	; C025H (skull related)
scorpion1: ; C026H
	.spratr_y:	rb 3	; C026H
	.spratr_color:	rb 1	; C029H
			rb 1	; C02AH (unused?)
	.status:	rb 1	; C02BH
			rb 1	; C02CH ($12, never read)
			rb 1	; C02DH ($04, never read)
bat1: ; C02EH
	.spratr_y:	rb 3	; C02EH
	.spratr_color:	rb 1	; C031H
			rb 1	; C032H (unused?)
	.status:	rb 1	; C033H
			rb 1	; C034H ($14, never read)
			rb 1	; C035H ($05, never read)
			rb 5	; C036H (unused?)
			rb 1	; C03BH ($00, never read)
			rb 1	; C03CH ($16, never read)
			rb 1	; C03DH ($06, never read)
scorpion2: ; C03EH
	.spratr_y:	rb 3	; C03EH
	.spratr_color:	rb 1	; C041H
			rb 1	; C042H (unused?)
	.status:	rb 1	; C043H
			rb 1	; C044H ($12, never read)
			rb 1	; C045H ($07, never read)
bat2: ; C046H
	.spratr_y:	rb 3	; C046H
	.spratr_color:	rb 1	; C049H
			rb 1	; C04AH (unused?)
	.status:	rb 1	; C04BH
			rb 1	; C04CH ($14, never read)
			rb 1	; C04DH ($08, never read)
			rb 5	; C04EH (unused?)
			rb 1	; C053H ($00, never read)
			rb 1	; C054H ($16, never read)
			rb 1	; C055H ($09, never read)
bullet: ; C056H
	.spratr_y:	rb 1	; C056H
	.spratr_x:	rb 1	; C057H
	.spratr_pat:	rb 1	; C058H
	.spratr_color:	rb 1	; C059H
	.direction:	rb 1	; C05AH
	.status:	rb 1	; C05BH
nest: ; C05CH
	.spratr_y:	rb 1	; C05CH
	.spratr_x:	rb 1	; C05DH
player_has_gun:		rb 1	; C05EH	
aux.frame_counter:	rb 1	; C05FH
new_player_direction:	rb 1	; C060H
direction_table:	rb 4	; C061H
current_enemy_ptr:	rb 2	; C065H
			rb 1	; C067H (unused?)
			rb 1	; C068H (unused?)
			rb 1	; C069H (???)
check_wall_for_player:	rb 1	; C06AH
			rb 1	; C06BH ($01, never read)
			rb 1	; C06CH ($00, never read)
			rb 1	; C06DH (???)
exit:
	.blink_counter:	rb 1	; C06EH
	.blink_flag:	rb 1	; C06FH
	.is_open:	rb 1	; C070H
game: ; C071H
	.air_left_bcd:	rb 4	; C071H
	.short_delay:	rb 1	; C075H
	.current_room:	rb 1	; C076H
	.air_left:	rb 4	; C077H
	.first_pyramid:	rb 1	; C07BH
	.lives:		rb 1	; C07CH
aux.how_many_bytes:	rb 2	; C07DH
game.high_score_bcd:	rb 3	; C07FH (6 digits)
game.score_bcd:		rb 3	; C082H (6 digits)
pyramid: ; C085H
	.room_index:	rb 1	; C085H
			rb 1	; C086H (unused?)
	.room_array:	rb 16	; C087H (7+5+3+1 rooms)
	.room_namtbl_ptr:rb 2	; C097H
sound_buffer: ; C099H
	.start:		rb 1+20	; C099H
	.unknown:	rb 1+20	; C0AEH
	.end:		rb 1+20	; C0C3H
aux.frame_counter_2:	rb 1	; C0D8H
			rb 1	; C0D9H (unused?)
player_entering_door:	rb 1	; C0DAH
			rb 1	; C0DBH (unused?)
			rb 1	; C0DCH
; -----------------------------------------------------------------------------

; EOF
