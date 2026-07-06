// --- إعدادات صفحة الغلاف المستقلة ---
#set page(
  paper: "a4",
  fill: rgb("#383B64"), // الدرجة الفخمة التي اخترتها
  margin: (top: 3.5cm, bottom: 2.5cm, left: 2.5cm, right: 4.5cm)
)
#set text(font: "IBM Plex Sans Arabic", fill: white, dir: rtl)

// 1. الجزء العلوي
#align(center)[
  #text(size: 12pt, weight: "bold", tracking: 1pt, fill: rgb("#fae3a5"))[
    مشروع تخرج أُعِدَّ لنيل درجة الإجازة في الهندسة الكهربائية والإلكترونية
  ]
]

#v(3.5cm) 

// 2. العنوان الرئيسي الضخم
#align(center)[
  #block(width: 100%)[
    #set text(size: 45pt, weight: "bold")
    تصميم وتحليل أداء منظومة طاقة شمسية مرتبطة بالشبكة
  ]
]

#v(1cm)

// 3. صف الأيقونات الاحترافي باستخدام ملفات SVG الخارجية
#align(center)[
  #grid(
    columns: (auto, auto, auto, auto),
    gutter: 22pt, 
    
    // نقوم باستدعاء ملفات الـ SVG وتلوينها برمجياً عبر تغيير لون النص الداعم لها إن أمكن
    // أو وضعها مباشرة بحجم متناسق وموحد
    image("Figures/panel.svg", width: 2.3cm),
    image("Figures/activity.svg", width: 2.3cm),
    image("Figures/gauge.svg", width: 2.3cm),
    image("Figures/zap.svg", width: 2.3cm),
  )
]

#v(1fr) // دفع المحتويات للأسفل بنقاء تام

// 4. الجزء السفلي (موازاة دقيقة لـ Alex Xu وبأعلى جودة محاذاة)
#align(center)[
  #text(size: 12pt, weight: "medium", tracking: 1pt, fill: white.darken(20%))[
    جامعة حلب — كلية الهندسة الكهربائية والإلكترونية
  ]
  
  #v(0.3cm)
  #line(length: 100%, stroke: 8pt + white) // جعلنا السماكة 4pt لتبدو أكثر رشاقة وأناقة أكاديمية
  #v(0.5cm)
  
  // حل مشكلة الأسماء والمحاذاة وانعكاس علامات الترقيم بالكامل
  #grid(
    columns: (1fr, 1fr),
    gutter: 50pt,
    
    // الخلية الأولى (ستظهر على اليمين تلقائياً لأن البيئة RTL)
    align(center)[
      #stack(
        dir: ttb,
        spacing: 12pt,
        text(size: 14pt, fill: rgb("#fae3a5"))[إعداد الطالب:],
        text(size: 16pt, weight: "bold")[محمد علي قطان]
      )
    ],
    
    // الخلية الثانية (ستظهر على اليسار تلقائياً ولكن نصوصها محاذية لليمين في مكانها)
    align(center)[
      #stack(
        dir: ttb,
        spacing: 12pt,
        text(size: 14pt, fill: rgb("#fae3a5"))[إشراف:],
        text(size: 16pt, weight: "bold")[د. كريمة سكر]
      )
    ]
  )
  
  #v(1.2cm)
  #text(size: 13pt, fill: white.darken(40%))[2026 م  —  1448 هـ]
]