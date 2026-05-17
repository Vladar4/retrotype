Retrotype
=========

Retrotype aims to replicate the look of old typewriter-made documents while keeping as many benefits of LaTeX as possible.

|                                                   |                                                                     |
| :-:                                               | :-:                                                                 |
| ![cover](https://i.postimg.cc/3JpbB2J3/cover.jpg) | ![demonstration](https://i.postimg.cc/QMxwpNGN/retrotype02demo.jpg) |
|                                                   |                                                                     |


Usage
-----

Consult the `retrotype-guide.tex` document or the [manual](MANUAL.md) for the list of available commands and practical examples of their usage. The compiled PDF version of `retrotype-guide` is available in [Releases](https://github.com/Vladar4/retrotype/releases).

To build the retrotype-guide PDF using the provided scripts (`make.sh` for Linux, `make.bat` for Windows) you must have [TeX Live](https://tug.org/texlive/) and [Ghostscript](https://www.ghostscript.com/) installed.

Showcase
--------
* The Forbidden Temple of Pflarr [GitHub](https://github.com/Vladar4/the-forbidden-temple-of-pflarr), [itch.io](https://vladar.itch.io/the-forbidden-temple-of-pflarr), [blog](https://vladar.bearblog.dev/the-forbidden-temple-of-pflarr/)


Changelog
---------

### v0.3 (2026-05-05)
* Added [MANUAL.md](MANUAL.md)
* Added some missing documentation to the retrotype-guide document
* Added batch scripts for Windows builds
* Changes:
  * tables (`tblr` environment):
    * `I` default column separator shortcut
    * `\rthline`, `\rtcline` horizontal lines for the `tblr` environment
  * `\header`, `\uheader` now discourage pagebreaks immediately after them.

### v0.2 (2024-10-17)
* New commands:
  * `\cleartorightpage`
  * different heading styles:
    * `\largetitles`
    * `\smalltitles`
  * tabulation:
    * `\setTabPositions`
    * `\setCustomTabPositions`
    * `\defaultTabPositions`
  * text mirroring:
    * `\mirrorh`
    * `\mirrorv`
    * `\mirrorboth`
  * additional stackengine commands:
    * `\overprintw`, `\opw`
    * `\underlinefill`, `\ulf`
    * `\overlinefill`, `\olf`
    * `\strikeoutfill`, `\sof`
* New variables:
    * title skip variables (__b__efore and __a__fter title skips):
      * `\bchapskip`, `\achapskip`
      * `\bsecskip`, `\asecskip`
      * `\bsubsecskip`, `\asubsecskip`
      * `\bsubsubsecskip`, `\asubsubsecskip`
      * `\bparskip`, `\aparskip`
      * `\bsubparskip`, `\asubparskip`
    * `\tabcharsDefault`
* New texture: `paper`
* Replaced `listings` with the `fancyvrb` package for handling verbatim text
* Fixed stackengine bugs in overprint commands
* `\linegoal` fix for the second column in `twocolumn` documents
* Fixed `\tabn` bug
* Fixed `\linecharw` insufficient length calculation bug
* License changed to LPPL

### v0.1 (2024-06-14)
Initial public testing release.

