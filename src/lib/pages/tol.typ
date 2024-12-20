#import "../util.typ": insert_blank_page

#let create_page() = context [
  #outline(
    title: [Quellcodeverzeichnis],
    target: figure.where(kind: "code"),
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
  <TOL_BEGIN>
  #hide("TOL_END")
  <TOL_END>
  #insert_blank_page(<TOL_BEGIN>, <TOL_END>)
]
