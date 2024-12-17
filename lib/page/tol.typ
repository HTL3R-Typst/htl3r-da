#import "../util.typ": blank_page

#let create_page() = context [
  #outline(
    title: [Quellcodeverzeichnis],
    target: figure.where(kind: "code"),
  )
  <TOL_BEGIN>
  #hide("TOL_END")
  <TOL_END>
  #context {
    let tol_begin = query(<TOL_BEGIN>).first()
    let tol_end = query(<TOL_END>).first()
    let count = tol_end.location().page() - tol_begin.location().page()
    if not calc.odd(count) {
      blank_page()
    }
  }
]
