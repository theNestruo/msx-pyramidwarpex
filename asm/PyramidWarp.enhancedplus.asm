; -----------------------------------------------------------------------------
; MSX BIOS
	VDP_DW:	equ $0007 ; One byte, VDP Data Port number (write)
	MSXID1:	equ $002b ; Frecuency (1b), date format (3b) and charset (4b)
	DISSCR:	equ $0041 ; Disable screen
	ENASCR:	equ $0044 ; Enable screen
	WRTVDP:	equ $0047 ; Write to any VDP register
	RDVRM:	equ $004a ; Read byte from VRAM
	WRTVRM:	equ $004d ; Write byte to VRAM
	FILVRM:	equ $0056 ; Fill block of VRAM with data byte
	LDIRVM:	equ $005c ; Copy block to VRAM, from memory
	CHGMOD:	equ $005f ; Change VDP mode
	CHGCLR:	equ $0062 ; Change VDP colours
	CLRSPR:	equ $0069 ; Clear all sprites
	INIGRP:	equ $0072 ; Initialize VDP to Graphics Mode
	GICINI:	equ $0090 ; Initialize PSG (GI Chip)
	GTSTCK:	equ $00d5 ; Get joystick status
	GTTRIG:	equ $00d8 ; Get trigger status

; Stack pointer initialization
	STACK_POINTER_INIT:	equ $f380 ; As suggested by the MSX2 Technical Handbook

