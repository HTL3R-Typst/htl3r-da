#import "../util.typ": insert_blank_page
#import "../global.typ" as global

#let create_page() = context [
  = Glossar <GLOSSARY_BEGIN>
  #for name in global.abbr.get().keys() [
    #let abbr = global.abbr.get().at(name)
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
        #v(0.5em)
      ]
    ]
  ]
  #hide("ABBR_END")
  <GLOSSARY_END>
  #insert_blank_page(<GLOSSARY_BEGIN>, <GLOSSARY_END>)
]
