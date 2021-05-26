
#
# tools
#

ASM=tniasm
EMULATOR=cmd /c start
PNG2MSX=png2msx
PNG2SPR=png2spr
TMX2BIN=tmx2bin
ZX0=zx0.exe

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
	asm\original\charset.png.chr \
	asm\original\charset.png.clr \
	asm\original\font.png.chr \
	asm\original\font.png.clr \
	asm\original\sprites.png.spr

ENHANCED_DATAS=\
	asm\enhanced\charset.png.chr \
	asm\enhanced\charset.png.clr \
	asm\enhanced\charset_0.png.chr \
	asm\enhanced\charset_0.png.clr \
	asm\enhanced\font.png.chr \
	asm\enhanced\font.png.clr \
	asm\enhanced\sprites.png.spr \
	asm\enhanced\sprites4d.png.spr

ENHANCEDPLUS_DATAS=\
	asm\enhancedplus\charset.png.chr.zx0 \
	asm\enhancedplus\charset.png.clr.zx0 \
	asm\enhancedplus\sprites.png.spr.zx0 \
	asm\enhancedplus\screen_title.tmx.bin.zx0 \
	asm\enhancedplus\screen_ingame.tmx.bin.zx0 \
	asm\enhancedplus\init.bin.zx0 \
	asm\enhancedplus\sfx\PW_Dead2.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level1_A.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level1_B.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level1_C.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level2_A.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level2_B.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level2_C.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level3_A.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level3_B.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_level3_C.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_LevelFinished.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_NewGame.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_Sphinx_IN.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_Sphinx_IN2.pt3.hl.zx0 \
	asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3.hl.zx0

ENHANCEDPLUS_STATIC_DATAS=\
	asm\enhancedplus\mapper\rooms_original.asm \
	asm\enhancedplus\mapper\rooms.asm \
	asm\enhancedplus\test.afb

#
# phony targets
#

# default target (just the enhancedplus version)
default: rom\PyramidWarp.enhancedplus.rom

clean:
	$(REMOVE) rom\PyramidWarp.enhancedplus.rom $(ENHANCEDPLUS_DATAS)
	$(REMOVE) $(SYMS) tniasm.sym tniasm.tmp

cleanall:
	$(REMOVE) rom\PyramidWarp.original.rom
	$(REMOVE) rom\PyramidWarp.enhanced.rom $(ORIGINAL_DATAS) $(ENHANCED_DATAS)
	$(REMOVE) rom\PyramidWarp.enhancedplus.rom $(ENHANCEDPLUS_DATAS)
	$(REMOVE) $(SYMS) tniasm.sym tniasm.tmp

compileall: rom\PyramidWarp.original.rom rom\PyramidWarp.enhanced.rom rom\PyramidWarp.enhancedplus.rom

test: rom\PyramidWarp.enhancedplus.rom
	$(EMULATOR) $<

#
# main targets
#

rom\PyramidWarp.original.rom: asm\PyramidWarp.annotated.asm
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

rom\PyramidWarp.enhanced.rom: asm\PyramidWarp.enhanced.asm $(ORIGINAL_DATAS) $(ENHANCED_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

rom\PyramidWarp.enhancedplus.rom: asm\PyramidWarp.enhancedplus.asm asm\symbols.asm $(ENHANCEDPLUS_DATAS) $(ENHANCEDPLUS_STATIC_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "debug_" tniasm.sym | sort

asm\enhancedplus\init.bin: asm\enhancedplus\init.asm
	$(ASM) $< $@

asm\enhancedplus\sfx\PW_Dead2.pt3.hl \
asm\enhancedplus\sfx\PW_level1_A.pt3.hl \
asm\enhancedplus\sfx\PW_level1_B.pt3.hl \
asm\enhancedplus\sfx\PW_level1_C.pt3.hl \
asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3.hl \
asm\enhancedplus\sfx\PW_level2_A.pt3.hl \
asm\enhancedplus\sfx\PW_level2_B.pt3.hl \
asm\enhancedplus\sfx\PW_level2_C.pt3.hl \
asm\enhancedplus\sfx\PW_level3_A.pt3.hl \
asm\enhancedplus\sfx\PW_level3_B.pt3.hl \
asm\enhancedplus\sfx\PW_level3_C.pt3.hl \
asm\enhancedplus\sfx\PW_LevelFinished.pt3.hl \
asm\enhancedplus\sfx\PW_NewGame.pt3.hl \
asm\enhancedplus\sfx\PW_Sphinx_IN.pt3.hl \
asm\enhancedplus\sfx\PW_Sphinx_IN2.pt3.hl \
asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3.hl: \
		asm\enhancedplus\sfx\headerless.asm \
		asm\enhancedplus\sfx\PW_Dead2.pt3 \
		asm\enhancedplus\sfx\PW_level1_A.pt3 \
		asm\enhancedplus\sfx\PW_level1_B.pt3 \
		asm\enhancedplus\sfx\PW_level1_C.pt3 \
		asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3 \
		asm\enhancedplus\sfx\PW_level2_A.pt3 \
		asm\enhancedplus\sfx\PW_level2_B.pt3 \
		asm\enhancedplus\sfx\PW_level2_C.pt3 \
		asm\enhancedplus\sfx\PW_level3_A.pt3 \
		asm\enhancedplus\sfx\PW_level3_B.pt3 \
		asm\enhancedplus\sfx\PW_level3_C.pt3 \
		asm\enhancedplus\sfx\PW_LevelFinished.pt3 \
		asm\enhancedplus\sfx\PW_NewGame.pt3 \
		asm\enhancedplus\sfx\PW_Sphinx_IN.pt3 \
		asm\enhancedplus\sfx\PW_Sphinx_IN2.pt3 \
		asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3
	$(ASM) $<

#
# GFXs targets
#

asm\enhancedplus\charset.png.chr: \
		asm\enhancedplus\charset_font.png.chr \
		asm\enhancedplus\charset_ingame.png.chr \
		asm\enhancedplus\charset_extra.png.chr
	$(COPY) /b \
		asm\enhancedplus\charset_font.png.chr \
		+ asm\enhancedplus\charset_ingame.png.chr \
		+ asm\enhancedplus\charset_extra.png.chr \
		$@

asm\enhancedplus\charset.png.clr: \
		asm\enhancedplus\charset_font.png.clr \
		asm\enhancedplus\charset_ingame.png.clr \
		asm\enhancedplus\charset_extra.png.clr
	$(COPY) /b \
		asm\enhancedplus\charset_font.png.clr \
		+ asm\enhancedplus\charset_ingame.png.clr \
		+ asm\enhancedplus\charset_extra.png.clr \
		$@

%.png.chr %.png.clr: %.png
	$(PNG2MSX) -hl $<

%.png.spr: %.png
	$(PNG2SPR) $<

%.tmx.bin: %.tmx
	$(TMX2BIN) $< $@

#
# Packed targets
#

%.chr.zx0: %.chr
	$(REMOVE) $@
	$(ZX0) $<

%.clr.zx0: %.clr
	$(REMOVE) $@
	$(ZX0) $<

%.spr.zx0: %.spr
	$(REMOVE) $@
	$(ZX0) $<

%.hl.zx0: %.hl
	$(REMOVE) $@
	$(ZX0) $<

%.bin.zx0: %.bin
	$(REMOVE) $@
	$(ZX0) $<
