#import "@preview/htl3r-da:0.1.0" as htl3r

= Grundlagen
#htl3r.author("Viktor Kreuzer")

Der Autor des Kapitels muss explizit angegeben werden!

```typst
#htl3r.author("Max Mustermann")
```

== Abbildungen
Damit die Abbildungen mit richtigem Spacing auf der Seite angezeigt werden, müssen sie mit einer Funktion gewrappt werden.

Damit kann die Breite der Figure angepasst werden.
#htl3r.fspace(
  total_width: 50%,
  figure(image("../assets/16x9.png"), caption: [Beispielabbildung im Verhältnis 16:9]),
)
#pagebreak()
Mehrere Bilder können mit der 
#htl3r.fspace(
  figure(image("../assets/16x9.png"), caption: [Beispielabbildung im Verhältnis 16:9]),
  figure(image("../assets/1x1.png"), caption: [Beispielabbildung im Verhältnis 1:1]),
)
== 

= Wichtige Details
#htl3r.author("Viktor Kreuzer")
