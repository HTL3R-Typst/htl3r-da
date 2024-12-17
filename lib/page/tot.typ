#import "../util.typ": blank_page

#let create_page() = [
  #outline(
    title: [Tabellenverzeichnis],
    target: figure.where(kind: table)
  )
  <TOT_BEGIN>
  #hide("TOT_END")
  <TOT_END>
  #context {
    let toc_begin = query(<TOT_BEGIN>).first()
    let toc_end = query(<TOT_END>).first()
    let count = toc_end.location().page() - toc_begin.location().page()
    if not calc.odd(count) {
      blank_page()
    }
  }
]
