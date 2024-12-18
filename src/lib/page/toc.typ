#import "../util.typ": insert_blank_page

#let create_page() = context [
  #show outline.entry.where(
    level: 1,
  ): e => context {
    if e.element.level == 1 {
      v(2em, weak: true)
    }
    if e.element.level == 1 {
      strong(e)
    } else {
      e
    }
  }
  #outline(
    target: selector(heading).after(<DA_BEGIN>),
    depth: 3,
    indent: 1em,
    fill: line(length: 100%, stroke: (dash: ("dot", 1em))),
  )
  <TOC_BEGIN>
  #hide("TOC_END")
  <TOC_END>
  #insert_blank_page(<TOC_BEGIN>, <TOC_END>)
]
