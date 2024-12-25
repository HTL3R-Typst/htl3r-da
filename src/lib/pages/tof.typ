#import "../util.typ": insert-blank-page

#let create-page() = [
  #outline(
    title: [Abbildungsverzeichnis],
    target: figure.where(kind: image),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
