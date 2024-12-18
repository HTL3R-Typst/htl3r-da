#import "../util.typ": insert_blank_page

#let create_page() = [
  #outline(
    title: [Tabellenverzeichnis],
    target: figure.where(kind: table),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
  <TOT_BEGIN>
  #hide("TOT_END")
  <TOT_END>
  #insert_blank_page(<TOT_BEGIN>, <TOT_END>)
]
