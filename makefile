
#
# tools
#

ASM=tniasm
EMULATOR=cmd /c start
PCX2MSX=pcx2msx+
PCX2SPR=pcx2spr
TMX2BIN=tmx2bin
ZX7=zx7.exe

#
# commands
#

COPY=cmd /c copy
MKDIR=cmd /c mkdir
MOVE=cmd /c move
REMOVE=cmd /c del
RENAME=cmd /c ren

#
# paths and file lists
#

ORIGINAL_DATAS=\
	asm\original\charset.pcx.chr \
	asm\original\charset.pcx.clr \
	asm\original\font.pcx.chr \
	asm\original\font.pcx.clr \
	asm\original\sprites.pcx.spr

ENHANCED_DATAS=\
	asm\enhanced\charset.pcx.chr \
	asm\enhanced\charset.pcx.clr \
	asm\enhanced\charset_0.pcx.chr \
	asm\enhanced\charset_0.pcx.clr \
	asm\enhanced\font.pcx.chr \
	asm\enhanced\font.pcx.clr \
	asm\enhanced\sprites.pcx.spr \
	asm\enhanced\sprites4d.pcx.spr

ENHANCEDPLUS_DATAS=\
	asm\enhancedplus\charset.pcx.chr.zx7 \
	asm\enhancedplus\charset.pcx.clr.zx7 \
	asm\enhancedplus\sprites.pcx.spr.zx7 \
	asm\enhancedplus\screen_title.tmx.bin.zx7 \
	asm\enhancedplus\screen_ingame.tmx.bin.zx7 \
	asm\enhancedplus\init.bin.zx7 \
	asm\enhancedplus\sfx\jingle-new-game.pt3.hl.zx7 \
	asm\enhancedplus\sfx\jingle-death.pt3.hl.zx7 \
	asm\enhancedplus\sfx\jingle-exit.pt3.hl.zx7 \
	asm\enhancedplus\sfx\jingle-sphinx.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-1-intro.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-1.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-2A.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-2B.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-2C.pt3.hl.zx7 \
	asm\enhancedplus\sfx\music-sphinx.pt3.hl.zx7

ENHANCEDPLUS_STATIC_DATAS=\
	asm\enhancedplus\mapper\rooms_original.asm \
	asm\enhancedplus\mapper\rooms.asm \
	asm\enhancedplus\test.afb

#
# phony targets
#

# default target
default: enhancedplus.rom

clean:
	$(REMOVE) enhancedplus.rom $(ENHANCEDPLUS_DATAS)
	$(REMOVE) $(SYMS) tniasm.sym tniasm.tmp

cleanall:
	$(REMOVE) original.rom
	$(REMOVE) enhanced.rom $(ORIGINAL_DATAS) $(ENHANCED_DATAS)
	$(REMOVE) enhancedplus.rom $(ENHANCEDPLUS_DATAS)
	$(REMOVE) $(SYMS) tniasm.sym tniasm.tmp

compileall: original.rom enhanced.rom enhancedplus.rom

test: enhancedplus.rom
	$(EMULATOR) $<

#
# main targets
#

original.rom: asm\PyramidWarp.annotated.asm
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

enhanced.rom: asm\PyramidWarp.enhanced.asm $(ORIGINAL_DATAS) $(ENHANCED_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

enhancedplus.rom: asm\PyramidWarp.enhancedplus.asm asm\symbols.asm $(ENHANCEDPLUS_DATAS) $(ENHANCEDPLUS_STATIC_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

asm\enhancedplus\init.bin: asm\enhancedplus\init.asm
	$(ASM) $< $@

asm\enhancedplus\sfx\jingle-new-game.pt3.hl \
asm\enhancedplus\sfx\jingle-death.pt3.hl \
asm\enhancedplus\sfx\jingle-exit.pt3.hl \
asm\enhancedplus\sfx\jingle-sphinx.pt3.hl \
asm\enhancedplus\sfx\music-1-intro.pt3.hl \
asm\enhancedplus\sfx\music-1.pt3.hl \
asm\enhancedplus\sfx\music-2A.pt3.hl \
asm\enhancedplus\sfx\music-2B.pt3.hl \
asm\enhancedplus\sfx\music-2C.pt3.hl \
asm\enhancedplus\sfx\music-sphinx.pt3.hl: \
		asm\enhancedplus\sfx\headerless.asm \
		asm\enhancedplus\sfx\jingle-new-game.pt3 \
		asm\enhancedplus\sfx\jingle-death.pt3 \
		asm\enhancedplus\sfx\jingle-exit.pt3 \
		asm\enhancedplus\sfx\jingle-sphinx.pt3 \
		asm\enhancedplus\sfx\music-1-intro.pt3 \
		asm\enhancedplus\sfx\music-1.pt3 \
		asm\enhancedplus\sfx\music-2A.pt3 \
		asm\enhancedplus\sfx\music-2B.pt3 \
		asm\enhancedplus\sfx\music-2C.pt3 \
		asm\enhancedplus\sfx\music-sphinx.pt3
	$(ASM) $<

#
# GFXs targets
#

asm\enhancedplus\charset.pcx.chr: \
		asm\enhancedplus\charset_font.pcx.chr \
		asm\enhancedplus\charset_ingame.pcx.chr \
		asm\enhancedplus\charset_extra.pcx.chr
	$(COPY) /b \
		asm\enhancedplus\charset_font.pcx.chr \
		+ asm\enhancedplus\charset_ingame.pcx.chr \
		+ asm\enhancedplus\charset_extra.pcx.chr \
		$@

asm\enhancedplus\charset.pcx.clr: \
		asm\enhancedplus\charset_font.pcx.clr \
		asm\enhancedplus\charset_ingame.pcx.clr \
		asm\enhancedplus\charset_extra.pcx.clr
	$(COPY) /b \
		asm\enhancedplus\charset_font.pcx.clr \
		+ asm\enhancedplus\charset_ingame.pcx.clr \
		+ asm\enhancedplus\charset_extra.pcx.clr \
		$@

%.pcx.chr %.pcx.clr: %.pcx
	$(PCX2MSX) -hl $<

%.pcx.spr: %.pcx
	$(PCX2SPR) $<

%.tmx.bin: %.tmx
	$(TMX2BIN) $< $@

#
# Packed targets
#

%.chr.zx7: %.chr
	$(REMOVE) $@
	$(ZX7) $<

%.clr.zx7: %.clr
	$(REMOVE) $@
	$(ZX7) $<

%.spr.zx7: %.spr
	$(REMOVE) $@
	$(ZX7) $<

%.hl.zx7: %.hl
	$(REMOVE) $@
	$(ZX7) $<

%.bin.zx7: %.bin
	$(REMOVE) $@
	$(ZX7) $<
