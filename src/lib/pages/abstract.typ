#import "../util.typ": blank_page

#let create_page(
  abstract_german,
  abstract_english,
) = [
  #blank_page()
  = Kurzfassung
  #abstract_german
  #blank_page()
  = Abstract
  #abstract_english
]
