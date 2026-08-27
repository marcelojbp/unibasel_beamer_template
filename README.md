# University of Basel Beamer Template

A **Beamer template** for University of Basel talks: seminars, conference
presentations and defences.

The theme is opinionated where it matters. A physics talk is sparse text, one
idea per slide, an equation or a figure as the anchor, and a literature
reference in the corner — so the template gives you those and gets out of the
way. No navigation bars, no accent stripes, no logo competing with the frame
title. Basel red is reserved for emphasis and is never used as decoration.

---

## Features

### University of Basel branding

* Official **Uni Basel logo** (black / white variants, switched with the theme)
* Complete **Uni Basel palette** in `unibaselcolor.sty`, with semantic aliases
  (`unibasData`, `unibasModel`) so slides, poster and paper agree on colour
* **Caladea + Carlito** (metric-compatible Cambria / Calibri clones): serif for
  headings, sans for body, mirroring the corporate Georgia + Arial pairing

### Theme variants

```tex
\themecolor{white} % or mint, red
```

* **white** — the working theme for content slides
* **mint** — dividers, outline slides, the closing slide
* **red** — a full-bleed impact variant, used sparingly

### Slide layouts

* 16:9 by default (`\documentclass[aspectratio=43]{unibaselbeamer}` to override)
* Corporate **title slide**: mint band, title inside it, funder logos below
* Frame title flush with the body margin, with an optional subtitle naming the
  sub-topic
* Footline: motto on the left, frame number on the right
* `chapter` — full-colour divider with an image clipped into a wedge
* `sidepic` — text on the left, an image bleeding off the right edge
* `\sectionslide[subtitle]{Name}` — a divider carrying only the section name

### House-style build helpers

Three devices mark what is new on a slide, and nothing else:

```tex
\term{\bm{B}_m\cdot\bm{S}}          % red rule under the term being discussed
\keybox[0.6\linewidth]{statement}   % thin red frame around what just landed
\ghost{not yet in play}             % greyed out
\reveal<3>{revealed on overlay 3}   % greyed out until overlay 3
```

### References

Two ways, both bottom-left and small:

```tex
\slidecite{N.~G.~Nguyen et al.\ \emph{Enhanced Electron-Spin Coherence in a
  GaAs Quantum Emitter}, Phys.\ Rev.\ Lett.\ \textbf{131}, 210805 (2023)}

Some important result.\footfullcite{nguyen2023enhanced}
```

`\slidecite` is free-form and needs no bibliography. `\footfullcite` uses
`biblatex` + `biber` with APS-like formatting (`style=phys`), set up in
`customize.tex`. Put `\footfullcite` outside a `columns` environment: inside
one, the footnote is set at the foot of the column instead of the slide.

### Backup slides

```tex
\backmatter[Soon on arXiv]   % "Thanks! Questions?"

\backupbegin
  ... backup frames ...
\backupend                   % restores the frame count
```

---

## File structure

```
.
├── main.tex                 % Example presentation (entry point)
├── customize.tex            % Bibliography, structure slides, helper macros
├── unibaselbeamer.cls       % Thin wrapper class
├── beamerthemeunibasel.sty  % The theme
├── unibaselcolor.sty        % Uni Basel palette
├── refs.bib                 % Example bibliography
├── images/
│   ├── unibas_logo_black.png
│   ├── unibas_logo_white.png
│   ├── SNSF_logo.pdf
│   ├── background.png       % demo image for chapter / sidepic
│   └── default.jpg          % demo image for \titlebackground
└── README.md
```

---

## Usage

Copy the repository into your project directory and compile with
`pdflatex` + `biber`:

```bash
latexmk -pdf main.tex
```

or, by hand:

```bash
pdflatex main && biber main && pdflatex main && pdflatex main
```

`biber` is only needed if you use `\footfullcite` / `\bibliographypage`.

---

## Customisation

* **Footline** — `\footlinecolor{}` for the default subtle footline, or
  `\footlinecolor{unibasPetrol}` for a coloured band (blocks follow suit)
* **Logo on content slides** — off by default; `\slidelogo{on}` puts a small
  mark in the top right corner
* **Motto** — `\UNIBASELmotto{Department of Physics}`
* **Title background** — `\titlebackground{images/default.jpg}` for a
  full-bleed image, `\titlebackground*{...}` for the split variant; either one
  replaces the mint band
* **Fonts** — set in the theme. Do **not** load `lmodern` or another font
  package from `customize.tex`: it silently overrides the Caladea/Carlito
  pairing.

---

## Credits

Adapted from the
[Harbin Institute of Technology (HIT) Beamer theme](https://www.overleaf.com/latex/templates/harbin-institute-of-technology-hit-beamer-presentation-theme/prwxqwfdzkqj),
which in turn builds on the SINTEF Beamer theme by *Federico Zenith*. The
structural foundation (chapter / sidepic ideas, wrapper class) comes from
there; branding, typography, palette, build helpers and citation handling are
specific to this template.

## License

See `LICENSE`, and check the upstream template before redistributing.
