#import "@preview/htl3r-da:1.0.0" as htl3r

#show: htl3r.diplomarbeit.with(
  disable-cover: true,
  disable-book-binding: true,
  print-ref: false,
  abbreviation: yaml("abbr.yml")
  /* funktioniert nicht, da die Page nicht geladen wird.

  bibliography-content: bibliography("refs.yml", title: [Literaturverzeichnis])*/
)

= Typst Syntax und Requirements
#[
#show link: set text(fill: blue)

Die #link("https://typst.app/docs/")[Typst-Dokumentation] ist die wichtigste Anlaufstelle für Wissen rund um Typst.

Die #link("https://typst.app/docs/reference/syntax/")[Syntax-Referenz] bietet eine Übersicht über die grundlegende Syntax und die wichtigsten Funktionen.

Bei komplexeren Problemsstellungen ist auch der Typst Discord-Server empfehlenswert. Der aktuelle Link befindet sich in der Kopfzeile der #link("https://typst.app")[Typst-Website].
]

== Schriftarten
Damit das Dokument korrekt kompilieren kann, ist es notwendig, dass folgende Schriftarten am System vorhanden sind:
/*
See issue #69
- *Calibri:* Verwendet für _Überschriften_.
*/
- *Cambria:* Verwendet für _Text_ und _Überschriften_.
- *Source Code Pro:* Verwendet für _Quellcode_.

Unter Windows sollten die Schriftarten schon vorhanden sein. Unter Linux können diese mit einem Package Manager heruntergeladen werden:
- *Arch Linux:* `yay -S ttf-vista-fonts adobe-source-code-pro-fonts`
- *Ubuntu:* `sudo apt install ttf-mscorefonts-installer # Source Code Pro exkludiert.`

#htl3r.info[
  Unter Ubuntu ist es am leichtesten sich _Source Code Pro_ auf Google-Fonts herunterzuladen:
  https://fonts.google.com/specimen/Source+Code+Pro

  Unter Arch Linux kann, falls `yay` nicht installiert ist, kann das Package manuell installiert werden:
  #htl3r.code[
  ```bash
  git clone https://aur.archlinux.org/ttf-vista-fonts.git
  makepkg -i -D ./ttf-vista-fonts
  sudo pacman -S adobe-source-code-pro-fonts
  ```
  ]
]

#htl3r.author("Viktor Kreuzer")
= Templatespezifische-Funktionen
*Angeben des Kapitelautors:*
Die Autorenangabe muss #underline[*vor*] der Überschrift erfolgen.
```typ
#htl3r.author("Viktor Kreuzer")
= Templatespezifische-Funktionen
```
Output: Im Footer wird der Autor gelistet.

*Breite von Figures festlegen:*
```typ
#htl3r.fspace(
  total-width: 50%,
  // hier können mehrere Figures nebeneinandergestellt werden!
  figure(image("assets/16x9.png"), caption: [Bild mit 16:9]),
  figure(image("assets/1x1.png"), caption: [Bild mit 1:1]),
)
```
Output:
#htl3r.fspace(
  total-width: 50%,
  figure(image("assets/16x9.png"), caption: [Bild mit 16:9]),
  figure(image("assets/1x1.png"), caption: [Bild mit 1:1]),
)

#pagebreak()

*Codeblock als Figure:*

#raw(
  lang: "typ",
  "#htl3r.code(description: [Bashskript], caption: [Codeblock Beispiel])[
```bash
#!/bin/bash
echo test123
```
]",
)

Output:
#htl3r.code(description: [Bashskript], caption: [Codeblock Beispiel])[
  ```bash
  #!/bin/bash
  echo test123
  ```
]

*Codeblock aus einem File importiert:*
```typ
#htl3r.code-file(
  lang: "bash",
  filename: [Test],
  text: read("assets/code-example.sh"),
)
```
Output:
#htl3r.code-file(
  lang: "bash",
  filename: [Test],
  text: read("assets/code-example.sh"),
)

#pagebreak()

*Todo-Eintrag:*
```typ
#htl3r.todo[SDO stolz machen.]
#htl3r.info[Information hier einfügen.]
#htl3r.warn[Achtung!]
```

Output:

#htl3r.todo[SDO stolz machen.]
#htl3r.info[Information hier einfügen.]
#htl3r.warn[Achtung!]

*Inline-Todo-Eintrag:*

```typ
#lorem(10) #htl3r.inline-todo[Das geht so nicht!] #lorem(20)
```

Output:

#lorem(10) #htl3r.inline-todo[Das geht so nicht!] #lorem(20)

#pagebreak()

*Breadcrumbs*

Können zur Darstellung eines Pfades oder einer Menüstruktur verwendet werden.

```typ
#lorem(10)
#htl3r.breadcrumbs(("Das", "ist", "eine", "mögliche", "Menüstruktur"))
#lorem(10)
```

Output:

#lorem(10)
#htl3r.breadcrumbs(("Das", "ist", "eine", "mögliche", "Menüstruktur"))
#lorem(10)

*Abkürzungen:*

Folgende Arten der Abkürzungen werden unterstützt:

```typ
Kurzform Singular: #htl3r.short[da] \
Kurzform Plural:   #htl3r.shortpl[da] \
Langform Singular: #htl3r.long[da] \
Langform Plural:   #htl3r.longpl[da] \
Vollform Singular: #htl3r.full[da] \
Vollform Plural:   #htl3r.fullpl[da] \
```

Output:

Kurzform Singular: #htl3r.short[da] \
Kurzform Plural:   #htl3r.shortpl[da] \
Langform Singular: #htl3r.long[da] \
Langform Plural:   #htl3r.longpl[da] \
Vollform Singular: #htl3r.full[da] \
Vollform Plural:   #htl3r.fullpl[da] \

#pagebreak()

*Zitieren:*

Die Literatur kann entweder in einer BibLaTeX `.bib` Datei oder in einer Datei im
#text(
  link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva-Format],
  fill: blue,
)
hinterlegt werden.

#htl3r.info[Bei aufeinanderfolgendem Zitieren der gleichen Quelle wird diese mit "ebd." (ebenda) abgekürzt.
  ```typ
  @htl3r-website[comp] \
  @htl3r-website[#htl3r.comp[S. 12]]
  ```
  Output:
  #image("assets/zit_ebd.png")
]

Beispiel:

#htl3r.code-file(
  lang: "yaml",
  filename: [refs.yml],
  text: read("refs.yml"),
)

1. direktes Zitat
  ```typ
  // Direktes Zitat = normaler Typst Syntax
  @htl3r-website[]
  ```
  Output:
  #image("assets/zit_dir.png")

#pagebreak()

2. direktes Zitat mit Supplement
  ```typ
  @htl3r-website[, S. 12]
  ```
  Output:
  #image("assets/zit_dir_suppl.png")

3. indirektes Zitat
  ```typ
  // Merkhilfe: comp ... comparison
  @htl3r-website[comp]
  ```
  Output:
  #image("assets/zit_ind.png")

  #htl3r.warn[Der String "`comp`" ist im Template hardcoded und kann damit *NICHT* als Supplement eingesetzt werden!]

4. indirektes Zitat mit Supplement
  ```typ
  // Merkhilfe: comp ... comparison
  @htl3r-website[#htl3r.comp[S. 12]]
  ```

  Output:
  #image("assets/zit_ind_suppl.png")
