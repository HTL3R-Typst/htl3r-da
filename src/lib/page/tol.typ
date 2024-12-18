#import "../util.typ": insert_blank_page

#let create_page() = context [
  #outline(
    title: [Quellcodeverzeichnis],
    target: figure.where(kind: "code"),
  )
  <TOL_BEGIN>
  #hide("TOL_END")
  <TOL_END>
  #insert_blank_page(<TOL_BEGIN>, <TOL_END>)
]
