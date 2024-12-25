# HTL Rennweg Diplomarbeits Vorlage

> [!IMPORTANT]
> If you are not a student of HTL Rennweg, this template will be of little use to you.

Dieses Template dient als Vorlage für ein Diplomarbeitsbuch an der HTL Rennweg
und orientiert sich am LaTeX-Template mit Stand 2024/25.

## Setup

To adhere to the official style of the book, all template options should be set according to the following template.

```typ
#import "@preview/htl3r-da:0.1.0" as htl3r

#show: htl3r.diplomarbeit.with(
  title: "Mein DA-Titel",
  subtitle: "mit kreativem Untertitel",
  department: "ITN", // kann eine Auswahl sein aus: ITN, ITM, M
  school-year: "2024/2025",
  authors: (
    (name: "Max Mustermann", supervisor: "Peter Professor"),
    (name: "Andreas Arbeiter", supervisor: "Bernd Betreuer"),
    (name: "Theodor Template", supervisor: "Bernd Betreuer"),
  ),
  abstract-german: [#include "text/kurzfassung.typ"],
  abstract-english: [#include "text/abstract.typ"],
  supervisor-incl-ac-degree: (
    "Prof, Dipl.-Ing. Peter Professor",
    "Prof, Dipl.-Ing. Bernd Betreuer",
  ),
  sponsors: (
    "Scherzartikel GmbH",
    "Ottfried OT-Handels GmbH",
  ),
  date: datetime.today(),
  print-ref: true,
  generative-ai-clause: none,
  abbreviation: yaml("abbr.yml"),
  bibliography: bibliography(
    "refs.yml",
    full: true,
    title: [Literaturverzeichnis],
    style: "harvard-cite-them-right",
  ),
)
```

## Template functions
For an overview of the function see the [manual](docs/manual.pdf).

## Installation (for devs)

The Justfile provides useful developement tasks.

The basic setup is as follows:

```
$ git clone https://github.com/HTL3R-Typst/htl3r-da
$ just install-preview # to install into the "preview" namespace
```

Now you are able to compile documents using the template system-wide.
