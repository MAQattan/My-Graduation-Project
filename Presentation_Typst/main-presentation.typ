#import "@preview/polylux:0.4.0": *
#import "lib.typ" as friendly
#import friendly: titled-block

// 1. إعدادات الخط واللغة العربية لدعم العرض هندسياً
#show: friendly.setup.with(
  short-title: [مشروع تخرج أُعِدَّ لنيل درجة الإجازة في الهندسة الكهربائية والإلكترونية],
  short-speaker: [محمد علي قطان],
)
#set text(size: 14pt, font: "IBM Plex Sans Arabic", lang: "ar", dir: rtl)
#show math.equation: set text(font: "New Computer Modern Math") // لضمان تنسيق المعادلات



#show figure.caption: it => {
  set text(size: 9pt, fill: gray.darken(85%))
  strong([#it.supplement #context it.counter.display(it.numbering)])
  [ ] // A space separating the numbering from the description, instead of a colon.
  it.body
}
// Custom reference style for citations (e.g., [1], [2], etc.)
#show ref: set text(fill: rgb("#1B365D"), weight: "bold")
// Custom figure numbering logic to include chapter numbers
#set figure(
  supplement: [الشكل],
  numbering: (..args) => context {
    // حساب عدد الفصول (Heading Level 1) المسبوقة حتى موقع الصورة الحالي
    let chapters = query(heading.where(level: 1).before(here())).filter(it => it.numbering != none)
    let ch_index = chapters.len()
    
    if ch_index > 0 {
      // دمج رقم الفصل مع رقم الصورة برمجياً كـ String لضمان اختفاء المسافات تماماً
      str(ch_index) + "-" + str(args.pos().first())
    } else {
      str(args.pos().first())
    }
  }
)





#include "title-slide.typ"

#include "part-1.typ"
#include "part-2.typ"
#include "part-3.typ"
// #include "part-4.typ"



#include "test.typ"







