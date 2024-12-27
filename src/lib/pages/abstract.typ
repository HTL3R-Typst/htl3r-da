#import "../util.typ": insert-blank-page

#let create-page(
  abstract-german,
  abstract-english,
  skip-blank-pages: false
) = [
  = Kurzfassung
  #abstract-german
  #if not skip-blank-pages { insert-blank-page() }
  = Abstract
  #abstract-english
]
