#import "settings.typ" as settings

#let bubble(text_color: rgb("#975E10"), fill: rgb("#FFEFD6"), stroke: rgb("#F9D9AD"), body) = {
  let inset = 1.2em
  set text(fill: text_color)
  block(
    breakable: false,
    width: 100%,
    figure(
      kind: "todo",
      supplement: [TODO],
      block(
        inset: inset,
        width: 100%,
        radius: 4pt,
        stroke: 1pt + stroke,
        fill: fill,
        grid(
          columns: (48pt, 1fr),
          column-gutter: inset,
          align(center + horizon, image.decode(width: 60%, read("assets/warning.svg").replace("black", text_color.to-hex()))),
          align(left + horizon, body),
        )
      )
    )
  )
}

#let todo(body) = {
  bubble(text_color: rgb("#975E10"), fill: rgb("#FFEFD6"), stroke: rgb("#F9D9AD"), body)
}

#let info(body) = {
  bubble(text_color: rgb("#0C2BAE"), fill: rgb("#EBEFFD"), stroke: rgb("#A0ACDF"), body)
}

#let warn(body) = {
  bubble(text_color: rgb("#810707"), fill: rgb("#FBECEC"), stroke: rgb("#EDABAB"), body)
}
