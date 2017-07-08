@echo off

:parse
if "%1" == "original" goto regenerate_original_data
if "%1" == "enhanced" goto regenerate_enhanced_data
goto assemble


REM
REM Re-generates the original graphic data
REM
:regenerate_original_data
bin\pcx2msx.exe -v asm\original\font.pcx -hl 
bin\pcx2msx.exe -v asm\original\charset.pcx
bin\pcx2spr.exe -v asm\original\sprites.pcx
shift
goto parse


REM
REM Re-generates the enhanced graphic data
REM
:regenerate_enhanced_data
bin\pcx2msx.exe -v asm\enhanced\font.pcx -hl 
bin\pcx2msx.exe -v asm\enhanced\charset.pcx
bin\pcx2spr.exe -v asm\enhanced\sprites.pcx
shift
goto parse


REM
REM Assembles the enhanced remake
REM
:assemble
bin\tniasm.exe "asm\PyramidWarp.enhanced.asm" ".\enhanced.rom"
findstr /b /i "debug_" tniasm.sym | sort
del tniasm.sym tniasm.tmp


REM
REM Tests the result
REM
:test
if "%1" == "test" start .\enhanced.rom
