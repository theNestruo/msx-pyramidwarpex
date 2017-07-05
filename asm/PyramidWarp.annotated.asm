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
	ld	a,34h		; '4'
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
	ld	(high_score_bcd),a
	ld	(high_score_bcd +1),bc
	ld	(score_bcd),a
	ld	(score_bcd +1),bc
	
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
	ld	(player.lives),a
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
	ld	(score_bcd),a
	ld	(score_bcd +1),bc
	ld	de,0B19h
	call	PRINT_SCORE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8B66
	; --- START PROC L82E7 ---

; -----------------------------------------------------------------------------
NEW_PYRAMID:
; Room 0
L82E7:	xor	a
	ld	(0C085h),a
	
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
	ld	ix,pyramid_rooms
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
DEC_LIVES_AND_ENTER_NEW_ROOM:
; Clear lives
L836A:	ld	b,05h
	ld	hl,LITERAL.BLANK_x6
	ld	de,1719h	; address or value?
	call	WRTVRM_CHARS
; Decreases lives
	ld	a,(player.lives)
	dec	a
	ld	(player.lives),a
; If no lives, go to GAME OVER
	jp	m,GAME_OVER
; Prints lives
	or	a
	jr	z,ENTER_NEW_ROOM ; (no lives to print)
	ld	b,a
	ld	de,1719h
	ld	hl,LITERAL.LIVES_x6
	call	WRTVRM_CHARS
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8380, 89DE
	; --- START PROC L838C ---
	
; -----------------------------------------------------------------------------
ENTER_NEW_ROOM:
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
	ld	a,(0C085h)
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
	ld	(curent_room_namtbl_ptr),de
	
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
; ------VVVV----falls through--------------------------------------------------

	
; -----------------------------------------------------------------------------
	xor	a
	ld	(aux.frame_counter_2),a
	; Referenced from 8439
L83FE:	xor	a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl

	; Referenced from 842E
L8403:	sla	b
	rl	c
	push	hl
	push	bc
	push	af
	jr	nc,L841C
	inc	a
	add	a,a
	ld	e,a
	ld	a,(aux.frame_counter_2)
	add	a,a
	inc	a
	ld	d,a
	ld	a,30h		; '0'
	call	WRTVRM_2x2_CHAR
	jr	L8428

	; Referenced from 840A
L841C:	inc	a
	add	a,a
	ld	e,a
	ld	a,(aux.frame_counter_2)
	add	a,a
	inc	a
	ld	d,a
	call	L8EEB

	; Referenced from 841A
L8428:	pop	af
	pop	bc
	pop	hl
	inc	a
	cp	0Bh
	jr	nz,L8403
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
	cp	0Bh
	jr	nz,L83FE
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
	ld	(0C070h),a
	ld	(0C06Fh),a
	ld	(0C06Dh),a
	ld	(0C05Eh),a
	ld	a,01h
	ld	(0C060h),a
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
	jr	L84D1

	; Referenced from 85E6, 8634, 8A47
	; --- START PROC L849B ---
L849B:	ld	bc,03E8h	; address or value?
	xor	a

	; Referenced from 84A2
L849F:	sbc	hl,bc
	inc	a
	jr	nc,L849F
	add	hl,bc
	dec	a
	ld	(0C071h),a
	ld	bc,0064h	; address or value?
	xor	a

	; Referenced from 84B0
L84AD:	sbc	hl,bc
	inc	a
	jr	nc,L84AD
	add	hl,bc
	dec	a
	ld	(0C072h),a
	ld	bc,000Ah	; address or value?
	xor	a

	; Referenced from 84BE
L84BB:	sbc	hl,bc
	inc	a
	jr	nc,L84BB
	add	hl,bc
	dec	a
	ld	(0C073h),a
	ld	a,l
	ld	(0C074h),a
	ld	hl,0C071h	; address or value?
	ld	b,04h
	jp	WRTVRM_CHARS

	; Referenced from 8499
	; --- START PROC L84D1 ---
L84D1:	ld	a,(game.current_room)
	cp	10h
	jp	z,L85CC
	
; Prints box1 in screen
	ld	ix,box1
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	call	TO_VRAM_COORDINATES
	xor	a
	ld	(ix+00h),a
	push	hl
	ld	a,34h		; '4'
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
	ld	a,34h		; '4'
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
	ld	a,34h		; '4'
	call	WRTVRM_2x2_CHAR
	pop	hl
	
; Prints ...
	ld	ix,0C05Ch	; address or value?
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
	ld	b,00h
	ld	a,e
	and	7Fh		; ''
	cp	e
	jr	z,.L853E
	inc	b
.L853E: ld	(ix+00h),b
	inc	ix
	ld	e,a
	call	TO_VRAM_COORDINATES
	inc	ix
	ld	a,03h
	ld	(ix+00h),a
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
	ld	ix,door2
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	b,00h
	ld	a,e
	and	7Fh		; ''
	cp	e
	jr	z,L8572
	inc	b

	; Referenced from 856F
L8572:	ld	(ix+00h),b
	inc	ix
	ld	e,a
	call	TO_VRAM_COORDINATES
	inc	ix
	ld	a,03h
	ld	(ix+00h),a
	ld	a,b
	add	a,a
	add	a,18h
	add	a,a
	add	a,a
	ld	(door2.spratr_pat),a
	ld	de,door2.spratr_y
	ld	a,01h
	call	PUT_SPRITE
	ld	a,4Ch		; 'L'
	ld	de,090Ah	; address or value?
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
	inc	e
	inc	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
	inc	e
	inc	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
	inc	d
	inc	d
	inc	d
	inc	d
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
	dec	e
	dec	e
	push	af
	push	de
	call	WRTVRM_2x2_CHAR
	pop	de
	pop	af
	dec	e
	dec	e
	call	WRTVRM_2x2_CHAR
	jr	L8622

	; Referenced from 84D6
L85CC:	ld	de,0B0Ch	; address or value?
	ld	a,34h		; '4'
	call	WRTVRM_2x2_CHAR
	ld	hl,0BB8h	; address or value?
	ld	a,(game.first_pyramid)
	or	a
	jr	z,L85E0
	ld	hl,07D0h	; address or value?

	; Referenced from 85DB
