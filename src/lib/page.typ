#import "page/cover.typ" as cover
#import "page/abstract.typ" as abstract
#import "page/preamble.typ" as preamble
#import "page/erklaerung.typ" as erklaerung
#import "page/toc.typ" as toc
#import "page/tot.typ" as tot
#import "page/tof.typ" as tof
#import "page/tol.typ" as tol
#import "page/abbreviation.typ" as abbrev
#import "page/glossary.typ" as glossary
#import "page/bibliography.typ" as bib
#import "page/printref.typ" as printref

#let create_tables() = {
  toc.create_page()
  tot.create_page()
  tof.create_page()
  tol.create_page()
}
