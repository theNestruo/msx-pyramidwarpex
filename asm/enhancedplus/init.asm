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
; Variables initialized once per game
game.score_bcd:
	db	$00, $00, $00 ; (6 digits)
game.lives:
	db	5
game.pyramid_count:
	db	0

; Enemies
skull:
	db	$00, $00 ; .spratr_y, .spratr_x
	db	SPRITE_PATTERN.SKULL4 ; .spratr_pattern
	db	SPRITE_COLOR.SKULL ; .spratr_color
	db	0 ; .direction
	db	0 ; .status
	db	SPRITE_PATTERN.SKULL4 ; .base_pattern
	db	1 ; .sprite_plane ; ($03)
scorpion1:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.SCORPION ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.SCORPION4 ; .base_pattern ; ($12)
	db	$02 ; .sprite_plane ; ($04)
bat1:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.BAT ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.BAT4 ; .base_pattern ; ($14)
	db	$03 ; .sprite_plane ; ($05)
snake1:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.SNAKE ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.SNAKE4 ; .base_pattern ; ($16)
	db	$04 ; .sprite_plane ; ($06)
scorpion2:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.SCORPION ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.SCORPION4 ; .base_pattern ; ($12)
	db	$05 ; .sprite_plane ; ($07)
bat2:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.BAT ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.BAT4 ; .base_pattern ; ($14)
	db	$06 ; .sprite_plane ; ($08)
snake2:
	db	$00, $00, $00 ; .spratr_y
	db	SPRITE_COLOR.SNAKE ; .spratr_color
	db	$00 ; .direction
	db	$00 ; .status
	db	SPRITE_PATTERN.SNAKE4 ; .base_pattern ; ($16)
	db	$07 ; .sprite_plane ; ($09)
; -----------------------------------------------------------------------------

; EOF