L85E0:	ld	(game.air_left),hl
	ld	de,0E19h	; address or value?
	call	L849B
	ld	a,06h
	ld	de,101Eh	; address or value?
	call	WRTVRM_1x1_CHAR
	xor	a
	ld	(door1.spratr_y),a
	ld	(door2.spratr_y),a
	ld	hl,player.spratr_y
	ld	a,98h
	ld	(hl),a
	inc	hl
	ld	a,60h		; '`'
	jr	L8640
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
L8622:	ld	hl,0BB8h	; address or value?
	ld	a,(game.first_pyramid)
	or	a
	jr	z,L862E
	ld	hl,07D0h	; address or value?

	; Referenced from 8629
L862E:	ld	(game.air_left),hl
	ld	de,0E19h	; address or value?
	call	L849B
	ld	hl,player.spratr_y
	ld	a,58h		; 'X'
	ld	(hl),a
	inc	hl
	ld	a,60h		; '`'

	; Referenced from 8601
	; --- START PROC L8640 ---
L8640:	ld	(hl),a
	inc	hl
	ld	a,04h
	ld	(hl),a
	inc	hl
	ld	a,0Bh
	ld	(hl),a
	inc	hl
	ld	a,01h
	ld	(hl),a
	ld	de,player.spratr_y
	ld	a,02h
	call	PUT_SPRITE
	ld	hl,8EE6h	; address or value?
	call	RANDOMIZE
	and	03h
	dec	a
	jr	z,L8665
	dec	a
	jr	z,L8664
	inc	hl

	; Referenced from 8661
L8664:	inc	hl

	; Referenced from 865E
L8665:	ld	a,(hl)
	inc	hl
	ld	(box1.content),a
	ld	a,(hl)
	inc	hl
	ld	(box2.content),a
	ld	a,(hl)
	ld	(box3.content),a
	ld	b,0Ah

	; Referenced from 867A
L8675:	push	bc
	call	L8C47
	pop	bc
	djnz	L8675

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
	ld	de,(curent_room_namtbl_ptr)
	ld	b,63h ; ($63 = non visited room)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L86AC
	inc	b ; ($64 = current room)
.L86AC:	ld	a,b
	call	WRTVRM_1x1_CHAR
	
; 
	ld	a,0FFh
	ld	(0C06Ah),a
	ld	hl,player.spratr_y
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	call	L8B69
	xor	a
	ld	(0C06Ah),a
	call	GTSTCK_ANY
	or	a
	jr	z,L86D1
	dec	a
	srl	a
	inc	a
	and	03h
	ld	(0C060h),a

	; Referenced from 86C6
L86D1:	ld	a,(0C060h)
	ld	hl,0C061h	; address or value?
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	jr	z,L86E4
	ld	a,(0C060h)
	ld	(player.direction),a

	; Referenced from 86DC
L86E4:	ld	a,(player.direction)
	ld	hl,0C061h	; address or value?
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	jr	z,L86F3
	ld	a,02h

	; Referenced from 86EF
L86F3:	ld	b,a
	ld	a,(player.direction)
	ld	c,a
	ld	a,b
	ld	hl,player.spratr_y
	srl	c
	jr	c,L8701
	inc	hl ; player.spratr_x

	; Referenced from 86FE
L8701:	srl	c
	jr	c,L8707
	neg

	; Referenced from 8703
L8707:	add	a,(hl)
	ld	(hl),a
	xor	a
	ld	(0C0DAh),a
	ld	hl,player.spratr_y
	ld	a,(door1.spratr_y)
	cp	(hl)
	jr	nz,L873B
	inc	hl
	ld	a,(door1.spratr_x)
	cp	(hl)
	jr	nz,L873B
	call	L912A
	ld	hl,(door2.spratr_y)
	ld	(player.spratr_y),hl
	ld	a,(door2.data)
	add	a,a
	ld	b,a
	ld	a,01h
	add	a,b
	ld	(player.direction),a
	ld	(0C060h),a
	ld	a,0FFh
	ld	(0C0DAh),a
	jr	L8767

	; Referenced from 8714, 871B
L873B:	ld	hl,player.spratr_y
	ld	a,(door2.spratr_y)
	cp	(hl)
	jr	nz,L8767
	inc	hl
	ld	a,(door2.spratr_x)
	cp	(hl)
	jr	nz,L8767
	call	L912A
	ld	hl,(door1.spratr_y)
	ld	(player.spratr_y),hl
	ld	a,(door1.data)
	add	a,a
	ld	b,a
	ld	a,01h
	add	a,b
	ld	(player.direction),a
	ld	(0C060h),a
	ld	a,0FFh
	ld	(0C0DAh),a

	; Referenced from 8739, 8742, 8749
L8767:	ld	a,(player.direction)
	ld	b,a
	ld	a,(0C05Eh)
	add	a,b
	ld	b,a
	ld	a,(aux.frame_counter)
	and	02h
	jr	z,L877B
	ld	a,04h
	add	a,b
	ld	b,a

	; Referenced from 8775
L877B:	ld	a,b
	add	a,a
	add	a,a
	ld	(player.spratr_pat),a
	ld	b,0Bh
	ld	a,(0C05Eh)
	or	a
	jr	z,L878B
	ld	b,0Fh

	; Referenced from 8787
L878B:	ld	a,b
	ld	(player.spratr_color),a
	ld	de,player.spratr_y
	ld	a,02h
	call	PUT_SPRITE
	ld	a,(0C0DAh)
	or	a
	call	z,L910C
	ld	a,(0C05Eh)
	or	a
	jr	z,L87E8
	ld	a,(bullet.status)
	or	a
	jr	nz,L87E8
	call	GTTRIG_ANY
	or	a
	jr	z,L87E8
	ld	ix,player
	ld	iy,bullet
	ld	a,(ix+00h)
	add	a,07h
	ld	(iy+00h),a
	ld	a,(ix+01h)
	add	a,07h
	ld	(iy+01h),a
	ld	a,70h		; 'p'
	ld	(iy+02h),a
	ld	a,0Fh
	ld	(iy+03h),a
	ld	a,(ix+04h)
	ld	(iy+04h),a
	ld	a,0FFh
	ld	(iy+05h),a
	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
	call	L913C

	; Referenced from 87A2, 87A8, 87AE
