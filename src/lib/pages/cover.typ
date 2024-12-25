#import "../settings.typ" as settings
#import "../util.typ": format-date, format-department

#let create-page(
  title: "Meine Diplomarbeit",
  subtitle: "Wir sind super toll!",
  department: "IT",
  school-year: "2024/2025",
  authors: (
    (
      name: "Max Mustermann",
      supervisor: "Otto Normalverbraucher",
      role: "Projektleiter",
    ),
    (
      name: "Erika Mustermann",
      supervisor: "Lieschen Müller",
      role: "Stv. Projektleiter",
    ),
  ),
  date: datetime(year: 2024, month: 12, day: 1),
) = {
  // Header
  block(
    width: auto,
    height: 52pt,
    stroke: (
      left: 4pt + settings.COLOR_RED,
    ),
    inset: (
      top: 2pt,
      bottom: 2pt,
      left: 8pt,
    ),
    align(left + horizon)[
      #box(
        height: 100%,
        text(
          size: 8pt,
          [
            #text(
              size: 8pt,
              [#strong([Höhere Technische Bundeslehranstalt Wien 3, Rennweg])],
            ) \
            #v(1fr)
            Höhere Abteilung für Mechatronik \
            Höhere Abteilung für Informationstechnologie \
            Fachschule für Informationstechnik
          ],
        ),
      )
      #h(1fr)
      #box(
        height: 100%,
        image("../assets/htl3r-logo.svg"),
      )
    ],
  )
  v(1fr)
  // Body
  align(center)[
    #text(
      size: 20pt,
      font: settings.FONT_TEXT_DISPLAY,
      "Diplomarbeit",
    )
  ]
  v(1fr)
  align(center)[
    #text(
      size: 24pt,
      font: settings.FONT_TEXT_DISPLAY,
      strong[
        #title \
        #subtitle
      ],
    )
  ]
  v(1fr)
  align(center)[
    #text(
      size: 10pt,
      [
        ausgeführt an der \
        Höheren Abteilung für #format-department(department) \
        der Höheren Technischen Lehranstalt Wien 3 Rennweg \
        im Schuljahr #school-year
      ],
    )
  ]
  v(1fr)
  align(
    center,
    block(width: 60%)[
      #par(
        leading: 1.4em,
        text(size: 10pt)[
          durch #h(1fr) unter Anleitung von \
          #v(-5pt)
          #line(length: 100%, stroke: 0.5pt)
          #v(-5pt)
          #for author in authors [
            #text(size: 14pt, strong(author.name)) #h(1fr) #author.supervisor \
          ]
        ],
      )
    ],
  )
  v(1fr)
  align(
    center,
    block(width: 60%)[
      #text(
        size: 10pt,
        [
          Wien, #format-date(date)
        ],
      )
    ],
  )
  v(1fr)
}
