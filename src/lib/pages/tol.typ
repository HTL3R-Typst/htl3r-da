#import "../util.typ": insert-blank-page

#let create-page() = [
  #outline(
    title: [Quellcodeverzeichnis],
    target: figure.where(kind: "code"),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
