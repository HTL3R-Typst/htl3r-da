#import "@preview/htl3r-da:0.1.0" as htl3r

#show: htl3r.diplomarbeit.with(
  abbreviation: yaml("abbr.yml"),
  bibliography: bibliography("refs.yml", full: true, title: [Literaturverzeichnis], style: "harvard-cite-them-right"),
)

#include "chapter/example.typ"
