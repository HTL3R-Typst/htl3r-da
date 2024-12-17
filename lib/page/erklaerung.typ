#import "../util.typ": format_date, blank_page

#let create_page(
  autoren,
  datum,
  generative_ki_tools_klausel,
) = [
  #blank_page()
  = Ehrenwörtliche Erklärung
  Hiermit versichere ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine
  anderen Hilfsmittel als die angegebenen benützt habe. Die Stellen, die anderen Werken
  (gilt ebenso für Werke aus elektronischen Datenbanken oder aus dem Internet) wörtlich
  oder sinngemäß entnommen sind, habe ich unter Angabe der Quelle und Einhaltung der
  Regeln wissenschaftlichen Zitierens kenntlich gemacht. Diese Versicherung umfasst auch
  in der Arbeit verwendete bildliche Darstellungen, Tabellen, Skizzen und Zeichnungen.
  Die verwendeten Hilfsmittel wurden vollständig und wahrheitsgetreu inkl. Produktversion
  und Prompt ausgewiesen.

  Für die Erstellung der Arbeit habe ich auch folgende Hilfsmittel generativer KI-Tools
  zu folgendem Zweck verwendet:

  #if generative_ki_tools_klausel == none [
    Es wurden keine Hilfsmittel generativer KI-Tools für die Erstellung der Arbeit verwendet.
  ] else [
    #generative_ki_tools_klausel
  ]
  #v(3em)
  Wien, am #format_date(datum)
  #v(7em)
  #let fields = autoren.map((autor) => {
    box(block(
      width: 7.5cm,
      height: 1cm,
      stroke: (
        top: 0.5pt + black
      ),
    )[#align(center + horizon)[
      #autor.name
    ]])
  })
  #let fields = fields.chunks(2).map((a) => [
    #let first = a.first()
    #let last = if a.len() == 2 { a.last() } else { box(block(width: 7cm, height: 1cm,)) }
    #block(width: 100%)[#first #h(1fr) #last #v(6em)]
  ])
  #for field in fields [
    #field
  ]
]
