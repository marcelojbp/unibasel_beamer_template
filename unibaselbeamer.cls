% Uni Basel Beamer wrapper class (thin wrapper around the theme).
% Based on the SINTEF beamer wrapper class.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unibaselbeamer}[2026/08/27 Uni Basel Beamer wrapper class]

% 16:9 is the house format; pass e.g. \documentclass[aspectratio=43]{unibaselbeamer}
% to override, or any other beamer option (handout, notes, ...).
\PassOptionsToClass{aspectratio=169}{beamer}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\LoadClass{beamer}

\usetheme{unibasel}