L87E8:	call	SHORT_DELAY
	ld	a,(skull.status)
	or	a
	jp	z,L8908
	ld	hl,0C01Eh	; address or value?
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	call	L8B69
	ld	hl,0C061h	; address or value?
	ld	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
	inc	hl
	add	a,(hl)
	inc	a
	jr	z,L8815
	ld	hl,0C061h	; address or value?
	ld	a,(skull.direction)
	xor	02h
	call	ADD_HL_A
	xor	a
	ld	(hl),a

	; Referenced from 8806
L8815:	ld	a,(player.spratr_x)
	ld	b,a
	ld	a,(skull.spratr_x)
	srl	a
	srl	b
	ld	c,02h
	cp	b
	jr	z,L8867
	jr	nc,L8828
	inc	c

	; Referenced from 8825
L8828:	ld	a,(player.spratr_y)
	ld	b,a
	ld	a,(skull.spratr_y)
	srl	a
	srl	b
	cp	b
	jr	z,L8898
	jr	nc,L883A
	inc	c
	inc	c

	; Referenced from 8836
L883A:	dec	c
	dec	c
	jr	z,L884E
	dec	c
	jr	z,L8849
	dec	c
	jr	z,L8853
	ld	a,03h
	call	L88C9

	; Referenced from 883F
L8849:	ld	a,02h
	call	L88C9

	; Referenced from 883C
L884E:	ld	a,01h
	call	L88C9

	; Referenced from 8842
L8853:	ld	a,00h
	call	L88C9
	ld	a,03h
	call	L88C9
	ld	a,02h
	call	L88C9
	ld	a,01h
	call	L88C9

	; Referenced from 8823
L8867:	ld	a,(player.spratr_y)
	ld	b,a
	ld	a,(skull.spratr_y)
	srl	a
	srl	b
	cp	b
	jr	nc,L8884
	ld	a,03h
	call	L88C9
	ld	a,00h
	call	L88C9
	ld	a,02h
	call	L88C9

	; Referenced from 8873
L8884:	ld	a,01h
	call	L88C9
	ld	a,00h
	call	L88C9
	ld	a,02h
	call	L88C9
	ld	a,03h
	call	L88C9

	; Referenced from 8834
L8898:	ld	a,(player.spratr_x)
	ld	b,a
	ld	a,(skull.spratr_x)
	srl	a
	srl	b
	cp	b
	jr	c,L88B5
	ld	a,00h
	call	L88C9
	ld	a,01h
	call	L88C9
	ld	a,03h
	call	L88C9

	; Referenced from 88A4
L88B5:	ld	a,02h
	call	L88C9
	ld	a,01h
	call	L88C9
	ld	a,03h
	call	L88C9
	ld	a,00h
	call	L88C9

	; Referenced from 8846, 884B, 8850, 8855, 885A, 885F, 8864, 8877, 887C, 8881, 8886, 888B, 8890, 8895, 88A8, 88AD, 88B2, 88B7, 88BC, 88C1, 88C6
	; --- START PROC L88C9 ---
L88C9:	ld	hl,0C061h	; address or value?
	ld	b,a
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	ret	z
	ld	a,b
	ld	(skull.direction),a
	pop	hl
	ld	hl,0C01Eh	; address or value?
	ld	a,02h
	srl	b
	jr	c,L88E2
	inc	hl

	; Referenced from 88DF
L88E2:	srl	b
	jr	c,L88E8
	neg

	; Referenced from 88E4
L88E8:	add	a,(hl)
	ld	(hl),a
	ld	a,(aux.frame_counter)
	and	02h
	ld	a,10h
	jr	z,L88F4
	inc	a

	; Referenced from 88F1
L88F4:	add	a,a
	add	a,a
	ld	(skull.spratr_pat),a
	ld	a,03h
	ld	de,skull
	call	PUT_SPRITE
	ld	ix,skull
	call	L8DAC

	; Referenced from 87EF
	; --- START PROC L8908 ---
L8908:	call	SHORT_DELAY
	ld	a,(bullet.status)
	or	a
	jr	z,L8969
	inc	a
	jr	nz,L8969
	ld	a,(bullet.direction)
	ld	b,a
	ld	a,04h
	ld	hl,0C056h	; address or value?
	srl	b
	jr	c,L8922
	inc	hl

	; Referenced from 891F
L8922:	srl	b
	jr	c,L8928
	neg

	; Referenced from 8924
L8928:	add	a,(hl)
	ld	(hl),a
	ld	a,(aux.frame_counter)
	and	08h
	ld	a,1Ch
	jr	z,L8934
	inc	a

	; Referenced from 8931
L8934:	add	a,a
	add	a,a
	ld	(bullet.spratr_pat),a
	ld	hl,bullet
	ld	d,(hl)
	inc	hl
	ld	e,(hl)
	call	L8BE2
	or	a
	jr	nz,L8961
	ld	hl,bullet.spratr_y
	ld	a,(hl)
	sub	07h
	ld	(hl),a
	inc	hl
	ld	a,(hl)
	sub	07h
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
	call	L9133

	; Referenced from 8943
L8961:	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE

	; Referenced from 890F, 8912
L8969:	call	SHORT_DELAY
	ld	a,(game.current_room)
	cp	10h
	jp	z,CHECK_SPHYNX_ROOM_BOX
	ld	ix,scorpion1
	call	L8C50
	ld	ix,box1
	call	L8E0A
	ld	ix,bat1
	call	L8C50
	ld	a,(0C070h)
	or	a
	jr	z,L89E1
	ld	a,(0C06Eh)
	dec	a
	ld	(0C06Eh),a
	jr	nz,L89B4
	ld	a,0Ah
	ld	(0C06Eh),a
	ld	a,(0C06Fh)
	cpl
	ld	(0C06Fh),a
	ld	de,0B0Ch	; address or value?
	or	a
	jr	z,L89B1
	ld	a,50h		; 'P'
	call	WRTVRM_2x2_CHAR
	jr	L89B4

	; Referenced from 89A8
L89B1:	call	L8EEB

	; Referenced from 8996, 89AF
