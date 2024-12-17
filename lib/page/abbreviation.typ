#import "../util.typ": blank_page, author
#import "../abbr.typ": abbr_state

#let create_page() = context [
  = Abkürzungsverzeichnis
  <ABBR_BEGIN>
  #author(none)
  #context {
    for name in abbr_state.get().keys() [
      #let abbr = abbr_state.get().at(name)
      #let short = abbr.at("short", default: none)
      #if short == none {
        panic("Short for '" + name + "' does not exist!")
      }
      #let short = short.at("singular", default: none)
      #if short == none {
        panic("Short for '" + name + "' does not exist in singular form!")
      }
      #let long = abbr.at("long", default: none)
      #if long == none {
        panic("Long for '" + name + "' does not exist!")
      }
      #let long = long.at("singular", default: none)
      #if long == none {
        panic("Long for '" + name + "' does not exist in singular form!")
      }
      #let description = abbr.at("description", default: none)
      #par(spacing: 0pt)[
        #strong(short): #label("ABBR_DES_"+name) #long #h(1fr)
        #if description != none [
          #let page = query(label("ABBR_G_"+name)).first().location().page() - query(<DA_BEGIN>).first().location().page() + 1
          #link(label("ABBR_G_"+name))[#emph[Glossar (S. #page)]]
        ]
      ]
      // list abbr locations
      #let refs = query(label("ABBR_"+name))
      #par(hanging-indent: 2em, spacing: 6pt, first-line-indent: 2em)[
        #for (index, a) in refs.enumerate() [
          #let loc = a.location()
          #let nr = loc.page() - query(<DA_BEGIN>).first().location().page() + 1
          #let delim = if index + 1 == refs.len() {""} else {","}
          #link(loc)[#emph[(S. #{nr})#{delim} ]]
        ]
      ]
      #v(1em)
    ]
  }
  <ABBR_END>
  #context {
    let abbr_begin = query(<ABBR_BEGIN>).first()
    let abbr_end = query(<ABBR_END>).first()
    let count = abbr_end.location().page() - abbr_begin.location().page()
    if not calc.odd(count) {
      blank_page()
    }
  }
]
