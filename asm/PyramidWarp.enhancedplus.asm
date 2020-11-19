
; -----------------------------------------------------------------------------
; MSX symbolic constants
	include	"asm/symbols.asm"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
CFG_BG_COLOR:
	.INIT:		equ 1
	.DEFAULT:	equ 4	; 4
	.SPHINX:	equ 1	; 1
	.DEAD_1:	equ 8	; 6
	.DEAD_2:	equ 9	; 4
	.DEAD_3:	equ 6
	.EXIT:		equ 12	; 3

CFG_EXIT:
	.BLINK_FRAMES:	equ 10

CFG_HUD:			; $yyxx coordinates
	.HIGH_COORDS:		equ $081A ; 0819h
	.SCORE_COORDS:		equ $0B1A ; 0B19h
	.AIR_LEFT_COORDS:	equ $0E1C ; 0E19h
	.ROOM_COORDS:		equ $101E ; 101Dh
	.LIVES_COORDS:		equ $171A ; 1719h

CFG_OTHERS:
	.OPTIONS_0:		equ ($02 << 4) + ($01 << 2) + ($01) ; 00eemmrr: Enemies, Mirroring, Rooms
	.PLAYER_INITIAL_DIR:	equ $03 ; 01h ; Initial player direction (down)
	.SHORT_DELAY_FACTOR:	equ $03 ; 04h ; Multiplier in short delay routine
	.CHEAT_TAB_FAST_FORWARD:	; Uncomment to use TAB key to advance
	; .CHEAT_WIN_GAME:	; Uncomment to start game in sphinx room!!
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

; =============================================================================
; 	ROM
; =============================================================================

; -----------------------------------------------------------------------------
; MSX cartridge (ROM) header, entry point and initialization
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

; VDP: color ,,1
	ld	a, CFG_BG_COLOR.INIT
	ld	[BDRCLR], a
; VDP: screen 2
	call	INIGRP
; screen ,2
	call	DISSCR
	ld	hl, RG1SAV
	set	1, [hl] ; (first call to ENASCR will actually apply to the VDP)
; screen ,,0
	xor	a
	ld	[CLIKSW], a

; Zeroes all the used RAM
	ld	hl, ram_start
	ld	de, ram_start +1
	ld	bc, ram_end - ram_start  -1
	ld	[hl], l ; l = $00
	ldir

; PSG: silence
	call	GICINI
; Initializes the replayer
	call	REPLAYER.RESET

; Frame rate related variables
	ld	a, [MSXID1]
	bit	7, a ; 0=60Hz, 1=50Hz
	ld	hl, 5 << 8 + 50 ; frame rate and frames per tenth for 50Hz
	jr	nz, .HL_OK
	ld	hl, 6 << 8 + 60 ; frame rate and frames per tenth for 60Hz
.HL_OK:
	ld	[frame_rate], hl

; Installs the H.TIMI hook in the interruption
	di
	ld	a, $c3 ; opcode for "JP nn"
	ld	[HTIMI], a
	ld	hl, HOOK
	ld	[HTIMI +1], hl
	ei

; Performs the only-once initialization
	call	INIT_ONCE
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
; Game entry point
INIT:
; color ,,1
	ld	bc, CFG_BG_COLOR.INIT << 8 + 07h
	call	WRTVDP

; Hides the sprites
	call	CLEAR_SPRITES
	call	LDIRVM_SPRITES

; Options menu
	call	INIT_MAIN_MENU
	call	ENASCR
	call	MAIN_MENU_LOOP

; color ,,4
	ld	bc,CFG_BG_COLOR.DEFAULT << 8 + 07h
	call	WRTVDP
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
NEW_GAME:
; Initializes the variables and prepares the playground
	call	INIT_INGAME

	ld	de,CFG_HUD.SCORE_COORDS
	call	PRINT_SCORE
; ------VVVV----falls through--------------------------------------------------

