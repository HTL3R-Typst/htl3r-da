#import "../util.typ": insert_blank_page

#let create_page() = [
  #outline(
    title: [Abbildungsverzeichnis],
    target: figure.where(kind: image),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
