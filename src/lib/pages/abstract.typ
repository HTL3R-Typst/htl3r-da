#import "../util.typ": insert_blank_page

#let create_page(
  abstract_german,
  abstract_english,
) = [
  = Kurzfassung
  #abstract_german
  #insert_blank_page()
  = Abstract
  #abstract_english
]