; -----------------------------------------------------------------------------
NEW_PYRAMID:
; Builds the pyramid
	call	BUILD_PYRAMID
	call	BUILD_PYRAMID_DEFINITION

; Room 0
	IFDEF  CFG_OTHERS.CHEAT_WIN_GAME
		ld	a, 15 ; (starts in the sphinx room)
	ELSE
		xor	a
	ENDIF
	ld	(pyramid.room_index),a

; Intro version in-game music
	ld	a, (game.pyramid_count)
	and	$01 ; a = 0 or 1
	add	a ; a = 0 or 2
	ld	(ingame_song_index), a

; Enemy count
	call	INIT_ENEMY_COUNT

; Plays "Start game" music
	call	PLAY_START_GAME_MUSIC
	jr	DEC_LIVES_AND_NEW_ROOM.ON_NEW_PYRAMID
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DEC_LIVES_AND_NEW_ROOM:
; Decreases the enemy count
	call	DECREASE_ENEMY_COUNT
.ON_NEW_PYRAMID:
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
	ld	a, [pyramid.room_index]
	ld	hl, pyramid.room_array
	call	ADD_HL_A
	ld	a, [hl]
	ld	[game.current_room], a

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

; Is the sphinx room?
	ld	a,(game.current_room)
	cp	10h
	jp	z,PRINT_SPHINX_ROOM_DECORATION ; yes
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
	ld	a, CHARACTER.NEST  ; $48 ; 54h
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
	ld	a, CHARACTER.BOX ; 34h ; ($34 = box)
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
	ld	(ix + 1),SPRITE_COLOR.DOOR_0 ; door.spratr_color
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
PRINT_SPHINX_ROOM_DECORATION:
; Prints single box
	ld	de,0B0Ch	; address or value?
	ld	a, CHARACTER.BOX ; 34h ; ($34 = box)
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
	ld	(hl),SPRITE_COLOR.PLAYER ; 0Bh

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
	ld	b, CHARACTER.ROOM_NOT_VISITED ; $53 ; ($63 = non visited room)
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
	ld	b,SPRITE_COLOR.PLAYER ; yellow (without gun)
	ld	a,(player_has_gun)
	or	a
	jr	z,.L878B
	ld	b,SPRITE_COLOR.PLAYER_GUN ; white (with gun)
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
	ld	(iy+03h),SPRITE_COLOR.BULLET; bullet color
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
	add	a, SPRITE_PATTERN.SKULL4*4

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
	ld	a, SPRITE_PATTERN.BULLET ; 1Ah
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
	ld	(hl),SPRITE_PATTERN.EXPLOSION_2*4 ; 78h
	inc	hl ; bullet.spratr_color
	ld	(hl),SPRITE_COLOR.EXPLOSION
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
; Is the sphinx room?
	ld	a,(game.current_room)
	cp	10h
	jp	z,CHECK_SPHINX_ROOM_BOX ; yes
; no: updates scorpion1, box1 and bat1
	ld	ix,scorpion1
	call	UPDATE_ENEMY
	ld	ix,box1
	call	UPDATE_BOX
	ld	ix,bat1
	call	UPDATE_ENEMY
	ld	ix,snake1
	call	UPDATE_ENEMY

	IFDEF CFG_OTHERS.CHEAT_TAB_FAST_FORWARD
		ld	a, $07 ; a = $07 ; CR SEL BS STOP TAB ESC F5 F4
		call	SNSMAT
		bit	3, a
		jr	z, .DO_EXIT
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
	ld	a, CFG_EXIT.BLINK_FRAMES ; 0Ah
	ld	(exit.blink_counter),a
	ld	a,(exit.blink_flag)
	cpl
	ld	(exit.blink_flag),a
	ld	de,0B0Ch
	or	a
	jr	z,.L89B1
; (prints the exit)
	ld	a, CHARACTER.EXIT ; $44 ; 50h
	call	PRINT_TILE
	jr	.L89B4
; (clears the exit)
.L89B1:	call	CLEAR_TILE