L89B4:	ld	hl,player.spratr_y
	ld	a,58h		; 'X'
	cp	(hl)
	jr	nz,L89E1
	inc	hl ; player.spratr_x
	ld	a,60h		; '`'
	cp	(hl)
	jr	nz,L89E1
	ld	a,(0C085h)
	inc	a
	ld	(0C085h),a
	ld	de,(curent_room_namtbl_ptr)
	ld	a,61h		; 'a'
	call	WRTVRM_1x1_CHAR
	call	L9070
	ld	de,0500h	; address or value?
	call	ADD_SCORE
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
	jp	ENTER_NEW_ROOM

	; Referenced from 898D, 89BA, 89C0
L89E1:	call	SHORT_DELAY
	ld	ix,box2
	call	L8E0A
	ld	ix,scorpion2
	call	L8C50
	ld	ix,bat2
	call	L8C50
	ld	ix,box3
	call	L8E0A
	ld	ix,bullet
	ld	a,(ix+05h)
	or	a
	jr	z,L8A3A
	inc	a
	jr	z,L8A3A
	dec	a
	dec	a
	ld	(ix+05h),a
	jr	z,L8A2D
	ld	b,1Eh
	cp	04h
	jr	c,L8A1B
	inc	b

	; Referenced from 8A18
L8A1B:	cp	02h
	jr	c,L8A20
	inc	b

	; Referenced from 8A1D
L8A20:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a
	ld	a,06h
	ld	(ix+03h),a
	jr	L8A32

	; Referenced from 8A12
L8A2D:	ld	a,0D1h
	ld	(ix+00h),a

	; Referenced from 8A2B
L8A32:	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE

	; Referenced from 8A08, 8A0B
L8A3A:	call	SHORT_DELAY
	ld	hl,(game.air_left)
	dec	hl
	ld	(game.air_left),hl
	ld	de,0E19h	; address or value?
	call	L849B
	ld	hl,(game.air_left)
	ld	a,h
	or	l
	call	z,L8DCA
	ld	a,(aux.frame_counter)
	and	04h
	ld	b,54h		; 'T'
	jr	z,L8A5D
	ld	b,58h		; 'X'

	; Referenced from 8A59
L8A5D:	ld	a,(0C05Ch)
	srl	a
	srl	a
	srl	a
	ld	d,a
	ld	a,(0C05Dh)
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
L8A88:	ld	(0C070h),a

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
	call	L9121
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
	
	call	L9067
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
	ld	a,(player.lives)
	inc	a
	ld	(player.lives),a
; Increases difficulty
	ld	a,0FFh
	ld	(game.first_pyramid),a
; Enters a new pyramid
	jp	NEW_PYRAMID
; -----------------------------------------------------------------------------

	; Referenced from 86BB, 87F8, 8CAB
	; --- START PROC L8B69 ---

; -----------------------------------------------------------------------------
L8B69:	push	de
	dec	e
	ld	ix,0C061h	; address or value?
	call	L8BE2
	ld	(ix+00h),a
	pop	de
	push	de
	ld	a,0Fh
	add	a,d
	ld	d,a
	dec	e
	call	L8BE2
	and	(ix+00h)
	ld	(ix+00h),a
	inc	ix
	pop	de
	push	de
	dec	d
	call	L8BE2
	ld	(ix+00h),a
	pop	de
	push	de
	dec	d
	ld	a,0Fh
	add	a,e
	ld	e,a
	call	L8BE2
	and	(ix+00h)
	ld	(ix+00h),a
	inc	ix
	pop	de
	push	de
	ld	a,10h
	add	a,e
	ld	e,a
	call	L8BE2
	ld	(ix+00h),a
	pop	de
	push	de
	ld	a,10h
	add	a,e
	ld	e,a
	ld	a,0Fh
	add	a,d
	ld	d,a
	call	L8BE2
	and	(ix+00h)
	ld	(ix+00h),a
	inc	ix
	pop	de
	push	de
	ld	a,10h
	add	a,d
	ld	d,a
	call	L8BE2
	ld	(ix+00h),a
	pop	de
	ld	a,10h
	add	a,d
	ld	d,a
	ld	a,0Fh
	add	a,e
	ld	e,a
	call	L8BE2
	and	(ix+00h)
	ld	(ix+00h),a
	ret

	; Referenced from 8B6F, 8B7C, 8B8A, 8B97, 8BA8, 8BB8, 8BC9, 8BD8, 893F
	; --- START PROC L8BE2 ---
L8BE2:	srl	e
	srl	e
	srl	e
	srl	d
	srl	d
	srl	d
	ld	hl,1800h	; address or value?
	ld	bc,0020h	; address or value?
	inc	d

	; Referenced from 8BF9
L8BF5:	dec	d
	jr	z,L8BFB
	add	hl,bc
	jr	L8BF5

	; Referenced from 8BF6
L8BFB:	add	hl,de
	call	RDVRM
	ld	b,a
	ld	a,(0C06Ah)
	or	a
	jr	z,L8C20
	ld	a,33h		; '3'
	cp	b
	jr	nc,L8C13
	ld	a,37h		; '7'
	cp	b
	jr	c,L8C13
	ld	a,0FFh
	ret

	; Referenced from 8C09, 8C0E
L8C13:	ld	a,4Fh		; 'O'
	cp	b
	jr	nc,L8C20
	ld	a,53h		; 'S'
	cp	b
	jr	c,L8C20
	ld	a,0FFh
	ret

	; Referenced from 8C04, 8C16, 8C1B
L8C20:	ld	a,0FFh
	cp	b
	jr	z,L8C26
	xor	a

	; Referenced from 8C23
	; --- START PROC L8C26 ---
L8C26:	ret

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
L8C47:	ld	hl,3000h	; address or value?

	; Referenced from 8C4D
L8C4A:	dec	hl
	ld	a,h
	or	l
	jr	nz,L8C4A
	ret

	; Referenced from 8978, 8986, 89EF, 89F6
	; --- START PROC L8C50 ---
L8C50:	ld	(0C065h),ix
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
	ld	bc,(0C05Ch)
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
	ld	de,(0C065h)
	call	PUT_SPRITE
	jp	L8D3C

	; Referenced from 8C58
