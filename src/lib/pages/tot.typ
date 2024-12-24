#import "../util.typ": insert_blank_page

#let create_page() = [
  #outline(
    title: [Tabellenverzeichnis],
    target: figure.where(kind: table),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
