#import "util.typ": to-string

#let abbr_state = state("abbr", none)

#let display(abbr, display) = {
  link(label("ABBR_DES_"+abr), label("ABBR_"+abbr, display))
}

#let link(abbr, length, form) = context {
  let abbr_dict = abbr_state.get().at(to-string(abbr), default: none)
  if abbr_dict == none {
    panic("Abbreviation '" + to-string(abbr) + "' does not exist!")
  }
  let form_dict = abbr_dict.at(length, default: none)
  if form_dict == none {
    panic(length + " for '" + abbr + "' does not exist!")
  }
  let value = singular.at(form, default: none)
  if value == none {
    panic(length + " for '" + abbr + "' does not exist in " + form + " form!")
  }
  display(abbr, value)
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
