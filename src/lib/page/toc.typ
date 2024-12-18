#import "../util.typ": insert_blank_page

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
  #insert_blank_page(<TOC_BEGIN>, <TOC_END>)
]
