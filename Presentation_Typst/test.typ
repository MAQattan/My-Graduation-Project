#import "@preview/polylux:0.4.0": *
#import "lib.typ" as friendly
#import friendly: titled-block


#slide[
  #set align(horizon)
  #block(
    width: 100%,
    inset: (x: 15pt, y: 12pt),
    radius: 6pt,
    fill: rgb("637A9F").lighten(92%),
    stroke: (right: 4pt + rgb("637A9F")), 
    [
      #set text(size: 15.5pt, style: "italic")
      نص الختام
    ]
  )

  #v(0.5cm) 

  #align(center)[
    #block(
      width: 85%,
      stroke: 2pt + gradient.linear(rgb("637A9F"), rgb("637A9F").lighten(50%)),
      radius: 12pt,
      inset: (top: 25pt, bottom: 28pt, x: 20pt),
      fill: white,
      [
        #text(size: 26pt, weight: "bold", fill: rgb("637A9F"))[شكر وتقدير]
        #v(0.6em)
        #text(size: 18pt, weight: "medium", fill: gray.darken(50%))[
          نتقدم بخالص الشكر والامتنان إلى جميع المشرفين على رمايتهم العلمية وتوجيهاتهم القيمة \
          وشكر خاص إلى *الدكتورة كريمة سكر* على إشرافها المباشر على المشروع وتقديمها الدعم الفني والإرشاد العلمي 
        ]
        #v(1em)
        #line(length: 35%, stroke: 0.8pt + rgb("637A9F").lighten(50%))
        #v(0.8em)
        #text(size: 24pt, weight: "bold", fill: rgb("637A9F").darken(15%))[
          شكراً لكم على حسن استماعكم وإصغائكم
        ]
      ]
    )
  ]

  #place(
    bottom + center,
    dy: -10pt,
    [
      #set text(size: 12.5pt, fill: gray.darken(20%), weight: "medium")
      #grid(
        columns: (1fr, 1fr),
        gutter: 220pt, 
        [إشراف الدكتورة: كريمة سكر],
        [إعداد الطالب: محمد علي قطان]
      )
    ]
  )
]