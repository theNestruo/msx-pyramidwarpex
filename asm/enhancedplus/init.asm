; -----------------------------------------------------------------------------
; MSX symbolic constants
	include	"asm/symbols.asm"
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Sprite symbolic constants
SPRITE_PATTERN:
	.SKULL4:	equ $10 *4
	.SCORPION4:	equ $28 *4
	.BAT4:		equ $30 *4
	.SNAKE4:	equ $38 *4

SPRITE_COLOR:
	.SKULL:		equ 15
	.SCORPION:	equ 9
	.BAT:		equ 5
	.SNAKE:		equ 3
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; Initial values for variables

; Enemies
scorpion1:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.SCORPION ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.SCORPION4 ; .base_pattern:	rb 1 ; ($12)
	db	$02 ; .sprite_plane:	rb 1 ; ($04)
bat1:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.BAT ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.BAT4 ; .base_pattern:	rb 1 ; ($14)
	db	$03 ; .sprite_plane:	rb 1 ; ($05)
snake1:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.SNAKE ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.SNAKE4 ; .base_pattern:	rb 1 ; ($16)
	db	$04 ; .sprite_plane:	rb 1 ; ($06)
scorpion2:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.SCORPION ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.SCORPION4 ; .base_pattern:	rb 1 ; ($12)
	db	$05 ; .sprite_plane:	rb 1 ; ($07)
bat2:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.BAT ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.BAT4 ; .base_pattern:	rb 1 ; ($14)
	db	$06 ; .sprite_plane:	rb 1 ; ($08)
snake2:
	db	$00, $00, $00 ; .spratr_y:	rb 3
	db	SPRITE_COLOR.SNAKE ; .spratr_color:	rb 1
	db	$00 ; .direction:	rb 1
	db	$00 ; .status:	rb 1
	db	SPRITE_PATTERN.SNAKE4 ; .base_pattern:	rb 1 ; ($16)
	db	$07 ; .sprite_plane:	rb 1 ; ($09)
; -----------------------------------------------------------------------------

; EOF
