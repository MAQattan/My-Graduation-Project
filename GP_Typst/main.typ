
// Call up the cover page first (it will automatically take its independent settings)
#include "front-cover.typ"
#page(footer: none)[]

// Move to a new page and set the internal thesis settings completely
#pagebreak()
#set page(
  paper: "a4",
  margin: (inside: 4cm, outside: 2cm, top: 2cm, bottom: 3cm), 
  
    // Numbering and chapter name in the header/footer with dynamic style detection
    footer: context {
    let page_num = counter(page).get().first()
    
    // 1. Get the active numbering format of the current page (e.g., "i" or "1")
    let fmt = here().page-numbering()
    
    // 2. Format the page integer based on the active style
    let page_str = if fmt != none { numbering(fmt, page_num) } else { str(page_num) }
    
    // Check if the current page format is Roman (preliminary sections)
    if fmt == "i" {
      // Hide the page number on the very first page (Inner Cover)
      if page_num == 1 { none } else { align(center)[#page_str] }
    } else {
      // Main chapters layout (Arabic numerals with alternating sides)
      let chapters = query(heading.where(level: 1).before(here())).filter(it => it.numbering != none)
      let ch_index = chapters.len() // The array length represents the current chapter number

      if calc.odd(page_num) {
        // Odd pages: Display Chapter Title (e.g., مقدمة المشروع)
        let current_title = if ch_index > 0 { chapters.last().body } else [المقدمة]
        align(right)[#page_str #h(6pt) | #h(6pt) #current_title]
      } else {
        // Even pages: Display Chapter Number prefix (e.g., الفصل ١)
        let current_num = if ch_index > 0 [الفصل #numbering("1", ch_index)] else [الفصل 1]
        align(left)[#current_num #h(6pt) | #h(6pt) #page_str]
      }
    }
  }
)

// ضبط خط المتن الافتراضي للأطروحة باللغة العربية
#set text(font: "IBM Plex Sans Arabic", size: 12pt, lang: "ar", dir: rtl)
#set par(justify: true, leading: 0.8em) // ضبط حواف النصوص وتباعد الأسطر المريح للعين

#show link: set text(fill: blue.darken(20%))
#show link: it => if type(it.dest) == "string" {
  // Enable auto-wrapping for web URLs
  link(it.dest)[#it.body]
} else { it }

// Set page numbering to lowercase Roman numerals for preliminary pages
#set page(numbering: "i")
#counter(page).update(1)

#include "inner-cover.typ"
#page(footer: none)[]

#include "Dedication.typ"
#pagebreak(weak: true)

#include "Acknowledgments.typ"
#pagebreak(weak: true)

#include "Abstract.typ"
#pagebreak(weak: true)

#include "List of Symbols.typ"
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


// --- Heading Numbering and Layout Styling (Model B - Up to Level 3) ---

// Enable automatic numbering depth up to 3 levels (e.g., 1.1.1)
#set heading(numbering: "1.1.1")

#show heading: it => {
  if it.level == 1 {
    if it.numbering != none {
    v(1cm)
    align(center)[
      #text(size: 60pt, weight: "bold")[#counter(heading).display("1")] \
      #v(0cm)
      #text(size: 30pt, weight: "bold")[#it.body]
    ]
    v(1cm) // Generous 2cm gap before chapter body text
    } else {
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
    v(0.5em)
    
  } else if it.level == 4 {
    // Depth 4 (e.g., ==== Title) -> Unnumbered, slightly smaller but distinct
    v(0.8em)
    text(size: 14pt, weight: "bold")[#it.body]
    v(0.4em)
    
  } else {
    // Depth 5 and beyond -> Same as body size but Bold and Italicized
    v(0.6em)
    text(size: 12pt, weight: "bold")[#it.body]
    v(0.3em)
  }
}



#include "chapters/ch02/ch02.typ"
#pagebreak(weak: true)

#include "chapters/ch03/ch03.typ"
#pagebreak(weak: true)

#include "chapters/ch10.typ"
#pagebreak(weak: true)


// References Section (Bibliography) with IEEE style formatting
#bibliography("bibliography.bib", title: [المراجع والمصادر], style: "ieee")

#page(footer: none)[]
#include "back-cover.typ"