; Compares player and exit coordinates
.L89B4: ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
	inc	hl
	ld	a,60h
	cp	(hl)
	jr	nz,GAME_LOOP.EXIT_OK ; no
.DO_EXIT:
; yes: increases room index (and increases the enemy count on new floor)
	call	INCREASE_ROOM_INDEX
	call	z, ON_FLOOR_CHANGE
; prints the room as visited
	ld	de,(pyramid.room_namtbl_ptr)
	ld	a, CHARACTER.ROOM_VISITED ; $51
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
	ld	b, SPRITE_PATTERN.EXPLOSION ; $1c
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
	ld	(ix+03h),SPRITE_COLOR.EXPLOSION ; bullet.spratr_color
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
	ld	b, CHARACTER.NEST1 ; $48 ; 54h
	jr	z,.L8A5D
	ld	b, CHARACTER.NEST2 ; $4c ; 58h
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
	ld	bc,SPRITE_COLOR.DOOR_1 << 8 + SPRITE_COLOR.DOOR_2
	jr	.L8A9C
.L8A98:	ld	bc,SPRITE_COLOR.DOOR_2 << 8 + SPRITE_COLOR.DOOR_1
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
CHECK_SPHINX_ROOM_BOX:
; Is the player at ($60,$58)?
.L8AB7:	ld	hl,player.spratr_y
	ld	a,58h
	cp	(hl)
	jr	nz,GAME_LOOP.NEXT ; no
	inc	hl ; player.spratr_x
	ld	a,60h
	cp	(hl)
	jr	nz,GAME_LOOP.NEXT ; no

; Prints sphinx sprites
	ld	hl, DATA_SPHINX_SPRATR + 0 *4
	ld	de, spratr_buffer
	ld	bc, 9 * 4
	ldir

	; Prints sphinx tiles
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

; Prints the sphinx room in the map
	ld	a,$52 ; ($62 = sphinx room)
	ld	de,121Ch	; address or value?
	call	PRINT_CHAR
; color ,,1
	ld	bc,CFG_BG_COLOR.SPHINX << 8 + 07h
	call	WRTVDP
; Increase score
	ld	de,2000h ; 2000 points (BCD)
	call	ADD_SCORE
; Prints literal
	ld	de,1206h
	ld	b,0Eh
	ld	hl,LITERAL.CONGRATULATIONS
	call	PRINT
; Sphinx sound
	call	PLAY_SOUND_SPHINX

; "Hit space key"
	ld	hl,LITERAL.TRY_THE_NEXT_PYRAMID
	ld	de,1403h
	ld	b,14h
	call	PRINT
	ld	de,1606h
	call	HIT_SPACE_KEY

; color ,,4
	ld	bc,CFG_BG_COLOR.DEFAULT << 8 + 07h
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
		ld	a, CHARACTER.FLOOR-1
		cp	b
		jr	nc, .L8BFB_ ; no
		ld	a, CHARACTER.FLOOR_END-1
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
	ld	a, CHARACTER.BOX-1 ; $34 -1 ; >= $34?
	cp	b
	jr	nc,.L8C13 ; no
	ld	a, CHARACTER.BOX_END-1 ; $38 -1 ; and <= $37?
	cp	b
	jr	c,.L8C13 ; no
; yes: box, not a wall
	ld	a,0FFh
	ret

; Checks for exit (player only)
.L8C13:
	ld	a, CHARACTER.EXIT-1 ; $44 -1 ; >= $44?
	cp	b
	jr	nc,.L8C20 ; no
	ld	a, CHARACTER.EXIT_END-1 ; $48 -1 ; and <= $48?
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
	ld	(hl),SPRITE_COLOR.EXPLOSION
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
	ld	bc,CFG_BG_COLOR.DEFAULT << 8 + 07h
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
	ld	a, CHARACTER.DIAMOND ; 3Ch
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
	ld	a, CHARACTER.GUN ; 38h
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
	ld	(hl),SPRITE_PATTERN.SKULL4*4+12 ; 40h
	inc	hl ; skull.spratr_color
	ld	(hl),SPRITE_COLOR.SKULL
	inc	hl ; skull.direction
	xor	a
	ld	(hl),a
	inc	hl ; skull.status
	inc	hl ; skull.base_pattern
	ld	(hl),SPRITE_PATTERN.SKULL4 ; 10h
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
	ld	hl, .SONG
	call	REPLAYER.PLAY_JINGLE
	jp	DELAY.ONE_SECOND
