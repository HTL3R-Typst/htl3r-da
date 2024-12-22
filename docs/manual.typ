#import "@preview/htl3r-da:0.1.0" as htl3r

/*#show: htl3r.diplomarbeit.with(
  manual_mode: true,
)*/

= Allgemeiner Typst Syntax
#{
  show link: set text(fill: blue, size: 80pt)
  align(center)[
    #link("https://typst.app/docs/reference/syntax/")[GUCKST \ DU \ HIER] \
  ]
}

#show link: set text(fill: blue)

== nützliche Features
- Fußnote mit ```typ #footnote[]```

= Templatespezifische-Funktionen
*Angeben des Kapitelautors:*
```typ
#htl3r.author("Viktor Kreuzer")
```

*Figure mit angepasster Breite:*
```typ
#htl3r.fspace(
  total_width: 50%,
  figure(image("assets/16x9.png"), caption: [Bild mit 16:9]),
)
```
Output:
#htl3r.fspace(
  total_width: 50%,
  figure(image("assets/16x9.png"), caption: [Bild mit 16:9]),
)

*Figures nebeneinandergestellt:*
```typ
#htl3r.fspace(
  figure(image("assets/16x9.png"), caption: [Bild mit 16:9]),
  figure(image("assets/1x1.png"), caption: [Bild mit 1:1]),
)
```
Output:
#htl3r.fspace(
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
#htl3r.code_file(
  lang: "bash",
  filename: [Test],
  text: read("assets/code_example.sh"),
)
```
Output:
#htl3r.code_file(
  lang: "bash",
  filename: [Test],
  text: read("assets/code_example.sh"),
)

*ToDo-Eintrag:*
```typ
#htl3r.todo[SDO stolz machen]
#htl3r.info[Information hier einfügen]
#htl3r.warn[Achtung!]
```

Output:

#htl3r.todo[SDO stolz machen]
#htl3r.info[Information hier einfügen]
#htl3r.warn[Achtung!]

*Zitieren:*
+ direktes Zitat
// To be implemented

+ indirektes Zitat
// To be implemented