L8CA5:	ld	d,(ix+00h)
	ld	e,(ix+01h)
	call	L8B69
	ld	ix,(0C065h)
	ld	hl,0C061h	; address or value?
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
	ld	hl,0C061h	; address or value?
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
L8CFD:	ld	hl,0C061h	; address or value?
	ld	b,a
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	ret	z
	pop	hl
	ld	hl,(0C065h)
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
	ld	ix,(0C065h)
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
	ld	de,(0C065h)
	call	PUT_SPRITE

	; Referenced from 8CA2
	; --- START PROC L8D3C ---
L8D3C:	ld	a,(bullet.status)
	or	a
	jr	z,L8DAC
	ld	ix,(0C065h)
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
	call	L9133
	ld	de,0030h	; address or value?
	call	ADD_SCORE
	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE
	xor	a
	ld	(ix+05h),a
	ld	a,0D1h
	ld	(ix+00h),a
	ld	de,(0C065h)
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

	; Referenced from 8A4F
	; --- START PROC L8DCA ---
L8DCA:	pop	hl
	call	L8FB3
	ld	b,04h
	ld	c,07h
	call	WRTVDP
	jp	DEC_LIVES_AND_ENTER_NEW_ROOM

	; Referenced from 837C
	; --- START PROC L8DD8 ---
	
; -----------------------------------------------------------------------------
GAME_OVER:
L8DD8:	call	L9145
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
	call	L9121
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
	ld	(0C06Eh),a
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
	ld	(0C05Eh),a
	ld	a,38h		; '8'
	call	WRTVRM_2x2_CHAR
	ld	de,0100h	; address or value?
	call	ADD_SCORE
	jp	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

	; Referenced from 8E39
L8E89:	ld	hl,0C01Eh	; address or value?
	push	de
	ld	(hl),d
	inc	hl
	ld	(hl),e
	inc	hl
	ld	a,40h		; '@'
	ld	(hl),a
	inc	hl
	ld	a,0Fh
	ld	(hl),a
	inc	hl
	xor	a
	ld	(hl),a
	inc	hl
	inc	hl
	ld	a,10h
	ld	(hl),a
	inc	hl
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
	call	L8EEB
	jp	SHORT_DELAY

	; Referenced from 8ECC
L8EE0:	ld	a,0FFh
	ld	(skull.status),a
	ret

L8EE6:	DB	38h		; '8'
	DB	3Ch		; '<'
	DB	00h
	DB	38h		; '8'
	DB	3Ch		; '<'


	; Referenced from 8425, 89B1, 8EDA
	; --- START PROC L8EEB ---
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
L8F14:	ld	ix,0C099h	; address or value?
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
	ld	hl,9F38h	; address or value?
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
	call	L9145
	ld	hl,0C099h	; address or value?
	call	PLAY_SOUND
	jp	L8C47

	; Referenced from 8DCB
	; --- START PROC L8FB3 ---
L8FB3:	xor	a
	ld	(0C0DCh),a
	ld	a,0Ah
	ld	ix,0C0AEh	; address or value?

	; Referenced from 8FC6
L8FBD:	push	af
	call	L8FE8
	pop	af
	add	a,14h
	cp	0E6h
	jr	nz,L8FBD
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
	ld	c,07h
	ld	b,04h
	call	WRTVDP
	ld	hl,9F38h	; address or value?
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
	call	L9145
	ld	hl,0C0AEh	; address or value?
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
L905F:	ld	c,07h
	call	WRTVDP
	jp	L8C47

	; Referenced from 8AFE
	; --- START PROC L9067 ---
L9067:	call	L9145
	ld	hl,9F3Bh	; address or value?
	jp	PLAY_SOUND

	; Referenced from 89D2
	; --- START PROC L9070 ---
L9070:	call	L9145
	ld	c,07h
	ld	b,03h
	call	WRTVDP
	ld	a,0F0h

	; Referenced from 9083
L907C:	push	af
	call	L909B
	pop	af
	sub	14h
	jr	nz,L907C
	ld	b,0Ch

	; Referenced from 908C
L9087:	push	bc
	call	L8C47
	pop	bc
	djnz	L9087
	ld	hl,9F38h	; address or value?
	call	PLAY_SOUND
	ld	c,07h
	ld	b,04h
	jp	0047h

	; Referenced from 907D
	; --- START PROC L909B ---
L909B:	ld	ix,0C0C3h	; address or value?
	ld	b,0Ah
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
	ld	hl,9F38h	; address or value?
	call	PLAY_SOUND
	ld	hl,0C0C3h	; address or value?
	call	PLAY_SOUND
	jp	L8C47

	; Referenced from 879B
	; --- START PROC L910C ---
L910C:	call	L9145
	ld	a,(aux.frame_counter)
	and	04h
	jr	nz,L911B
	ld	hl,914Bh	; address or value?
	jr	L911E

	; Referenced from 9114
L911B:	ld	hl,915Ah	; address or value?

	; Referenced from 9119
	; --- START PROC L911E ---
L911E:	jp	PLAY_SOUND

	; Referenced from 8AC5, 8E1F
	; --- START PROC L9121 ---
L9121:	call	L9145
	ld	hl,9169h	; address or value?
	jp	PLAY_SOUND

	; Referenced from 871D, 874B
	; --- START PROC L912A ---
L912A:	call	L9145
	ld	hl,9184h	; address or value?
	jp	PLAY_SOUND

	; Referenced from 895E, 8D8D
	; --- START PROC L9133 ---
L9133:	call	L9145
	ld	hl,9193h	; address or value?
	jp	PLAY_SOUND

	; Referenced from 87E5
	; --- START PROC L913C ---
L913C:	call	L9145
	ld	hl,91A2h	; address or value?
	jp	PLAY_SOUND

	; Referenced from 8DD8, 8FA7, 912A, 910C, 913C, 9133, 9121, 9067, 9070, 9046
	; --- START PROC L9145 ---
L9145:	ld	hl,91B7h	; address or value?
	jp	PLAY_SOUND

