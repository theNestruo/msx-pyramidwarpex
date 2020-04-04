@echo off

REM
REM Reassembles the annotated disassembly
REM
tniasm.exe "asm\PyramidWarp.annotated.asm" ".\annotated.rom"
fc /b "rom\PyramidWarp.rom" ".\annotated.rom"
del tniasm.sym tniasm.tmp
