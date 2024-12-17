#import "../util.typ": blank_page
#import "../state.typ" as state

#let create_page() = context [
  = Glossar
  <GLOSSARY_BEGIN>
  #context {
    for name in state.abbr.get().keys() [
      #let abbr = state.abbr.get().at(name)
      #let desc = abbr.at("description", default: none)
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