L914B:	DB	07h
	DB	00h
	DB	0FDh
	DB	01h
	DB	00h
	DB	07h
	DB	0B8h
	DB	08h
	DB	08h
	DB	0Bh
	DB	22h		; '"'
	DB	0Ch
	DB	02h
	DB	0Dh
	DB	0Fh
	DB	07h
	DB	00h
	DB	3Fh		; '?'
	DB	01h
	DB	01h
	DB	07h
	DB	0B8h
	DB	08h
	DB	08h
	DB	0Bh
	DB	22h		; '"'
	DB	0Ch
	DB	05h
	DB	0Dh
	DB	09h
	DB	0Dh
	DB	00h
	DB	0FDh
	DB	01h
	DB	00h
	DB	02h
	DB	0D5h
	DB	03h
	DB	00h
	DB	04h
	DB	3Fh		; '?'
	DB	05h
	DB	00h
	DB	07h
	DB	0B8h
	DB	08h
	DB	10h
	DB	09h
	DB	10h
	DB	0Ah
	DB	10h
	DB	0Bh
	DB	9Eh
	DB	0Ch
	DB	0Ah
	DB	0Dh
	DB	09h
	DB	07h
	DB	00h
	DB	0E0h
	DB	01h
	DB	04h
	DB	07h
	DB	0B8h
	DB	08h
	DB	0Fh
	DB	0Bh
	DB	92h
	DB	0Ch
	DB	05h
	DB	0Dh
	DB	05h
	DB	07h
	DB	06h
	DB	1Fh
	DB	07h
	DB	87h
	DB	08h
	DB	0Fh
	DB	09h
	DB	0Fh
	DB	0Bh
	DB	0Bh
	DB	0Ch
	DB	02h
	DB	0Dh
	DB	0Fh
	DB	0Ah
	DB	00h
	DB	0C0h
	DB	01h
	DB	09h
	DB	06h
	DB	1Fh
	DB	07h
	DB	80h
	DB	08h
	DB	0Ch
	DB	09h
	DB	0Ch
	DB	0Ah
	DB	10h
	DB	0Bh
	DB	0Bh
	DB	0Ch
	DB	06h
	DB	0Dh
	DB	00h
	DB	0Eh
	DB	00h
	DB	00h
	DB	01h
	DB	00h
	DB	02h
	DB	00h
	DB	03h
	DB	00h
	DB	05h
	DB	00h
	DB	06h
	DB	00h
	DB	07h
	DB	80h
	DB	08h
	DB	00h
	DB	09h
	DB	00h
	DB	0Ah
	DB	00h
	DB	0Bh
	DB	00h
	DB	0Ch
	DB	00h
	DB	0Dh
	DB	00h


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
L92A9:	ld	hl,score_bcd
	ld	a,(high_score_bcd)
	cp	(hl)
	jr	c,.L92C3
	ret	nz
; (next digit)
	inc	hl
	ld	a,(high_score_bcd +1)
	cp	(hl)
	jr	c,.L92C3
	ret	nz
; (next digit)
	inc	hl
	ld	a,(high_score_bcd +2)
	cp	(hl)
	jr	z,.L92C3
	ret	nc
; Copies score (BCD) to high_score (BCD)
.L92C3:	ld	bc,(score_bcd)
	ld	(high_score_bcd),bc
	ld	a,(score_bcd +2)
	ld	(high_score_bcd +2),a
; Prints high score
	ld	hl,high_score_bcd
	jr	WRTVRM_6x_BCD
; -----------------------------------------------------------------------------

	; Referenced from 82E4, 8F0B
	; --- START PROC L92D6 ---