.SONG:
	incbin "asm/enhancedplus/sfx/PW_NewGame.pt3.hl.zx7"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_INGAME_MUSIC:
; Reads the song to use and skips the nointro version the next time
	ld	hl, ingame_song_index
; Checks sphinx room first
	ld	a, [pyramid.room_index]
	cp	15
	ld	a, 8
	jr	z, .A_OK ; yes
; No: Reads the song to use and skips the nointro version the next time
	ld	a, [hl]
	set	2, [hl] ; 00000 X 0 0
.A_OK:
; Gets the proper song
	ld	hl, .TABLE
	call	ADD_HL_A
	ld	a, [hl] ; hl = [hl]
	inc	hl
	ld	h, [hl]
	ld	l, a
; Plays the song
	xor	a ; (loop)
	jp	REPLAYER.PLAY
.TABLE:
	dw	.SONG_INTRO	; 0 = 00000 0 0 0
	dw	.SONG_INTRO	; 2 = 00000 0 1 0
	dw	.SONG_A		; 4 = 00000 1 0 0
	dw	.SONG_B		; 6 = 00000 1 1 0
	dw	.SONG_SPHINX	; 8 = 00001 0 0 0
.SONG_INTRO:
	incbin "asm/enhancedplus/sfx/PW_VT2_3chan.pt3.hl.zx7"
.SONG_A:
	incbin "asm/enhancedplus/sfx/PW_VT2_3chan_nointro.pt3.hl.zx7"
.SONG_B:
	incbin "asm/enhancedplus/sfx/PW_VT2_3_Level2.pt3.hl.zx7"
.SONG_SPHINX:
	incbin "asm/enhancedplus/sfx/PW_VT2_3_Sphinx_IN.pt3.hl.zx7"
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
	ld	hl, .SONG
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
	ld	bc,CFG_BG_COLOR.DEAD_3 << 8 + 07h
	call	WRTVDP
; (delay)
	call	REPLAYER.WAIT
	jp	DELAY.ONE_SECOND

.FLASH:
; Flashes the background color
	ld	a,(aux.dying_flashes)
	cpl
	ld	(aux.dying_flashes),a
	ld	b,CFG_BG_COLOR.DEAD_2
	or	a
	jr	nz,.L905F
	ld	b,CFG_BG_COLOR.DEAD_1
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
	incbin "asm/enhancedplus/sfx/PW_Dead2.pt3.hl.zx7"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_SOUND_EXIT:
; color ,,3
	ld	bc, CFG_BG_COLOR.EXIT << 8 + 07h
	call	WRTVDP
; Plays the jingle
	ld	hl, .SONG
	call	REPLAYER.PLAY_JINGLE
; color ,,4
	ld	bc, CFG_BG_COLOR.DEFAULT << 8 + 07h
	jp	WRTVDP
.SONG:
	incbin "asm/enhancedplus/sfx/PW_LevelFinished.pt3.hl.zx7"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PLAY_SOUND_SPHINX:
; color ,,3
	ld	bc, CFG_BG_COLOR.EXIT << 8 + 07h
	call	WRTVDP
; Plays the jingle
	ld	hl, .SONG
	call	REPLAYER.PLAY_JINGLE
; color ,,4
	ld	bc, CFG_BG_COLOR.DEFAULT << 8 + 07h
	jp	WRTVDP
.SONG:
	incbin "asm/enhancedplus/sfx/PW_VT2_Sphinx.pt3.hl.zx7"
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
	; .SPHINX:		equ 11 -1	; 6, 11
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
	ld a, CHARACTER.FLOOR
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

