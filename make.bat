@echo off

REM
REM Assembles the optimized/enhanced remake
REM
bin\tniasm.exe "asm\PyramidWarp.optimized.asm" ".\optimized.rom"
findstr /b /i "debug_" tniasm.sym | sort
del tniasm.sym tniasm.tmp

if "%1" == "test" start .\optimized.rom
