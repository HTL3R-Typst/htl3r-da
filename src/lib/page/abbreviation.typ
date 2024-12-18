#import "../util.typ": blank_page, insert_blank_page
#import "../global.typ" as global

#let create_page() = context [
  = Abkürzungsverzeichnis <ABBR_BEGIN>
  #global.author.update(none)
  #for name in global.abbr.get().keys() [
    #let abbr = global.abbr.get().at(name)
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
        #let page_number = query(label("ABBR_G_"+name)).first().location().page() - query(<DA_BEGIN>).first().location().page() + 1
        #link(label("ABBR_G_"+name))[#emph[Glossar (S. #page_number)]]
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
  #hide("ABBR_END")
  <ABBR_END>
  #insert_blank_page(<ABBR_BEGIN>, <ABBR_END>)
]
