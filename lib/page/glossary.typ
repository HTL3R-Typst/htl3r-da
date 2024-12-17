#import "../util.typ": blank_page, author

#let create_page(
  abkuerzungen: ()
) = context [
  = Glossar
  <GLOSSARY_BEGIN>
  #author(none)
  #{
    for abbr in abkuerzungen [
      #if abbr.bedeutung != none [
        #par(hanging-indent: 2em)[
          #strong(abbr.langform): #label("ABBR_G_"+abbr.abbr) #abbr.bedeutung \
          #v(1em)
        ]
      ]
    ]
  }
  <GLOSSARY_END>
  #context {
    let glossary_begin = query(<GLOSSARY_BEGIN>).first()
    let glossary_end = query(<GLOSSARY_END>).first()
    let count = glossary_end.location().page() - glossary_begin.location().page()
    if not calc.odd(count) {
      blank_page()
    }
  }
]
