
#
# tools
#

ASM=tniasm
EMULATOR=cmd /c start
PCX2MSX=pcx2msx+
PNG2MSX=png2msx
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
	asm\original\charset.png.chr \
	asm\original\charset.png.clr \
	asm\original\font.png.chr \
	asm\original\font.png.clr \
	asm\original\sprites.pcx.spr

ENHANCED_DATAS=\
	asm\enhanced\charset.pcx.chr \
	asm\enhanced\charset.pcx.clr \
	asm\enhanced\charset_0.pcx.chr \
	asm\enhanced\charset_0.pcx.clr \
	asm\enhanced\font.pcx.chr \
	asm\enhanced\font.pcx.clr \
	asm\enhanced\charset.png.chr \
	asm\enhanced\charset.png.clr \
	asm\enhanced\charset_0.png.chr \
	asm\enhanced\charset_0.png.clr \
	asm\enhanced\font.png.chr \
	asm\enhanced\font.png.clr \
	asm\enhanced\sprites.pcx.spr \
	asm\enhanced\sprites4d.pcx.spr

ENHANCEDPLUS_DATAS=\
	asm\enhancedplus\charset.pcx.chr.zx7 \
	asm\enhancedplus\charset.pcx.clr.zx7 \
	asm\enhancedplus\charset.png.chr.zx7 \
	asm\enhancedplus\charset.png.clr.zx7 \
	asm\enhancedplus\sprites.pcx.spr.zx7 \
	asm\enhancedplus\screen_title.tmx.bin.zx7 \
	asm\enhancedplus\screen_ingame.tmx.bin.zx7 \
	asm\enhancedplus\init.bin.zx7 \
	asm\enhancedplus\sfx\PW_Dead2.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level1_A.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level1_B.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level1_C.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level2.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level2_A.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level2_B.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level2_C.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level3.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level3_A.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level3_all.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level3_B.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_level3_C.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_LevelFinished.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_NewGame.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_Sphinx_IN.pt3.hl.zx7 \
	asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3.hl.zx7

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

asm\enhancedplus\sfx\PW_Dead2.pt3.hl \
asm\enhancedplus\sfx\PW_level1_A.pt3.hl \
asm\enhancedplus\sfx\PW_level1_B.pt3.hl \
asm\enhancedplus\sfx\PW_level1_C.pt3.hl \
asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3.hl \
asm\enhancedplus\sfx\PW_level2.pt3.hl \
asm\enhancedplus\sfx\PW_level2_A.pt3.hl \
asm\enhancedplus\sfx\PW_level2_B.pt3.hl \
asm\enhancedplus\sfx\PW_level2_C.pt3.hl \
asm\enhancedplus\sfx\PW_level3.pt3.hl \
asm\enhancedplus\sfx\PW_level3_A.pt3.hl \
asm\enhancedplus\sfx\PW_level3_all.pt3.hl \
asm\enhancedplus\sfx\PW_level3_B.pt3.hl \
asm\enhancedplus\sfx\PW_level3_C.pt3.hl \
asm\enhancedplus\sfx\PW_LevelFinished.pt3.hl \
asm\enhancedplus\sfx\PW_NewGame.pt3.hl \
asm\enhancedplus\sfx\PW_Sphinx_IN.pt3.hl \
asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3.hl: \
		asm\enhancedplus\sfx\headerless.asm \
		asm\enhancedplus\sfx\PW_Dead2.pt3 \
		asm\enhancedplus\sfx\PW_level1_A.pt3 \
		asm\enhancedplus\sfx\PW_level1_B.pt3 \
		asm\enhancedplus\sfx\PW_level1_C.pt3 \
		asm\enhancedplus\sfx\PW_level1_ONLY_FIRST_TIME.pt3 \
		asm\enhancedplus\sfx\PW_level2.pt3 \
		asm\enhancedplus\sfx\PW_level2_A.pt3 \
		asm\enhancedplus\sfx\PW_level2_B.pt3 \
		asm\enhancedplus\sfx\PW_level2_C.pt3 \
		asm\enhancedplus\sfx\PW_level3.pt3 \
		asm\enhancedplus\sfx\PW_level3_A.pt3 \
		asm\enhancedplus\sfx\PW_level3_all.pt3 \
		asm\enhancedplus\sfx\PW_level3_B.pt3 \
		asm\enhancedplus\sfx\PW_level3_C.pt3 \
		asm\enhancedplus\sfx\PW_LevelFinished.pt3 \
		asm\enhancedplus\sfx\PW_NewGame.pt3 \
		asm\enhancedplus\sfx\PW_Sphinx_IN.pt3 \
		asm\enhancedplus\sfx\PW_Sphinx_OUT.pt3
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

asm\enhancedplus\charset.png.chr: \
		asm\enhancedplus\charset_font.png.chr \
		asm\enhancedplus\charset_ingame.png.chr \
		asm\enhancedplus\charset_extra.png.chr
	$(COPY) /b \
		asm\enhancedplus\charset_font.png.chr \
		+ asm\enhancedplus\charset_ingame.png.chr \
		+ asm\enhancedplus\charset_extra.png.chr \
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

asm\enhancedplus\charset.png.clr: \
		asm\enhancedplus\charset_font.png.clr \
		asm\enhancedplus\charset_ingame.png.clr \
		asm\enhancedplus\charset_extra.png.clr
	$(COPY) /b \
		asm\enhancedplus\charset_font.png.clr \
		+ asm\enhancedplus\charset_ingame.png.clr \
		+ asm\enhancedplus\charset_extra.png.clr \
		$@

%.pcx.chr %.pcx.clr: %.pcx
	$(PCX2MSX) -hl $<

%.png.chr %.png.clr: %.png
	$(PNG2MSX) -hl $<

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
