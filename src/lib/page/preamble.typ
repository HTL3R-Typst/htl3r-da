#import "../util.typ": blank_page

#let create_page(
  betreuer,
  sponsoren,
) = [
  #blank_page()
  = Präambel
  Die Inhalte dieser Diplomarbeit entsprechen § 7(1) und § 24 der Verordnung des
  Bundesministers für Bildung über die abschließenden Prüfungen in den berufsbildenden
  mittleren und höheren Schulen (Prüfungsordnung BMHS) vom 30.5.2012 (BGBl. Nr.
  II 177/2012) in der derzeit geltenden Fassung.
  #v(2em)
  #strong[Liste der betreuenden Lehrer:] \
  #for b in betreuer [
    #b \
  ]
  #v(2em)
  #strong[Liste der Kooperationspartner:] \
  #for s in sponsoren [
    #s \
  ]
]
