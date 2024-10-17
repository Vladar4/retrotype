Retrotype
=========

Retrotype aims to replicate the look of old typewriter-made documents while keeping as many benefits of LaTeX as possible.

|                                                              |                                                                     |
| :-:                                                          | :-:                                                                 |
| ![cover](https://i.postimg.cc/XYgtGGPD/retrotype02cover.jpg) | ![demonstration](https://i.postimg.cc/QMxwpNGN/retrotype02demo.jpg) |
|                                                              |                                                                     |

Usage
-----

Consult the `retrotype-guide.tex` document for the list of available commands and practical examples of their usage. The compiled PDF version of `retrotype-guide` is available in [Releases](https://github.com/Vladar4/retrotype/releases).

Changelog
---------

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

