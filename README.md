# msx-pyramidwarpex

Disassembly, reverse engineering, and possible enhancement of the MSX game cartridge "Pyramid Warp (1983)"

## Original enhancements by theNestruo

* Moved RAM start from $C000 to $E000 (RAM requirement is now 8KB)
* Unused data removed. Data realigned to simplify routines and to free space (+512 bytes freed)
* Disabled keyboard click sound
* Player starts looking down instead of up (simply because it looks better)
* Numbers in scoreboard aligned right to improve readability
* Patcheable colors (symbolic constants in assembly code)
* Patcheable graphics (external binaries for font, charset and sprites)
* Patcheable room definitions (external assembly code)
* 5th and 6th enemy slots can be enabled

## Additional enhancements by Nenefranz

* Completely new graphic set
* Enemies can look in 4 directions
* Enemies sprites can be replaced by player sprites
* A floor tile can be used instead of transparent character
* Numbers in scoreboard in a different color (to improve readability)
* Fixes the first draw of the playground

## Future enhancements

* Proper music and sounds
* More room definitions! More randomness!
* Sprite flickering routine
* (bug) Improve the old "use 3D charset" enhancement to be compatible with "floor tile" enhancement (and with the new graphic set)