.BLANKS:
	DB	$2F, $2F, $2F, $2F, $2F, $2F, $2F	; 15x blanks
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
	DB	$19, $22, $1B, $0A, $16, $12, $0D	; PYRAMID
.GAME_OVER: ; 9CCF
	DB	$10, $0A, $16, $0E, $FF			; GAME_
	DB	$18, $1F, $0E, $1B			; OVER
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
DATA_SPHINX_SPRATR:
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

DATA_SOUND.SPHINX:
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
; param hl: pointer to the packed song
; param a: *******l, where l (LSB) is the loop flag (0 = loop),
REPLAYER.PLAY:
	push	af ; (preserves flags)
	push	hl ; (preserves source)
; (makes the replayer stop during unpack to avoid corruption)
	call	REPLAYER.STOP
; Unpacks song
	pop	hl ; (restores source)
	ld	de, unpack_buffer
	call	UNPACK
; Saves the configuration (the loop flag)
	pop	af ; (restores flags)
	and	$01 ; (loop flag only)
	ld	[PT3_SETUP], a
; Initializes song
	ld	hl, unpack_buffer -100 ; (headerless PT3 files)
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
; ZX7 decoder by Einar Saukas, Antonio Villena & Metalbrain
; "Standard" version (69 bytes only)
UNPACK:
	include	"asm/libext/dzx7_standard.tniasm.asm"
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
	ld	a,10h ; (sphinx room)
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
	ld	bc, $1010 ; 16 rooms, +16
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
	call	.RANDOMIZE_FLOOR ; (falls through)
; Randomizes the sphinx room
	ld	a, r
	rrca
	ret	nc ; classic room
; Newer room
	ld	a, [de]
	add	$10
	ld	[de], a
	ret

; Randomizes a floor with the new method
.RANDOMIZE_FLOOR:
	push	de ; (preserves target)
	push	bc ; (preserves count and split pivot)

; Initializes the shuffle area (1,2,3...)
	sla	b ; (randomize twice the numbers)
	push	bc ; (preserves double count)
	ld	de, pyramid_definition.tmp
	ld	a, l
.FILL_LOOP:
; Check if split pivot has been reached
	cp	c
	jr	nz, .FILL_A_OK
; Split pivot reached
	sub	c ; translates 8-14 -> 1-7 (+$10), 13-17 -> 8-12 (+$10), 16-18 -> 13-15 (+$10)
	add	l
	add	$10
.FILL_A_OK:
	ld	[de], a
	inc	de
	inc	a
	djnz	.FILL_LOOP

; Shuffles the shuffle area
	pop	bc ; (restores double count)
	dec	b ; (do not shuffle last number)
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

; Actually copies the shuffled area to the pyramid_definition
	pop	bc ; (restores count)
	ld	c, b
	ld	b, 0
	ld	hl, pyramid_definition.tmp
	pop	de ; (restores target)
	ldir
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
; On entering second or third floor
ON_FLOOR_CHANGE:
; Changes the in-game song
	ld	hl, ingame_song_index
	ld	a, [hl]
	xor	$02 ; 00000 0 X 0
	ld	[hl], a
; Increases the enemy count
	; jp	INCREASE_ENEMY_COUNT ; (falls through)
; ------VVVV----falls through--------------------------------------------------

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
	ld	hl, pyramid_definition -1 ; (-1 because game.current_room is 1-based)
	ld	a, (game.current_room)
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

; Is the sphinx room?
	ld	a, (game.current_room)
	cp	$10
	ret	z ; (do not mirror nor flip the sphinx room)

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
; Performs the only-once initialization:
; - initial option values
; - CHRTBL/CLRTBL/SPRTBL
INIT_ONCE:
; Initializes the options
	ld	a, CFG_OTHERS.OPTIONS_0
	ld	[options], a

; High score = 0
	xor	a
	ld	(game.high_score_bcd),a
	ld	(game.high_score_bcd +1),a
	ld	(game.high_score_bcd +2),a

