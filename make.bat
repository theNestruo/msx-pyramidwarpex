@echo off


REM
REM Re-builds the original graphic data
REM

if not "%1" == "original-data" goto no_original_data
shift

bin\pcx2msx "asm\original.font.pcx" -hl -v
bin\pcx2msx "asm\original.charset.pcx" -v
bin\pcx2spr "asm\original.sprites.pcx" -v

:no_original_data


REM
REM Assembles the optimized/enhanced remake
REM

bin\tniasm.exe "asm\PyramidWarp.optimized.asm" ".\optimized.rom"
findstr /b /i "debug_" tniasm.sym | sort
del tniasm.sym tniasm.tmp

REM
REM Tests the result
REM

if "%1" == "test" start .\optimized.rom
