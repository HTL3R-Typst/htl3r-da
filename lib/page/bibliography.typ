#import "../util.typ": blank_page

#let create_page(
  literatur: []
) = context [
  #literatur
  <BIB_BEGIN>
  #hide("BIB_END")
  <BIB_END>
  #context {
    let bib_begin = query(<BIB_BEGIN>).first()
    let bib_end = query(<BIB_END>).first()
    let count = bib_end.location().page() - bib_begin.location().page()
    if calc.odd(count) {
      blank_page()
    }
  }
]
