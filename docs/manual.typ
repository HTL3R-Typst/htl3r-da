#import "@preview/htl3r-da:0.1.0" as htl3r

#show: htl3r.diplomarbeit.with(
  disable-cover: true,
  disable-book-binding: true,
  print-ref: false,
  /* funktioniert nicht, da die Page nicht geladen wird.

  bibliography-content: bibliography("refs.yml", title: [Literaturverzeichnis])*/
)

= Allgemeiner Typst Syntax
#{
  show link: set text(fill: blue, size: 60pt)
  align(center)[
    #link("https://typst.app/docs/reference/syntax/")[GUCKST \ DU \ HIER] \
  ]
}

#show link: set text(fill: blue)

== nützliche Features
- Fußnote mit ```typ #footnote[]```

#htl3r.author("Viktor Kreuzer")
= Templatespezifische-Funktionen
*Angeben des Kapitelautors:*
Die Autorenangabe muss #underline[*vor*] der Überschrift erfolgen
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

*Todo-Eintrag:*
```typ
#htl3r.todo[SDO stolz machen]
#htl3r.info[Information hier einfügen]
#htl3r.warn[Achtung!]
```

Output:

#htl3r.todo[SDO stolz machen]
#htl3r.info[Information hier einfügen]
#htl3r.warn[Achtung!]

*Inline-Todo-Eintrag:*

```typ
#lorem(10) #htl3r.inline-todo[Das geht so nicht!] #lorem(20)
```

Output:

#lorem(10) #htl3r.inline-todo[Das geht so nicht!] #lorem(20)

*Breadcrumbs*

Können als Darstellung eines Pfades oder einer Menüstruktur verwendet werden.

```typ
#lorem(10)
#htl3r.breadcrumbs(("Das", "ist", "eine", "mögliche", "Menüstruktur"))
#lorem(10)
```

#lorem(10)
#htl3r.breadcrumbs(("Das", "ist", "eine", "mögliche", "Menüstruktur"))
#lorem(10)

*Zitieren:*

Die Referenzdatei kann entweder in einer BibLaTeX `.bib` Datei oder in einer Datei im 
#text(link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva-Format], fill: blue)
erfolgen.

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

+ direktes Zitat
  ```typ
  // Direktes Zitat = normaler Typst Syntax
  @htl3r-website[]
  ```
  Output:
  #image("assets/zit_dir.png")

+ direktes Zitat mit Supplement
  ```typ
  @htl3r-website[, S. 12]
  ```
  Output:
  #image("assets/zit_dir_suppl.png")

+ indirektes Zitat
  ```typ
  // Merkhilfe: comp ... comparison
  @htl3r-website[comp]
  ```
  Output:
  #image("assets/zit_ind.png")

  #htl3r.warn[Der String "`comp`" ist im Template hardcoded und kann damit *NICHT* als Supplement eingesetzt werden! \
  (Warum auch immer man das auch machen würde)]

+ indirektes Zitat mit Supplement
  ```typ
  // Merkhilfe: comp ... comparison
  @htl3r-website[#htl3r.comp[S. 12]]
  ```

  Output:
  #image("assets/zit_ind_suppl.png")
