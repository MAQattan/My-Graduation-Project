
// --- Independent page settings for the back cover ---

// Disable the justify property to avoid stretched English text in bad way
#set par(justify: false)

#set page(
  paper: "a4",
  fill: rgb("#383B64"), // Premium deep color matching the front cover
  margin: (top: 3.5cm, bottom: 2.5cm, left: 4.5cm, right: 2.5cm),
  // Disable inherited footer and header from the main file completely
  footer: none, 
  header: none  

)
#set text(font: "IBM Plex Sans Arabic", fill: white, dir: ltr, tracking: 0pt) // Switched to Ltr for English And Reset tracking to 0pt to avoid stretched English text

// 1. Top Section
#align(center)[
  #text(size: 12pt, weight: "bold", tracking: 1.5pt, fill: rgb("#fae3a5"))[
    A Graduation Project Submitted for the Degree of Bachelor in Electrical and Electronic Engineering
  ]
]

#v(2.5cm)

// 2. Huge Main Title
#align(center)[
  #block(width: 100%)[
    #set text(size: 35pt, weight: "bold")
    Design and Performance Analysis of a Grid-Tied Solar Power System
  ]
]

#v(1cm)

// 3. Professional Icon Grid using external SVG files
#align(center)[
  #grid(
    columns: (auto, auto, auto, auto),
    gutter: 22pt,
    image("Figures/panel.svg", width: 2.3cm),
    image("Figures/activity.svg", width: 2.3cm),
    image("Figures/gauge.svg", width: 2.3cm),
    image("Figures/zap.svg", width: 2.3cm),
  )
]

#v(1fr) // Pushes content to the bottom smoothly

// 4. Bottom Section
#align(center)[
  #text(size: 11pt, weight: "medium", tracking: 1pt, fill: white.darken(20%))[
    University of Aleppo — Faculty of Electrical and Electronic Engineering
  ]
  #v(0.3cm)
  #line(length: 100%, stroke: 8pt + white) // Thick elegant white line matching the front design
  #v(0.5cm)
  
  // Student and Supervisor names aligned symmetrically
  #grid(
    columns: (1fr, 1fr),
    gutter: 50pt,
    
    // First column: Student Info
    align(center)[
      #stack(
        dir: ttb,
        spacing: 12pt,
        text(size: 14pt, fill: rgb("#fae3a5"))[Prepared by:],
        text(size: 16pt, weight: "bold")[Muhammad Ali Qattan]
      )
    ],
    
    // Second column: Supervisor Info
    align(center)[
      #stack(
        dir: ttb,
        spacing: 12pt,
        text(size: 14pt, fill: rgb("#fae3a5"))[Supervised by:],
        text(size: 15pt, weight: "bold")[Dr. Karima Sukkar]
      )
    ]
  )
  #v(1.2cm)
  #text(size: 13pt, fill: white.darken(40%))[2026 CE — 1448 AH]
]