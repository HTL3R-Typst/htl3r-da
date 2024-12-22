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

#include "chapter/example.typ"