; MSX system variables
	SCNCNT: equ $f3f6 ; Key scan timing
	CLIKSW:	equ $f3db ; Keyboard click sound
	RG1SAV:	equ $f3e0 ; Content of VDP(1) register (R#1)
	STATFL: equ $f3e7 ; Content of VDP status register (S#0)
	FORCLR:	equ $f3e9 ; Foreground colour
	BAKCLR:	equ $f3ea ; Background colour
	BDRCLR:	equ $f3eb ; Border colour
	JIFFY: equ $fc9e ; Software clock; each VDP interrupt gets increased by 1
	INTCNT:	equ $fca2 ; ON INTERVAL counter (counts backwards)
	HKEYI:	equ $fd9a ; Interrupt handler
	HTIMI:	equ $fd9f ; Interrupt handler
	HOOK_SIZE:	equ HTIMI - HKEYI

; VRAM addresses
	CHRTBL:		equ $0000 ; Pattern table
	.BANK_SIZE:	equ 256 * 8
	.BANK_0:	equ CHRTBL + 0 * CHRTBL.BANK_SIZE
	.BANK_1:	equ CHRTBL + 1 * CHRTBL.BANK_SIZE
	.BANK_2:	equ CHRTBL + 2 * CHRTBL.BANK_SIZE
	.SIZE:		equ 3 * .BANK_SIZE
	NAMTBL:		equ $1800 ; Name table
	.SIZE:		equ $300
	CLRTBL:		equ $2000 ; Color table
	.BANK_SIZE:	equ 256 * 8
	.BANK_0:	equ CLRTBL + 0 * CLRTBL.BANK_SIZE
	.BANK_1:	equ CLRTBL + 1 * CLRTBL.BANK_SIZE
	.BANK_2:	equ CLRTBL + 2 * CLRTBL.BANK_SIZE
	.SIZE:		equ 3 * .BANK_SIZE
	SPRATR:		equ $1B00 ; Sprite attributes table
	.SIZE:		equ 4 * 32
	SPRTBL:		equ $3800 ; Sprite pattern table

; VDP symbolic constants
	SCR_WIDTH:	equ 32
	SPAT_END:	equ $d0 ; Sprite attribute table end marker
	SPAT_OB:	equ $d1 ; Sprite out of bounds marker (not standard)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
CFG_COLOR:
	.SKULL:		equ 15	; 15
	.SCORPION:	equ 9	; 9
	.BAT_0:		equ 1	; 1
	.BAT:		equ 5	; 1
	.SNAKE:		equ 3
	.PLAYER:	equ 14	; 11
	.PLAYER_GUN:	equ 15	; 15
	.BULLET:	equ 15	; 15
	.EXPLOSION:	equ 6	; 6
	.DOOR_0:	equ 15	; 3
	.DOOR_1:	equ 7	; 7
	.DOOR_2:	equ 15	; 8

	.BG:		equ 4	; 4
	.BG_SPHYNX:	equ 1	; 1
	.BG_DEAD_1:	equ 8	; 6
	.BG_DEAD_2:	equ 9	; 4
	.BG_DEAD_3:	equ 6
	.BG_EXIT:	equ 12	; 3

CFG_BASE_PATTERN:
	.SKULL:		equ	$10
	.SCORPION:	equ	$12
	.BAT:		equ	$14
	.SNAKE:		equ	$16

	.SKULL4:	equ	$10
	.SCORPION4:	equ	$28
	.BAT4:		equ	$30
	.SNAKE4:	equ	$38

	.DOOR_0:	equ	$18
	.DOOR_1:	equ	$19
	.DOOR_2:	equ	$18
	.BULLET:	equ	$1A
	.EXPLOSION:	equ	$1C

	.EXPLOSION_0:	equ $1C
	.EXPLOSION_1:	equ $1D
	.EXPLOSION_2:	equ $1E

CFG_TILES_PATTERN:
	.TILE_WALL:		equ $30
	.TILE_BOX:		equ $34
	.TILE_GUN:		equ $38
	.TILE_DIAMOND:		equ $3C
	.TILE_WALL_WARP:	equ $40
	.TILE_EXIT:		equ $44
	.TILE_NEST:		equ $48
	.TILE_NEST1:		equ $48
	.TILE_NEST2:		equ $4C
	.TILE_FLOOR:		equ $58 ; $FC

	.TILE_WALL_END:		equ CFG_TILES_PATTERN.TILE_WALL  + 1*4
	.TILE_BOX_END:		equ CFG_TILES_PATTERN.TILE_BOX   + 1*4
	.TILE_GUN_END:		equ CFG_TILES_PATTERN.TILE_GUN   + 1*4
	.TILE_DIAMOND_END:	equ CFG_TILES_PATTERN.TILE_DIAMOND + 1*4
	.TILE_WALL_WARP_END:	equ CFG_TILES_PATTERN.TILE_WALL_WARP + 1*4
	.TILE_EXIT_END:		equ CFG_TILES_PATTERN.TILE_EXIT  + 1*4
	.TILE_NEST_END:		equ CFG_TILES_PATTERN.TILE_NEST  + 2*4
	.TILE_NEST1_END:	equ CFG_TILES_PATTERN.TILE_NEST1 + 1*4
	.TILE_NEST2_END:	equ CFG_TILES_PATTERN.TILE_NEST2 + 1*4
	.TILE_FLOOR_END:	equ CFG_TILES_PATTERN.TILE_FLOOR + 1*4

CFG_EXIT:
	.BLINK_FRAMES:	equ 10

CFG_PYRAMID:
	.ROOM_VISITED:		equ $51
	.ROOM_NOT_VISITED:	equ $53


CFG_HUD:			; $yyxx coordinates
	.HIGH_COORDS:		equ $081A ; 0819h
	.SCORE_COORDS:		equ $0B1A ; 0B19h
	.AIR_LEFT_COORDS:	equ $0E1C ; 0E19h
	.ROOM_COORDS:		equ $101E ; 101Dh
	.LIVES_COORDS:		equ $171A ; 1719h


CFG_OTHERS:
	.OPTIONS_0:		equ ($02 << 4) + ($01 << 2) + ($00) ; 00eemmrr: Enemies, Mirroring, Rooms
	.PLAYER_INITIAL_DIR:	equ $03 ; 01h ; Initial player direction (down)
	.SHORT_DELAY_FACTOR:	equ $03 ; 04h ; Multiplier in short delay routine
	.NUMBERS_WITH_COLOR:	; Uncomment to paint number with color
	; .CHEAT_WIN_GAME:	; Uncomment to start game in sphynx room!!
	; .DEAD_PLAYER_COLOR:	equ 13 ; Uncomment to change player color when dead
	.DEAD_PLAYER_DIZZY:	equ 1 ; Uncomment to make the player dizzy when dead

enemy_spratr_y:			equ 0
enemy_spratr_x:			equ 1
enemy_spratr_pat:		equ 2
enemy_spratr_color:	equ 3
enemy_direction:		equ 4
enemy_status:			equ 5
enemy_base_pattern:	equ 6
enemy_sprite_plane:	equ 7

; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; ROM header and entry point
;	org	$8000, $9fff ; 8KB ROM
	org	$8000, $bfff ; 16KB ROM
ROM_START:
	db	"AB"		; ID ("AB")
	dw	.INIT		; INIT
	ds	$8010 - $, $00	; STATEMENT, DEVICE, TEXT, Reserved

; Entry Point
.INIT:
; Ensures interrupt mode
	di
	im	1
	ld	sp, STACK_POINTER_INIT
; Cancels the existing hooks (several BIOS routines re-enable interruptions)
	ld	a, $c9 ; opcode for "RET"
	ld	[HKEYI], a
	ld	[HTIMI], a

; Zeroes all the used RAM
	ld	hl, $e000
	ld	de, $e001
	ld	bc, $f380 - $e000 -1
	ld	[hl], l ; l = $00
	ldir
; Initializes the options
	ld	a, CFG_OTHERS.OPTIONS_0
	ld	[options], a

; color 15, 0, 1
	ld	a,0Fh
	ld	(FORCLR),a
	xor	a
	ld	(BAKCLR),a
	inc	a
	ld	(BDRCLR),a

; screen 2
	call	INIGRP
; screen ,2
	call	DISSCR
	ld	hl, RG1SAV
	set	1, [hl] ; (first call to ENASCR will actually apply to the VDP)
; screen ,,0
	xor	a
	ld	[CLIKSW], a

; Frame rate related variables
	ld	a, [MSXID1]
	bit	7, a ; 0=60Hz, 1=50Hz
	ld	hl, 5 << 8 + 50 ; frame rate and frames per tenth for 50Hz
	jr	nz, .HL_OK
	ld	hl, 6 << 8 + 60 ; frame rate and frames per tenth for 60Hz
.HL_OK:
	ld	[frame_rate], hl

; Hides the sprites
	call	CLEAR_SPRITES
	call	LDIRVM_SPRITES

; Initializes the replayer
	call	GICINI
	call	REPLAYER.RESET

; Installs the H.TIMI hook in the interruption
	di
	ld	a, $c3 ; opcode for "JP nn"
	ld	[HTIMI], a
	ld	hl, HOOK
	ld	[HTIMI +1], hl
	ei

; CLS (with custom "blank" characteR)
	ld	hl,NAMTBL
	ld	bc,NAMTBL.SIZE
	ld	a,2Fh
	call	FILVRM

; init font
	ld	hl,DATA_FONT
	ld	de,CHRTBL
	ld	bc,DATA_FONT.SIZE
	call	LDIRVM_3_BANKS
	ld	a, 15 << 4 or 0
	ld	hl,CLRTBL
	ld	bc,CLRTBL.SIZE
	call	FILVRM
	IFDEF CFG_OTHERS.NUMBERS_WITH_COLOR
		ld	a, 7 << 4 or 0
		ld	hl,CLRTBL.BANK_0
		ld	bc,10*8
		call	FILVRM
		ld	a, 7 << 4 or 0
		ld	hl,CLRTBL.BANK_1
		ld	bc,10*8
		call	FILVRM
		ld	a, 7 << 4 or 0
		ld	hl,CLRTBL.BANK_2
		ld	bc,10*8
		call	FILVRM
	ENDIF

; Init CHRTBL/CLRTBL
	ld	hl, DATA_CHARSET.CHR
	ld	de, CHRTBL + $30 * $08
	ld	bc, DATA_CHARSET.SIZE ; - $08
	call	LDIRVM_3_BANKS
	ld	hl, DATA_CHARSET.CLR
	ld	de, CLRTBL + $30 * $08
	call	LDIRVM_3_BANKS
; Init CHRTBL/CLRTBL (last character)
	ld	hl, DATA_CHARSET.CHR_FF
	ld	de, CHRTBL + $FF * $08
	ld	bc, $08
	call	LDIRVM_3_BANKS
	ld	hl, DATA_CHARSET.CLR_FF
	ld	de, CLRTBL + $FF * $08
	call	LDIRVM_3_BANKS
; init sprites
	ld	hl,DATA_SPRTBL
	ld	de,SPRTBL
	ld	bc,DATA_SPRTBL.SIZE
	call	LDIRVM

; Init on-screen texts
	ld	hl,LITERAL.MSX
	ld	de,$030e ; 080Dh
	ld	b,03h
	call	PRINT
	ld	hl,LITERAL.PYRAMID_WARP_TITLE
	ld	de,$050a ; 0909h
	ld	b,0Ch
	call	PRINT
	ld	hl,LITERAL.PYRAMID_WARP_TITLE + $0c
	ld	de,$060a
	ld	b,0Ch
	call	PRINT
	ld	hl,LITERAL.COPYRIGHT
	ld	de,$0806 ; 0C05h
	ld	b,14h
	call	PRINT

	call	ENASCR

; Options menu
	call	OPTIONS_MENU
; "Hit space key"
	; ld	de, $1008
	; call	HIT_SPACE_KEY

; color ,,4
	ld	bc,CFG_COLOR.BG << 8 + 07h
	call	WRTVDP

; Fills in playground
	ld	de,0001h
	ld	bc, $1918 ; was: 1818h, now clears spurious characters
	xor	a ; enhancedplus
.LOOP:
	push	de
	push	bc
	ld	hl, LITERAL.WALL_x24 ; (followed by blanks!)
	call	PRINT
	pop	bc
	pop	de

	inc	a
	inc	d
	dec	c
	jr	nz, .LOOP

; Prints HUD
	ld	hl,LITERAL.DASHES
	ld	de,0019h
	ld	b,07h
	call	PRINT
	ld	hl,LITERAL.PYRAMID
	ld	de,0119h
	ld	b,07h
	call	PRINT
	ld	hl,LITERAL.DASHES
	ld	de,0219h
	ld	b,07h
	call	PRINT
	ld	hl,LITERAL.TnESOFT
	ld	de,0419h
	ld	b,07h
	call	PRINT
	ld	hl,LITERAL.Y1983
	ld	de,051Bh
	ld	b,04h
	call	PRINT
	ld	hl,LITERAL.HIGH
	ld	de,0719h
	ld	b,04h
	call	PRINT
	ld	hl,LITERAL.SCORE
	ld	de,0A19h
	ld	b,05h
	call	PRINT
	ld	hl,LITERAL.ROOM
	ld	de,1019h
	ld	b,04h
	call	PRINT
	ld	hl,LITERAL.AIR
	ld	de,0D19h
	ld	b,03h
	call	PRINT

; High score = 0
	xor	a
	ld	(game.high_score_bcd),a
	ld	(game.high_score_bcd +1),a
	ld	(game.high_score_bcd +2),a

; Sprite patterns, colors and planes
	ld	a,CFG_COLOR.SCORPION ; 09h
	ld	(scorpion1.spratr_color),a
	ld	(scorpion2.spratr_color),a
	ld	a, CFG_BASE_PATTERN.SCORPION4 * 4 ; 12h
	ld	(scorpion1.base_pattern),a
	ld	(scorpion2.base_pattern),a

	ld	a,CFG_COLOR.BAT ; 01h
	ld	(bat1.spratr_color),a
	ld	(bat2.spratr_color),a
	ld	a, CFG_BASE_PATTERN.BAT4 * 4 ; 14h
	ld	(bat1.base_pattern),a
	ld	(bat2.base_pattern),a

	ld	a,CFG_COLOR.SNAKE
	ld	(snake1.spratr_color),a
	ld	(snake2.spratr_color),a
	ld	a, CFG_BASE_PATTERN.SNAKE4 * 4 ; 16h
	ld	(snake1.base_pattern),a
	ld	(snake2.base_pattern),a

	ld	a, 2
	ld	(scorpion1.sprite_plane), a
	inc	a
	ld	(bat1.sprite_plane), a ; 3
	inc	a
	ld	(snake1.sprite_plane), a ; 4
	inc	a
	ld	(scorpion2.sprite_plane), a ; 5
	inc	a
	ld	(bat2.sprite_plane), a ; 6
	inc	a
	ld	(snake2.sprite_plane), a ; 7
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8E07
	; --- START PROC L82B8 ---

; -----------------------------------------------------------------------------
NEW_GAME:
; Five lives
	ld	a,05h
	ld	(game.lives),a
; First pyramid (extra time)
	xor	a
	ld	(game.pyramid_count),a
; Score to 0 (and prints score)
	xor	a
	ld	bc,0000h
	ld	(game.score_bcd),a
	ld	(game.score_bcd +1),bc

	ld	de,CFG_HUD.SCORE_COORDS
	call	PRINT_SCORE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8B66
	; --- START PROC L82E7 ---

; -----------------------------------------------------------------------------
NEW_PYRAMID:
; Builds the pyramid
	call	BUILD_PYRAMID
	call	BUILD_PYRAMID_DEFINITION

; Room 0
	xor	a
	ld	(pyramid.room_index),a

; Enemy count
	call	INIT_ENEMY_COUNT

; Prints the pyramid in the HUD
	ld	de,1519h
	ld	b,07h ; 7 rooms
.L834D:	push	bc
	ld	hl,LITERAL.ROOMS_x7
	call	PRINT
	inc	e ; destination += (+1, -1)
	dec	d
	pop	bc ; length -= 2
	dec	b
	dec	b
	ld	a,01h ; if more than one room, loops
	cp	b
	jr	nz,.L834D
; Prints the sphynx room
	ld	a,$52 ; ($52 = sphynx room)
	call	PRINT_CHAR

; Plays "Start game" music
	call	PLAY_START_GAME_MUSIC
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8DD5
	; --- START PROC L836A ---

; -----------------------------------------------------------------------------
DEC_LIVES_AND_NEW_ROOM:
; Decreases the enemy count
	call	DECREASE_ENEMY_COUNT
; Clear lives
	ld	hl,LITERAL.BLANKS
	ld	de,CFG_HUD.LIVES_COORDS
	ld	b,05h
	call	PRINT
; Decreases lives
	ld	hl, game.lives
	dec	(hl)
	ld	a, (hl)
	jp	m,GAME_OVER ; (<0 lives = GAME_OVER)
; Prints lives
	jr	z,NEW_ROOM ; (no lives to print)
	ld	hl,LITERAL.LIVES_x6
	ld	b,a
	call	PRINT
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
NEW_ROOM:
; Plays "Ingame" music
	call	PLAY_INGAME_MUSIC
; Print score and updates high score
.L838C:	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

; Hides the sprites
	call	CLEAR_SPRITES

; Reads the current room index
	ld	a,(pyramid.room_index)
	ld	hl,pyramid.room_array
	call	ADD_HL_A
	ld	a,(hl)

	IFDEF  CFG_OTHERS.CHEAT_WIN_GAME
		ld	a, $10 ; TESTING END
	ENDIF

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
	ld	de,CFG_HUD.ROOM_COORDS
	call	PRINT_CHAR
; Prints the room number (units)
	ld	a,(game.current_room)
	add	a,00h
	daa
	and	0Fh
	ld	de,CFG_HUD.ROOM_COORDS +1
	call	PRINT_CHAR

; Draws the room
	call	BUFFER_CURRENT_ROOM
	call	DRAW_CURRENT_ROOM

; Is sphynx room?
	ld	a,(game.current_room)
	cp	10h
	jp	z,PRINT_SPHYNX_ROOM_DECORATION ; yes
; ------VVVV----falls through--------------------------------------------------


; Prints exit zone
	push	hl
	ld		hl, NAMTBL + 32*9+10
	ld		b, 6
.LOOPWARP0:
	push	bc
	ld		b, 6
.LOOPWARP1:
	call	RDVRM
	cp	$34
	jr	nc, .NEXTWARP1
	; change tile
	add	a, 16
	call	WRTVRM
	jr	.NEXTWARP2
.NEXTWARP1:
	cp	$5C
	jr	c, .NEXTWARP2
	cp	$60
	jr	nc, .NEXTWARP2
	add	a, 4
	call	WRTVRM
.NEXTWARP2:
	inc	hl
	djnz	.LOOPWARP1
	ld		bc, 32-6
	add	hl, bc
	pop	bc
	djnz	.LOOPWARP0
	pop	hl


; -----------------------------------------------------------------------------
; param hl: room data pointer (after walls definition)
PRINT_ROOM_DECORATION:
; Initializes boxes
	ld	ix,box1
	call	NEW_BOX
	ld	ix,box2
	call	NEW_BOX
	ld	ix,box3
	call	NEW_BOX

; Initializes nest
	ld	ix,nest
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	push	hl ; (preserve)
; (prints nest)
	call	TO_VRAM_COORDINATES
	ld	a, CFG_TILES_PATTERN.TILE_NEST  ; $48 ; 54h
	call	PRINT_TILE
	pop	hl ; (restore)

; Initializes doors
	ld	ix,door1
	call	NEW_DOOR
	ld	ix,door2
	call	NEW_DOOR


; Initial player coordinates
	ld	a,58h

	jp	INIT_GAME_LOOP
; -----------------------------------------------------------------------------

PRINT_WALL_3D:
	push	hl
	push	af
	push	bc
	push	de

	; initialize
	xor	a
	ld	(room_enhance_tile), a

	; LEFT TILE
	ld	a, (room_enhance_pos)
	ld	b, a
	and	$0F
	jr	z, .left_set_bit
	; set left pos
	dec	a
	ld	c, a
	ld	a, b
	and	$F0
	or	c		; a = new pos
	; get map position
	call	GET_MAP_POSITION
	jr	z, .left_check_end
.left_set_bit:
	; set left bit
	ld	hl, room_enhance_tile
	set	0, (hl)
.left_check_end:


	; UP TILE
	ld	a, (room_enhance_pos)
	ld	b, a
	and	$F0
	jr	z, .up_set_bit
	; set up pos
	add	a, -16
	ld	c, a
	ld	a, b
	and	$0F
	or	c		; a = new pos
	; get map position
	call	GET_MAP_POSITION
	jr	z, .up_check_end
.up_set_bit:
	; set left bit
	ld	hl, room_enhance_tile
	set	1, (hl)
.up_check_end:


	; RIGHT TILE
	ld	a, (room_enhance_pos)
	ld	b, a
	and	$0F
	cp	10 ; 11
	jr	nc, .right_set_bit
	; set left pos
	inc	a
	ld	c, a
	ld	a, b
	and	$F0
	or	c		; a = new pos
	; get map position
	call	GET_MAP_POSITION
	jr	z, .right_check_end
.right_set_bit:
	; set left bit
	ld	hl, room_enhance_tile
	set	2, (hl)
.right_check_end:


	; DOWN TILE
	ld	a, (room_enhance_pos)
	ld	b, a
	and	$F0
	cp	10 << 4 ; $B0
	jr	nc, .down_set_bit
	; set up pos
	add	a, $10
	ld	c, a
	ld	a, b
	and	$0F
	or	c		; a = new pos
	; get map position
	call	GET_MAP_POSITION
	jr	z, .down_check_end
.down_set_bit:
	; set left bit
	ld	hl, room_enhance_tile
	set	3, (hl)
.down_check_end:

	; calculate actual tile
	ld	a, (room_enhance_tile)
	add	a, a
	add	a, a
	ld	hl, DATA_WALL_ENHANCE
	call	ADD_HL_A
	call	PRINT_TILE_SEQ

	pop	de
	pop	bc
	pop	af
	pop	hl
	ret


GET_MAP_POSITION:
	ld		b, a
	rra
	rra
	rra
	and 	$1F	; a = (posicion y en mapa)*2
	ld		hl, room_buffer
	call	ADD_HL_A
	ld		a, (hl)	; a = byte con 8 pixeles
	ld		c, a	; c = byte con 8 pixeles

	ld		a, b	; b = posicion
	and		$07	; a = posicion x (0..7)
	cpl
	add		a, 7 +1
	ld		b, a	; b = numero de bits a rotar
	ld		a, c	; a = byte con 8 pixeles
	jr		z, @@norotar
@@rotar:
	rra
	djnz	@@rotar
@@norotar:
	and		$01
	ret


; -----------------------------------------------------------------------------
; param ix:
NEW_BOX:
; Read box data
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	push	hl
; Initializes coordinates and other values
	call	TO_VRAM_COORDINATES
	ld	(ix+00h),000h ; box.is_opening
; Prints box
	ld	a, CFG_TILES_PATTERN.TILE_BOX ; 34h ; ($34 = box)
	call	PRINT_TILE
; (restore data pointer and end)
	pop	hl
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param ix:
NEW_DOOR:
; Read door data
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	push	hl

; MSB determines door type  (0 = v, 1 = ^)
	ld	b,00h ; b = 0 = door down (v)
	ld	a,e ; (preserves e)
	and	7Fh
	cp	e
	jr	z,.DOWN ; no
	inc	b ; yes: b = 1 = door up (^)
.DOWN:	ld	(ix+00h),b ; door.type

; saves door coordinates
	ld	e,a ; (restores e)
	inc	ix
	push	ix ; (preserves pointer to spratr_y)
	call	TO_VRAM_COORDINATES
; saves door pattern based on b
	ld	a,b
	add	a,18h ; a = 18 or 19
	add	a,a ; a *= 4
	add	a,a
	ld	(ix),a ; door.spratr_pat
; saves door color
	ld	(ix + 1),CFG_COLOR.DOOR_0 ; door.spratr_color
; Prints door sprite
	pop	de ; (restores pointer to spratr_y)
	ld	a, 9
	add	b ; sprite plane according b: 10, 11
	call	PUT_SPRITE
; (restore data pointer and end)
	pop	hl
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PRINT_SPHYNX_ROOM_DECORATION:
; Prints single box
	ld	de,0B0Ch	; address or value?
	ld	a, CFG_TILES_PATTERN.TILE_BOX ; 34h ; ($34 = box)
	call	PRINT_TILE

; Do not initialize doors
	xor	a
	ld	(door1.spratr_y),a
	ld	(door2.spratr_y),a

; ; Prints "6" (for "ROOM 16")
	; ld	a,06h
	; ld	de,CFG_HUD.ROOM_COORDS + 1
	; call	PRINT_CHAR

; Player initial position
	ld	a,98h
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
; param a: initial value for player.spratr_y
INIT_GAME_LOOP:
; Player initial position
	ld	hl,player.spratr_y
	push	hl
	ld	(hl),a
	inc	hl
	ld	(hl),60h
	inc	hl
	push	hl

; Initializes air_left (fisrt_pyramid ? 3000 : 2000)
	ld	hl,0BB8h ; 3000
	ld	a,(game.pyramid_count)
	or	a
	jr	z,.L862E
	ld	hl,07D0h ; 2000
.L862E:	ld	(game.air_left),hl
; Prints air left
	ld	de,CFG_HUD.AIR_LEFT_COORDS
	call	PRINT_AIR_LEFT

; Initializes game vars
	xor	a
	ld	(skull.status),a
	ld	(scorpion1.status),a
	ld	(scorpion2.status),a
	ld	(bat1.status),a
	ld	(bat2.status),a
	ld	(snake1.status),a
	ld	(snake2.status),a
	ld	(bullet.status),a
	ld	(aux.frame_counter),a
	ld	(exit.is_enabled),a
	ld	(exit.blink_flag),a
	ld	(exit.has_diamond),a
	ld	(player_has_gun),a

; Sets player direction
	ld	a,CFG_OTHERS.PLAYER_INITIAL_DIR
	ld	(new_player_direction),a
	ld	(player.direction),a

; Sets player pattern
	pop	hl ; player.spratr_pat
	add	a ; a = CFG_OTHERS.PLAYER_INITIAL_DIR *4
	add	a
	ld	(hl),a
; Sets player color
	inc	hl ; player.spratr_color
	ld	(hl),CFG_COLOR.PLAYER ; 0Bh

; Put player sprite
	pop	de ; player.spratr_y
	xor	a
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

	call	LDIRVM_SPRITES

; Initial pause
	call	DELAY.ONE_SECOND
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8AB4
	; --- START PROC L867C ---

; -----------------------------------------------------------------------------
GAME_LOOP:
	call	LDIRVM_SPRITES

; Configures game speed according air left
.L867C:	ld	hl,(game.air_left)
	ld	a,40h ; speed = 40
	ld	de,03E8h ; 1000
	sbc	hl,de
	jr	c,.L8691 ; air left < 1000
	add	a,60h ; speed += 60
	or	a
	sbc	hl,de
	jr	c,.L8691 ; air left < 2000
	add	a,50h ; speed += 60
.L8691: ld	(game.short_delay),a
; Next frame
	ld	a,(aux.frame_counter)
	inc	a
	ld	(aux.frame_counter),a
	call	SHORT_DELAY

; Each 4 frames, blinks the current room
	ld	de,(pyramid.room_namtbl_ptr)
	ld	b, CFG_PYRAMID.ROOM_NOT_VISITED ; $53 ; ($63 = non visited room)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L86AC
	inc	b ; ($64 = current room)
.L86AC:	ld	a,b
	call	PRINT_CHAR

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
	inc	a
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
	inc	a
	ld	(player.direction),a
	ld	(new_player_direction),a
; Sets the flag about the player entering a door
	ld	a,0FFh
	ld	(player_entering_door),a
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
GAME_LOOP.DOORS_OK:
	; Referenced from 8739, 8742, 8749
.L8767:	ld	a,(player.direction)
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
	ld	b,CFG_COLOR.PLAYER ; yellow (without gun)
	ld	a,(player_has_gun)
	or	a
	jr	z,.L878B
	ld	b,CFG_COLOR.PLAYER_GUN ; white (with gun)
.L878B:	ld	a,b
	ld	(player.spratr_color),a
; Prints the player sprite
	ld	de, player.spratr_y
	xor	a
	call	PUT_SPRITE

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
	ld	(iy+02h),70h ; bullet pattern
	ld	(iy+03h),CFG_COLOR.BULLET; bullet color
	ld	a,(ix+04h) ; direction
	ld	(iy+04h),a
	ld	(iy+05h),0FFh ; bullet status active
; Put bullet sprite
	ld	de, bullet
	ld	a, 8
	call	PUT_SPRITE
	call	PLAY_SOUND_BULLET
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
GAME_LOOP.GUN_OK:
.L87E8:	call	SHORT_DELAY

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
.L8853:	xor	a ; left; was: ld a,00h
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
	xor	a ; left; was: ld a,00h
	call	MOVE_SKULL
	ld	a,02h ; right
	call	MOVE_SKULL
; player is up
.L8884:	ld	a,01h ; up
	call	MOVE_SKULL
	xor	a ; left; was: ld a,00h
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
	xor	a ; left; was: ld a,00h
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
	xor	a ; left; was: ld a,00h
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
.L88C9:	ld	hl,direction_table
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
.L88E8:
	add	a,(hl)
	ld	(hl),a


	ld	a,(skull.direction)
	ld	b,a ; b = 0..3
; Animates the player sprite each two frames (b += 0/4)
	ld	a,(aux.frame_counter)
	and	02h
	jr	z, .L88F4_
	ld	a, 04h
	add	a,b
	ld	b,a
; Computes and sets the sprite pattern (a *= 4)
.L88F4_:
	ld	a,b
	add	a,a
	add	a,a
	add	a, CFG_BASE_PATTERN.SKULL4*4

	ld	(skull.spratr_pat),a
; Puts the skull sprite
	ld	de, skull
	ld	a, 1
	call	PUT_SPRITE
; Checks collision between the skull and the player
	ld	ix,skull
	call	CHECK_ENEMY_PLAYER_COLLISION
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 87EF
	; --- START PROC L8908 ---

; -----------------------------------------------------------------------------
GAME_LOOP.SKULL_OK:
.L8908:	call	SHORT_DELAY
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
	ld	a, CFG_BASE_PATTERN.BULLET ; 1Ah
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
	ld	(hl),CFG_BASE_PATTERN.EXPLOSION_2*4 ; 78h
	inc	hl ; bullet.spratr_color
	ld	(hl),CFG_COLOR.EXPLOSION
	inc	hl ; bullet.direction
	inc	hl ; bullet.status
	ld	(hl),06h
; Sound
	call	PLAY_SOUND_BULLET_HIT
; Puts the bullet sprite
.L8961:	ld	de, bullet
	ld	a, 8
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 890F, 8912

; -----------------------------------------------------------------------------
GAME_LOOP.BULLET_OK:
.L8969:	call	SHORT_DELAY
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
	ld	ix,snake1
	call	UPDATE_ENEMY

; Is the exit open?
	ld	a,(exit.is_enabled)
	or	a
	jr	z,GAME_LOOP.EXIT_OK ; no
; yes: makes the exit blink
	ld	a,(exit.blink_counter)
	dec	a
	ld	(exit.blink_counter),a
	jr	nz,.L89B4
; (each 10 frames)
	ld	a, CFG_EXIT.BLINK_FRAMES ; 0Ah
	ld	(exit.blink_counter),a
	ld	a,(exit.blink_flag)
	cpl
	ld	(exit.blink_flag),a
	ld	de,0B0Ch
	or	a
	jr	z,.L89B1
; (prints the exit)
	ld	a, CFG_TILES_PATTERN.TILE_EXIT ; $44 ; 50h
	call	PRINT_TILE
	jr	.L89B4
; (clears the exit)
.L89B1:	call	CLEAR_TILE

; Compares player and exit coordinates
.L89B4:	ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
	inc	hl
	ld	a,60h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
; yes: increases room index (and increases the enemy count on new floor)
	call	INCREASE_ROOM_INDEX
	call	z, INCREASE_ENEMY_COUNT
; prints the room as visited
	ld	de,(pyramid.room_namtbl_ptr)
	ld	a, CFG_PYRAMID.ROOM_VISITED ; $51
	call	PRINT_CHAR
; Plays exit sound
	call	PLAY_SOUND_EXIT
; Scores 500 points
	ld	de,0500h
	call	ADD_SCORE
; Starts next room
	jp	NEW_ROOM
; -----------------------------------------------------------------------------

	; Referenced from 898D, 89BA, 89C0

; -----------------------------------------------------------------------------
GAME_LOOP.EXIT_OK:
.L89E1:	call	SHORT_DELAY
; Updates box2, scorpion2, bat2 and box3
	ld	ix,box2
	call	UPDATE_BOX

	ld	ix,scorpion2
	ld	a, [enemy_count]
	cp	4
	call	nc, UPDATE_ENEMY ; (only if enemy_count >= 4)

	ld	ix,bat2
	ld	a, [enemy_count]
	cp	5
	call	nc, UPDATE_ENEMY ; (only if enemy_count >= 5)

	ld	ix,box3
	call	UPDATE_BOX

	ld	ix,snake2
	ld	a, [enemy_count]
	cp	6
	call	nc, UPDATE_ENEMY ; (only if enemy_count >= 6)

; Updates bullet explosion
	ld	ix,bullet
	ld	a,(ix+05h) ; bullet.status
	or	a
	jr	z,GAME_LOOP.EVERYTHING_OK ; $00 = no bullet
	inc	a
	jr	z,GAME_LOOP.EVERYTHING_OK ; $ff = bullet flying
; Decreases counter
	sub	2
	ld	(ix+05h),a
; if 0, removes explosion
	jr	z,.L8A2D
; if < 4, makes explosion smaller
	ld	b, CFG_BASE_PATTERN.EXPLOSION ; $1c
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
	ld	(ix+03h),CFG_COLOR.EXPLOSION ; bullet.spratr_color
	jr	.L8A32

; Removes bullet
.L8A2D:	ld	(ix+00h),SPAT_OB

; Puts bullet sprite
.L8A32:	ld	de, bullet
	ld	a, 8
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8A08, 8A0B

; -----------------------------------------------------------------------------
GAME_LOOP.EVERYTHING_OK:
.L8A3A:	call	SHORT_DELAY
; Decreases air counter
	ld	hl,(game.air_left)
	dec	hl
	ld	(game.air_left),hl
; Updates HUD
	ld	de,CFG_HUD.AIR_LEFT_COORDS
	call	PRINT_AIR_LEFT
; If air is 0
	ld	hl,(game.air_left)
	ld	a,h
	or	l
	call	z,KILL_PLAYER
; Animates the enemies nest each four frames
	ld	a,(aux.frame_counter)
	and	04h
	ld	b, CFG_TILES_PATTERN.TILE_NEST1 ; $48 ; 54h
	jr	z,.L8A5D
	ld	b, CFG_TILES_PATTERN.TILE_NEST2 ; $4c ; 58h
; Prints nest
.L8A5D:	ld	a,(nest.spratr_y)
	rrca
	rrca
	rrca
	and	$1f
	ld	d,a
	ld	a,(nest.spratr_x)
	rrca
	rrca
	rrca
	and	$1f
	ld	e,a
	ld	a,b
	call	PRINT_TILE

; Does the player has the diamond?
	ld	a,(exit.has_diamond)
	or	a
	jr	z,.L8A8B ; no
; yes: enables the door (some "airs" after getting the diamond)
	ld	hl,(game.air_left)
	ld	de,(game.air_left_copy)
	xor	a
	sbc	hl,de
	jr	nc,.L8A88
	dec	a ; a = $ff
.L8A88:	ld	(exit.is_enabled),a

; Swaps door colors each four frames
.L8A8B:	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L8A98
	ld	bc,CFG_COLOR.DOOR_1 << 8 + CFG_COLOR.DOOR_2
	jr	.L8A9C
.L8A98:	ld	bc,CFG_COLOR.DOOR_2 << 8 + CFG_COLOR.DOOR_1
; Sets door colors (RAM)
.L8A9C:	ld	a,b
	ld	(door1.spratr_color),a
	ld	a,c
	ld	(door2.spratr_color),a
; Sets door colors (VRAM)
	ld	de, door1.spratr_y
	ld	a, 9
	call	PUT_SPRITE
	ld	de, door2.spratr_y
	ld	a, 10
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8ABD, 8AC3

; -----------------------------------------------------------------------------
GAME_LOOP.NEXT:
.L8AB4:	jp	GAME_LOOP
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
	; Referenced from 8971
CHECK_SPHYNX_ROOM_BOX:
; Is the player at ($60,$58)?
.L8AB7:	ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,GAME_LOOP.NEXT ; no
	inc	hl ; player.spratr_x
	ld	a,60h
	cp	(hl)
	jr	nz,GAME_LOOP.NEXT ; no
; yes
	call	PLAY_SOUND_BOX


;; screen ,3
;	ld	c,01h
;	ld	b,0E3h
;	call	WRTVDP

; Prints sphynx sprites
	ld	hl, DATA_SPHYNX_SPRATR + 0 *4
	ld	de, spratr_buffer
	ld	bc, 9 * 4
	ldir

	; Prints sphynx tiles
	ld	de, 030Ah
	ld	a, $64 + 4*0
	call	PRINT_TILE
	ld	de, 030Ch
	ld	a, $64 + 4*1
	call	PRINT_TILE
	ld	de, 030Eh
	ld	a, $64 + 4*2
	call	PRINT_TILE

	ld	de, 050Ah
	ld	a, $64 + 4*3
	call	PRINT_TILE
	ld	de, 050Ch
	ld	a, $64 + 4*4
	call	PRINT_TILE
	ld	de, 050Eh
	ld	a, $64 + 4*5
	call	PRINT_TILE

	ld	de, 070Ah
	ld	a, $64 + 4*6
	call	PRINT_TILE
	ld	de, 070Ch
	ld	a, $64 + 4*7
	call	PRINT_TILE
	ld	de, 070Eh
	ld	a, $64 + 4*8
	call	PRINT_TILE


; Prints the sphynx room in the map
	ld	a,$52 ; ($62 = sphynx room)
	ld	de,121Ch	; address or value?
	call	PRINT_CHAR
; color ,,1
	ld	bc,CFG_COLOR.BG_SPHYNX << 8 + 07h
	call	WRTVDP
; Sphynx sound
	call	PLAY_SOUND_SPHYNX
; Increase score
	ld	de,2000h ; 2000 points (BCD)
	call	ADD_SCORE
; Prints literal
	ld	de,1206h
	ld	b,0Eh
	ld	hl,LITERAL.CONGRATULATIONS
	call	PRINT
	ld	hl,LITERAL.TRY_THE_NEXT_PYRAMID
	ld	de,1403h
	ld	b,14h
	call	PRINT

; "Hit space key"
	ld	de,1606h
	call	HIT_SPACE_KEY

; screen ,2
.L8B4C:	ld	bc,0E2h << 8 + 01h
	call	WRTVDP
; color ,,4
	ld	bc,CFG_COLOR.BG << 8 + 07h
	call	WRTVDP
; Extra life
	ld	hl, game.lives
	inc	[hl]
; Increases difficulty
	ld	hl, game.pyramid_count
	inc	[hl]
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
.L8B69:	push	de
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
.L8BE2:	srl	e
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
	jr	z,.L8BFB
	add	hl,bc ; y++
	jr	.L8BF5
.L8BFB:	add	hl,de ; += x (d = 0, e = x)
; Reads the character
	call	RDVRM
	ld	b,a

	; Checks for floor
		ld	a, CFG_TILES_PATTERN.TILE_FLOOR-1
		cp	b
		jr	nc, .L8BFB_ ; no
		ld	a, CFG_TILES_PATTERN.TILE_FLOOR_END-1
		cp	b
		jr	c, .L8BFB_ ; no
	; yes: wall
		ld	b, $FF
.L8BFB_:

; Is checking player?
	ld	a,(check_wall_for_player)
	or	a
	jr	z,.L8C20 ; no

; Checks for box (player only)
	ld	a, CFG_TILES_PATTERN.TILE_BOX-1 ; $34 -1 ; >= $34?
	cp	b
	jr	nc,.L8C13 ; no
	ld	a, CFG_TILES_PATTERN.TILE_BOX_END-1 ; $38 -1 ; and <= $37?
	cp	b
	jr	c,.L8C13 ; no
; yes: box, not a wall
	ld	a,0FFh
	ret

; Checks for exit (player only)
.L8C13:
	ld	a, CFG_TILES_PATTERN.TILE_EXIT-1 ; $44 -1 ; >= $44?
	cp	b
	jr	nc,.L8C20 ; no
	ld	a, CFG_TILES_PATTERN.TILE_EXIT_END-1 ; $48 -1 ; and <= $48?
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
	add	a,l
	ld	l,a
	adc	a,h
	sub	l
	ld	h,a
	ret
; -----------------------------------------------------------------------------

	; Referenced from 82EB, 830A, 8325, 8658, 8CCC, 8C67
	; --- START PROC L8C2E ---

; -----------------------------------------------------------------------------
; ret a: random value
RANDOMIZE:
.L8C2E:	ld	iy,JIFFY
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
.L8C3C:	ld	b,CFG_OTHERS.SHORT_DELAY_FACTOR
.L8C3E:	ld	a,(game.short_delay)
.L8C41:	dec	a
	jr	nz,.L8C41
	djnz	.L8C3E
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8FB0, 8676, 9088, 9109, 9064
	; --- START PROC L8C47 ---

; -----------------------------------------------------------------------------
; Synchronization routines (modified to use halt instead of loops)
DELAY:

.ONE_SECOND:
	ld	hl, frame_rate
	ld	b, (hl)
	jr	.LOOP

.ONE_TENTH:
	ld	hl, frames_per_tenth
	ld	b, (hl)
	; inc	b ; (the original delay was ~7 frames in 60Hz)
	; jr	.LOOP ; falls through

.LOOP:
	push	bc ; preserves b
	halt
	call	LDIRVM_SPRITES ; (keeps the flickering during the wait)
	pop	bc ; restores b
	djnz	.LOOP
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8978, 8986, 89EF, 89F6
	; --- START PROC L8C50 ---

; -----------------------------------------------------------------------------
; param ix: pointer to the enemy
UPDATE_ENEMY:
; Preserves pointer
.L8C50:	ld	(current_enemy_ptr),ix
; Active?
	ld	a,(ix+05h)
	or	a
	jr	nz,UPDATE_ALIVE_ENEMY ; yes
; no: ready to spawn?
	ld	a,(spawn_enemy_delay)
	or	a
	jr	z,SPAWN_NEW_ENEMY ; yes
; no: decreases the delay
	dec	a
	ld	(spawn_enemy_delay),a
	jp	SHORT_DELAY
; -----------------------------------------------------------------------------

	; Referenced from 8C5E

; -----------------------------------------------------------------------------
SPAWN_NEW_ENEMY:
; 50% of the time
.L8C67:	call	RANDOMIZE
	cp	80h
	jp	c,SHORT_DELAY ; waits a little longer
; yes: restarts delay
	ld	a,20h
	ld	(spawn_enemy_delay),a
; Initializes coords from nest, state, direction
	ld	bc,(nest)
	ld	(ix+00h),c ; .spratr_y
	ld	(ix+01h),b ; .spratr_x
	ld	(ix+05h),0FFh ; .status
	ld	(ix+04h),000h ; .direction (0 = left)
; Reads enemy pattern
	ld	b,(ix+06h) ; .base_pattern
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L8C92
	inc	b
; Computes actual pattern
.L8C92:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a ; .spratr_pattern
; Puts sprite
	ld	de, (current_enemy_ptr)
	ld	a, (ix + enemy_sprite_plane) ; .sprite_plane
	call	PUT_SPRITE
; Checks enemy and bullet collision
	jp	CHECK_ENEMY_BULLET_COLLISION
; -----------------------------------------------------------------------------

	; Referenced from 8C58

; -----------------------------------------------------------------------------
UPDATE_ALIVE_ENEMY:
; Reads enemy coordinates in de
.L8CA5:	ld	d,(ix+00h)
	ld	e,(ix+01h)
; Checks available directions
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
; Only one direction available?
	inc	a ; $ff +1 = $00
	jr	z,.L8CCC ; yes
; no: avoids moving back faking a wall in the incoming direction
	ld	a,(ix+04h)
	xor	02h ; (reverses direction)
	ld	hl,direction_table
	call	ADD_HL_A
	xor	a
	ld	(hl),a ; (fakes the wall)

; Randomizes new enemy direction
.L8CCC:	call	RANDOMIZE
	and	03h
	; or	a ; (unnecessary)
	jr	z,.L8CE9
	dec	a
	jr	z,.L8CE4
	dec	a
	jr	z,.L8CDF
	ld	a,03h ; down
	call	MOVE_ENEMY
.L8CDF:	ld	a,02h ; right
	call	MOVE_ENEMY
.L8CE4:	ld	a,01h ; up
	call	MOVE_ENEMY
.L8CE9:	xor	a ; left; was: ld a,00h
	call	MOVE_ENEMY
	ld	a,03h ; down
	call	MOVE_ENEMY
	ld	a,02h ; right
	call	MOVE_ENEMY
	ld	a,01h ; up
	call	MOVE_ENEMY
	; (control never reaches here)
; -----------------------------------------------------------------------------

	; Referenced from 8CDC, 8CE1, 8CE6, 8CEB, 8CF0, 8CF5, 8CFA
	; --- START PROC L8CFD ---

; -----------------------------------------------------------------------------
; param a: direction to try (0..3 = left, up, right, down)
; ret: if the enemy could not be moved in that direction
; continues below: if the enemy was moved
MOVE_ENEMY:
; Wall in that direction?
.L8CFD:	ld	hl,direction_table
	ld	b,a
	call	ADD_HL_A
	ld	a,(hl)
	or	a
	ret	z; yes
; no: (no ret)
	pop	hl
; Moves the enemy
	ld	hl,(current_enemy_ptr)
	ld	(ix+enemy_direction),b ; .direction
	ld	a,02h ; (two pixels)
	srl	b
	jr	c,.L8D15
	inc	hl ; .x
.L8D15:	srl	b
	jr	c,.L8D1B
	neg
.L8D1B:	add	a,(hl)
	ld	(hl),a

; Animates the enemy each four frames
	ld	ix,(current_enemy_ptr)

	ld	a,(ix+enemy_direction)
	ld	b,a ; b = 0..3
; Animates the enemy sprite each four frames (b += 0/4)
	ld	a,(aux.frame_counter)
	and	04h
	jr	z, .L8D2C_
	ld	a, 04h
	add	a,b
	ld	b,a
; Computes and sets the sprite pattern (a *= 4)
.L8D2C_:
	ld	a,b
	add	a,a
	add	a,a
	add	a, (ix+enemy_base_pattern)

	ld	(ix+enemy_spratr_pat),a ; .spratr_pattern
	ld	de, (current_enemy_ptr)
	ld	a, (ix + enemy_sprite_plane) ; .sprite_plane
	call	PUT_SPRITE
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8CA2
	; --- START PROC L8D3C ---

; -----------------------------------------------------------------------------
CHECK_ENEMY_BULLET_COLLISION:
; Is there any bullet?
.L8D3C:	ld	a,(bullet.status)
	or	a
	jr	z,CHECK_ENEMY_PLAYER_COLLISION ; no
; Yes: compares y
	ld	ix,(current_enemy_ptr)
	ld	a,(ix+00h) ; .y
	add	a,08h ; (8 pixels distance)
	ld	b,a
	ld	a,(bullet.spratr_y)
	inc	a
	sub	b
	jr	nc,.L8D55
	neg
.L8D55:	cp	05h
	jr	nc,CHECK_ENEMY_PLAYER_COLLISION ; no collision
; Compares x
	ld	a,(ix+01h) ; .x
	add	a,08h ; (8 pixels distance)
	ld	b,a
	ld	a,(bullet.spratr_x)
	inc	a
	sub	b
	jr	nc,.L8D68
	neg
.L8D68:	cp	05h
	jr	nc,CHECK_ENEMY_PLAYER_COLLISION ; no collision
; Sets the enemy coords to the bullet (for the explosion)
	ld	hl,bullet.spratr_y
	ld	a,(ix+00h)
	ld	(hl),a
	inc	hl ; bullet.spratr_x
	ld	a,(ix+01h)
	ld	(hl),a
	inc	hl ; bullet.spratr_pat
	ld	(hl),78h
	inc	hl ; bullet.spratr_color
	ld	(hl),CFG_COLOR.EXPLOSION
	inc	hl ; bullet.direction
	inc	hl ; bullet.status
	ld	(hl),06h
; Prints explosion sprite
	ld	de, bullet
	ld	a, 9
	call	PUT_SPRITE
; Play sound
	call	PLAY_SOUND_BULLET_HIT
; Scores 30 points
	ld	de,0030h
	call	ADD_SCORE
; Removes enemy (RAM)
	ld	(ix+05h),000h ; .status
	ld	(ix+00h),SPAT_OB ; .spratr_y
; Removes enemy (VRAM)
	ld	de, (current_enemy_ptr)
	ld	a, (ix + enemy_sprite_plane) ; .sprite_plane
	jp	PUT_SPRITE
; -----------------------------------------------------------------------------

	; Referenced from 8905, 8D40, 8D57, 8D6A
	; --- START PROC L8DAC ---

; -----------------------------------------------------------------------------
; param ix: pointer to the enemy
CHECK_ENEMY_PLAYER_COLLISION:
.L8DAC:	ld	a,(player.spratr_y)
	ld	d,a
	ld	a,(player.spratr_x)
	ld	e,a
; Compares y
	ld	a,(ix+00h) ; .y
	sub	d
	jr	nc,.L8DBC
	neg
.L8DBC:	cp	08h ; (8 pixels distance)
	ret	nc ; no collision
; Compares x
	ld	a,(ix+01h) ; .x
	sub	e
	jr	nc,.L8DC7
	neg
.L8DC7:	cp	08h ; (8 pixels distance)
	ret	nc ; no collision
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8A4F
	; --- START PROC L8DCA ---

; -----------------------------------------------------------------------------
KILL_PLAYER:
; (no ret from call CHECK_ENEMY_PLAYER_COLLISION or call KILL_PLAYER)
.L8DCA:	pop	hl
	call	PLAY_DEAD_MUSIC
; color ,,4
	ld	bc,CFG_COLOR.BG << 8 + 07h
	call	WRTVDP
	jp	DEC_LIVES_AND_NEW_ROOM
; -----------------------------------------------------------------------------

	; Referenced from 837C
	; --- START PROC L8DD8 ---

; -----------------------------------------------------------------------------
GAME_OVER:
.L8DD8:	call	REPLAYER.STOP ; was: call RESET_SOUND
; Prints GAME OVER message
	ld	hl,LITERAL.GAME_OVER
	ld	de,0808h
	ld	b,09h
	call	PRINT

; "Hit space key"
	ld	de,0C06h
	call	HIT_SPACE_KEY

	jp	NEW_GAME
; -----------------------------------------------------------------------------

	; Referenced from 897F, 89E8, 89FD
	; --- START PROC L8E0A ---

; -----------------------------------------------------------------------------
; param ix: pointer to the box
UPDATE_BOX:
; Is the box just open?
.L8E0A:	ld	a,(ix+02h) ; .is_opening
	or	a
	jp	nz,UPDATE_BOX_JUST_OPEN ; yes
; Compares y
	ld	hl,player.spratr_y
	ld	a,(ix+00h) ; .y
	cp	(hl)
	ret	nz ; no collision
; Compares x
	inc	hl ; hl = player.spratr_x
	ld	a,(ix+01h) ; .x
	cp	(hl)
	ret	nz ; no collision
; Opens the box
	call	PLAY_SOUND_BOX
	call	SHORT_DELAY
	ld	(ix+02h),0FFh ; .status

	ld	(ix+03h),32h		; '2'
	ld	d,(ix+00h)
	ld	e,(ix+01h)
; Checks the contents
	ld	a,(ix+04h)
	or	a
	jr	z,OPEN_BOX_SKULL ; skull
; Is the gun or the diamond; prepares the coordinates
	srl	d
	srl	d
	srl	d
	srl	e
	srl	e
	srl	e
; Is the gun?
	cp	38h ; $38 = gun
	jr	z,OPEN_BOX_GUN ; Diamond
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
OPEN_BOX_DIAMOND:
; Sets the proper flags
	ld	a,0FFh
	ld	(exit.has_diamond),a
	ld	a,01h
	ld	(exit.unused1),a
	ld	(exit.blink_counter),a
	xor	a
	ld	(exit.unused2),a
; Prints the diamond
	ld	a, CFG_TILES_PATTERN.TILE_DIAMOND ; 3Ch
	call	PRINT_TILE
; Prepares the mark to opening the door (2 "airs" later)
	ld	hl,(game.air_left)
	ld	bc,0002h ; number of "airs"
	xor	a
	sbc	hl,bc
	ld	(game.air_left_copy),hl
; Scores 3000 points
	ld	de,0300h
	jp	ADD_SCORE
; -----------------------------------------------------------------------------

	; Referenced from 8E49

; -----------------------------------------------------------------------------
OPEN_BOX_GUN:
; Sets the proper flags
.L8E76:	ld	a,08h
	ld	(player_has_gun),a
; Prints the gun
	ld	a, CFG_TILES_PATTERN.TILE_GUN ; 38h
	call	PRINT_TILE
; Scores 100 points
	ld	de,0100h
	jp	ADD_SCORE
; -----------------------------------------------------------------------------

	; Referenced from 8E39

; -----------------------------------------------------------------------------
OPEN_BOX_SKULL:
; Initializes the skull
.L8E89:	ld	hl,skull.spratr_y
	push	de
	ld	(hl),d
	inc	hl ; skull.spratr_x
	ld	(hl),e
	inc	hl ; skull.spratr_pattern
	ld	(hl),CFG_BASE_PATTERN.SKULL4*4+12 ; 40h
	inc	hl ; skull.spratr_color
	ld	(hl),CFG_COLOR.SKULL
	inc	hl ; skull.direction
	xor	a
	ld	(hl),a
	inc	hl ; skull.status
	inc	hl ; skull.base_pattern
	ld	(hl),CFG_BASE_PATTERN.SKULL4 ; 10h
	inc	hl ; skull.sprite_plane
	ld	(hl),03h
; Put skull sprite
	ld	de, skull
	ld	a, 1
	call	PUT_SPRITE
; Scores 200 points
	ld	de,0200h
	call	ADD_SCORE
	pop	de
; Immediatly removes box
	jr	REMOVE_OPEN_BOX
; -----------------------------------------------------------------------------

	; Referenced from 8E0E

; -----------------------------------------------------------------------------
; param ix: pointer to the box
UPDATE_BOX_JUST_OPEN:
; Already open?
.L8EB8:	ld	a,(ix+03h) ; .remove_delay
	or	a
	ret	z ; yes
; Decreases counter
	dec	a
	ld	(ix+03h),a ; .remove_delay
	ret	nz ; not yet
; After initial delay...
	ld	d,(ix+00h) ; .y
	ld	e,(ix+01h) ; .x
	ld	a,(ix+04h) ; .content
; Is skull?
	or	a
	jr	z,ACTIVATE_SKULL ; yes: activate skull
; no: simply removes the box
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8EB6

; -----------------------------------------------------------------------------
REMOVE_OPEN_BOX:
.L8ECE:	srl	d
	srl	d
	srl	d
	srl	e
	srl	e
	srl	e
	call	CLEAR_TILE
	jp	SHORT_DELAY
; -----------------------------------------------------------------------------

	; Referenced from 8ECC

; -----------------------------------------------------------------------------
ACTIVATE_SKULL:
.L8EE0:	ld	a,0FFh
	ld	(skull.status),a
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_RANDOMIZE_BOX_CONTENTS:
.L8EE6:	DB	38h ; gun
	DB	3Ch ; jewel
	DB	00h ; skull
	DB	38h ; gun
	DB	3Ch ; jewel
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_START_GAME_MUSIC:
; Plays the jingle
	ld	hl, .SONG -100 ; (headerless)
	call	REPLAYER.PLAY_JINGLE
	jp	DELAY.ONE_SECOND
.SONG:
	incbin "asm/enhancedplus/PW_NewGame.pt3", 100 ; (headerless)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_INGAME_MUSIC:
	ld	hl, .SONG -100 ; (headerless)
	xor	a ; (loop)
	jp	REPLAYER.PLAY
.SONG:
	incbin "asm/enhancedplus/PW_VT2_3chan.pt3", 100 ; (headerless)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_DEAD_MUSIC:
; Changes the player color
IFDEF CFG_OTHERS.DEAD_PLAYER_COLOR
	ld	a, CFG_OTHERS.DEAD_PLAYER_COLOR
	ld	(spratr_buffer + 3),a
	; call	LDIRVM_SPRITES ; (embedded in the delay)
ENDIF

; Plays the jingle
	ld	hl, .SONG -100 ; (headerless)
	inc	a ; (not a loop)
	call	REPLAYER.PLAY

; Initializes the "flashing" flag
	xor	a
	ld	(aux.dying_flashes),a
; (mimics the timing of the original descending notes)
	ld 	a, 12
.L8FBD:	push	af
	call	.FLASH
	pop	af
	dec	a
	jr	nz,.L8FBD
; color ,,6
	ld	bc,CFG_COLOR.BG_DEAD_3 << 8 + 07h
	call	WRTVDP
; (delay)
	call	REPLAYER.WAIT
	jp	DELAY.ONE_SECOND

.FLASH:
; Flashes the background color
	ld	a,(aux.dying_flashes)
	cpl
	ld	(aux.dying_flashes),a
	ld	b,CFG_COLOR.BG_DEAD_2
	or	a
	jr	nz,.L905F
	ld	b,CFG_COLOR.BG_DEAD_1
; color ,,b
.L905F:	ld	c,07h
	call	WRTVDP

; Changes the player direction without touching any other attribute
IFDEF CFG_OTHERS.DEAD_PLAYER_DIZZY
	ld	hl, spratr_buffer + 2
	ld	a, (hl)
	and	$f0 ; stores the non-direction part of the pattern...
	ld	b, a ; ...in b
	ld	a, (hl)
	add	4 ; next direction
	and	$0c ; combines the new direction part of the pattern...
	or	b ; ...with the rest of the pattern
	ld	(hl), a
	; call	LDIRVM_SPRITES ; (embedded in the delay)
ENDIF

	jp	DELAY.ONE_TENTH

.SONG:
	incbin "asm/enhancedplus/PW_Dead2.pt3", 100 ; (headerless)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_SOUND_EXIT:
; color ,,3
	ld	bc, CFG_COLOR.BG_EXIT << 8 + 07h
	call	WRTVDP
; Plays the jingle
	ld	hl, .SONG -100 ; (headerless)
	call	REPLAYER.PLAY_JINGLE
; color ,,4
	ld	bc, CFG_COLOR.BG << 8 + 07h
	jp	WRTVDP
.SONG:
	incbin "asm/enhancedplus/PW_LevelFinished.pt3", 100 ; (headerless)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_SOUND_BOX:
	ld	a, CFG_SOUND.BOX
	ld	c, 9 ; default-low priority
	jp	ayFX_INIT

PLAY_SOUND_DOOR:
	ld	a, CFG_SOUND.DOOR
	ld	c, 9 ; default-low priority
	jp	ayFX_INIT

PLAY_SOUND_BULLET_HIT:
	ld	a, CFG_SOUND.BULLET_HIT
	ld	c, 9 ; default-low priority
	jp	ayFX_INIT

PLAY_SOUND_BULLET:
	ld	a, CFG_SOUND.BULLET
	ld	c, 9 ; default-low priority
	jp	ayFX_INIT

PLAY_SOUND_SPHYNX:
	ld	a, CFG_SOUND.SPHYNX
	ld	c, 9 ; default-low priority
	jp	ayFX_INIT
; -----------------------------------------------------------------------------


; -----------------------------------------------------------------------------
; ayFX sound bank
SOUND_BANK:
	incbin "asm/enhancedplus/test.afb"

CFG_SOUND:
						; valid sounds in <test.afb>:
	.BOX:			equ  8 -1	; 3, 4, 8, 15
	.DOOR:			equ 13 -1	; 10, 11, 12, 13, 17
	.BULLET:		equ  5 -1	; 2, 5, 7
	.BULLET_HIT:		equ 14 -1	; 2, 5, 7, 9, 14
	.SPHYNX:		equ 11 -1	; 6, 11
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Hides the sprites
CLEAR_SPRITES:
; Fills with SPAT_OB
	ld	hl, spratr_buffer
	ld	bc, 11 << 8 + SPAT_OB
.LOOP:
	ld	(hl), c
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	djnz	.LOOP
; SPAT_END
	dec	c ; c = SPAT_END
	ld	(hl), c
; spratr_buffer.flicker_offset = 0
	xor	a
	ld	(spratr_buffer.flicker_offset), a
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param a: sprite index
; param de: ROM/RAM source SPRATR data
PUT_SPRITE:
.L91E3:
	ld	hl,spratr_buffer
	ld	bc,4 ; 4b per sprite
	inc	a
.L91EA: dec	a
	jp	z,.L91F1
	add	hl,bc
	jr	.L91EA
.L91F1: ex	de,hl
	ldir
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
LDIRVM_SPRITES:
; Has the VDP reported a 5th sprite?
	ld	a, [STATFL]
	bit	6, a
	jr	z, .NO_FLICKER ; no: non-flickering LDIRVM
; Reads the 5th sprite plane
	and	$0f
; Computes the new flickering offset
	sub	2 ; (player and skull don't flicker)
	add	a ; a (offset, bytes) = a *4
	add	a
	ld	hl, spratr_buffer.flicker_offset
	add	[hl]
; Is the offset beyond the actual flickering size?
	cp	11 * 4 ; (size, bytes)
	jr	c, .OFFSET_OK ; no
; yes: tries to loop around
	sub	11 * 4 ; (size, bytes)
	jr	z, .OFFSET_ZERO ; (the offset got reset)
; Is the offset still beyond the actual flickering size?
	cp	11 * 4 ; (size, bytes)
	jr	c, .OFFSET_OK ; no
; yes: The flickering size has changed between frames; resets the offset
	xor	a
.OFFSET_ZERO:
; Preserves the offset for the next frame
	ld	[hl], a
	jr	.NO_FLICKER ; non-flickering LDIRVM

.OFFSET_OK:
; Preserves the offset for the next frame
	ld	[hl], a

; Copies the sprites before the offset at the actual end of the spratr buffer
	ld	hl, spratr_buffer + 2 *4
	ld	de, spratr_buffer.end
	ld	b, 0 ; bc = offset
	ld	c, a
	push	bc ; (preserves offset)
	ldir
; Appends a SPAT_END (just in case)
	ld	a, SPAT_END
	ld	[de], a

; LDIRVM the non-flickering sprites
	ld	hl, spratr_buffer
	ld	de, SPRATR
	ld	bc, 2 *4
	call	LDIRVM

; LDIRVM the sprites, starting from the offset
	ld	hl, spratr_buffer + 2 *4
	pop	bc ; (restores offset)
	add	hl, bc
	ld	de, SPRATR + 2 *4
	ld	bc, spratr_buffer.size - 2 *4
	jp	LDIRVM

; LDIRVM the actual SPRATR buffer
.NO_FLICKER:
; Appends a SPAT_END (just in case)
	ld	hl, spratr_buffer.end
	ld	[hl], SPAT_END

	ld	hl, spratr_buffer
	ld	de, SPRATR
	ld	bc, spratr_buffer.size
	jp	LDIRVM
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
LDIRVM_3_BANKS:
	call	.BLIT
	call	.BLIT
.BLIT:
; Preserves everything
	push	hl
	push	bc
	push	de
; Actual LDIRVM
	call	LDIRVM
; Restores dest and moves to next bank
	pop	hl
	ld	bc, CHRTBL.BANK_SIZE
	add	hl, bc
	ex	de, hl
; Restores size and source
	pop	bc
	pop	hl
	ret
; -----------------------------------------------------------------------------

	; Referenced from 8F46, 8FAD, 9148, 9130, 9142, 9139, 911E, 8FE5, 9127, 906D, 9091, 904C, 9100, 9106
	; --- START PROC L9264 ---

; -----------------------------------------------------------------------------
; param hl: sound data pointer
PLAY_SOUND:
; .L9264:	ld	b,(hl)
; .L9265:	inc	hl
; 	ld	a,(hl)
; 	inc	hl
; 	ld	e,(hl)
; 	call	0093h
; 	djnz	.L9265
	ret
; -----------------------------------------------------------------------------

	; Referenced from 86C2
	; --- START PROC L926F ---

; -----------------------------------------------------------------------------
GTSTCK_ANY:
.L926F:	xor	a
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
.L9280:	xor	a
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

; -----------------------------------------------------------------------------
; param de: score to add (BCD)
ADD_SCORE:
.L9296:	ld	hl,game.score_bcd + 2
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
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
PRINT_SCORE_AND_UPDATE_HIGH_SCORE:
	ld	de,CFG_HUD.SCORE_COORDS
	call	PRINT_SCORE
	ld	de,CFG_HUD.HIGH_COORDS
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
UPDATE_HIGH_SCORE:
; Compares score (BCD) with high score (BCD)
.L92A9:	ld	hl,game.score_bcd
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

; -----------------------------------------------------------------------------
PRINT_SCORE:
.L92D6:	ld	hl,game.score_bcd
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
; Writes 6 BCD characters
; param hl: ROM/RAM source data
; param de: yx
WRTVRM_6x_BCD:
; 3 times 2 characters
.L92D9:	call	.L92DF
	call	.L92DF
; First digit
.L92DF: push	hl
	push	de
	xor	a
	rld
	push	af
	call	PRINT_CHAR
	pop	af
	pop	de
	pop	hl
; Next digit
	inc	e
	push	hl
	push	de
	rld
	push	af
	call	PRINT_CHAR
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

; -----------------------------------------------------------------------------
; param hl: game.air_left value
; param de: VRAM destination
PRINT_AIR_LEFT:
; Computes air_left_bcd (first digit)
.L849B:	ld	bc,03E8h ; 1000
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
	jp	PRINT
; -----------------------------------------------------------------------------

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
.L8603:	ld	a,d
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
	; Referenced from 81C8, 81D3, 81DE, 81E9, 8208, 9308, 822E, 8239, 8244, 824F, 825A, 8265, 8270, 827B, 8286, 8296, 82C0, 82CF, 8350, 8372, 8389, 8DE3, 8E02, 84CE, 8B12, 8B1D, 8B28, 8B47
	; --- START PROC L92FC ---

; -----------------------------------------------------------------------------
; param de: VRAM destination
HIT_SPACE_KEY:
	ld	hl,.LITERAL
	ld	b,0Dh
	call	PRINT
.LOOP:	push	de
	call	.BLINK
	call	GTTRIG_ANY
	pop	de
	or	a
	ret	nz
	jr	.LOOP

.LITERAL:
	DB	$11, $12, $1D, $FF		; HIT_
	DB	$1C, $19, $0A, $0C, $0E, $FF	; SPACE_
	DB	$14, $0E, $22			; KEY

.BLINK:
; (preparation)
	ld	hl,.LITERAL
	ld	b,0Dh
; Increases counter
	ld	a,(aux.frame_counter_2)
	inc	a
	ld	(aux.frame_counter_2),a
; Prints text
	and	80h
	jr	z,PRINT
; Clears text
	ld	hl,LITERAL.BLANKS
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
; param hl: ROM/RAM source
; param de: VRAM destination ($yyxx)
; param b: number of chars
; ret de: VRAM destination
PRINT:
; (preserves de and length)
	push	de
	ld	a, b
	ex	af, af'
	call	TO_NAMTBL
; (restores length in c; actually, in bc)
	ex	af,af'
	ld	c, a
	call	LDIRVM
; (restores de)
	pop	de
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param de: VRAM destination ($yyxx)
CLEAR_TILE:
	ld a, CFG_TILES_PATTERN.TILE_FLOOR
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param de: VRAM destination ($yyxx)
; param a: character to put
PRINT_TILE:
	ex	af, af'
	call	TO_NAMTBL
	ex	de,hl
	ex	af,af'
; First row, first char
	call	.CHAR
; Second char
	ld	a, c
	inc	hl
	call	.CHAR
; Second row, first char
	ld	a, c
	ld	bc, SCR_WIDTH -1
	add	hl, bc
	call	.CHAR
; Second char
	ld	a, c
	inc	l
	jp	WRTVRM

; param hl: VRAM destination
; param a: character to print
; ret hl: VRAM destination
; ret c: a + 1
.CHAR:
	ld	c, a
	push	hl
	call	WRTVRM
	pop	hl
	inc	c
	ret
; -----------------------------------------------------------------------------

; param hl: tile address
; param de: VRAM destination ($yyxx)
; param a: character to put
PRINT_TILE_SEQ:
	ex	af, af'
	call	TO_NAMTBL
	;ex	de,hl
	ex	af,af'

	push	hl
	push	de
	ld		bc, 2
	call	LDIRVM
	pop	de
	ld		hl, 32
	add	hl, de
	ex		de, hl
	pop	hl
	inc	hl
	inc	hl
	ld		bc, 2
	jp		LDIRVM


; -----------------------------------------------------------------------------
; param de: VRAM destination ($yyxx)
; param a: character to put
PRINT_CHAR:
; (preserves char)
	ex	af, af'
	call	TO_NAMTBL
	ex	de,hl
; (restores char)
	ex	af,af'
	jp	WRTVRM
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param de: coordinates $yyxx
; ret b: 0
; ret c: 32
; ret de: NAMTBL coordinates
; destroys: a, bc
TO_NAMTBL:
	push	hl
	ld	hl, NAMTBL
	ld	bc, SCR_WIDTH
	inc	d
.Y:	dec	d
	jr	z, .Y_OK
	add	hl, bc
	jr	.Y
.Y_OK:	add	hl, de
	ex	de, hl
	pop	hl
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
LITERAL:
.DASHES: ; 9C04
	DB	$27, $27, $27, $27, $27, $27, $27	; -------
.TnESOFT: ; 9C12
	DB	$1D, $24, $0E, $2B, $2C, $2D, $2E	; T&Esoft
.HIGH: ; 9C1D
	DB	$11, $12, $10, $11			; HIGH
.SCORE: ; 9C21
	DB	$1C, $0C, $18, $1B, $0E			; SCORE
.ROOM: ; 9C26
	DB	$1B, $18, $18, $16			; ROOM
.AIR: ; 9C2A
	DB	$0A, $12, $1B				; AIR



.WALL_x24:
	DB	$5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E	; 24x wall
	DB	$5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E
	DB	$5E, $5E, $5E, $5E, $5E, $5E, $5E, $5F

.BLANKS:
	DB	$2F, $2F, $2F, $2F, $2F, $2F, $2F	; 15x blanks
	DB	$2F, $2F, $2F, $2F, $2F, $2F

.ROOMS_x7:
	DB	$53, $53, $53, $53, $53, $53, $53	; 7x black room

.LIVES_x6: ; 9C77
	DB	$50, $50, $50, $50, $50, $50		; 6x life

.CONGRATULATIONS: ; 9C7D
	DB	$0C, $18, $17, $10, $1B, $0A, $1D, $1E
	DB	$15, $0A, $1D, $12, $18, $17		; CONGRATULATION
.TRY_THE_NEXT_PYRAMID: ; 9C8B
	DB	$1D, $1B, $22, $FF			; TRY_
	DB	$1D, $11, $0E, $FF			; THE_
	DB	$17, $0E, $21, $1D, $FF			; NEXT_
.PYRAMID_WARP:
.PYRAMID:
	DB	$19, $22, $1B, $0A, $16, $12, $0D	; PYRAMID
	DB	$2F					; _
	DB	$20, $0A, $1B, $19			; WARP
.MSX: ; 9CAC
	DB	$16, $1C, $21				; MSX
.COPYRIGHT: ; 9CBB
	DB	$28, $0C, $29, $2F			; (C)_
.Y1983:
	DB	$01, $09, $08, $03, $2F			; 1983_
	DB	$0B, $22, $2F				; BY_
	DB	$1D, $24, $0E, $2F			; T&E_
	DB	$1C, $18, $0F, $1D			; SOFT
.GAME_OVER: ; 9CCF
	DB	$10, $0A, $16, $0E, $FF			; GAME_
	DB	$18, $1F, $0E, $1B			; OVER
.PYRAMID_WARP_TITLE:
	;	P__  Y__  R__  A__  M____  I_ D__    W_____  A__  R__  P__
	DB	$8A, $8B, $8C, $8D, $8E, $8F, $90, $91, $92, $8D, $8C, $8A
	DB	$93, $94, $95, $96, $97, $98, $99, $9A, $9B, $96, $95, $93
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SPHYNX_SPRATR:
.L9F28:
	DB	23,  80, $7C, $04
	DB	23,  96, $80, $04
	DB	23, 112, $84, $04

	DB	39,  80, $88, $04
	DB	39,  96, $8C, $04
	DB	39, 112, $90, $04

	DB	55,  80, $94, $04
	DB	55,  96, $98, $04
	DB	55, 112, $9C, $04

	DB	63,  96, 12, $0E


;	DB	07h, 50h, $7c, $04 ; ..., 84h, 04h
;	DB	07h, 70h, $80, $04 ; ..., 88h, 04h
;	DB	27h, 50h, $84, $04 ; ..., 8Ch, 04h
;	DB	27h, 70h, $88, $04 ; ..., 90h, 04h

; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SOUND.MUTE_CHANNELS:
.L9F38:	DB	01h ; length
	DB	07h, 0BFh

DATA_SOUND.SPHYNX:
.L9F3B:	DB	0Dh ; length
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
DATA_FONT:
	incbin	"asm/enhancedplus/font.pcx.chr"
	.SIZE:	equ $ - DATA_FONT

DATA_SPRTBL:
	incbin	"asm/enhancedplus/sprites.pcx.spr"
	.SIZE:	equ $ - DATA_SPRTBL

DATA_CHARSET:
	.CHR:
	incbin	"asm/enhancedplus/charset.pcx.chr"
	.CHR_FF:	equ $ - 8
	incbin	"asm/enhancedplus/title.pcx.chr"
	incbin	"asm/enhancedplus/cursor.pcx.chr"
	.SIZE:	equ $ - DATA_CHARSET

	.CLR:
	incbin	"asm/enhancedplus/charset.pcx.clr"
	.CLR_FF:	equ $ - 8
	incbin	"asm/enhancedplus/title.pcx.clr"
	incbin	"asm/enhancedplus/cursor.pcx.clr"

DATA_WALL_ENHANCE:
	DB	$30,	$31,	$32,	$33	; 0
	DB	$5D,	$31,	$5C,	$33	; 1
	DB	$5E,	$5F,	$32,	$33	; 2
	DB	$5E,	$5F,	$5C,	$33	; 3
	DB	$30,	$5D,	$32,	$5C	; 4
	DB	$5D,	$5D,	$5C,	$5C	; 5
	DB	$5E,	$5E,	$32,	$5C	; 6
	DB	$5E,	$5E,	$5C,	$5C	; 7
	DB	$30,	$31,	$5E,	$5F	; 8
	DB	$5D,	$31,	$5E,	$5F	; 9
	DB	$5E,	$5F,	$5E,	$5F	; 10
	DB	$5E,	$5F,	$5E,	$5F	; 11
	DB	$30,	$5D,	$5E,	$5E	; 12
	DB	$5D,	$5D,	$5E,	$5E	; 13
	DB	$5E,	$5E,	$5E,	$5E	; 14
	DB	$5E,	$5E,	$5E,	$5E	; 15
; -----------------------------------------------------------------------------


; -----------------------------------------------------------------------------
; H.TIMI hook
; 1. Invokes the replayer
; 2. Reads the inputs
; 3. Tricks BIOS' KEYINT to skip keyboard scan, TRGFLG, OLDKEY/NEWKEY, ON STRIG...
; 4. Invokes the previously existing hook
HOOK:
	push	af ; Preserves VDP status register S#0 (a)

; Invokes the replayer
; Invokes the replayer (with frameskip in 60Hz machines)
	ld	a, [frames_per_tenth]
	cp	5
	jr	z, .NO_FRAMESKIP ; No frameskip (50Hz machine)
; Checks frameskip (60Hz machine)
	; ld	a, 6 ; (unnecessary)
	ld	hl, replayer.frameskip
	inc	[hl]
	sub	[hl]
	jr	nz, .NO_FRAMESKIP ; No framewksip
; Resets frameskip counter
	; xor	a ; (unnecessary)
	ld	[hl], a
	jr	.FRAMESKIP

.NO_FRAMESKIP:
; Executes a frame of the replayer
	call	REPLAYER.FRAME
.FRAMESKIP:

; Tricks BIOS' KEYINT to skip keyboard scan, TRGFLG, OLDKEY/NEWKEY, ON STRIG...
	xor	a
	ld	[SCNCNT], a
	ld	[INTCNT], a

	pop	af ; Restores VDP status register S#0 (a)
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Replayer routines: PT3-based implementation

; Initializes the replayer
REPLAYER.RESET:
; Initializes the PT3 replayer
	call	REPLAYER.STOP
; Initializes the ayFX replayer
	ld	hl, SOUND_BANK
	jp	ayFX_SETUP

; Stops the replayer
REPLAYER.STOP:
; Sets "end of the song" marker and no loop
	ld	a, $81
	ld	[PT3_SETUP], a
; Prepares next frame with silence
	jp	PT3_MUTE


; Starts the replayer
; param hl: pointer to the song
; param a: *******l, where l (LSB) is the loop flag (0 = loop),
REPLAYER.PLAY:
; Saves the configuration (the loop flag)
	ld	[PT3_SETUP], a
; Initializes song
	jp	PT3_INIT


; Starts the replayer and waits for a jingle to end
; param hl: pointer to the song
REPLAYER.PLAY_JINGLE:
	ld	a, 1 ; (not a loop)
	call	REPLAYER.PLAY
; Waits for the jingle to end
REPLAYER.WAIT:
	halt
	call	LDIRVM_SPRITES ; (to keep flickering)
	ld	a, [PT3_SETUP]
	bit	7, a ; "bit7 is set each time, when loop point is passed"
	ret	nz
	jr	REPLAYER.WAIT


; Processes a frame in the replayer
REPLAYER.FRAME:
; Plays the actual frame
	call	PT3_ROUT

; Prepares PT3 next frame
; Checks if the end of the song has been reached
	ld	a, [PT3_SETUP]
	bit	7, a ; "bit7 is set each time, when loop point is passed"
	jp	z, .PLAY ; no: prepares next frame
; yes: Checks if loop is enabled
	bit	0, a ; "set bit0 to 1, if you want to play without looping"
	ret	nz ; no: does nothing
; yes: reactivates the player and prepares next frame
	res	7, a
	ld	[PT3_SETUP], a
.PLAY:
; Prepares both PT3 and ayFX next frame
	call	PT3_PLAY
	jp	ayFX_PLAY


; PT3 replayer by Dioniso/MSX-KUN/SapphiRe
	include	"asm/libext/PT3-ROM.tniasm.ASM"
; ayFX REPLAYER v1.31
	include	"asm/libext/ayFX-ROM.tniasm.asm"
; -----------------------------------------------------------------------------


; -----------------------------------------------------------------------------
OPTIONS_MENU:
; Print option titles
	ld	hl, .ROOMS
	ld	de, $0C06
	ld	b, 8
	call	PRINT

	ld	hl, .MIRRORING
	ld	de, $0E05
	ld	b, 9
	call	PRINT

	ld	hl, .ENEMIES
	ld	de, $1004
	ld	b, 10
	call	PRINT

; Initialization
	xor	a
	ld	[prevstick], a
	ld	[cursor], a

.LOOP:
; Prints cursor and current option values (1/3)
	xor	a
	ld	de, $0c0f
	call	.PRINT_CURSOR
	ld	hl, .ROOMS_VALUES
	ld	de, $0c12
	ld	a, [options] ; 00eemmrr
	and	$03
	call	.PRINT_OPTION_VALUE_x8

; Prints cursor and current option values (2/3)
	ld	a, 1
	ld	de, $0e0f
	call	.PRINT_CURSOR
	ld	hl, .MIRRORING_VALUES
	ld	de, $0e12
	ld	a, [options] ; 00eemmrr
	and	$04
	call	.PRINT_OPTION_VALUE_x2

; Prints cursor and current option values (3/3)
	ld	a, 2
	ld	de, $100f
	call	.PRINT_CURSOR
	ld	hl, .ENEMIES_VALUES
	ld	de, $1012
	ld	a, [options] ; 00eemmrr
	and	$30
	srl	a
	call	.PRINT_OPTION_VALUE

; Prints "Hit space key"
	call	.PRINT_HIT_SPACE_KEY

; Changes option on stick
	call	.CHANGE_OPTION

; Returns on trigger
	call	GTTRIG_ANY
	or	a
	ret	nz
	jr	.LOOP


; param hl: .XXX_VALUES
; param de: yyxx
; param a: value as multiple of 8 ($00, $08, $10)
.PRINT_OPTION_VALUE_x8:
	add	a
	add	a
.PRINT_OPTION_VALUE_x2:
	add	a
.PRINT_OPTION_VALUE:
	call	ADD_HL_A
	ld	b, 8
	jp	PRINT

; param a: the option index
; param de: yyxx
.PRINT_CURSOR:
	ld	hl, cursor
	cp	[hl]
	ld	hl, .CURSOR
	jr	z, .PRINT_CURSOR_HL_OK
	ld	hl, LITERAL.BLANKS
.PRINT_CURSOR_HL_OK:
	ld	b, 2
	jp	PRINT

; no params
.PRINT_HIT_SPACE_KEY:
	ld	hl, aux.frame_counter_2
	ld	a, [hl]
	inc	a
	ld	[hl], a
	ld	hl, HIT_SPACE_KEY.LITERAL
	and	$40
	jr	nz, .HIT_SPACE_KEY_HL_OK
	ld	hl, LITERAL.BLANKS
.HIT_SPACE_KEY_HL_OK:
	ld	de, $1409 ; $1008
	ld	b,0Dh
	jp	PRINT


; param a: GTSTCK_ANY return value
.CHANGE_OPTION:
	call	GTSTCK_ANY
; Compares with previous value
	ld	hl, prevstick
	cp	[hl]
	ret	z ; (same value)
; Saves new value
	ld	[hl], a
	or	a
	ret	z ; (no input)
; Input: translates to direction values
	dec	a	; 0..7
	srl	a	; 0..3

	inc	hl ; (hl = cursor, for convenience purposes)
; Up?
	or	a
	jr	nz, .NO_UP
; Moves cursor up
	xor	[hl] ; a already 0, checks if cursor is 0
	ret	z
	dec	[hl]
	ret
.NO_UP:

; Down?
	cp	2
	jr	nz, .NO_DOWN
; Moves cursor down
	xor	[hl] ; a already 2, checks if cursor is 2
	ret	z
	inc	[hl]
	ret
.NO_DOWN:

	ld	b, [hl] ; b = cursor index
	inc	hl ; hl = options

; Mirroring option?
	djnz	.NO_MIRRORING
; Changes the mirroring option
	dec	a ; 0 = right, 2 = left
	add	a ; 0 = right, 4 = left
	xor	4 ; 4 = right, 0 = left
	ld	b, a
	ld	a, [hl]
	and	$f3
	or	b
	ld	[hl], a
	ret
.NO_MIRRORING:

; Enemies option?
	djnz	.NO_ENEMIES
; Changes the enemies option
	dec	a
	ld	a, [hl]
	jr	nz, .DEC_ENEMIES
; Moves enemies option to the right
	and	$30
	cp	$30
	ret	z ; (was already rightmost)
	ld	a, [hl]
	add	$10
	ld	[hl], a
	ret
; Moves enemies option to the left
.DEC_ENEMIES:
	and	$30
	ret	z ; (was already leftmost)
	ld	a, [hl]
	sub	$10
	ld	[hl], a
	ret
.NO_ENEMIES:

; Rooms option?
; Changes the rooms option
	dec	a
	ld	a, [hl]
	jr	nz, .DEC_ROOMS
; Moves rooms option to the right
	and	$03
	cp	$02
	ret	z ; (already rightmost)
	inc	[hl]
	ret
; Moves rooms option to the left
.DEC_ROOMS:
	and	$03
	ret	z ; (already leftmost)
	dec	[hl]
	ret


.ROOMS:
	DB	$19, $22, $1B, $0A, $16, $12, $0D, $1C	; PYRAMIDS
.ROOMS_VALUES:
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED
	db	$17, $0E, $20, $0E, $1B, $FF, $FF, $FF	; NEWER

.MIRRORING:
	db	$16, $12, $1B, $1B, $18, $1B, $12, $17, $10 ; MIRRORING
.MIRRORING_VALUES:
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED

.ENEMIES:
	db	$0D, $12, $0F, $0F, $12, $0C, $1E, $15, $1D, $22 ; DIFFICULTY
.ENEMIES_VALUES:
	db	$0E, $0A, $1C, $12, $0E, $1B, $FF, $FF	; EASIER (3)
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL (4)
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED
	db	$11, $0A, $1B, $0D, $0E, $1B, $FF, $FF	; HARDER (6)

.CURSOR:
	db	$9c, $9d
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Builds the pyramid
BUILD_PYRAMID:
	ld	de, pyramid.room_array
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR1
	ld	bc,0007h ; 7 rooms
	call	.RANDOMIZE_FLOOR
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR2
	ld	bc,0005h ; 5 rooms
	call	.RANDOMIZE_FLOOR
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR3
	ld	bc,0003h ; 3 rooms
	call	.RANDOMIZE_FLOOR
	ld	a,10h ; (sphynx room)
	ld	(de),a
	ret

; param hl: Source data. One of DATA_RANDOMIZE_PYRAMID.FLOOR*
; param de: Pointer to the room_array
; param bc: Number of rooms of the current floor
; ret de: Updated pointer to the room_array
.RANDOMIZE_FLOOR:
	call	RANDOMIZE
	and	03h
	inc	a ; a = 1..4
; (skips to the right source)
.LOOP:	add	hl,bc
	dec	a
	jr	nz, .LOOP
; (copies the sequence)
	ldir
	ret

DATA_RANDOMIZE_PYRAMID:
	include	"asm/original/pyramids.asm"
	.FLOOR1:	equ DATA_RANDOMIZE_PYRAMID -7
	.FLOOR2:	equ DATA_RANDOMIZE_PYRAMID +(7*4) -5
	.FLOOR3:	equ DATA_RANDOMIZE_PYRAMID +(7*4) +(5*4) -3
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Builds the pyramid definition (from the pyramid HUD)
BUILD_PYRAMID_DEFINITION:
; Copies the pyramid (HUD) as the initial pyramid definition
	ld	hl, pyramid.room_array
	ld	de, pyramid_definition
	ld	bc, $0010
	ldir
; Checks rooms set
	ld	a, [options] ; 00eemmrr
	and	$03
	ret	z ; original mode: no changes
	dec	a
	jr	z, .ENHANCED_ROOMS
; Newer rooms mode
	ld	hl, pyramid_definition
	ld	bc, $0f10 ; 15 rooms, +16
.NEWER_ROOMS_LOOP:
	ld	a, [hl]
	add	c
	ld	[hl], a
	inc	hl
	djnz	.NEWER_ROOMS_LOOP
	ret

.ENHANCED_ROOMS:
; Classic and newer rooms, better randomized
	ld	hl, $0e01 ; Randomize from: 1-14
	ld	bc, $0708 ; Copy 7 numbers, split pivot at 8: 1-7, 8-14
	ld	de, pyramid_definition
	call	.RANDOMIZE_FLOOR
	ld	hl, $1108 ; Randomize from: 8-17
	ld	bc, $050d ; Copy 5 numbers, split pivot at 13: 8-12, 13-17
	call	.RANDOMIZE_FLOOR
	ld	hl, $120d ; Randomize from: 13-18
	ld	bc, $0310 ; Copy 3 numbers, split pivot at 16: 13-15, 16-18
	; jr	.RANDOMIZE_FLOOR ; (falls through)

; Randomizes a floor with the new method
.RANDOMIZE_FLOOR:
	push	de ; (preserves target)

; Initializes the shuffle area (1,2,3...)
	ld	ix, pyramid_definition.tmp
	ld	a, l
	inc	h ; (for convenience reasons)
.FILL_LOOP:
	ld	[ix], a
	inc	ix
	inc	a
	cp	h
	jr	nz, .FILL_LOOP
	dec	h ; (restores original h value)

; Shuffles the shuffle area
	push	bc ; (preserves count and split pivot)
	ld	b, h
	ld	hl, pyramid_definition.tmp
.SHUFFLE_LOOP:
; a = 0..b
	ld	a, r
	and	$0f
	jr	z, .NO_SWAP
.SHUFFLE_A_NOT_OK:
	cp	b
	jr	c, .SHUFFLE_A_OK
	sub	b
	jr	.SHUFFLE_A_NOT_OK
.SHUFFLE_A_OK:
; Swaps [hl] and [hl+a]
	push	hl
	call	ADD_HL_A
	ld	c, [hl] ; c = [hl+a]
	pop	de
	ex	de, hl
	ld	a, [hl] ; a = [hl]
	ld	[de], a ; [hl+a] = a
	ld	[hl], c ; [hl] = c
.NO_SWAP:
	inc	hl
; Next byte
	djnz	.SHUFFLE_LOOP
	pop	bc ; (restores count and split)

; Actually copies the shuffled area to the pyramid_definition
	ld	hl, pyramid_definition.tmp
	pop	de ; (restores target)
.COPY_LOOP:
	ld	a, [hl]
	cp	c
	jr	c, .COPY_A_OK ; (a < pivot point)
; (a > pivot point: go to the "newer rooms" section)
	add	$10
.COPY_A_OK:
	ld	[de], a
	inc	hl
	inc	de
	djnz	.COPY_LOOP
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Initializes the enemy count based on the option value and the pyramid number
INIT_ENEMY_COUNT:
; Checks the option value
	ld	a, [options] ; 00eemmrr

; Easier mode (3 enemies, fixed)
	ld	b, 3
	and	$30
	jr	z, .SET_ENEMY_COUNT
; Original mode (4 enemies, fixed)
	inc	b ; b = 4
	sub	$10
	jr	z, .SET_ENEMY_COUNT
; Harder mode (6 enemies, fixed)
	inc	b ; b = 6
	inc	b
	sub	$10
	jr	nz, .SET_ENEMY_COUNT
; Enhanced mode (3-6 enemies, progressive)
.ENHANCED:
	ld	a, [game.pyramid_count]
	add	3
	ld	b, a
	cp	7
	jr	c, .SET_ENEMY_COUNT
	ld	b, 6 ; (cannot set more than 6 enemies)
.SET_ENEMY_COUNT:
	ld	a, b
	ld	[enemy_count], a
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Increases room index
; ret z: entering second or third floor
; ret nz: otherwise
INCREASE_ROOM_INDEX:
; Increases room index
	ld	a,(pyramid.room_index)
	inc	a
	ld	(pyramid.room_index),a
; Entering second floor?
	cp	a, 7
	ret	z
; no: Entering third floor?
	cp	a, 7 +5
	ret	; ret z/nz
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Increases the enemy count
INCREASE_ENEMY_COUNT:
; Checks the option value
	ld	a, [options] ; 00eemmrr
	and	$30
	cp	$20
	ret	nz ; not enhanced mode
; Increases the enemy count
	ld	a, 6 ; maximum = 6
	ld	hl, enemy_count
	cp	[hl]
	ret	z ; (cannot set more than 6 enemies)
	inc	[hl]
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Decreases the enemy count
DECREASE_ENEMY_COUNT:
; Checks the option value
	ld	a, [options] ; 00eemmrr
	and	$30
	cp	$20
	ret	nz ; not enhanced mode
; Decreases the enemy count
	ld	a, [game.pyramid_count] ; minimum = pyramid_count + 3
	add	3
	ld	hl, enemy_count
	cp	[hl]
	ret	nc ; (cannot set fewer than pyramid_count + 3 enemies)
	dec	[hl]
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Buffers the current room
BUFFER_CURRENT_ROOM:
; (uses the actual pyramid definition)
	ld	a, (game.current_room)
	ld	hl, pyramid_definition
	call	ADD_HL_A
	ld	a, [hl]
; Checks if the room is already buffered
	ld	hl, buffered_room
	cp	[hl]
	ret	z ; yes
	ld	[hl], a ; (saves the room as buffered)
; no: Points to the right room data
	ld	hl, .DATA - $0022
	ld	bc, $0022
.L83F7:	add	hl, bc
	dec	a
	jr	nz, .L83F7
; Buffers the current room data
	ld	de, room_buffer
	ldir

; Checks enhanced mirroring
	ld	a, [options] ; 00eemmrr
	and	$0c
	ret	z ; original
; enhanced
	ld	a, r
; Randomly flips the room
	bit	0, a
	jr	z, .FLIP_OK
	push	af ; (preserves random byte)
	call	.FLIP_ROOM
	pop	af ; (restores random byte)
.FLIP_OK:
; Randomly mirrors the room
	bit	1, a
	ret	z
	jr	.MIRROR_ROOM

; Flips the room
.FLIP_ROOM:
; Flips the walls (1/2)
	ld	bc, (room_buffer.walls + 0)
	ld	de, (room_buffer.walls + 2)
	ld	hl, (room_buffer.walls + 4)
	exx
	ld	bc, (room_buffer.walls + 20)
	ld	de, (room_buffer.walls + 18)
	ld	hl, (room_buffer.walls + 16)
	ld	(room_buffer.walls + 0), bc
	ld	(room_buffer.walls + 2), de
	ld	(room_buffer.walls + 4), hl
	exx
	ld	(room_buffer.walls + 20), bc
	ld	(room_buffer.walls + 18), de
	ld	(room_buffer.walls + 16), hl
; Flips the walls (2/2)
	ld	bc, (room_buffer.walls + 6)
	ld	de, (room_buffer.walls + 8)
	exx
	ld	bc, (room_buffer.walls + 14)
	ld	de, (room_buffer.walls + 12)
	ld	(room_buffer.walls + 6), bc
	ld	(room_buffer.walls + 8), de
	exx
	ld	(room_buffer.walls + 14), bc
	ld	(room_buffer.walls + 12), de
; Flips the coordinates
	ld	hl, room_buffer.box1 + 1
	ld	b, 6
.FLIP_COORDS_LOOP:
	ld	a, 10
	sub	[hl]
	ld	[hl], a
	inc	hl
	inc	hl
	djnz	.FLIP_COORDS_LOOP
; Swaps the doors
	ld	a, $80
	ld	hl, room_buffer.door_up
	xor	[hl]
	ld	[hl], a
	ld	a, $80
	ld	hl, room_buffer.door_down
	xor	[hl]
	ld	[hl], a
	ret

; Mirrors the room
.MIRROR_ROOM:
; Mirrors the walls
	ld	hl, room_buffer.walls
	ld	b, 11
.MIRROR_WALLS_LOOP:
; Mirrors the nibbles
	xor	a ; 00
	rld	; [hl  ]=ABC0, a=00 -> [hl  ]=B0C0, a=0A
	call	MIRROR_NIBBLE ; 0A->0a
	inc	hl
	rld	; [  hl]=B0C0, a=0a -> [  hl]=B00a, a=0C
	call	MIRROR_NIBBLE ; 0C->0c
	dec	hl
	rld	; [hl  ]=B00a, a=0c -> [hl  ]=0c0a, a=0B
	call	MIRROR_NIBBLE ; 0B->0b
	rld	; [hl  ]=0c0a, a=0b -> [hl  ]=cb0a, a=00
	inc	hl
	rld	; [  hl]=cb0a, a=00 -> [  hl]=cba0, a=00
; Additional bit shift
	ld	e, [hl] ; de = cba0
	dec	hl
	ld	d, [hl]
	sla	e ; de << 1
	rl	d
	ld	[hl], d ; de <- cba0 (shifted)
	inc	hl
	ld	[hl], e
; Next row
	inc	hl
	djnz	.MIRROR_WALLS_LOOP
; Mirrors the coordinates
	ld	hl, room_buffer.box1
	ld	b, 6
.MIRROR_COORDS_LOOP:
	ld	a, 10
	sub	[hl]
	ld	[hl], a
	inc	hl
	inc	hl
	djnz	.MIRROR_COORDS_LOOP
	ret

.DATA:
	include	"asm/enhancedplus/mapper/rooms_original.asm"
	include	"asm/enhancedplus/mapper/rooms.asm"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DRAW_CURRENT_ROOM:

; Prints the room
	xor	a
	ld	(room_enhance_pos), a

; For each row
	ld	hl, room_buffer
	ld	d, $01
.ROW:
; Reads two bytes from the data
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
; (preserves data pointer)
	push	hl
; For each column
	ld	e, $02
.COLUMN:
; (preserves data bytes and target pointer)
	push	de
; Is the first bit set?
	sla	b
	rl	c
	push	bc

	jr	nc,.EMPTY ; no
; (wall)
	call	PRINT_WALL_3D
	jr	.BIT_OK

.EMPTY:
	call	CLEAR_TILE

.BIT_OK:

; (restores data bytes and target pointer)
	pop	bc
	pop	de
; x++
	inc	e
	inc	e
; x==24?

	ld a, (room_enhance_pos)
	inc a
	ld (room_enhance_pos), a

	ld	a, 24
	cp	e
	jr	nz, .COLUMN

.END_ROW:
; (restores data pointer)
	pop	hl
; y++
	inc	d
	inc	d
; y==23?

	ld	a, (room_enhance_pos)
	and $F0
	add a, $10
	ld (room_enhance_pos), a

	ld	a, 23
	cp	d
	jr	nz, .ROW

DRAW_ROOM_ENHANCE:


	push	hl

	; restore FIRST & LAST ROW and FIRST COLUMN
	ld		hl, NAMTBL + 2
	ld		a, $5E
	ld		bc, 22
	call	FILVRM

	ld		hl, NAMTBL + 23*32 + 2
	ld		a, $5E
	ld		bc, 22
	call	FILVRM

	ld		hl, NAMTBL + 32 + 1
	ld		b, 22
.LOOP0:
	push	bc
	ld		a, $5E
	call	WRTVRM
	ld		bc, 32
	add	hl, bc
	pop	bc
	djnz	.LOOP0


	; check FIRST ROW
	ld		hl, NAMTBL + 32 + 2
	ld		b, 11
.LOOP1:
	push	hl
	push	bc
	call	RDVRM
	cp		$58
	jr		nz, .LOOP1_NEXT
	ld		bc, -32
	add	hl, bc
	ld		a, $5C
	call	WRTVRM
	inc	hl
	call	WRTVRM
.LOOP1_NEXT:
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	djnz	.LOOP1

	; check LAST ROW
	ld		hl, NAMTBL + 32*22 + 2
	ld		b, 11
.LOOP2:
	push	hl
	push	bc
	call	RDVRM
	cp		$5A
	jr		nz, .LOOP2_NEXT
	ld		bc, 32
	add	hl, bc
	ld		a, $5D
	call	WRTVRM
	inc	hl
	call	WRTVRM
.LOOP2_NEXT:
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	djnz	.LOOP2

	; check FIRST COLUMN
	ld		hl, NAMTBL + 32 + 2
	ld		b, 11
.LOOP3:
	push	bc
	push	hl
	call	RDVRM
	cp		$58
	jr		nz, .LOOP3_NEXT
	dec	hl
	ld		a, $5F
	call	WRTVRM
	ld		bc, 32
	add	hl, bc
	call	WRTVRM
.LOOP3_NEXT:
	pop	hl
	ld		bc, 32*2
	add	hl, bc
	pop	bc
	djnz	.LOOP3

	pop	hl

	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; param a: the nibble to mirror
; ret a: the mirrored nibble
; touches de
MIRROR_NIBBLE:
	and	$0f
	ld	de, .MIRROR_LUT
	add	e
	ld	e, a
	adc	d
	sub	e
	ld	d, a
	ld	a, [de]
	ret
.MIRROR_LUT:
	db	0000b, 1000b, 0100b, 1100b, 0010b, 1010b, 0110b, 1110b
	db	0001b, 1001b, 0101b, 1101b, 0011b, 1011b, 0111b, 1111b
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
	db	" PYRAMID WARP", $a0
	db	" 1983. 9. 15", $a0
	db	" by T&E SOFT", $a0
	db	" EIZI KATO !!", $a0
; -----------------------------------------------------------------------------

debug_rom_end_original: equ $9f8c
debug_rom_end_new:	equ $
debug_rom_end_diff:	equ debug_rom_end_original - debug_rom_end_new

; -----------------------------------------------------------------------------
; Padding to a 16kB boundary
	ds	($ OR $3fff) -$ +1, $00
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; RAM
	org	$e000, $f380 ; 8KB RAM

box1: ; C000H
	.y:		rb 1	; C000H
	.x:		rb 1	; C001H
	.is_opening:	rb 1	; C002H
	.remove_delay:	rb 1	; C003H
	.content:	rb 1	; C004H
box2: ; C005H
	.x:		rb 1	; C005H
	.y:		rb 1	; C006H
	.status:	rb 2	; C007H
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
	.base_pattern:	rb 1	; C024H (never read?)
	.sprite_plane:	rb 1	; C025H (never read?)
scorpion1: ; C026H
	.spratr_y:	rb 3	; C026H
	.spratr_color:	rb 1	; C029H
	.direction:	rb 1	; C02AH
	.status:	rb 1	; C02BH
	.base_pattern:	rb 1	; C02CH ($12)
	.sprite_plane:	rb 1	; C02DH ($04)
bat1: ; C02EH
	.spratr_y:	rb 3	; C02EH
	.spratr_color:	rb 1	; C031H
	.direction:	rb 1	; C032H
	.status:	rb 1	; C033H
	.base_pattern:	rb 1	; C034H ($14)
	.sprite_plane:	rb 1	; C035H ($05)
snake1: ; C036H
	.spratr_y:	rb 3	; C036H
	.spratr_color:	rb 1	; C039H
	.direction:	rb 1	; C03AH
	.status:	rb 1	; C03BH
	.base_pattern:	rb 1	; C03CH ($16)
	.sprite_plane:	rb 1	; C03DH ($06)
scorpion2: ; C03EH
	.spratr_y:	rb 3	; C03EH
	.spratr_color:	rb 1	; C041H
	.direction:	rb 1	; C042H
	.status:	rb 1	; C043H
	.base_pattern:	rb 1	; C044H ($12)
	.sprite_plane:	rb 1	; C045H ($07)
bat2: ; C046H
	.spratr_y:	rb 3	; C046H
	.spratr_color:	rb 1	; C049H
	.direction:	rb 1	; C04AH
	.status:	rb 1	; C04BH
	.base_pattern:	rb 1	; C04CH ($14)
	.sprite_plane:	rb 1	; C04DH ($08)
snake2: ; C04EH
	.spratr_y:	rb 3	; C04EH
	.spratr_color:	rb 1	; C051H
	.direction:	rb 1	; C052H
	.status:	rb 1	; C053H
	.base_pattern:	rb 1	; C054H ($16)
	.sprite_plane:	rb 1	; C055H ($09)
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
spawn_enemy_delay:	rb 1	; C069H
check_wall_for_player:	rb 1	; C06AH
exit:
	.unused1:	rb 1	; C06BH ($01, never read)
	.unused2:	rb 1	; C06CH ($00, never read)
	.has_diamond:	rb 1	; C06DH
	.blink_counter:	rb 1	; C06EH
	.blink_flag:	rb 1	; C06FH
	.is_enabled:	rb 1	; C070H
game: ; C071H
	.air_left_bcd:	rb 4	; C071H
	.short_delay:	rb 1	; C075H
	.current_room:	rb 1	; C076H
	.air_left:	rb 2	; C077H
	.air_left_copy:	rb 2	; C079H
	.pyramid_count:	rb 1	; C07BH
	.lives:		rb 1	; C07CH
aux.how_many_bytes:	rb 2	; C07DH
game.high_score_bcd:	rb 3	; C07FH (6 digits)
game.score_bcd:		rb 3	; C082H (6 digits)
pyramid: ; C085H
	.room_index:	rb 1	; C085H
	.room_array:	rb 16	; C087H (7+5+3+1 rooms)
	.room_namtbl_ptr:rb 2	; C097H
aux.frame_counter_2:	rb 1	; C0D8H
player_entering_door:	rb 1	; C0DAH
aux.dying_flashes:	rb 1	; C0DCH
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
room_enhance_pos:	rb 1
room_enhance_tile:	rb 1

; Options menu:
prevstick:		rb 1 ; previously read GTSTCK_ANY value
cursor:			rb 1 ; cursor index: 0 = enemies, 1 = mirroring, 2 = rooms
options:		rb 1 ; 00eemmrr: Enemies, Mirroring, Rooms

; The actual pyramid definition, as the old pyramid.room_array
pyramid_definition:	rb 16 ; (7+5+3+1 rooms)
	.tmp:		rb 14 ; (for shuffling the rooms)

; Buffer of the current room
buffered_room:		rb 1 ; prevents re-buffering the current room
; Room data, copied from BUFFER_CURRENT_ROOM.DATA[i]
room_buffer:
	.walls:		rb 22
	.box1:		rb 2
	.box2:		rb 2
	.box3:		rb 2
	.nest:		rb 2
	.door_up:	rb 2
	.door_down:	rb 2

enemy_count:		rb 1 ; current enemy count
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Refresh rate in Hertzs (50Hz/60Hz) and related frames per tenth
frame_rate:
	rb	1
frames_per_tenth:
	rb	1

; 60Hz replayer synchronization
replayer.frameskip:
	rb	1

spratr_buffer:
	rb	11 * 4
.end:
	rb	1 ; to store one SPAT_END when the buffer is full
	.size:	equ $ - spratr_buffer
; (extra space for the flickering routine)
	rb	11 * 4

.flicker_offset:
	rw	1 ; Offset used by the flickering routine


; PT3 replayer by Dioniso/MSX-KUN/SapphiRe
	include	"asm/libext/PT3-RAM.tniasm.ASM"
; ayFX REPLAYER v1.31
	include	"asm/libext/ayFX-RAM.tniasm.asm"
; -----------------------------------------------------------------------------

debug_ram_end_original: equ $c0dc + $2000 ; (16KB RAM to 8KB RAM)
debug_ram_end_new:	equ $ -1
debug_ram_end_diff:	equ debug_ram_end_original - debug_ram_end_new

; EOF
