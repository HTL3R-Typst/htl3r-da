#import "../util.typ": insert-blank-page

#let create-page() = [
  #outline(
    title: [Tabellenverzeichnis],
    target: figure.where(kind: table),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