; -----------------------------------------------------------------------------
PRINT_SCORE:
L92D6:	ld	hl,score_bcd
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
L9CD8:	DB	0D1h
	DB	40h 
	DB	04h
	DB	00h
	DB	0B5h
	DB	0A0h
	DB	80h
	DB	00h
	DB	2Eh 
	DB	0C0h
	DB	60h 
	DB	80h
	DB	6Eh 
	DB	0A0h
	DB	00h
	DB	20h 
	DB	75h 
	DB	0A0h
	DB	40h 
	DB	80h
	DB	5Ah 
	DB	20h 
	DB	00h
	DB	00h
	DB	02h
	DB	05h
	DB	0Ah
	DB	07h
	DB	0Ah
	DB	0Ah
	DB	82h
	DB	00h
	DB	05h
	DB	0Ah
	DB	0AEh
	DB	0A0h
	DB	08h
	DB	00h
	DB	0BAh
	DB	0C0h
	DB	00h
	DB	80h
	DB	0EEh
	DB	0A0h
	DB	80h
	DB	00h
	DB	0AEh
	DB	0A0h
	DB	88h
	DB	20h 
	DB	0ABh
	DB	0A0h
	DB	80h
	DB	00h
	DB	0AEh
	DB	0A0h
	DB	05h
	DB	00h
	DB	00h
	DB	07h
	DB	0Ah
	DB	07h
	DB	00h
	DB	00h
	DB	01h
	DB	0Ah
	DB	89h
	DB	00h
	DB	0EEh
	DB	0E0h
	DB	0AAh
	DB	0A0h
	DB	00h
	DB	00h
	DB	0AAh
	DB	0A0h
	DB	0Eh
	DB	00h
	DB	0A0h
	DB	0A0h
	DB	0Eh
	DB	00h
	DB	0AAh
	DB	0A0h
	DB	80h
	DB	20h 
	DB	0EAh
	DB	0E0h
	DB	0Ah
	DB	00h
	DB	01h
	DB	00h
	DB	05h
	DB	00h
	DB	09h
	DB	00h
	DB	08h
	DB	04h
	DB	05h
	DB	0Ah
	DB	87h
	DB	00h
	DB	6Ah 
	DB	0C0h
	DB	00h
	DB	00h
	DB	0BBh
	DB	0A0h
	DB	00h
	DB	00h
	DB	6Eh 
	DB	0C0h
	DB	00h
	DB	00h
	DB	6Eh 
	DB	0C0h
	DB	00h
	DB	00h
	DB	0BBh
	DB	0A0h
	DB	00h
	DB	00h
	DB	6Ah 
	DB	0C0h
	DB	01h
	DB	02h
	DB	09h
	DB	02h
	DB	09h
	DB	08h
	DB	00h
	DB	08h
	DB	85h
	DB	00h
	DB	05h
	DB	0Ah
	DB	8Bh
	DB	40h 
	DB	0A8h
	DB	00h
	DB	0A2h
	DB	0C0h
	DB	0Ah
	DB	00h
	DB	0DEh
	DB	0C0h
	DB	00h
	DB	80h
	DB	5Eh 
	DB	20h 
	DB	02h
	DB	80h
	DB	6Bh 
	DB	0E0h
	DB	08h
	DB	80h
	DB	62h 
	DB	20h 
	DB	05h
	DB	00h
	DB	07h
	DB	08h
	DB	0Ah
	DB	08h
	DB	00h
	DB	01h
	DB	00h
	DB	0Ah
	DB	8Ah
	DB	00h
	DB	85h
	DB	00h
	DB	0DDh
	DB	0C0h
	DB	84h
	DB	00h
	DB	0B1h
	DB	60h 
	DB	1Eh
	DB	00h
	DB	40h 
	DB	0C0h
	DB	0EEh
	DB	0C0h
	DB	24h 
	DB	00h
	DB	0ADh
	DB	60h 
	DB	04h
	DB	00h
	DB	0F1h
	DB	0C0h
	DB	00h
	DB	00h
	DB	01h
	DB	0Ah
	DB	08h
	DB	0Ah
	DB	01h
	DB	06h
	DB	0Ah
	DB	0Ah
	DB	86h
	DB	00h
	DB	0AAh
	DB	0A0h
	DB	88h
	DB	80h
	DB	0AAh
	DB	0A0h
	DB	22h 
	DB	20h 
	DB	0AEh
	DB	80h
	DB	80h
	DB	40h 
	DB	0AEh
	DB	80h
	DB	22h 
	DB	20h 
	DB	0EBh
	DB	0A0h
	DB	88h
	DB	80h
	DB	0AAh
	DB	0A0h
	DB	00h
	DB	0Ah
	DB	04h
	DB	01h
	DB	07h
	DB	08h
	DB	08h
	DB	05h
	DB	81h
	DB	00h
	DB	09h
	DB	0Ah
	DB	0DEh
	DB	0C0h
	DB	42h 
	DB	00h
	DB	58h 
	DB	0A0h
	DB	02h
	DB	0A0h
	DB	5Eh 
	DB	00h
	DB	00h
	DB	0C0h
	DB	5Fh 
	DB	0C0h
	DB	00h
	DB	00h
	DB	0ADh
	DB	40h 
	DB	05h
	DB	40h 
	DB	0D4h
	DB	60h 
	DB	00h
	DB	00h
	DB	00h
	DB	0Ah
	DB	09h
	DB	09h
	DB	05h
	DB	00h
	DB	8Ah
	DB	00h
	DB	04h
	DB	0Ah
	DB	0BBh
	DB	0A0h
	DB	08h
	DB	00h
	DB	63h 
	DB	0C0h
	DB	4Ah 
	DB	00h
	DB	7Eh 
	DB	0A0h
	DB	00h
	DB	00h
	DB	0AEh
	DB	0E0h
	DB	0EAh
	DB	20h 
	DB	8Ah
	DB	0A0h
	DB	20h 
	DB	80h
	DB	0EAh
	DB	0A0h
	DB	01h
	DB	0Ah
	DB	0Ah
	DB	07h
	DB	07h
	DB	00h
	DB	01h
	DB	03h
	DB	85h
	DB	00h
	DB	05h
	DB	0Ah
	DB	74h 
	DB	60h 
	DB	15h
	DB	00h
	DB	0D5h
	DB	0C0h
	DB	04h
	DB	20h 
	DB	7Fh 
	DB	60h 
	DB	00h
	DB	00h
	DB	0DFh
	DB	60h 
	DB	10h
	DB	40h 
	DB	7Bh 
	DB	0C0h
	DB	10h
	DB	40h 
	DB	0DFh
	DB	00h
	DB	02h
	DB	00h
	DB	03h
	DB	09h
	DB	0Ah
	DB	00h
	DB	0Ah
	DB	05h
	DB	0Ah
	DB	02h
	DB	8Ah
	DB	07h
	DB	15h
	DB	00h
	DB	44h 
	DB	40h 
	DB	51h 
	DB	40h 
	DB	44h 
	DB	40h 
	DB	7Fh 
	DB	0C0h
	DB	00h
	DB	00h
	DB	7Fh 
	DB	0C0h
	DB	51h 
	DB	0C0h
	DB	44h 
	DB	40h 
	DB	51h 
	DB	40h 
	DB	54h 
	DB	00h
	DB	01h
	DB	02h
	DB	01h
	DB	09h
	DB	09h
	DB	02h
	DB	05h
	DB	03h
	DB	04h
	DB	0Ah
	DB	84h
	DB	00h
	DB	2Ah 
	DB	80h
	DB	0A0h
	DB	0C0h
	DB	2Ah 
	DB	80h
	DB	7Fh 
	DB	0A0h
	DB	1Fh
	DB	00h
	DB	0C0h
	DB	40h 
	DB	1Fh
	DB	00h
	DB	44h 
	DB	40h 
	DB	6Fh 
	DB	00h
	DB	41h 
	DB	40h 
	DB	14h
	DB	00h
	DB	03h
	DB	03h
	DB	05h
	DB	03h
	DB	07h
	DB	03h
	DB	05h
	DB	08h
	DB	85h
	DB	00h
	DB	04h
	DB	0Ah
	DB	0E0h
	DB	0E0h
	DB	8Ah
	DB	20h 
	DB	2Ah 
	DB	80h
	DB	64h 
	DB	0C0h
	DB	0Eh
	DB	00h
	DB	0A0h
	DB	0E0h
	DB	0Eh
	DB	00h
	DB	64h 
	DB	0C0h
	DB	2Eh 
	DB	80h
	DB	8Ah
	DB	20h 
	DB	0E0h
	DB	0E0h
	DB	01h
	DB	00h
	DB	01h
	DB	0Ah
	DB	0Ah
	DB	05h
	DB	05h
	DB	07h
	DB	05h
	DB	02h
	DB	85h
	DB	09h
	DB	50h 
	DB	0E0h
	DB	56h 
	DB	0C0h
	DB	06h
	DB	00h
	DB	50h
	DB	0A0h
	DB	1Eh
	DB	20h
	DB	0E0h
	DB	0A0h
	DB	8Eh
	DB	00h
	DB	6Ch
	DB	0C0h
	DB	0Ah
	DB	00h
	DB	60h
	DB	0A0h
	DB	0Eh
	DB	0A0h
	DB	00h
	DB	05h
	DB	0Ah
	DB	04h
	DB	05h
	DB	0Ah
	DB	0Ah
	DB	00h
	DB	80h
	DB	00h
	DB	07h
	DB	0Ah
	DB	0FBh
	DB	0E0h
	DB	0A0h
	DB	80h
	DB	0AAh
	DB	0A0h
	DB	8Ah
	DB	20h
	DB	2Eh
	DB	0A0h
	DB	60h
	DB	80h
	DB	2Eh
	DB	0C0h
	DB	8Ah
	DB	00h
	DB	0A0h
	DB	0A0h
	DB	2Dh
	DB	80h
	DB	0A0h
	DB	0A0h
	DB	01h
	DB	00h
	DB	02h
	DB	05h
	DB	0Ah
	DB	03h
	DB	00h
	DB	0Ah
	DB	05h
	DB	03h
	DB	85h
	DB	07h
	DB	20h
	DB	80h
	DB	20h
	DB	80h
	DB	20h
	DB	80h
	DB	20h
	DB	80h
	DB	3Bh
	DB	80h
	DB	0Ah
	DB	00h
	DB	00h
	DB	00h
	DB	55h
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
L9EE5: 	DB	40h, 00h, 00h, 00h, 00h, 00h, 00h
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
L9F38:	DB	01h
	DB	07h
	DB	0BFh
	DB	0Dh
	DB	00h
	DB	01h
	DB	01h
	DB	01h
	DB	02h
	DB	05h
	DB	03h
	DB	02h
	DB	04h
	DB	0Fh
	DB	05h
	DB	03h
	DB	06h
	DB	05h
	DB	07h
	DB	0B0h
	DB	08h
	DB	10h
	DB	09h
	DB	10h
	DB	0Ah
	DB	10h
	DB	0Ch
	DB	0FFh
	DB	0Dh
	DB	00h
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
	
