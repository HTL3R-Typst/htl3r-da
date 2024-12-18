#import "../util.typ": insert_blank_page

#let create_page() = [
  #outline(
    title: [Abbildungsverzeichnis],
    target: figure.where(kind: image)
  )
  <TOF_BEGIN>
  #hide("TOF_END")
  <TOF_END>
  #insert_blank_page(<TOF_BEGIN>, <TOF_END>)
]
