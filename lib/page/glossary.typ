#import "../util.typ": blank_page, author
#import "../abbr.typ": abbr_state

#let create_page() = context [
  = Glossar
  <GLOSSARY_BEGIN>
  #author(none)
  #context {
    for name in abbr_state.get().keys() [
      #let abbr = abbr_state.get().at(name)
      #let desc = abbr.at("description", default: none)
      #if desc == none {
        panic("Description for '" + name + "' does not exist!")
      }
      #let long = abbr.at("long", default: none)
      #if long == none {
        panic("Long for '" + name + "' does not exist!")
      }
      #let long = long.at("singular", default: none)
      #if long == none {
        panic("Long for '" + name + "' does not exist in singular form!")
      }
      #if desc != none [
        #par(hanging-indent: 2em)[
          #strong(long): #label("ABBR_G_"+name) #desc \
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
