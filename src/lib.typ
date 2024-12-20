#import "lib/settings.typ" as settings
#import "lib/page/cover.typ" as cover
#import "lib/page/abstract.typ" as abstract
#import "lib/page/preamble.typ" as preamble
#import "lib/page/erklaerung.typ" as erklaerung
#import "lib/page/toc.typ" as toc
#import "lib/page/tot.typ" as tot
#import "lib/page/tof.typ" as tof
#import "lib/page/tol.typ" as tol
#import "lib/page/abbreviation.typ" as abbrev
#import "lib/page/glossary.typ" as glossary
#import "lib/page/bibliography.typ" as bib
#import "lib/page/printref.typ" as printref
#import "lib/util.typ" as util
#import "lib/abbr.typ" as abbr
#import "lib/global.typ" as global
#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *

#let author = util.author
#let fspace = util.fspace
#let code = util.code
#let code_file = util.code_file

#let short = abbr.short
#let shortpl = abbr.shortpl
#let long = abbr.long
#let longpl = abbr.longpl

// TODO: fix bug with page counter not updating correctly after body
#let diplomarbeit(
  title: "Meine Diplomarbeit",
  subtitle: "Wir sind super toll!",
  department: "ITN",
  school_year: "2024/2025",
  authors: (
    (name: "Max Mustermann", supervisor: "Otto Normalverbraucher", role: "Projektleiter"),
    (name: "Erika Mustermann", supervisor: "Lieschen Müller", role: "Stv. Projektleiter"),
  ),
  supervisor_incl_ac_degree: ("Prof, Dipl.-Ing. Otto Normalverbraucher", "Prof, Dipl.-Ing. Lieschen Müller"),
  sponsors: ("Knallhart GmbH", "Gartenbedarfs GmbH", "Huber e.U.", "Huberit Vetrieb GmbH & Co. KG"),
  date: datetime(year: 2024, month: 12, day: 1),
  print_ref: true,
  abstract_german: [#lorem(180)],
  abstract_english: [#lorem(180)],
  generative_ai_clause: [Es wurden keine Hilfsmittel generativer KI-Tools für die Erstellung der Arbeit verwendet.],
  abbreviation: none,
  bibliography: none,
  body,
) = context {
  // validate
  assert(("ITN", "ITM", "M").contains(department), message: "Abteilung muss entweder \"ITN\", \"ITM\" oder \"M\" sein.")

  // state
  global.abbr.update(abbreviation)

  // document
  show: codly-init.with()
  codly(
    display-icon: false,
    zebra-fill: none,
    number-align: left + top,
    lang-format: none,
    breakable: true,
    header-cell-args: (align: left, fill: luma(240)),
    header-repeat: true,
  )
  set document(
    title: title,
    author: authors.map((v) => v.name),
  )
  show heading: h => {
    set text(font: settings.FONT_TEXT_DISPLAY, size: settings.HEADING_SIZES.at(h.level - 1).size)
    if h.level == 1 {
      pagebreak(weak: true)
    }
    v(settings.HEADING_SIZES.at(h.level - 1).top)
    h
    v(settings.HEADING_SIZES.at(h.level - 1).bottom)
  }
  set par(justify: true)
  set text(
    font: settings.FONT_TEXT_BODY,
    size: settings.FONT_SIZE,
    lang: "de"
  )
  set figure(numbering: "1.1",)
  show figure: set par(justify: false)
  show figure: set block(breakable: true)
  // show link: underline
  set page(
    paper: "a4",
    margin: (
      top: settings.PAGE_MARGIN_VERTICAL,
      bottom: settings.PAGE_MARGIN_VERTICAL,
      inside: settings.PAGE_MARGIN_OUTER,
      outside: settings.PAGE_MARGIN_OUTER,
    ),
  )
  cover.create_page(
    title: title,
    subtitle: subtitle,
    department: department,
    school_year: school_year,
    authors: authors,
    date: date,
  )
  set page(
    paper: "a4",
    margin: (
      top: settings.PAGE_MARGIN_VERTICAL,
      bottom: settings.PAGE_MARGIN_VERTICAL,
      inside: settings.PAGE_MARGIN_INNER,
      outside: settings.PAGE_MARGIN_OUTER,
    ),
  )
  set page(
    header-ascent: 1cm,
    header: context {
      let page_number = here().page()
      let after = query(heading.where(level: 1).after(here()))
      let before_l1 = query(heading.where(level: 1).before(here()))
      let before_l2 = query(heading.where(level: 2).before(here()))
      let before = (..before_l1, ..before_l2).sorted(key: it => it.location().page())
      let reference = none
      if after.len() > 0 and after.first().location().page() == page_number {
        reference = after.first()
      } else if before.len() > 0 {
        reference = before.last()
      }

      let current = box(height: 28pt, align(left + horizon, reference.body))
      if calc.odd(page_number) {
        [#current #h(1fr) #box(height: 28pt, image("lib/assets/htl3r_logo.svg"))]
      } else {
        [#box(height: 28pt, image("lib/assets/htl3r_logo.svg")) #h(1fr) #current]
      }
      v(-5pt)
      line(length: 100%, stroke: 0.5pt)
    },
    footer-descent: 1cm,
    footer: context {
      let counter = counter(page)
      let is-odd = calc.odd(counter.at(here()).first())
      let aln = if is-odd {
        right
      } else {
        left
      }
      line(length: 100%, stroke: 0.5pt)
      v(-5pt)
      [#align(aln)[#counter.display("i")]]
    }
  )
  show page: p => {
    let i = counter(page).at(here()).first()
    let is-odd = calc.odd(i)
    set page(binding: if is-odd { right } else { left })
  }
  abstract.create_page(abstract_german, abstract_english)
  preamble.create_page(supervisor_incl_ac_degree, sponsors)
  erklaerung.create_page(authors, date, generative_ai_clause)
  util.blank_page()
  toc.create_page()
  tot.create_page()
  tof.create_page()
  tol.create_page()
  text[#metadata("DA_BEGIN")<DA_BEGIN>]
  counter(page).update(1)
  set page(
    footer: context {
      let page_text = counter(page).display("1")
      let is-odd = calc.odd(counter(page).get().first())
      let author = global.author.get()
      line(length: 100%, stroke: 0.5pt)
      v(-5pt)
      if is-odd [
        #if author != none [
          Autor: #author
        ]
        #h(1fr)
        #page_text
      ] else [
        #page_text
        #h(1fr)
        #if author != none [
          Autor: #author
        ]
      ]
    }
  )
  set heading(numbering: "1.1")
  let page_count_begin = counter(page).get().first()
  body
  if not calc.odd(counter(page).get().first() - page_count_begin) {
    util.blank_page()
  }
  set heading(numbering: none)
  if abbreviation != none {
    abbrev.create_page()
    glossary.create_page()
  }
  if bibliography != none {
    bib.create_page(bibliography: bibliography)
  }
  if print_ref {
    printref.create_page()
  } else {
    util.blank_page()
  }
}
