#import "settings.typ" as settings

#let is_font_missing(font) = {
  measure(text(font: font, fallback: false)[WIDTH]).width == 0pt
}

/// Returns an array of missing fonts
#let check_missing_fonts() = {
  (settings.FONT_TEXT_BODY, settings.FONT_TEXT_DISPLAY, settings.FONT_TEXT_RAW)
    .dedup()
    .filter(it => is_font_missing(it))
}
