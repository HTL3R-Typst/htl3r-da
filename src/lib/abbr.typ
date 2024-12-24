#import "util.typ": to_string
#import "global.typ" as global

#let display(abbr, display) = {
  link(label("ABBR_DES_" + abbr))[#display#label("ABBR_" + abbr)]
  // Create footnote
  let abbr = global.abbr.get().at(abbr)
  let desc = abbr.at("footnote", default: abbr.at("description", default: none))
  if not abbr.at("used", default: false) and desc != none {
    footnote([#emph(abbr.at("long").at("singular")): #desc])
  }
}

#let link(abbr, length, form) = context {
  let name = to_string(abbr)
  let abbr_dict = global.abbr.get().at(name, default: none)
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

#let short(abbr) = {
  link(abbr, "short", "singular")
}

#let shortpl(abbr) = {
  link(abbr, "short", "plural")
}

#let long(abbr) = {
  link(abbr, "long", "singular")
}

#let longpl(abbr) = {
  link(abbr, "long", "plural")
}