box1:				; C000H
	.data:		rb 4	; C000H
	.content:	rb 1	; C004H
box2:				; C005H
	.data:		rb 4	; C005H
	.content:	rb 1	; C009H
box3:				; C00AH
	.data:		rb 4	; C00AH
	.content:	rb 1	; C00EH

door1:				; C00FH
	.data:		rb 1	; C00FH
	.spratr_y:	rb 1	; C010H
	.spratr_x:	rb 1	; C011H
	.spratr_pat:	rb 1	; C012H
	.spratr_color:	rb 1	; C013H
door2:				; c014H
	.data:		rb 1	; C014H
	.spratr_y:	rb 1	; C015H
	.spratr_x:	rb 1	; C016H
	.spratr_pat:	rb 1	; C017H
	.spratr_color:	rb 1	; C018H
	
player:				; C019H
	.spratr_y:	rb 1	; C019H
	.spratr_x:	rb 1	; C01AH
	.spratr_pat:	rb 1	; C01BH
	.spratr_color:	rb 1	; C01CH
	.direction:	rb 1	; C01DH
	
skull:				; C01EH
	.spratr_y:	rb 1	; C01EH
	.spratr_x:	rb 1	; C01FH
	.spratr_pat:	rb 1	; C020H
	.spratr_color:	rb 1	; C021H
	.direction:	rb 1	; C022H
	.status:	rb 1	; C023H
	
			rb 1	; C024H (unused?)
			rb 1	; C025H (unused?)
	
scorpion1:			; C026H
	.spratr_y:	rb 3	; C026H
	.spratr_color:	rb 1	; C029H
			rb 1	; (unused?)
	.status:	rb 1	; C02BH
	
LabelC02C:		rb 1	; C02CH
LabelC02D:		rb 1	; C02DH

bat1:				; C02EH
	.spratr_y:	rb 3	; C02EH
	.spratr_color:	rb 1	; C031H
			rb 1	; (unused?)
	.status:	rb 1	; C033H

LabelC034:		rb 1	; C034H
LabelC035:		rb 6	; C035H
LabelC03B:		rb 1	; C03BH
LabelC03C:		rb 1	; C03CH
LabelC03D:		rb 1	; C03DH

scorpion2:			; C03EH
	.spratr_y:	rb 3	; C03EH
	.spratr_color:	rb 1	; C041H
			rb 1	; (unused?)
	.status:	rb 1	; C043H
	
LabelC044:		rb 1	; C044H
LabelC045:		rb 1	; C045H
	
bat2:				; C046H
	.spratr_y:	rb 3	; C046H
	.spratr_color:	rb 1	; C049H
			rb 1	; (unused?)
	.status:	rb 1	; C04BH

LabelC04C:		rb 1	; C04CH
LabelC04D:		rb 6	; C04DH
LabelC053:		rb 1	; C053H
LabelC054:		rb 1	; C054H
LabelC055:		rb 1	; C055H

bullet:				; C056H
	.spratr_y:	rb 1	; C056H
	.spratr_x:	rb 1	; C057H
	.spratr_pat:	rb 1	; C058H
	.spratr_color:	rb 1	; C059H
	.direction:	rb 1	; C05AH
	.status:	rb 1	; C05BH

aux.frame_counter:	equ	$C05F ; rb 1

game.short_delay:	equ	$C075 ; rb 1
game.current_room:	equ	$C076 ; rb 1
game.air_left:		equ	$C077 ; rb 4
game.first_pyramid:	equ	$C07B ; rb 1

player.lives:		equ	$C07C ; rb 1

aux.how_many_bytes:	equ	$C07D ; rb 2

high_score_bcd:		equ	$C07F ; rb 3 (6 digits)
score_bcd:		equ	$C082 ; rb 3 (6 digits)

pyramid_rooms:		equ	$C087 ; rb ?

curent_room_namtbl_ptr:	equ	$C097 ; rb 2

aux.frame_counter_2:	equ	$C0D8 ; rb 1
; -----------------------------------------------------------------------------

; EOF
