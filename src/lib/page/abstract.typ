#import "../util.typ": blank_page

#let create_page(
  kurzfassung_text,
  abstract_text,
) = [
  #blank_page()
  = Kurzfassung
  #kurzfassung_text
  #blank_page()
  = Abstract
  #abstract_text
]
