#import "lib/settings.typ" as settings
#import "lib/pages.typ" as pages
#import "lib/util.typ" as util
#import "lib/abbr.typ" as abbr
#import "lib/global.typ" as global
#import "lib/bubble.typ" as bubble
#import "lib/validate.typ": validate
#import "lib/font.typ": check_missing_fonts
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

#let todo = bubble.todo
#let info = bubble.info
#let warn = bubble.warn

// TODO: fix bug with page counter not updating correctly after body
#let diplomarbeit(
  title: none,
  subtitle: none,
  department: none,
  school_year: none,
  authors: none,
  supervisor_incl_ac_degree: none,
  sponsors: none,
  date: none,
  abstract_german: none,
  abstract_english: none,
  generative_ai_clause: [Es wurden keine Hilfsmittel generativer KI-Tools für die Erstellung der Arbeit verwendet.],
  abbreviation: none,
  bibliography: none,
  print_ref: true,
  disable_cover: false,
  body,
) = context {
  // validate fonts
  let missing_fonts = check_missing_fonts()
  if missing_fonts.len() != 0 {
    panic("The following fonts couldn't be found on the system: " + missing_fonts.map(it => "'" + it + "'").join(", ", last: " and ") + "! " +
      "You may be able to download them from Google Fonts (https://fonts.google.com/).")
  }

  // validate arguments
  if not disable_cover {
    validate("title", title)
    validate("subtitle", subtitle)
    validate("department", department)
    validate("school_year", school_year)
    validate("authors", authors)
    validate("supervisor_incl_ac_degree", supervisor_incl_ac_degree)
    validate("sponsors", sponsors)
    validate("date", date)
    validate("abstract_german", abstract_german)
    validate("abstract_english", abstract_english)
    validate("generative_ai_clause", generative_ai_clause)
    validate("abbreviation", abbreviation)
    validate("bibliography", bibliography)
    validate("print_ref", print_ref)
    validate("disable_cover", disable_cover)
  }

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
    author: if disable_cover and authors == none {()} else { authors.map(v => v.name) },
  )
  show heading: h => {
    set text(
      font: settings.FONT_TEXT_DISPLAY,
      size: settings.HEADING_SIZES.at(h.level - 1).size,
    )
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
    lang: "de",
  )
  set figure(numbering: "1.1")
  show figure: set block(breakable: true)
  // show link: underline
  if not disable_cover {
    set page(
      paper: "a4",
      margin: (
        top: settings.PAGE_MARGIN_VERTICAL,
        bottom: settings.PAGE_MARGIN_VERTICAL,
        inside: settings.PAGE_MARGIN_OUTER,
        outside: settings.PAGE_MARGIN_OUTER,
      ),
    )
    pages.cover.create_page(
      title: title,
      subtitle: subtitle,
      department: department,
      school_year: school_year,
      authors: authors,
      date: date,
    )
    util.insert_blank_page()
  }
  set page(
    paper: "a4",
    margin: (
      top: settings.PAGE_MARGIN_VERTICAL,
      bottom: settings.PAGE_MARGIN_VERTICAL,
      inside: if disable_cover { settings.PAGE_MARGIN_OUTER } else { settings.PAGE_MARGIN_OUTER },
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
      let before = (..before_l1, ..before_l2).sorted(
        key: it => it.location().page(),
      )
      let reference = none
      if after.len() > 0 and after.first().location().page() == page_number {
        reference = after.first()
      } else if before.len() > 0 {
        reference = before.last()
      }

      let current = box(height: 28pt, align(left + horizon, reference.body))
      if calc.odd(page_number) or disable_cover {
        [#current #h(1fr) #box(
            height: 28pt,
            image("lib/assets/htl3r_logo.svg"),
          )]
      } else {
        [#box(
            height: 28pt,
            image("lib/assets/htl3r_logo.svg"),
          ) #h(1fr) #current]
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
    },
  )
  show page: p => {
    let i = counter(page).at(here()).first()
    let is-odd = calc.odd(i)
    set page(binding: if is-odd { right } else { left })
  }
  if not disable_cover {
    pages.abstract.create_page(abstract_german, abstract_english)
    util.insert_blank_page()
    pages.preamble.create_page(supervisor_incl_ac_degree, sponsors)
    util.insert_blank_page()
    pages.sworn_statement.create_page(authors, date, generative_ai_clause)
    util.insert_blank_page()
    pages.create_tables()
    util.insert_blank_page()
  }
  counter(page).update(1)
  set page(
    footer: context {
      let page_text = counter(page).display("1")
      let is-odd = calc.odd(counter(page).get().first())
      let author = global.author.get()
      line(length: 100%, stroke: 0.5pt)
      v(-5pt)
      if is-odd or disable_cover [
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
    },
  )
  set heading(numbering: "1.1")
  body
  if not disable_cover {
    util.insert_blank_page()
    set heading(numbering: none)
    if abbreviation != none {
      pages.abbreviation.create_page()
      util.insert_blank_page()
      pages.glossary.create_page()
      util.insert_blank_page()
    }
    if bibliography != none {
      pages.bibliography.create_page(bibliography: bibliography)
      util.insert_blank_page()
    }
  }
  if print_ref {
    pages.printref.create_page()
  } else if not disable_cover {
    util.blank_page()
  }
}
