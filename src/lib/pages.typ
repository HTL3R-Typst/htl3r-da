#import "pages/cover.typ" as cover
#import "pages/abstract.typ" as abstract
#import "pages/preamble.typ" as preamble
#import "pages/sworn_statement.typ" as sworn_statement
#import "pages/toc.typ" as toc
#import "pages/tot.typ" as tot
#import "pages/tof.typ" as tof
#import "pages/tol.typ" as tol
#import "pages/abbreviation.typ" as abbreviation
#import "pages/glossary.typ" as glossary
#import "pages/bibliography.typ" as bibliography
#import "pages/printref.typ" as printref

#let create_tables() = {
  toc.create_page()
  tot.create_page()
  tof.create_page()
  tol.create_page()
}
