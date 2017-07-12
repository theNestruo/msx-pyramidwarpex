; -----------------------------------------------------------------------------
; MSX BIOS
	WRTVDP:	equ $0047 ; Write to any VDP register
	RDVRM:	equ $004a ; Read byte from VRAM
	WRTVRM:	equ $004d ; Write byte to VRAM
	FILVRM:	equ $0056 ; Fill block of VRAM with data byte
	LDIRVM:	equ $005c ; Copy block to VRAM, from memory
	CHGMOD:	equ $005f ; Change VDP mode
	CHGCLR:	equ $0062 ; Change VDP colours
	CLRSPR:	equ $0069 ; Clear all sprites
	INIGRP:	equ $0072 ; Initialize VDP to Graphics Mode
	GTSTCK:	equ $00d5 ; Get joystick status
	GTTRIG:	equ $00d8 ; Get trigger status

; MSX system variables
	CLIKSW:	equ $f3db ; Keyboard click sound
	RG1SAV:	equ $f3e0 ; Content of VDP(1) register (R#1)
	FORCLR:	equ $f3e9 ; Foreground colour
	BAKCLR:	equ $f3ea ; Background colour
	BDRCLR:	equ $f3eb ; Border colour
	JIFFY: equ $fc9e ; Software clock; each VDP interrupt gets increased by 1

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
	SPRTBL:		equ $3800 ; Sprite pattern table

; VDP symbolic constants
	SCR_WIDTH:	equ 32
	SPAT_OB:	equ $d1 ; Sprite out of bounds marker (not standard)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
CFG_ENHANCEMENTS:	; Uncomment to use enchanced...
	.FONT:		; ...font
	.SPRITES:	; ...sprites
	.CHARSET:	; ...graphical charset
	.ROOMS:		; ...room and pyramid definition

CFG_COLOR:
	.SKULL:		equ 15	; 15
	.SCORPION:	equ 11	; 9
	.BAT:		equ 1	; 1
	.OTHER:		equ 7
	.PLAYER:	equ 14	; 11
	.PLAYER_GUN:	equ 15	; 15
	.BULLET:	equ 15	; 15
	.EXPLOSION:	equ 6	; 6
	.DOOR_0:	equ 15	; 3
	.DOOR_1:	equ 7	; 7
	.DOOR_2:	equ 15	; 8

	.BG:		equ 4	; 4
	.BG_SPHYNX:	equ 1	; 1
	.BG_DEAD_1:	equ 6	; 6
	.BG_DEAD_2:	equ 4	; 4
	.BG_EXIT:	equ 2	; 3

CFG_HUD:			; $yyxx coordinates
	.HIGH_COORDS:		equ $081A ; 0819h
	.SCORE_COORDS:		equ $0B1A ; 0B19h
	.AIR_LEFT_COORDS:	equ $0E1C ; 0E19h
	.ROOM_COORDS:		equ $101E ; 101Dh
	.LIVES_COORDS:		equ $171A ; 1719h

CFG_OTHERS:
	.PLAYER_INITIAL_DIR:	equ $03 ; 01h ; Initial player direction (down)
	; .DONT_DECORATE_WARP:	; Uncomment to keep warp as normal walls
	.CHARSET_3D:		; Uncomment to use "3D" charset
	.EXTRA_ENEMY_1:		; Uncomment to use the unused_enemy_slot1
	.EXTRA_ENEMY_2:		; Uncomment to use the unused_enemy_slot2
	.SHORT_DELAY_FACTOR:	equ $03 ; 04h ; Multiplier in short delay routine
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; ROM header and entry point
	org	$8000, $9fff ; 8KB ROM
ROM_START:
	db	"AB"		; ID ("AB")
	dw	.INIT		; INIT
	ds	$8010 - $, $00	; STATEMENT, DEVICE, TEXT, Reserved

; Entry Point
.INIT:
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
	ld	bc,0E201h	; address or value?
	call	WRTVDP
	call	CLRSPR
; screen ,,0
	xor	a
	ld	[CLIKSW], a

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
; Init CHRTBL/CLRTBL
	ld	hl, DATA_CHARSET.CHR
	ld	de, CHRTBL + $30 * $08
	ld	bc, DATA_CHARSET.SIZE - $08
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
	ld	de,080Dh
	ld	b,03h
	call	PRINT
	ld	hl,LITERAL.PYRAMID_WARP
	ld	de,0A09h
	ld	b,0Ch
	call	PRINT
	ld	hl,LITERAL.COPYRIGHT
	ld	de,0C05h
	ld	b,14h
	call	PRINT

; "Hit space key"
	ld	de, $1008
	call	HIT_SPACE_KEY

; color ,,4
	ld	c,07h
	ld	b,CFG_COLOR.BG
	call	WRTVDP

; Fills in playground
	ld	de,0001h
	ld	b,18h
	ld	c,18h
.LOOP:	call	.SUB
	jr	z, .CONT
	jr	.LOOP

.SUB:	push	de
	push	bc
	ld	hl,LITERAL.WALL_x25
	call	PRINT
	pop	bc
	pop	de
	inc	d
	dec	c
	ret
.CONT:

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
	ld	bc,0000h
	ld	(game.high_score_bcd),a
	ld	(game.high_score_bcd +1),bc

; Sprite patterns, colors and planes
	ld	a,CFG_COLOR.SCORPION ; 09h
	ld	(scorpion1.spratr_color),a
	ld	(scorpion2.spratr_color),a
	ld	a,12h
	ld	(scorpion1.base_pattern),a
	ld	(scorpion2.base_pattern),a

	ld	a,CFG_COLOR.BAT ; 01h
	ld	(bat1.spratr_color),a
	ld	(bat2.spratr_color),a
	ld	a,14h
	ld	(bat1.base_pattern),a
	ld	(bat2.base_pattern),a

	ld	a,CFG_COLOR.OTHER
	ld	(unused_enemy_slot1.spratr_color),a
	ld	(unused_enemy_slot2.spratr_color),a
	ld	a,16h
	ld	(unused_enemy_slot1.base_pattern),a
	ld	(unused_enemy_slot2.base_pattern),a

	ld	a,04h
	ld	(scorpion1.sprite_plane),a
	inc	a
	ld	(bat1.sprite_plane),a ; $05
	inc	a
	ld	(unused_enemy_slot1.sprite_plane),a ; $06
	inc	a
	ld	(scorpion2.sprite_plane),a ; $07
	inc	a
	ld	(bat2.sprite_plane),a ; $08
	inc	a
	ld	(unused_enemy_slot2.sprite_plane),a ; $09
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
	ld	(game.first_pyramid),a
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
; Room 0
	xor	a
	ld	(pyramid.room_index),a

; Builds the pyramid
	ld	de, pyramid.room_array
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR1
	ld	bc,0007h ; 7 rooms
	call	RANDOMIZE_FLOOR
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR2
	ld	bc,0005h ; 5 rooms
	call	RANDOMIZE_FLOOR
	ld	hl,DATA_RANDOMIZE_PYRAMID.FLOOR3
	ld	bc,0003h ; 3 rooms
	call	RANDOMIZE_FLOOR
	ld	a,10h ; (sphynx room)
	ld	(de),a

; Prints the pyramid in the HUD
	ld	de,1519h
	ld	b,07h ; 7 rooms
.L834D:	push	bc
	ld	hl,LITERAL.ROOMS_x7
	call	PRINT
	inc	e ; destination += (+1, 1)
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
; Clear lives
	ld	hl,LITERAL.BLANKS
	ld	de,CFG_HUD.LIVES_COORDS
	ld	b,05h
	call	PRINT
; Decreases lives
	ld	a,(game.lives)
	dec	a
	ld	(game.lives),a
	jp	m,GAME_OVER ; (<0 lives = GAME_OVER)
; Prints lives
	jr	z,NEW_ROOM ; (no lives to print)
	ld	hl,LITERAL.LIVES_x6
	ld	b,a
	call	PRINT
; ------VVVV----falls through--------------------------------------------------

	; Referenced from 8380, 89DE
	; --- START PROC L838C ---

; -----------------------------------------------------------------------------
NEW_ROOM:
; Print score and updates high score
.L838C:	call	PRINT_SCORE_AND_UPDATE_HIGH_SCORE

IFDEF CFG_OTHERS.CHARSET_3D
; Fills in playground
	ld	de,0001h
	ld	b,18h
	ld	c,18h
.LOOP:	call	.SUB
	jr	z, .CONT
	jr	.LOOP

.SUB:	push	de
	push	bc
	ld	hl,LITERAL.WALL_x25
	call	PRINT
	pop	bc
	pop	de
	inc	d
	dec	c
	ret
.CONT:
ENDIF

; Hides the sprites (one by one)
	ld	hl,SPRATR
	ld	a,SPAT_OB
	ld	b, $20
.L8394:	call	WRTVRM
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	djnz	.L8394

; Reads the current room index
	ld	a,(pyramid.room_index)
	ld	hl,pyramid.room_array
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
	ld	de,CFG_HUD.ROOM_COORDS
	call	PRINT_CHAR
; Prints the room number (units)
	ld	a,(game.current_room)
	add	a,00h
	daa
	and	0Fh
	ld	de,CFG_HUD.ROOM_COORDS +1
	call	PRINT_CHAR

; Points to the right room data
	ld	hl,DATA_ROOMS - $0022
	ld	de,0022h
	ld	a,(game.current_room)
	ld	b,a
.L83F7:	add	hl,de
	djnz	.L83F7

; Prints the room

; For each row
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
IFDEF CFG_OTHERS.CHARSET_3D
	jr	c,.BIT_OK
ELSE
	jr	nc,.EMPTY ; no
; (wall)
	ld	a,30h
	call	PRINT_TILE
	jr	.BIT_OK
ENDIF
.EMPTY:
IFDEF CFG_OTHERS.CHARSET_3D
	push	de
	call	CLEAR_TILE
	pop	de
	
; Is there wall over the current tile?
	dec	d
	call	TO_NAMTBL
	ex	de,hl
	push	hl
	call	RDVRM
	pop	hl
	inc	a
	jr	z, .BIT_OK ; no
; Yes: overwrites the lower characters
	push	hl
	ld	a, $32
	call	WRTVRM
	inc	hl
	inc	a
	call	WRTVRM
	pop	hl
ELSE
	call	CLEAR_TILE
ENDIF
.BIT_OK:

; (restores data bytes and target pointer)
	pop	bc
	pop	de
; x++
	inc	e
	inc	e
; x==24?
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
	ld	a, 23
	cp	d
	jr	nz, .ROW

; Is sphynx room?
	ld	a,(game.current_room)
	cp	10h
	jp	z,PRINT_SPHYNX_ROOM_DECORATION ; yes
; ------VVVV----falls through--------------------------------------------------

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

; Initializes next
	ld	ix,nest
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	push	hl ; (preserve)
; (prints nest)
	call	TO_VRAM_COORDINATES
	ld	a,$48 ; 54h
	call	PRINT_TILE
	pop	hl ; (restore)

; Initializes doors
	ld	ix,door1
	call	NEW_DOOR
	ld	ix,door2
	call	NEW_DOOR

; Prints exit zone
IFDEF CFG_OTHERS.DONT_DECORATE_WARP
ELSE
	ld	de,090Ah
	ld	a,$40
	call	PRINT_TILE
	ld	de,090Ch
	ld	a,$40
	call	PRINT_TILE
	ld	de,090Eh
	ld	a,$40
	call	PRINT_TILE
	ld	de,0D0Ah
	ld	a,$40
	call	PRINT_TILE
	ld	de,0D0Ch
	ld	a,$40
	call	PRINT_TILE
	ld	de,0D0Eh
	ld	a,$40
	call	PRINT_TILE
ENDIF

; Initial player coordinates
	ld	a,58h

	jp	INIT_GAME_LOOP
; -----------------------------------------------------------------------------

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
	xor	a
	ld	(ix+00h),a ; box.is_opening
; Prints box
	ld	a,34h ; ($34 = box)
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
	ld	a,CFG_COLOR.DOOR_0
	ld	(ix + 1),a ; door.spratr_color
; Prints door sprite
	pop	de ; (restores pointer to spratr_y)
	ld	a,b ; sprite plane according b
	call	PUT_SPRITE
; (restore data pointer and end)
	pop	hl
	ret
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PRINT_SPHYNX_ROOM_DECORATION:
; Prints single box
	ld	de,0B0Ch	; address or value?
	ld	a,34h ; ($34 = box)
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
	ld	a,60h
	ld	(hl),a
	inc	hl
	push	hl

; Initializes air_left (fisrt_pyramid ? 3000 : 2000)
	ld	hl,0BB8h ; 3000
	ld	a,(game.first_pyramid)
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
	ld	(unused_enemy_slot1.status),a
	ld	(unused_enemy_slot2.status),a
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
	ld	a,CFG_COLOR.PLAYER ; 0Bh
	ld	(hl),a

; Put player sprite
	pop	de ; player.spratr_y
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
.L867C:	ld	hl,(game.air_left)
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
	ld	b,$53 ; ($63 = non visited room)
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
	ld	a,CFG_COLOR.BULLET; bullet color
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
	ld	a,1Ah
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
	ld	a,CFG_COLOR.EXPLOSION
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
IFDEF CFG_OTHERS.EXTRA_ENEMY_1
	ld	ix,unused_enemy_slot1
	call	UPDATE_ENEMY
ENDIF
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
	ld	a,0Ah
	ld	(exit.blink_counter),a
	ld	a,(exit.blink_flag)
	cpl
	ld	(exit.blink_flag),a
	ld	de,0B0Ch
	or	a
	jr	z,.L89B1
; (prints the exit)
	ld	a,$44 ; 50h
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
; yes: increases room index
	ld	a,(pyramid.room_index)
	inc	a
	ld	(pyramid.room_index),a
; prints the room as visited
	ld	de,(pyramid.room_namtbl_ptr)
	ld	a,$51
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
	call	UPDATE_ENEMY
	ld	ix,bat2
	call	UPDATE_ENEMY
	ld	ix,box3
	call	UPDATE_BOX
IFDEF CFG_OTHERS.EXTRA_ENEMY_2
	ld	ix,unused_enemy_slot2
	call	UPDATE_ENEMY
ENDIF
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
	ld	b,$1c
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
	ld	a,CFG_COLOR.EXPLOSION
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
	ld	b,$48 ; 54h
	jr	z,.L8A5D
	ld	b,$4c ; 58h
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
	ld	b,CFG_COLOR.DOOR_1
	ld	c,CFG_COLOR.DOOR_2
	jr	.L8A9C
.L8A98:	ld	b,CFG_COLOR.DOOR_2
	ld	c,CFG_COLOR.DOOR_1
; Sets door colors (RAM)
.L8A9C:	ld	a,b
	ld	(door1.spratr_color),a
	ld	a,c
	ld	(door2.spratr_color),a
; Sets door colors (VRAM)
	ld	de,door1.spratr_y
	ld	a,00h
	call	PUT_SPRITE
	ld	de,door2.spratr_y
	ld	a,01h
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
	ld	a,$52 ; ($62 = sphynx room)
	ld	de,121Ch	; address or value?
	call	PRINT_CHAR
; color ,,1
	ld	b,CFG_COLOR.BG_SPHYNX
	ld	c,07h
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
.L8B4C:	ld	c,01h
	ld	b,0E2h
	call	WRTVDP
; color ,,4
	ld	c,07h
	ld	b,CFG_COLOR.BG
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
; Is checking player?
	ld	a,(check_wall_for_player)
	or	a
	jr	z,.L8C20 ; no

; Checks for box (player only)
	ld	a,$34 -1 ; >= $34?
	cp	b
	jr	nc,.L8C13 ; no
	ld	a,$38 -1 ; and <= $37?
	cp	b
	jr	c,.L8C13 ; no
; yes: box, not a wall
	ld	a,0FFh
	ret

; Checks for exit (player only)
.L8C13:	ld	a,$44 -1 ; >= $44?
	cp	b
	jr	nc,.L8C20 ; no
	ld	a,$48 -1 ; and <= $48?
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

; -----------------------------------------------------------------------------
; param hl: Source data. One of DATA_RANDOMIZE_PYRAMID.FLOOR*
; param de: Pointer to the room_array
; param bc: Number of rooms of the current floor
; ret de: Updated pointer to the room_array
RANDOMIZE_FLOOR:
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
LONG_DELAY:
.L8C47:	ld	hl,3000h	; address or value?
.L8C4A:	dec	hl
	ld	a,h
	or	l
	jr	nz,.L8C4A
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
	ld	a,0FFh
	ld	(ix+05h),a ; .status
	xor	a
	ld	(ix+04h),a ; .direction (0 = left)
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
	ld	a,(ix+07h) ; .sprite_plane
	ld	de,(current_enemy_ptr)
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
	or	a
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
.L8CE9:	ld	a,00h ; left
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
	ld	(ix+04h),b ; .direction
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
	ld	b,(ix+06h) ; .base_pattern
	ld	a,(aux.frame_counter)
	and	04h
	jr	z,.L8D2C
	inc	b
; (computes enemy pattern)
.L8D2C:	ld	a,b
	add	a,a
	add	a,a
	ld	(ix+02h),a ; .spratr_pattern
	ld	a,(ix+07h) ; .sprite_plane
	ld	de,(current_enemy_ptr)
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
	ld	a,78h
	ld	(hl),a
	inc	hl ; bullet.spratr_color
	ld	a,CFG_COLOR.EXPLOSION
	ld	(hl),a
	inc	hl ; bullet.direction
	inc	hl ; bullet.status
	ld	a,06h
	ld	(hl),a
; Prints explosion sprite
	ld	de,bullet
	ld	a,0Ah
	call	PUT_SPRITE
; Play sound
	call	PLAY_SOUND_BULLET_HIT
; Scores 30 points
	ld	de,0030h
	call	ADD_SCORE
; Removes enemy (RAM)
	xor	a
	ld	(ix+05h),a ; .status
	ld	a,SPAT_OB
	ld	(ix+00h),a ; .spratr_y
; Removes enemy (VRAM)
	ld	de,(current_enemy_ptr)
	ld	a,(ix+07h) ; .sprite_plane
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
	ld	b,CFG_COLOR.BG
	ld	c,07h
	call	WRTVDP
	jp	DEC_LIVES_AND_NEW_ROOM
; -----------------------------------------------------------------------------

	; Referenced from 837C
	; --- START PROC L8DD8 ---

; -----------------------------------------------------------------------------
GAME_OVER:
.L8DD8:	call	RESET_SOUND
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
	ld	a,0FFh
	ld	(ix+02h),a ; .status

	ld	a,32h		; '2'
	ld	(ix+03h),a
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
	ld	a,3Ch
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
	ld	a,38h
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
	ld	a,40h
	ld	(hl),a
	inc	hl ; skull.spratr_color
	ld	a,CFG_COLOR.SKULL
	ld	(hl),a
	inc	hl ; skull.direction
	xor	a
	ld	(hl),a
	inc	hl ; skull.status
	inc	hl ; skull.base_pattern
	ld	a,10h
	ld	(hl),a
	inc	hl ; skull.sprite_plane
	ld	a,03h
	ld	(hl),a
; Put skull sprite
	ld	de,skull
	ld	a,03h
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
.L8F14:	ld	ix,sound_buffer.start

; Three times
	ld	b,03h
.L8F1A:	push	bc
	ld	a,0Ah ; note
	call	PLAY_START_GAME_MUSIC.NOTE
	ld	a,14h ; note
	call	PLAY_START_GAME_MUSIC.NOTE
	ld	a,1Eh
	call	PLAY_START_GAME_MUSIC.NOTE
	ld	a,14h
	call	PLAY_START_GAME_MUSIC.NOTE
	pop	bc
	djnz	.L8F1A ; loops
; Long last note
	ld	a,0Ah
	call	PLAY_START_GAME_MUSIC.NOTE
; (delay)
	ld	b,03h
.L8F39:	ld	hl,0000h
.L8F3C:	dec	hl
	ld	a,h
	or	l
	jr	nz,.L8F3C
	djnz	.L8F39
; Stops music
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	jp	PLAY_SOUND

	; Referenced from 8F1D, 8F22, 8F27, 8F2C, 8F34
	; --- START PROC L8F49 ---

PLAY_START_GAME_MUSIC.NOTE:
; Prepares the buffer
.L8F49:	ld	b,0Ah
	ld	(ix+00h),b ; length
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
; Plays the note
	call	RESET_SOUND
	ld	hl,sound_buffer.start
	call	PLAY_SOUND
	jp	LONG_DELAY
; -----------------------------------------------------------------------------

	; Referenced from 8DCB
	; --- START PROC L8FB3 ---

; -----------------------------------------------------------------------------
PLAY_DEAD_MUSIC:
; Initializes the "flashing" flag
.L8FB3:	xor	a
	ld	(aux.dying_flashes),a
; (descending notes)
	ld	a,0Ah ; initial tone
	ld	ix,sound_buffer.dead
.L8FBD:	push	af
	call	PLAY_DEAD_MUSIC.NOTE
	pop	af
	add	a,14h ; decreases tone
	cp	0E6h ; until x
	jr	nz,.L8FBD
; color ,,6
	ld	c,07h
	ld	b,CFG_COLOR.BG_DEAD_1
	call	WRTVDP
; (delay)
	ld	b,03h
.L8FD1:	ld	hl,0000h
.L8FD4:	dec	hl
	ld	a,h
	or	l
	jr	nz,.L8FD4
	djnz	.L8FD1
; color ,,4
	ld	c,07h
	ld	b,CFG_COLOR.BG_DEAD_2
	call	WRTVDP
; Stops music
	ld	hl,DATA_SOUND.MUTE_CHANNELS
	jp	PLAY_SOUND

	; Referenced from 8FBE
	; --- START PROC L8FE8 ---

PLAY_DEAD_MUSIC.NOTE:
; Prepares the buffer
.L8FE8:	ld	b,0Ah ; length
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
; Plays the note
	call	RESET_SOUND
	ld	hl,sound_buffer.dead
	call	PLAY_SOUND
; Flashes the background color
	ld	a,(aux.dying_flashes)
	cpl
	or	a
	ld	(aux.dying_flashes),a
	jr	z,.L905D
	ld	b,CFG_COLOR.BG_DEAD_2
	jr	.L905F
.L905D:	ld	b,CFG_COLOR.BG_DEAD_1
; color ,,b
.L905F:	ld	c,07h
	call	WRTVDP
	jp	LONG_DELAY
; -----------------------------------------------------------------------------

	; Referenced from 8AFE
	; --- START PROC L9067 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_SPHYNX:
.L9067:	call	RESET_SOUND
	ld	hl,DATA_SOUND.SPHYNX
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 89D2
	; --- START PROC L9070 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_EXIT:
.L9070:	call	RESET_SOUND
; color ,,3
	ld	c,07h
	ld	b,CFG_COLOR.BG_EXIT
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
	ld	b,CFG_COLOR.BG
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
.L910C:	call	RESET_SOUND
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
.L9121:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BOX
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 871D, 874B
	; --- START PROC L912A ---

; -----------------------------------------------------------------------------
PLAY_SOUND_DOOR:
.L912A:	call	RESET_SOUND
	ld	hl,DATA_SOUND.DOOR
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 895E, 8D8D
	; --- START PROC L9133 ---

; -----------------------------------------------------------------------------
PLAY_SOUND_BULLET_HIT:
.L9133:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BULLET_HIT
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 87E5
	; --- START PROC L913C ---

; -----------------------------------------------------------------------------
PLAY_SOUND_BULLET:
.L913C:	call	RESET_SOUND
	ld	hl,DATA_SOUND.BULLET
	jp	PLAY_SOUND
; -----------------------------------------------------------------------------

	; Referenced from 8DD8, 8FA7, 912A, 910C, 913C, 9133, 9121, 9067, 9070, 9046
	; --- START PROC L9145 ---

; -----------------------------------------------------------------------------
RESET_SOUND:
.L9145:	ld	hl,DATA_SOUND.RESET
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

; -----------------------------------------------------------------------------
; param a: sprite index
; param de: ROM/RAM source SPRATR data
PUT_SPRITE:
.L91E3:	ld	hl,SPRATR
	ld	bc,4 ; 4b per sprite
	inc	a
.L91EA: dec	a
	jp	z,.L91F1
	add	hl,bc
	jr	.L91EA
.L91F1: ex	de,hl
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
.L9264:	ld	b,(hl)
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
	call	TO_NAMTBL
	ex	de,hl
; First row, first char
	call	.CHAR
; Second char
	ld	a, c
	inc	hl
	call	.CHAR
; Second row, first char
	ld	bc, SCR_WIDTH -1
	add	hl, bc
	call	.CHAR
; Second char
	inc	l
	jp	WRTVRM

.CHAR:
	push	hl
	ld	a, $ff
	call	WRTVRM
	pop	hl
	ret
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

.WALL_x25: ; 9C3B
	DB	$31, $30, $31, $30, $31, $30, $31, $30	; 25x wall
	DB	$31, $30, $31, $30, $31, $30, $31, $30
	DB	$31, $30, $31, $30, $31, $30, $31, $30
	DB	$31
.ROOMS_x7:	; 9C54
	DB	$53, $53, $53, $53, $53, $53, $53	; 7x black room

.BLANKS: ; 9C62
	DB	$2F, $2F, $2F, $2F, $2F, $2F, $2F
	DB	$2F, $2F, $2F, $2F, $2F, $2F

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
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SPHYNX_SPRATR:
.L9F28:	DB	07h, 50h, $7c, $04 ; ..., 84h, 04h
	DB	07h, 70h, $80, $04 ; ..., 88h, 04h
	DB	27h, 50h, $84, $04 ; ..., 8Ch, 04h
	DB	27h, 70h, $88, $04 ; ..., 90h, 04h
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
	IFDEF CFG_ENHANCEMENTS.FONT
		incbin	"asm/enhanced/font.pcx.chr"
	ELSE
		incbin	"asm/original/font.pcx.chr"
	ENDIF
	.SIZE:	equ $ - DATA_FONT

DATA_SPRTBL:
	IFDEF CFG_ENHANCEMENTS.SPRITES
		incbin	"asm/enhanced/sprites.pcx.spr"
	ELSE
		incbin	"asm/original/sprites.pcx.spr"
	ENDIF
	.SIZE:	equ $ - DATA_SPRTBL

DATA_CHARSET:
	.CHR:
	IFDEF CFG_ENHANCEMENTS.CHARSET
		incbin	"asm/enhanced/charset.pcx.chr"
	ELSE
		incbin	"asm/original/charset.pcx.chr"
	ENDIF
	.CHR_FF:	equ $ - 8
	.SIZE:	equ $ - DATA_CHARSET

	.CLR:
	IFDEF CFG_ENHANCEMENTS.CHARSET
		incbin	"asm/enhanced/charset.pcx.clr"
	ELSE
		incbin	"asm/original/charset.pcx.clr"
	ENDIF
	.CLR_FF:	equ $ - 8

DATA_ROOMS:
	IFDEF CFG_ENHANCEMENTS.ROOMS
		include	"asm/enhanced/rooms.asm"
	ELSE
		include	"asm/original/rooms.asm"
	ENDIF

DATA_RANDOMIZE_PYRAMID:
	IFDEF CFG_ENHANCEMENTS.ROOMS
		include	"asm/enhanced/pyramids.asm"
	ELSE
		include	"asm/original/pyramids.asm"
	ENDIF
	.FLOOR1:	equ DATA_RANDOMIZE_PYRAMID -7
	.FLOOR2:	equ DATA_RANDOMIZE_PYRAMID +(7*4) -5
	.FLOOR3:	equ DATA_RANDOMIZE_PYRAMID +(7*4) +(5*4) -3
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
.L9F56:	db	" PYRAMID WARP", $a0
	db	" 1983. 9. 15", $a0
	db	" by T&E SOFT", $a0
	db	" EIZI KATO !!", $a0
; -----------------------------------------------------------------------------

debug_rom_end_original: equ $9f8c
debug_rom_end_new:	equ $
debug_rom_end_diff:	equ debug_rom_end_original - debug_rom_end_new

; -----------------------------------------------------------------------------
; Padding to a 8kB boundary
	ds	($ OR $1fff) -$ +1, $00
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
unused_enemy_slot1: ; C036H
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
unused_enemy_slot2: ; C04EH
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
	.first_pyramid:	rb 1	; C07BH
	.lives:		rb 1	; C07CH
aux.how_many_bytes:	rb 2	; C07DH
game.high_score_bcd:	rb 3	; C07FH (6 digits)
game.score_bcd:		rb 3	; C082H (6 digits)
pyramid: ; C085H
	.room_index:	rb 1	; C085H
	.room_array:	rb 16	; C087H (7+5+3+1 rooms)
	.room_namtbl_ptr:rb 2	; C097H
sound_buffer: ; C099H
	.start:		rb 1+20	; C099H
	.dead:		rb 1+20	; C0AEH
	.end:		rb 1+20	; C0C3H
aux.frame_counter_2:	rb 1	; C0D8H
player_entering_door:	rb 1	; C0DAH
aux.dying_flashes:	rb 1	; C0DCH
; -----------------------------------------------------------------------------

debug_ram_end_original: equ $c0dc + $2000 ; (16KB RAM to 8KB RAM)
debug_ram_end_new:	equ $ -1
debug_ram_end_diff:	equ debug_ram_end_original - debug_ram_end_new

; EOF
