#import "../util.typ": blank_page

#let create_page() = context [
  #let num_pages = counter(page).get().last()
  #if not calc.odd(num_pages) {
    blank_page()
  }
  #set page(header: none, footer: none)
  #heading(outlined: false, level: 1)[Druckgrößenkontrolle]
  Diese Seite sollte nach dem Probedruck entfernt werden.
  Einfach das ``` druck_referenz``` Argument auf ``` false``` setzen.
  #align(center + horizon, block(
    width: 100mm,
    height: 50mm,
    stroke: 1pt,
    text(

    )[
      Breite = 100mm \
      Höhe = 50mm
    ]
  ))
]
