
#import "template.typ": setup_thesis
#show: setup_thesis

// Call up the cover page first (it will automatically take its independent settings)
#include "front-cover.typ"
#page(footer: none)[]

// Move to a new page and set the internal thesis settings completely
// #pagebreak()

// Set page numbering to lowercase Roman numerals for preliminary pages
#set page(numbering: "i")
#counter(page).update(1)

#include "inner-cover.typ"
#page(footer: none)[]

#include "Verse.typ"
#pagebreak(weak: true)

#include "Dedication.typ"
#pagebreak(weak: true)

#include "Acknowledgments.typ"
#pagebreak(weak: true)

#include "Abstract.typ"
#pagebreak(weak: true)


// Generate academic outlines automatically
#outline(title: [المحتويات], depth: 3, indent: 1.5em)
#pagebreak(weak: true)

#outline(title: [الأشكال], target: figure.where(kind: image))
#pagebreak(weak: true)

#outline(title: [الجداول], target: figure.where(kind: table))
#pagebreak(weak: true)


// Reset page counter and switch to arabic numerals right before Chapter 1
#set page(numbering: "1")
#counter(page).update(1)



#include "chapters/ch01/ch01.typ"
#pagebreak(weak: true)

#include "chapters/ch02/ch02.typ"
#pagebreak(weak: true)

#include "chapters/ch03/ch03.typ"
#pagebreak(weak: true)

#include "chapters/ch04/ch04.typ"
#pagebreak(weak: true)

#include "chapters/ch05/ch05.typ"
#pagebreak(weak: true)

#include "chapters/ch06/ch06.typ"
#pagebreak(weak: true)

#include "chapters/ch07/ch07.typ"
#pagebreak(weak: true)

#include "chapters/ch08/ch08.typ"
#pagebreak(weak: true)

#include "chapters/ch09/ch09.typ"
#pagebreak(weak: true)

#include "chapters/ch10/ch10.typ"
#pagebreak(weak: true)

#include "chapters/ch11/ch11.typ"
#pagebreak(weak: true)

#include "Appendices/Appendices.typ"
#pagebreak(weak: true)

// References Section (Bibliography) with IEEE style formatting
// جلب المراجع بشكل مخفي لإجبارها على الظهور في القائمة النهائية دون ترك أثر في المتن
#cite(<stapleton2026grid>, form: none)
#cite(<chen2026solar>, form: none)
#cite(<mohamed2026photovoltaic>, form: none)
#cite(<eltahan2026course>, form: none)
#cite(<solana2026distance>, form: none)
#cite(<youssef2026guidelines>, form: none)
#cite(<gses2026design>, form: none)

// استدعاء طباعة المراجع والمصادر بنمط IEEE
#bibliography("bibliography.bib", title: [المراجع والمصادر], style: "ieee")

#page(footer: none)[]
#include "back-cover.typ"