#import "../util.typ": blank_page, author

#let create_page(
  abkuerzungen: ()
) = context [
  = Abkürzungsverzeichnis
  <ABBR_BEGIN>
  #author(none)
  #context {
    for abbr in abkuerzungen [
      #par(spacing: 0pt)[
        #strong(abbr.abbr): #label("ABBR_DES_"+abbr.abbr) #abbr.langform #h(1fr)
        #if abbr.bedeutung != none [
          #let page = query(label("ABBR_G_"+abbr.abbr)).first().location().page() - query(<DA_BEGIN>).first().location().page() + 1
          #link(label("ABBR_G_"+abbr.abbr))[#emph[Glossar (S. #page)]]
        ]
      ]
      // list abbr locations
      #let refs = query(label("ABBR_"+abbr.abbr))
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
