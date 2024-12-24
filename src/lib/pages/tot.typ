#import "../util.typ": insert_blank_page

#let create_page() = [
  #show outline.entry: e => context {
    if repr(e.body).split("]").at(2).split(".").at(1) == "1" {
      v(2em, weak: true)
    }
    e
  }
  #outline(
    title: [Tabellenverzeichnis],
    target: figure.where(kind: table),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
