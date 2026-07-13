#import "@preview/polylux:0.4.0": *

// الألوان المعتمدة للثيم الأكاديمي الفخم
#let accent1 = rgb("383B64")
#let accent2 = rgb("E8C872")
#let accent3 = rgb("80B9AD")
#let accent4 = rgb("B3E2A7")


// دالة كتل المحتوى التقني
#let titled-block(title: [], body, ..kwargs) = {
  block(
    width: 100%,
    stroke: 0.5pt + accent1.lighten(40%), 
    radius: 6pt,                          
    fill: accent1.lighten(95%),           
    clip: true,                           
    stack(
      dir: ttb,
      block(
        fill: accent1,                    
        width: 100%,
        inset: (x: 12pt, y: 12pt),
        text(fill: white, weight: "bold", size: 1em)[#title] 
      ),
      block(
        width: 100%,
        inset: (x: 12pt, top: 10pt, bottom: 12pt),
        body
      )
    )
  )
}

// إعدادات الخطوط والهوامش الافتراضية للشرائح
#let setup(body, short-title: [], short-speaker: []) = {
  set page(
    paper: "presentation-16-9",
    margin: 1em,
    footer: {
      set align(bottom)
      set text(size: .8em, fill: gray)
      short-title
      h(1fr)
      short-speaker
      h(3fr)
      toolbox.slide-number
      v(0.8em)
    },
  )
  show heading.where(level: 1): underline.with(
    background: true,
    stroke: (thickness: .3em, paint: accent2.lighten(50%), cap: "round"),
    evade: false,
    extent: .2em,
  )
  show heading.where(level: 1): set text(size: 30pt)
  show heading.where(level: 1): pad.with(right: 25pt)
  show heading: set block(below: 1em)
  body
}

// --- دالة سلايد الغلاف النظيفة والمصححة 100% ---
#let title-slide(
  title: [],
  speaker: [],
  conference: [],
  logo: none,
  title-align: center + horizon, 
  logo-align: center + horizon,  
) = slide({
  set page(margin: 0pt, footer: none)
  grid(
    columns: (1fr, 2fr),
    rows: (100%, ),
    gutter: 1.5em,
    
    // الجانب الأبيض (يحتوي على تفاصيل الشعار والمؤسسة التي مررتها)
    grid.cell(inset: 2.5em, align: logo-align, {
      if logo != none { logo }
    }), 
    
    // الجانب الكحلي الفخم (يحتوي على العبارة التعريفية، العنوان، وأسماء المناقشة)
    grid.cell(fill: accent1, inset: 2em, align: title-align)[
      #set text(fill: white)
      #block(width: 100%)[
        #text(size: 0.8em, fill: white.darken(10%))[#conference]
        #v(1cm)
        #title
        #v(1.5cm)
        #text(size: 0.75em)[#speaker]
      ]
    ]
  )
})