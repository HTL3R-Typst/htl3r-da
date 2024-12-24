#import "../util.typ": insert_blank_page

#let create_page() = [
  #outline(
    title: [Quellcodeverzeichnis],
    target: figure.where(kind: "code"),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
]
