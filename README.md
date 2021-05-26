# msx-pyramidwarpex

Disassembly, reverse engineering, and possible enhancement of the MSX game cartridge "Pyramid Warp (1983)"

## Versions:

* `PyramidWarp.annotated.asm`:
	* The annotated disassembly of Pyramid Warp (1983).
	* Assembles to the original ROM, verbatim.

* `PyramidWarp.enhanced.asm`:
	* The original source code, once disassembled, was easy to understand and easy to improve because it used no compression, did no clever tricks, and underused some resources (e.g.: the game looked like SCREEN 1 despite being SCREEN2 already).
	* This is a patcheable version of the original source code that allows several of those enhancements.
	* This version keeps most of the original source code untouched and, actually, a pixel-perfect clone of the original game can be assembled from this!

* `PyramidWarp.enhanced+.asm`:
	* This version break ties with the original source code wherever necessary to accomodate not-so-easy-to-fit enhancements (such as a proper music replayer or a sprite flickering routine)

## Enhancements

### Original enhancements by theNestruo

* Moved RAM start from $C000 to $E000 (RAM requirement is now 8KB)
* Unused data removed. Data realigned to simplify routines and to free space (+512 bytes freed)
* Disabled keyboard click sound
* Player starts looking down instead of up (simply because it looks better)
* Numbers in scoreboard aligned right to improve readability
* Patcheable colors (symbolic constants in assembly code)
* Patcheable graphics (external binaries for font, charset and sprites)
* Patcheable room definitions (external assembly code)
* 5th and 6th enemy slots can be enabled

### Additional enhancements by Nenefranz

* Completely new graphic set
* Enemies can look in 4 directions
* Enemies sprites can be replaced by player sprites
* A floor tile can be used instead of transparent character
* Numbers in scoreboard in a different color (to improve readability)
* Fixes the first draw of the playground

### Additional enhancements

* Sprite flickering routine
* Proper title charset
* Proper music and sounds! (by Bitcaffe)
* More randomness! Rooms can be mirrored and flipped
* More room definitions! (room editor by Nenefranz)
* Difficulty option! Choose between: easier (3 enemies), original (4 enemies), enhanced (progressive and adaptative number of enemies), and harder (6 enemies).

## Credits

* Original game &copy; 1983 by T&E SOFT
* Enhanced versions by Bitcaffe, Nenefranz, and theNestruo

### External libraries

* [ayFX Replayer v1.31](http://www.z80st.es/downloads/code/) by SapphiRe
* [PT3 Replayer](http://www.z80st.es/downloads/code/) by Dioniso, MSX-KUN (ROM version), SapphiRe (asMSX version)
* [ZX0](https://github.com/einar-saukas/ZX0) by Einar Saukas

### External tools

* [PCXTOOLS v2.2](https://github.com/theNestruo/pcxtools) coded by theNestruo
* [tniASM v0.45](http://tniasm.tni.nl/) is written by Patriek Lesparre, &copy; 2000-2013 by The New Image
* [Tiled](http://www.mapeditor.org/) &copy; 2008-2020 Thorbjørn Lindeijer
* [ZX0](https://github.com/einar-saukas/ZX0) by Einar Saukas