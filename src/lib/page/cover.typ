#import "../settings.typ" as settings
#import "../util.typ": format_date, format_department

#let create_page(
  titel: "Meine Diplomarbeit",
  titel_zusatz: "Wir sind super toll!",
  abteilung: "IT",
  schuljahr: "2024/2025",
  autoren: (
    (name: "Max Mustermann", betreuung: "Otto Normalverbraucher", rolle: "Projektleiter"),
    (name: "Erika Mustermann", betreuung: "Lieschen Müller", rolle: "Stv. Projektleiter"),
  ),
  datum: datetime(year: 2024, month: 12, day: 1),
) = {
  // Header
  block(
    width: auto,
    height: 52pt,
    stroke: (
      left: 4pt + settings.COLOR_RED
    ),
    inset: (
      top: 2pt,
      bottom: 2pt,
      left: 8pt
    ),
    align(left + horizon)[
      #box(
        height: 100%,
        text(
          size: 8pt,
          [
            #text(size: 8pt, [#strong([Höhere Technische Bundeslehranstalt Wien 3, Rennweg])]) \
            #v(1fr)
            Höhere Abteilung für Mechatronik \
            Höhere Abteilung für Informationstechnologie \
            Fachschule für Informationstechnik
          ]
        )
      )
      #h(1fr)
      #box(
        height: 100%, image("../assets/htl3r_logo.svg")
      )
    ],
  )
  v(1fr)
  // Body
  align(center)[
    #text(
      size: 20pt,
      font: settings.FONT_TEXT_DISPLAY,
      "Diplomarbeit"
    )
  ]
  v(1fr)
  align(center)[
    #text(
      size: 24pt,
      font: settings.FONT_TEXT_DISPLAY,
      strong[
        #titel \
        #titel_zusatz
      ]
    )
  ]
  v(1fr)
  align(center)[
    #text(
      size: 10pt,
      [
        ausgeführt an der \
        Höheren Abteilung für #format_department(abteilung) \
        der Höheren Technischen Lehranstalt Wien 3 Rennweg \
        im Schuljahr #schuljahr
      ]
    )
  ]
  v(1fr)
  align(center, block(width: 60%)[
    #par(
      leading: 1.4em,
      text(size: 10pt,)[
        durch #h(1fr) unter Anleitung von \
        #v(-5pt)
        #line(length: 100%, stroke: 0.5pt)
        #v(-5pt)
        #for autor in autoren [
          #text(size: 14pt, strong(autor.name)) #h(1fr) #autor.betreuung \
        ]
      ]
    )
  ])
  v(1fr)
  align(center, block(width: 60%)[
    #text(
      size: 10pt,
      [
        Wien, #format_date(datum)
      ]
    )
  ])
  v(1fr)
}
