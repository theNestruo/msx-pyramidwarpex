@echo off

REM
REM Disassembles "Pyramid Warp (1983) (T&E Soft) (J).rom"
REM MD5: 6b 9f 3f 0c 3a 6d 1d 6a bd 3d 4a 45 89 cc dd 1f
REM
yazd.exe "rom\PyramidWarp.rom" "rom\PyramidWarp.asm" @"rom\PyramidWarp.yazd"

REM
REM Tests the disassembly
REM
tniasm.exe "rom\PyramidWarp.asm" ".\disassembly.rom"
fc /b "rom\PyramidWarp.rom" ".\disassembly.rom"
del tniasm.sym tniasm.tmp ".\disassembly.rom"
