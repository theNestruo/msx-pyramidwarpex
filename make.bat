@echo off

:parse
if "%1" == "original" goto regenerate_original_data
if "%1" == "enhanced" goto regenerate_enhanced_data
if "%1" == "plus" goto regenerate_enhancedplus_data
if "%1" == "enhancedplus" goto regenerate_enhancedplus_data
goto assemble


REM
REM Re-generates the original graphic data
REM
:regenerate_original_data
pcx2msx.exe -v asm\original\font.pcx -hl
pcx2msx.exe -v asm\original\charset.pcx
pcx2spr.exe -v asm\original\sprites.pcx
shift
goto parse


REM
REM Re-generates the enhanced graphic data
REM
:regenerate_enhanced_data
pcx2msx.exe -v asm\enhanced\font.pcx -hl
pcx2msx.exe -v asm\enhanced\charset.pcx
pcx2msx.exe -v asm\enhanced\charset_0.pcx
pcx2spr.exe -v asm\enhanced\sprites.pcx
pcx2spr.exe -v asm\enhanced\sprites4d.pcx
shift
goto parse


REM
REM Re-generates the enhanced+ graphic data
REM
:regenerate_enhancedplus_data
pcx2msx.exe -v asm\enhanced+\font.pcx -hl
pcx2msx.exe -v asm\enhanced+\charset.pcx
pcx2spr.exe -v asm\enhanced+\sprites.pcx
shift
goto parse


REM
REM Assembles the enhanced and the enhanced+ remake
REM
:assemble
tniasm.exe "asm\PyramidWarp.enhanced.asm" ".\enhanced.rom"
findstr /b /i "debug_" tniasm.sym | sort
rem del tniasm.sym tniasm.tmp

tniasm.exe "asm\PyramidWarp.enhanced+.asm" ".\enhanced+.rom"
findstr /b /i "debug_" tniasm.sym | sort
rem del tniasm.sym tniasm.tmp


REM
REM Tests the result
REM
:test
if "%1" == "test" start .\enhanced.rom
if "%1" == "testplus" start .\enhanced+.rom
