#import "util.typ": to-string
#import "state.typ" as state

#let display(abbr, display) = {
  link(label("ABBR_DES_"+abbr))[#display#label("ABBR_"+abbr)]
}

#let link(abbr, length, form) = context {
  let name = to-string(abbr)
  let abbr_dict = state.abbr.get().at(name, default: none)
  if abbr_dict == none {
    panic("Abbreviation '" + name + "' does not exist!")
  }
  let form_dict = abbr_dict.at(length, default: none)
  if form_dict == none {
    panic(length + " for '" + name + "' does not exist!")
  }
  let value = form_dict.at(form, default: none)
  if value == none {
    panic(length + " for '" + name + "' does not exist in " + form + " form!")
  }
  display(name, value)
}

#let shorts(abbr) = {
  link(abbr, "short", "singular")
}

#let shortpl(abbr) = {
  link(abbr, "short", "plural")
}

#let longs(abbr) = {
  link(abbr, "long", "singular")
}

#let longpl(abbr) = {
  link(abbr, "long", "plural")
}
