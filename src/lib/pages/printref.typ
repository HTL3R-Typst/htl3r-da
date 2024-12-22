#import "../util.typ": insert_blank_page

#let create_page() = context [
  #set page(header: none, footer: none)
  #heading(outlined: false, level: 1)[Druckgrößenkontrolle]
  Diese Seite sollte nach dem Probedruck entfernt werden.
  Einfach das ``` print_ref``` Argument auf ``` false``` setzen.
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