; Init CHRTBL/CLRTBL
	ld	hl, .CHRTBL
	ld	de, CHRTBL
	call	.UNPACK_LDIRVM_x3
	ld	hl, .CLRTBL
	ld	de, CLRTBL
	call	.UNPACK_LDIRVM_x3
; Init SPRTBL
	ld	hl, .SPRTBL
	ld	de, unpack_buffer
	call	UNPACK
	ld	hl, unpack_buffer
	ld	de, SPRTBL
	ld	bc, SPRTBL_SIZE
	jp	LDIRVM

.UNPACK_LDIRVM_x3:
	push	de ; (preserves VRAM address)
; Unpacks
	ld	de, unpack_buffer
	call	UNPACK
; Prepare for blitting
	ld	hl, unpack_buffer
	pop	de ; (restores VRAM address)
; Blits to the three banks
	call	.LDIRVM_x1
	call	.LDIRVM_x1
	; jr	.LDIRVM_x1 ; (falls through)
.LDIRVM_x1:
; Preserves everything
	push	hl ; (preserves source)
	push	de ; (preserves destination)
; Actual LDIRVM
	ld	bc, CHRTBL_SIZE
	push	bc
	call	LDIRVM
; Restores dest and moves to next bank
	pop	bc ; bc = CHRTBL_SIZE
	pop	hl ; (restores destination)
	add	hl, bc
	ex	de, hl
; Restores size and source
	pop	hl ; (restores source)
	ret

; Data
.CHRTBL:
	incbin	"asm/enhancedplus/charset.pcx.chr.zx7"
.CLRTBL:
	incbin	"asm/enhancedplus/charset.pcx.clr.zx7"
.SPRTBL:
	incbin	"asm/enhancedplus/sprites.pcx.spr.zx7"

CHARACTER:
	.WALL:			equ $30
	.WALL_END:		equ CHARACTER.WALL + 1*4

	.BOX:			equ $34
	.BOX_END:		equ CHARACTER.BOX + 1*4

	.GUN:			equ $38
	.GUN_END:		equ CHARACTER.GUN + 1*4

	.DIAMOND:		equ $3C
	.DIAMOND_END:		equ CHARACTER.DIAMOND + 1*4

	.WALL_WARP:		equ $40
	.WALL_WARP_END:		equ CHARACTER.WALL_WARP + 1*4

	.EXIT:			equ $44
	.EXIT_END:		equ CHARACTER.EXIT + 1*4

	.NEST:			equ $48
	.NEST_END:		equ CHARACTER.NEST + 2*4

	.NEST1:			equ $48
	.NEST1_END:		equ CHARACTER.NEST1 + 1*4

	.NEST2:			equ $4C
	.NEST2_END:		equ CHARACTER.NEST2 + 1*4

	.ROOM_VISITED:		equ $51
	.ROOM_NOT_VISITED:	equ $53
	.CURSOR:		equ $56

	.FLOOR:			equ $58
	.FLOOR_END:		equ CHARACTER.FLOOR + 1*4

; Related symbolic constants
SPRITE_PATTERN:
	.SKULL:		equ $10
	.SCORPION:	equ $12
	.BAT:		equ $14
	.SNAKE:		equ $16

	.SKULL4:	equ $10
	.SCORPION4:	equ $28
	.BAT4:		equ $30
	.SNAKE4:	equ $38

	.DOOR_0:	equ $18
	.DOOR_1:	equ $19
	.DOOR_2:	equ $18
	.BULLET:	equ $1A
	.EXPLOSION:	equ $1C

	.EXPLOSION_0:	equ $1C
	.EXPLOSION_1:	equ $1D
	.EXPLOSION_2:	equ $1E

