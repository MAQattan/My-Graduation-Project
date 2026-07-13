#import "@preview/polylux:0.4.0": *
#import "lib.typ" as friendly
#import friendly: titled-block

// 2. شريحة العنوان المصححة بدون أي مشاكل
#friendly.title-slide(
title: [
    #text(size: 28pt, weight: "bold")[تصميم وتحليل أداء منظومة طاقة شمسية مرتبطة بالشبكة]
    #v(0.2cm) // مسافة عمودية مناسبة أسفل العنوان
    
    #align(center)[
      #grid(
        columns: (auto, auto, auto, auto),
        gutter: 20pt, // المسافة بين الأيقونات
        align: horizon,
        // قمنا بتصغير الحجم قليلاً إلى 1.5cm لتتناسب مع أبعاد الشريحة (16:9) بدلاً من مقاس الـ A4
        image("Figures/panel.svg", width: 2cm),
        image("Figures/activity.svg", width: 2cm),
        image("Figures/gauge.svg", width: 2cm),
        image("Figures/zap.svg", width: 2cm),
      )
    ]
  ],  
speaker: block(width: 100%)[
    #grid(
      columns: (1fr, 1fr),     // تقسيم المساحة إلى عمودين متساويين
      gutter: 20pt,            // مسافة أمان أفقية بين الاسمين
      align: center, // توسيط النصوص عمودياً وأفقياً داخل كل عمود لجمالية التنسيق
      
      // العمود الأول: سيظهر على اليمين تلقائياً (الطالب)
      [
        #text(size: 15pt, fill: rgb("#fae3a5"))[إعداد الطالب:] \
        #v(2pt)
        #text(size: 16pt, weight: "bold", fill: white)[محمد علي قطان] \
        #v(0.5pt)
        #text(size: 13pt, fill: white.darken(35%))[الرقم الجامعي: 207047]
        #v(-20pt)
      ],
      
      // العمود الثاني: سيظهر على اليسار تلقائياً (المشرف)
      [
        #text(size: 15pt, fill: rgb("#fae3a5"))[إشراف:] \
        #v(2pt)
        #text(size: 16pt, weight: "bold", fill: white)[د. كريمة سكر]
      ]
    )
  ],
  conference: text(size: 12pt, weight: "bold", tracking: 1pt, fill: rgb("#fae3a5"))[مشروع تخرج أُعِدَّ لنيل درجة الإجازة في الهندسة الكهربائية],
  
  logo: move(
    dx: -8pt,
    dy: -50pt, 
    [
      #grid(
        columns: (1fr, auto, auto), 
        gutter: 15pt,         
        align: horizon,       
        
        // الشعارات مرتبة عمودياً
        stack(
          dir: ttb,
          spacing: 10pt, 
          image("AU-Logo_V.svg", width: 2.8cm),
          image("FEEE-Logo_V.svg", width: 2.8cm),
        ),
        
        // الخط الفاصل الشاقولي الأنيق
        line(start: (-30pt, 0pt), end: (-30pt, 90pt), stroke: 0.5pt + gray.lighten(30%)),

        // النص المؤسسي الرسمي للجامعة
        move(dx: -34pt, dy: 0pt,
          stack(
            dir: ttb,
            spacing: 11pt,       
            text(size: 12pt, weight: "bold", fill: rgb("637A9F"))[الجمهورية العربية السورية],
            text(size: 11pt, weight: "medium")[وزارة التعليم العالي والبحث العلمي],
            text(size: 12pt, weight: "medium")[جامعة حلب],
            text(size: 12pt, fill: gray.darken(90%))[كلية الهندسة الكهربائية والإلكترونية],
            text(size: 12pt, fill: gray.darken(70%))[قسم نظم القدرة الكهربائية]
          )
        )
      )
      
      // التواريخ في أسفل الجزء الأبيض
      #place(
        dx: -80pt,  
        dy: 60pt,  
        stack(
          dir: ttb,
          spacing: 6pt,
          text(size: 14pt, fill: gray.darken(20%))[1448 هـ],
          text(size: 14pt, fill: gray.darken(20%))[2026 م]
        )
      )
    ]
  ),
  logo-align: center + horizon, // سيعمل الآن بنقاء وبدون أي خطأ أحمر!
)
