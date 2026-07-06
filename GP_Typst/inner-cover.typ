// --- Independent page settings for the inner white cover ---
#set page(
  paper: "a4",
  fill: white, // Standard academic white background
  // margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 3cm)
)
#set text(font: "IBM Plex Sans Arabic", fill: black, dir: rtl)

// 1. Header Section (Official Text on the right, Logos on the left)
#grid(
  columns: (auto, 1fr, auto),
  gutter: 20pt,

  align(center + top)[
    #image("Figures/AU-Logo_V.png", height: 3.2cm)
  ],
  
  // Right Column: Official Academic Hierarchy
  align(center + top)[
    #v(0.3cm)
    #set text(size: 10pt, weight: "medium")
    #stack(
      dir: ttb,
      spacing: 9pt,
      [الجمهورية العربية السورية],
      [وزارة التعليم العالي والبحث العلمي],
      [جامعة حلب],
      [كلية الهندسة الكهربائية والإلكترونية],
      [قسم هندسة نظم القدرة الكهربائية]
    )
  ],
  
  // Left Column: University & Faculty Logos side-by-side
  align(center + top)[
      #image("Figures/FEEE-Logo_V.png", height: 3.2cm)
  ]
)

#v(3.5cm) // Generous vertical space before the title

// 2. Project Title Section (Bilingual is mandatory inside)
#align(center)[
  #text(size: 26pt, weight: "bold")[تصميم وتحليل أداء منظومة طاقة شمسية مرتبطة بالشبكة]
  
  #v(0.8cm)
  
  #text(size: 18pt, weight: "semibold")[
    Design and Performance Analysis of a Grid-Tied Solar Power System
  ]
]

#v(2cm)

// 3. Academic Purpose Statement
#align(center)[
  #text(size: 13pt, style: "normal")[
    مشروع تخرج أُعِدَّ لنيل درجة الإجازة في الهندسة الكهربائية والإلكترونية \
    (اختصاص هندسة نظم القدرة الكهربائية)
  ]
]

#v(1fr) // Dynamically pushes the names section to the lower third

// 4. Names Section (Symmetrical and clear layout)
#grid(
  columns: (1fr, 1fr),
  gutter: 40pt,
  
  // Right side: Student Info
  align(center)[
    #stack(
      dir: ttb,
      spacing: 10pt,
      text(size: 13pt, fill: gray.darken(30%))[إعداد الطالب:],
      text(size: 15pt, weight: "bold")[محمد علي قطان]
    )
  ],
  
  // Left side: Supervisor Info
  align(center)[
    #stack(
      dir: ttb,
      spacing: 10pt,
      text(size: 13pt, fill: gray.darken(30%))[إشراف:],
      text(size: 15pt, weight: "bold")[د. كريمة سكر]
    )
  ]
)

#v(1.5cm)

// 5. Academic Year Footer
#align(center)[
  #text(size: 13pt, weight: "medium")[1448 هـ  —  2026 م]
]