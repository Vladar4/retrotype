# Retrotype Manual

## The Objective

Retrotype aims to replicate the look of old typewriter-made documents while keeping as many benefits of LaTeX as possible.

## The Implementation

The most important part of achieving the objective is an appropriate font. [TT2020 font](https://copypaste.wtf/TT2020/) fits the goal perfectly and has 10 variants of each glyph to imitate the natural randomness of a real typewriter. The default font family is also set to monospace.

To use this custom font, [XeTeX](https://xetex.sourceforge.net/) is required due to its [fonspec](https://ctan.org/pkg/fontspec) capabilities. If you use [TeXstudio](https://www.texstudio.org/), you just need to have these lines at the start of your project:

```tex
% !TeX program = xelatex
\documentclass[english,12pt,openany,letterpaper]\{book\}
\usepackage{babel}
\usepackage{retrotype}
```

## Roadmap

* v0.1 — initial public testing release;
* v0.3 — current release;
* improving existing features and adding new ones if needed;
* v0.9 — all features complete, debugging and testing;
* v1.0 — release.


## Links

* <https://github.com/Vladar4/retrotype> — project's GitHub page;
* <https://vladar.bearblog.dev> — author's blog.

### Resources used
* <https://copypaste.wtf/TT2020/> — TT2020 typewriter font ([OFL](https://openfontlicense.org/));
* <https://textkool.com/en/ascii-art-generator?font=Big&text=Retrotype> — title text art;
* <https://www.asciiart.eu/mythology/dragons> — dragon cover art;
* <https://www.publicdomainpictures.net/en/view-image.php?image=166303> — typewriter image;
* <https://lostandtaken.com/> — paper textures;
* <https://archive.org/details/Artyping> — "Artyping" book by Julius Nelson.

## Page Layouts

While you can set up any custom layouts using the `\newgeometry` command (see the geometry package), the following setups were fine-tuned:
* Letter paper (8.5 x 11 in)
  * 10pt font — 86 characters per line, 51 lines per page
  * 11pt font — 80 characters per line, 45 lines per page
  * 12pt font — 72 characters per line, 42 lines per page
* Legal paper (8.5 x 14 in)
  * 10pt font — 86 characters per line, 65 lines per page
  * 80pt font — 80 characters per line, 58 lines per page
  * 12pt font — 72 characters per line, 54 lines per page
* Executive paper (7.25 x 10.5 in)
  * 10pt font — 74 characters per line, 49 lines per page
  * 11pt font — 68 characters per line, 43 lines per page
  * 12pt font — 60 characters per line, 40 lines per page
* A4 paper (210 x 297 mm)
  * 10pt font — 84 characters per line, 55 lines per page
  * 11pt font — 76 characters per line, 48 lines per page
  * 12pt font — 70 characters per line, 45 lines per page
* A5 paper (148 x 210 mm)
  * 10pt font — 59 characters per line, 38 lines per page
  * 11pt font — 54 characters per line, 34 lines per page
  * 12pt font — 49 characters per line, 32 lines per page

## Package Reference

### New Lengths

* `\charwidth` — character width.
* `\docfontsize` — document font size dimension.
* `\docfontsizeInt` — returns document font size.
* `\tabwidth` — width of a tab (see Tabs below). Changed automatically through the `\setTabPositions` call.

### New Symbols
* `\dash` — dash (&emdash;).
* `\odash` — overline dash (&oline;).
* `\tld` — tilde (~).
* `\bs` — backslash (\).
* `\thelinechar` — the default line character (`\dash` by default).

### Pages
* `\pagelayout` — document page layout (Letter, Legal, Executive, A4, A5, undefined).
* `\defaultGeometry` — reset to page geometry. Called automatically.
* `\cpl` — characters per line.
* `\lpp` — lines per page.
* `\cleartoleftpage` — clear to left (even) page (new spread).
* `\cleartorightpage` — clear to right (odd) page.

### Tabs
* `\tab` — go to the next tab in the current line.
* `\tabn{n}` — skip to the **n**-th tab, counting from the current position.
* `\tabspace` — inserts horizontal space equal to the current `\tabwidth`.
* `\tabchars` — tab distance in characters (4). Changed automatically through the `\setTabPositions` call.
* `\tabcharsDefault` — the default tab distance in characters (4), used in `\defaultTabPositions` call.
* `\defaultTabPositions` — reset `\TabPositions` to the default ones.
* `\setTabPositions{n}` — changes distance between tab stops to **n** characters wide. Also updates `\tabchars` and `\tabwidth` accordingly.
* `\setCustomTabPositions{list}` — takes a list of comma-separated distances in `\charwidth` amounts to use as tab stops. Does <u>**NOT**</u> update `\tabchars` and `\tabwidth` since the tabs can be distanced unequally.

### Repeats and Lines
* `\rep{chars}{n}` — repeat the **chars** **n** times.
* `\linechars[chars]{n}` — make a line by repeating the **chars** **n** times (chars = `\thelinechar` by default).
* `\linecharw[chars]{width}` — repeat the **chars** for the given **width** (chars = `\thelinechar` by default).
* `\linefill[chars]` — fill the whole line with **chars** (chars = `\thelinechar` by default).
* `\linegoal` — the length of the remainder of the line (see the [linegoal](https://www.ctan.org/pkg/linegoal) package).
* `\strfit{chars}` — return int number of how many times the **chars** will fit
into the remaining space on the line.

### Stackengine
Retrotype uses some capabilities of the [stackengine](https://www.ctan.org/pkg/stackengine) package to simulate the overprinting of one character on top of another — a typewriting
technique for creating new characters and graphic design elements.
* `\overprint{a}{chars}` — same as
* `\op{a}{chars}` — overprint **a** on top of all **chars**.
* `\overprintw[width]{a}` — same as
* `\opw[width]{a}` — overprint **a** for the given **width** on the line, but keep printing from the starting point (**width** = `\linegoal` by default).
* `\overprintn[n]{a}` — same as
* `\opn[n]{a}` — overprint **a** for **n** times, but keep printing from the starting point (**n** = `\cpl` by default).

* `\underline{chars}` — same as
* `\ul{chars}` — underline given **chars**.
* `\underlinefill` — same as
* `\ulf` — underline the rest of the line, but keep printing from the starting point.
* `\underlinen[n]` — same as
* `\uln[n]` — underline **n** chars, but keep printing from the starting point (**n** = `\cpl` by default).

* `\overline{chars}` — same as
* `\ol{chars}` — overline given **chars**.
* `\overlinefill` — same as
* `\olf` — overline the rest of the line, but keep printing from the starting point.
* `\overlinen[n]` — same as
* `\oln[n]` — overline **n** chars, but keep printing from the starting point (**n** = `\cpl` by default).

* `\strikeout{chars}` — same as
* `\so{chars}` — strikeout given **chars**.
* `\strikeoutfill` — same as
* `\sof` — strikeout the rest of the line, but keep printing from the starting point.
* `\strikeoutn[n]` — same as
* `\son[n]` — strikeout **n** chars, but keep printing from the starting point (**n** = `\cpl` by default).

### Formatting
* `\skipline[height]` — insert a vertical space (`\baselineskip` by default).

* `\mirrorh{text}` — mirror text horizontally.
* `\mirrorv{text}` — mirror text vertically.
* `\mirrorboth{text}` — mirror text horizontally and vertically.

* `\rightbox[height]{text}` — a right-aligned line of text raised by `\baselineskip + height`. The default height is `\parskip` to put the text on a `\paragraph{}` line above.

* `\tabpar[l][r]{text}` — a single paragraph indented from the left and right by **l** and **r** characters (**l** = `\tabchars` (4), **r** = `0` by default).
* `{tabbox}[l][r]` environment — text indented from the left and right by **l** and **r** characters respectively (**l** = `\tabchars` (4) and **r** = `0` by default).
* `{tabbox}*[l][r]` version switches the values between odd and even pages.

* `\header[format]{text}[chars]` — **text** with **chars** filling the line (**chars** = `\_`, **format** = `\bfseries` by default). Not a sectioning element.
* `\uheader[format]{text}[chars]` — same as `\header`, with **text** underlined.
* `{headerbox}[format]{header}[top][bottom]` environment — text box with a **header**, surrounded by top and bottom lines (**top** = `\_` and **bottom** = `\odash` by default).
* `{uheaderbox}[format]{header}[top][bottom]` environment — same as `{headerbox}`, with **header** underlined.

* `{textbox}[top][bottom]` environment — text box surrounded by top and bottom lines (**top** = `\_` and **bottom** = `\odash` by default).

### Tables

Additions to the tabularray's tblr environment. See the [tabularray](https://ctan.org/pkg/tabularray) package documentation for full details.

```tex
\begin{tblr}{
width = \linewidth,
colspec = {I X{l} I X{l} I},
}
...
\end{tblr}
```

#### Column separators
* `I` — default column separator shortcut: `\NewTblrColumnType{I}{!{|}}`.
* `!{chars}` — custom separator that <u>inserts</u> into inter-column space (`\colsep = \charwidth` by default).
* `@{chars}` — custom separator that <u>replaces</u> inter-column space.

#### New commands
* `\rthline[chars]` — hline filled by repeating **chars**.
* `\rtcline[chars]{a-b}` — cline in **a-b** column range filled by repeating **chars**.

### Table of Contents
To make your table of contents two-column, use this package: `\usepackage[toc]{multitoc}`.
* `\toc[n]` — print table of contents to the **n**-th depth.

### Titles
* `\chapterx` — unnumbered chapter with a TOC entry.
* `\largetitles` — set varying font sizes for the titles (the default).
* `\smalltitles` — set all titles' font size to `\normalsize`.

#### Title Spacing
Current skip lengths before and after each sectioning level are available through `\b<title>skip` and `\a<title>skip` macros:
| Before            | After             |
| :-                | :-                |
| `\bchapskip`      | `\achapskip`      |
| `\bsecskip`       | `\asecskip`       |
| `\bsubsecskip`    | `\asubsecskip`    |
| `\bsubsubsecskip` | `\asubsubsecskip` |
| `\bparskip`       | `\aparskip`       |
| `\bsubparskip`    | `\asubparskip`    |

### Verbatim
* `\VerbatimInput{file}`, `\BVerbatimInput{file}`, `\LVerbatimInput{file}` — include text file verbatim (normal, TeX box, LR mode).
* `{Verbatim}`, `{BVerbatim}`, `{LVerbatim}` — verbatim text environments.
* `\renewcommand{\FancyVerbFormatLine}[1]{#1}` — execute arbitrary code for each line of verbatim text.
* `\fvset{options}` — set comma-separated verbatim text options.

All commands of the [fancyvrb](https://www.ctan.org/pkg/fancyvrb) package are also available by default.

### Background and Foreground
* `\addBg{code}` — add code to the background picture.
* `\addFg{code}` — add code to the foreground picture.
* `\clearBg` — clear the background picture.
* `\clearFg` — clear the foreground picture.

#### Commands
* `\pageFill[opacity][blend]{color}` — fill the page with the given color:
  * **opacity** — color opacity (`1.0` by default);
  * **blend** — color blend mode (`normal` by default);
  * **color** — color to fill the page with.
* `\pageCenter[opacity][blend]{file}[scale]` — image centered on the page:
  * **opacity** — image opacity (`1.0` by default);
  * **blend** — image blend mode (`normal` by default);
  * **file** — image file name;
  * **scale** — image scale (`1.0` by default).
* `\pageStretch[opacity][blend]{file}[ratio]` — image stretched over the page:
  * **opacity** — image opacity (`1.0` by default);
  * **blend** — image blend mode (`normal` by default);
  * **file** — image file name;
  * **ratio** — keep aspect ratio (default = `1`, make `0` to ignore).
* `\pageTiles[opacity][blend]{file}[scale]` — tile the image over the page:
  * `opacity` — image opacity (`1.0` by default);
  * `blend` — image blend mode (`normal` by default);
  * `file` — image file name;
  * `scale` — image scale (`1.0` by default).

#### Blend modes
1. normal
2. multiply
3. screen
4. overlay
5. darken
6. lighten
7. color dodge
8. color burn
9. hard light
10. soft light
11. difference
12. exclusion
13. hue
14. saturation
15. color
16. luminosity

