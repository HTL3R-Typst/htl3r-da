#import "@preview/htl3r-da:0.1.0" as htl3r

= Einführung Typst
#htl3r.author("Julian Burger")
Typst ist eine Markup basierter Schrifftsatz welcher entwickelt wurde um genau so mächtig wie LaTeX zu sein,
während er gleichzeitig simpel und einfach zu benutzen ist. Bei unklarheiten ist die Dokumentation unter
https://typst.app/docs/ aufzufinden. Falls allgemeine Fragen zur Umsetzung gewisser Konzepte aufkommen,
so ist entweder das Forum (https://forum.typst.app/) oder der Discord-Server
aufzusuchen.

== Warum wurde sich für Typst entschieden?
Innerhalb der Klasse 5CN um Schuljahr 2024/25 gab es mehrere Diplomarbeiten welche interesse an LaTeX gezeigt haben.
Allerdings war die existierende LaTeX Vorlage unbrauchbar und die hohe Komplexität von LaTeX selbst ist eine Zumutung.
Somit war klar, dass etwas neues gebraucht wird. Typst ist der perfekte Ersatz für LaTeX.

== Kompilierung einer Typst-Datei
Typst hat eine CLI, über welche die Quellcodedateien kompiliert werden. Um eine Datei zu kompileren wird diese CLI aufgerufen:
```bash
typst compile $DATEI
```

= Grundlagen
#htl3r.author("Viktor Kreuzer")

Der Autor des Kapitels muss explizit angegeben werden!

```typ
#htl3r.author("Max Mustermann")
```

== Abbildungen
Damit die Abbildungen mit richtigem Spacing auf der Seite angezeigt werden, müssen sie mit einer Funktion gewrappt werden.

Damit kann die Breite der Figure angepasst werden.

```typ
#htl3r.fspace(
  total_width: 50%,
  figure(image("../assets/16x9.png"), caption: [Bild mit 16:9]),
)
```

resultiert in:

#htl3r.fspace(
  total_width: 50%,
  figure(image("../assets/16x9.png"), caption: [Bild mit 16:9]),
)

#pagebreak()
Mit der `fspace`-Funktion können auch mehrere Figures nebeneinander gestellt werden. 

```typ
#htl3r.fspace(
  figure(image("../assets/16x9.png"), caption: [Bild mit 16:9]),
  figure(image("../assets/1x1.png"), caption: [Bild mit 1:1]),
)
```

resultiert in:

#htl3r.fspace(
  figure(image("../assets/16x9.png"), caption: [Bild mit 16:9]),
  figure(image("../assets/1x1.png"), caption: [Bild mit 1:1]),
)

#pagebreak()
== Abkürzungen
Die verwendeten Abkürzungen werden zentral in einer YAML-Datei definiert. \

Beispiel:
```yaml
da:
  short:
    singular: DA
    plural: DA
  long:
    singular: Diplomarbeit
    plural: Diplomarbeiten
```

Diese Abkürzungen können im Dokument verwendet werden.

```typ
#htl3r.abbr.short[da] // Kurzform Singular
#htl3r.abbr.shortpl[da] // Kurzform Plural
#htl3r.abbr.long[da] // Langform Singular
#htl3r.abbr.longpl[da] // Langform Plural
```

#htl3r.abbr.short[da] \
#htl3r.abbr.shortpl[da] \
#htl3r.abbr.long[da] \
#htl3r.abbr.longpl[da] \

= Wichtige Details
#htl3r.author("Viktor Kreuzer")