SPRITE_COLOR:
	.SKULL:		equ 15
	.SCORPION:	equ 9
	.BAT:		equ 5
	.SNAKE:		equ 3
	.PLAYER:	equ 14
	.PLAYER_GUN:	equ 15
	.BULLET:	equ 15
	.EXPLOSION:	equ 6
	.DOOR_0:	equ 15
	.DOOR_1:	equ 7
	.DOOR_2:	equ 15
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
INIT_MAIN_MENU:
; Initialization
	xor	a
	ld	[prevstick], a
	ld	[cursor], a

; Init NAMTBL
	ld	hl, .NAMTBL
	ld	de, namtbl_buffer
	call	UNPACK
	ld	hl, namtbl_buffer
	ld	de, NAMTBL
	ld	bc, NAMTBL_SIZE
	jp	LDIRVM

; Data
.NAMTBL:
	incbin	"asm/enhancedplus/screen_title.tmx.bin.zx7"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
MAIN_MENU_LOOP:
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
	jr	MAIN_MENU_LOOP


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


; Data
.ROOMS_VALUES:
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED
	db	$17, $0E, $20, $0E, $1B, $FF, $FF, $FF	; NEWER

.MIRRORING_VALUES:
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED

.ENEMIES_VALUES:
	db	$0E, $0A, $1C, $12, $0E, $1B, $FF, $FF	; EASIER (3)
	db	$18, $1B, $12, $10, $12, $17, $0A, $15	; ORIGINAL (4)
	db	$0E, $17, $11, $0A, $17, $0C, $0E, $0D	; ENHANCED
	db	$11, $0A, $1B, $0D, $0E, $1B, $FF, $FF	; HARDER (6)

.CURSOR:
	db	CHARACTER.CURSOR
	db	CHARACTER.CURSOR +1
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
INIT_INGAME:
; Enemy sprite patterns, colors and planes
	ld	hl, .INIT
	ld	de, enemies
	call	UNPACK

	; TODO: move to "init.bin"!!!
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

; Init NAMTBL
	ld	hl, .NAMTBL
	ld	de, namtbl_buffer
	call	UNPACK
	ld	hl, namtbl_buffer
	ld	de, NAMTBL
	ld	bc, NAMTBL_SIZE
	jp	LDIRVM

; Data
.INIT:
	incbin "asm/enhancedplus/init.bin.zx7"
.NAMTBL:
	incbin	"asm/enhancedplus/screen_ingame.tmx.bin.zx7"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
	db	" PYRAMID WARP", $a0
	db	" 1983. 9. 15", $a0
	db	" by T&E SOFT", $a0
	db	" EIZI KATO !!", $a0
; -----------------------------------------------------------------------------

debug_rom_end:	equ $

; -----------------------------------------------------------------------------
; Padding to a 16kB boundary with $FF (RST $38)
PADDING:
	ds	($ OR $3fff) -$ +1, $ff
	.SIZE:	equ $ - PADDING
; -----------------------------------------------------------------------------

; =============================================================================
; 	RAM
; =============================================================================

	org	$e000, $f380 ; 8KB RAM
ram_start:

; -----------------------------------------------------------------------------
; Enhanced version variables

; NAMTBL buffer (aligned)
namtbl_buffer:
	rb NAMTBL_SIZE

; SPRATR buffer (+ flickering routine) (aligned)
spratr_buffer:
	rb	11 * 4
.end:
	rb	1 ; to store one SPAT_END when the buffer is full
	.size:	equ $ - spratr_buffer
; (extra space for the flickering routine)
	rb	11 * 4
; Offset used by the flickering routine
.flicker_offset:
	rw	1

; Refresh rate in Hertzs (50Hz/60Hz) and related frames per tenth
frame_rate:
	rb	1
frames_per_tenth:
	rb	1
; 60Hz replayer synchronization
replayer.frameskip:
	rb	1
; PT3 replayer by Dioniso/MSX-KUN/SapphiRe
	include	"asm/libext/PT3-RAM.tniasm.ASM"
; ayFX REPLAYER v1.31
	include	"asm/libext/ayFX-RAM.tniasm.asm"

