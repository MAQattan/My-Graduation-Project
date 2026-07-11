
#let setup_thesis(body) = {

  set page(
    paper: "a4",
    margin: (inside: 4cm, outside: 2cm, top: 2cm, bottom: 3cm), 
    
      // Numbering and chapter name in the header/footer with dynamic style detection
      footer: context {
      let page_num = counter(page).get().first()
      
      // 1. Get the active numbering format of the current page (e.g., "i" or "1")
      let fmt = here().page-numbering()
      
      // 2. Format the page integer based on the active style
      let page_str = if fmt != none { numbering(fmt, page_num) } else { str(page_num) }
      
      if fmt == none {
        // 1. إذا لم يتم تحديد نمط ترقيم (مثل الغلاف)، لا تطبع أي شيء
        none
      // Check if the current page format is Roman (preliminary sections)
      } else if fmt == "i" {
        // Hide the page number on the very first page (Inner Cover)
        if page_num == 1 { none } else { align(center)[#page_str] }
      } else {
        // Main chapters layout (Arabic numerals with alternating sides)
        let chapters = query(heading.where(level: 1).before(here())).filter(it => it.numbering != none)
        let ch_index = chapters.len() // The array length represents the current chapter number

        if calc.odd(page_num) {
          // Odd pages: Display Chapter Title (e.g., مقدمة المشروع)
          let current_title = if ch_index > 0 { chapters.last().body } else [المقدمة]
          align(right)[#page_str #h(4pt) | #h(4pt) #current_title]
        } else {
          // Even pages: Display Chapter Number prefix (e.g., الفصل ١)
          let current_num = if ch_index > 0 [الفصل #numbering("1", ch_index)] else [الفصل 1]
          align(left)[#current_num #h(4pt) | #h(4pt) #page_str]
        }
      }
    }
  )

  // ضبط خط المتن الافتراضي للأطروحة باللغة العربية
  set text(font: "IBM Plex Sans Arabic", size: 12pt, lang: "ar", dir: rtl)
  set par(justify: true, leading: 0.8em) // ضبط حواف النصوص وتباعد الأسطر المريح للعين

  show link: set text(fill: blue.darken(20%))
  show link: it => if type(it.dest) == "string" {
    // Enable auto-wrapping for web URLs
    link(it.dest)[#it.body]
  } else { it }



set heading(numbering: "1.1.1")
// خيار 2: إلغاء التمدد حصرياً لعناوين الفصول الرئيسية (المستوى الأول) فقط
show heading.where(): set par(justify: false)

show heading: it => {
  if it.level == 1 {
    if it.numbering != none [

    // الحل الجذري: تصفير عداد الصور والجداول بأسمائهم البرمجية الدقيقة
    #counter(figure.where(kind: image)).update(0)
    #counter(figure.where(kind: table)).update(0)    

    #v(1cm)
    #align(center)[
      #text(size: 60pt, weight: "bold")[#counter(heading).display("1")] \
      #v(0cm)
      #text(size: 30pt, weight: "bold")[#it.body]
    ]
    #v(1cm) // Generous 2cm gap before chapter body text
    ] else {
      // Elegant centered style for unnumbered Level 1 headings like Bibliography
      v(1cm)
      align(center)[
        #text(size: 30pt, weight: "bold")[#it.body]
      ]
      v(1cm)
    }
  } else if it.level == 2 {
    // First sublevel (e.g., == Title) -> 1.1 Title
    v(1.2em)
    text(size: 20pt, weight: "bold")[
      // #counter(heading).display("1.1") 
      #it.body
    ]
    v(0.6em)
    
    // --- Update this specific part inside your #show heading rule ---
  } else if it.level == 3 {
    // Depth 3 (e.g., === Title) -> 1.1.1 Title (Prominent Sub-section)
    v(1em)
    text(size: 15pt, weight: "bold")[
    // #context counter(heading).get().at(2) #h(0.5em)
    #it.body
    ]
    v(0.3em)
    
  } else if it.level == 4 {
    // Depth 4 (e.g., ==== Title) -> Unnumbered, slightly smaller but distinct
    v(0.8em)
    text(size: 14pt, weight: "bold")[#it.body]
    v(0.2em)
    
  } else {
    // Depth 5 and beyond -> Same as body size but Bold and Italicized
    v(0.6em)
    text(size: 12pt, weight: "bold")[#it.body]
    // v(0.3em)
  }
}

// Custom figure caption style with Arabic numbering and "الشكل" prefix
show figure.caption: it => {
  set text(size: 9pt, fill: gray.darken(85%))
  strong([#it.supplement #context it.counter.display(it.numbering)])
  [ ] // A space separating the numbering from the description, instead of a colon.
  it.body
}
// Custom reference style for citations (e.g., [1], [2], etc.)
show ref: set text(fill: rgb("#1B365D"), weight: "bold")
// Custom figure numbering logic to include chapter numbers
set figure(
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

set list(marker: ([•], [◦], [-]))



show outline.entry: it => {
  // 1. التأكد أولاً أن هذا المدخل ينتمي إلى عنوان (Heading) وليس إلى شكل أو جدول
  if it.element.func() == heading {
    
    // الحل الأوتوماتيكي الذكي: جلب رقم الصفحة وتطبيق تنسيقها النشط (لاتيني أو عربي) تلقائياً
    let loc = it.element.location()
    let page_num = counter(page).at(loc).first()
    let fmt = loc.page-numbering()
    let page_str = if fmt != none { numbering(fmt, page_num) } else { str(page_num) }

    // ---------------------------------------------------------
    // تخصيص المستوى الأول (عناوين الفصول الرئيسية فقط)
    // ---------------------------------------------------------
    if it.level == 1 {
      v(2em) 
      
      align(center)[
        #context {
          if it.element.numbering != none {
            let ch_num = counter(heading).at(loc).first()
            text(size: 32pt, weight: "bold", fill: rgb("#1E3A8A"))[#str(ch_num)]
            v(-2em)
          }
        }
        #text(size: 17pt, weight: "bold", fill: rgb("#1E3A8A"))[#it.element.body] 
        #v(0.6em)
        #text(size: 10.5pt, weight: "regular", fill: rgb("#64748B"))[
          — صفحة #page_str —
        ]
      ]
      v(1.5em) 
    } 
    // ---------------------------------------------------------
    // تخصيص المستوى الثاني (العناوين الفرعية الأولى)
    // ---------------------------------------------------------
    else if it.level == 2 {
      v(0.6em) 
      show link: set text(size: 11pt, weight: "medium", fill: rgb("#1E293B"))
      link(loc)[
        #grid(
          columns: (auto, 1fr, auto), 
          align: (right + horizon, center + horizon, left + horizon),
          [#h(1.5em)#it.element.body], 
          [#box(width: 100%, it.fill)], 
          [#page_str] // سيتغير الآن تلقائياً إلى i, ii, iii في الصفحات التمهيدية
        )
      ]
    } 
    // ---------------------------------------------------------
    // تخصيص المستوى الثالث (الفقرات الفرعية الدقيقة)
    // ---------------------------------------------------------
    else if it.level == 3 {
      v(0.6em) 
      show link: set text(size: 10pt, weight: "regular", fill: rgb("#475569"))
      link(loc)[
        #grid(
          columns: (auto, 1fr, auto),
          align: (right + horizon, center + horizon, left + horizon),
          [#h(3.2em)#it.element.body], 
          [#box(width: 100%, it.fill)],
          [#page_str] // وهنا أيضاً سيعمل بشكل أوتوماتيكي بالكامل
        )
      ]
    } 
    else {
      it
    }

  } else if it.element.func() == figure {
    let loc = it.element.location()
    let page_num = counter(page).at(loc).first()
    let fmt = loc.page-numbering()
    let page_str = if fmt != none { numbering(fmt, page_num) } else { str(page_num) }
    
    let chapters = query(heading.where(level: 1).before(loc)).filter(ch => ch.numbering != none)
    let ch_index = chapters.len()
    let fig_num = counter(figure.where(kind: it.element.kind)).at(loc).first()
    
    let full_number = if ch_index > 0 {
      str(ch_index) + "-" + str(fig_num)
    } else {
      str(fig_num)
    }
    
    v(0.6em) 
    show link: set text(size: 11pt, weight: "regular", fill: rgb("#1E293B")) 
    
    link(loc)[
      #block(width: 100%)[
        #it.element.supplement #full_number #h(0em) : #if it.element.caption != none { it.element.caption.body } else [] \u{200f} #box(width: 1fr, it.fill) \u{200f} #page_str
      ]
    ]
  } else {
    it
  }
}









  body
}