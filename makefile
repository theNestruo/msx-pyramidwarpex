
#
# tools
#

ASM=tniasm
EMULATOR=cmd /c start
PCX2MSX=pcx2msx+
PCX2SPR=pcx2spr
TMX2BIN=tmx2bin

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
	asm\enhancedplus\charset.pcx.chr \
	asm\enhancedplus\charset.pcx.clr \
	asm\enhancedplus\font.pcx.chr \
	asm\enhancedplus\font.pcx.clr \
	asm\enhancedplus\sprites.pcx.spr

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
	cmd /c findstr /b /i "dbg_" tniasm.sym | sort

enhanced.rom: asm\PyramidWarp.enhanced.asm $(ORIGINAL_DATAS) $(ENHANCED_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "dbg_" tniasm.sym | sort

enhancedplus.rom: asm\PyramidWarp.enhancedplus.asm $(ENHANCEDPLUS_DATAS)
	$(ASM) $< $@
	cmd /c findstr /b /i "dbg_" tniasm.sym | sort

#
# GFXs targets
#

%.pcx.chr %.pcx.clr: %.pcx
	$(PCX2MSX) -hl $<

%.pcx.spr: %.pcx
	$(PCX2SPR) $<
