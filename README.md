# msx-pyramidwarpex
Disassembly, reverse engineering, and possible enhancement of the MSX game cartridge "Pyramid Warp (1983)"

## Enhancements

* Moved RAM start from $C000 to $E000 (RAM requirement is now 8KB)
* Unused data removed. Data realigned to simplify routines and to free space (+512 bytes freed)
* Disabled keyboard click sound
* Player starts looking down instead of up (simply because it looks better)
* Numbers in scoreboard aligned right to improve readability
* Patcheable colors (symbolic constants in assembly code)
* Patcheable graphics (external binaries for font, charset and sprites)
* Patcheable room definitions (external assembly code)
