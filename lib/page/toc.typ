#import "../util.typ": blank_page

#let create_page() = context [
  #show outline.entry.where(
    level: 1,
  ): e => {
    if e.element.numbering == none {
      v(1em)
      strong(e)
    } else {
      e
    }
  }
  #outline(
    target: selector(heading).after(<DA_BEGIN>),
    depth: 3
  )
  <TOC_BEGIN>
  #hide("TOC_END")
  <TOC_END>
  #context {
    let toc_begin = query(<TOC_BEGIN>).first()
    let toc_end = query(<TOC_END>).first()
    let count = toc_end.location().page() - toc_begin.location().page()
    if not calc.odd(count) {
      blank_page()
    }
  }
]
