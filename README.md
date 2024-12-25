# HTL Rennweg Diplomarbeits Vorlage

> [!IMPORTANT]  
> If you are not a student of HTL Rennweg, this template will be of little use to you.

Dieses Template dient als Vorlage für ein Diplomarbeitsbuch an der HTL Rennweg
und orientiert sich am LaTeX-Template mit Stand 2024/25.

## Template adaptation checklist

- [ ] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [X] Check and/or replace `LICENSE` by something that suits your needs
- [X] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [X] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [ ] check the values under `env:`, particularly `REGISTRY_REPO`
    - [ ] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`
    - [ ] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README
- [ ] OXIpng komprimieren

## ToDo
- [ ] Tests aus dem gitignore nehmen und CI enablen
- [X] Figure Umbruch fixen
- [ ] Autor für L2 Headings

## Setup

To adhere to the official style of the book, all template options should be set according to the following template.

```typ
#import "@preview/htl3r-da:0.1.0" as htl3r

#show: htl3r.diplomarbeit.with(
  title: "Mein DA-Titel",
  subtitle: "mit kreativem Untertitel",
  department: "ITN", // kann eine Auswahl sein aus: ITN, ITM, M
  school_year: "2024/2025",
  authors: (
    (name: "Max Mustermann", supervisor: "Peter Professor"),
    (name: "Andreas Arbeiter", supervisor: "Bernd Betreuer"),
    (name: "Theodor Template", supervisor: "Bernd Betreuer"),
  ),
  abstract_german: [#include "text/kurzfassung.typ"],
  abstract_english: [#include "text/abstract.typ"],
  supervisor_incl_ac_degree: (
    "Prof, Dipl.-Ing. Peter Professor",
    "Prof, Dipl.-Ing. Bernd Betreuer",
  ),
  sponsors: (
    "Scherzartikel GmbH",
    "Ottfried OT-Handels GmbH",
  ),
  date: datetime.today(),
  print_ref: true,
  generative_ai_clause: none,
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