; Options menu variables
prevstick:		rb 1 ; previously read GTSTCK_ANY value
cursor:			rb 1 ; cursor index: 0 = enemies, 1 = mirroring, 2 = rooms
options:		rb 1 ; option values: 00eemmrr: Enemies, Mirroring, Rooms

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

; Enhanced graphics variables
room_enhance_pos:	rb 1
room_enhance_tile:	rb 1

; Current enemy count
enemy_count:
	rb 1
; Current in-game song index
ingame_song_index:
	rb 1
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Original variables

; Player
player:
	.spratr_y:	rb 1
	.spratr_x:	rb 1
	.spratr_pat:	rb 1
	.spratr_color:	rb 1
	.direction:	rb 1
bullet:
	.spratr_y:	rb 1
	.spratr_x:	rb 1
	.spratr_pat:	rb 1
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1

; Boxes
box1:
	.y:		rb 1
	.x:		rb 1
	.is_opening:	rb 1
	.remove_delay:	rb 1
	.content:	rb 1
box2:
	.x:		rb 1
	.y:		rb 1
	.status:	rb 2
	.content:	rb 1
box3:
	.data:		rb 4
	.content:	rb 1

; Doors
door1:
	.type:		rb 1 ; (0 = v, 1 = ^)
	.spratr_y:	rb 1
	.spratr_x:	rb 1
	.spratr_pat:	rb 1
	.spratr_color:	rb 1
door2:
	.type:		rb 1 ; (0 = v, 1 = ^)
	.spratr_y:	rb 1
	.spratr_x:	rb 1
	.spratr_pat:	rb 1
	.spratr_color:	rb 1

; Skull
skull:
	.spratr_y:	rb 1
	.spratr_x:	rb 1
	.spratr_pat:	rb 1
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; (never read?)
	.sprite_plane:	rb 1 ; (never read?)

; Enemies
enemies:
scorpion1:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($12)
	.sprite_plane:	rb 1 ; ($04)
bat1:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($14)
	.sprite_plane:	rb 1 ; ($05)
snake1:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($16)
	.sprite_plane:	rb 1 ; ($06)
scorpion2:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($12)
	.sprite_plane:	rb 1 ; ($07)
bat2:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($14)
	.sprite_plane:	rb 1 ; ($08)
snake2:
	.spratr_y:	rb 3
	.spratr_color:	rb 1
	.direction:	rb 1
	.status:	rb 1
	.base_pattern:	rb 1 ; ($16)
	.sprite_plane:	rb 1 ; ($09)

; etc.
nest:
	.spratr_y:	rb 1
	.spratr_x:	rb 1
player_has_gun:		rb 1
aux.frame_counter:	rb 1
new_player_direction:	rb 1
direction_table:	rb 4
current_enemy_ptr:	rb 2
spawn_enemy_delay:	rb 1
check_wall_for_player:	rb 1
exit:
	.unused1:	rb 1 ; ($01, never read)
	.unused2:	rb 1 ; ($00, never read)
	.has_diamond:	rb 1
	.blink_counter:	rb 1
	.blink_flag:	rb 1
	.is_enabled:	rb 1
game:
	.air_left_bcd:	rb 4
	.short_delay:	rb 1
	.current_room:	rb 1
	.air_left:	rb 2
	.air_left_copy:	rb 2
	.pyramid_count:	rb 1
	.lives:		rb 1
aux.how_many_bytes:	rb 2
game.high_score_bcd:	rb 3 ; (6 digits)
game.score_bcd:		rb 3 ; (6 digits)
pyramid:
	.room_index:	rb 1
	.room_array:	rb 16 ; (7+5+3+1 rooms)
	.room_namtbl_ptr:rb 2
aux.frame_counter_2:	rb 1
player_entering_door:	rb 1
aux.dying_flashes:	rb 1
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Unpack buffer
unpack_buffer:
	rb	3042 ; (at least 2K; the size of the largest PT3 song)
; -----------------------------------------------------------------------------

ram_end:

debug_ram_end_new:	equ $ -1

; EOF
