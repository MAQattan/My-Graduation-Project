#block(height: 0pt, above: 0pt, below: 0pt)[
  #hide[== #text(size: 12pt, weight: "light")[ملخص المشروع #h(0.5em)]]
]
#v(8em)
#align(center)[#text(size: 30pt, weight: "bold")[ملخص المشروع]]
#v(2em)

يهدف هذا البحث إلى تقديم دراسة هندسية تطبيقية متكاملة لتصميم واستمثال أداء منظومة طاقة كهروضوئية مرتبطة بالشبكة (On-Grid) بقدرة $23.4 "kWp"$، مخصصة لتلبية الاحتياجات الطاقية لمنشأة مصرفية حيوية في مدينة حلب. تتمحور مشكلة البحث حول معالجة التناقض بين المتطلبات العالية لموثوقية التغذية الكهربائية وبين "المحدودية المكانية" والقيود الإنشائية لأسطح المنشآت الحضرية وما ينتج عنها من فواقد تظليل حرجة.

اعتمدت المنهجية المتبعة على "دورة التصميم الهندسي المتكاملة"، والتي بدأت بتقييم جيومناخي دقيق للمورد الشمسي عبر منصة (Global Solar Atlas)، تلاه ابتكار حل إنشائي يعتمد تقنية "التثبيت المتدرج" (Terraced Mounting) لرفع "عامل استغلال المساحة" (LUF) إلى حده الأقصى وتحييد أثر الظلال المتبادلة. شمل الجانب الكهربائي إجراء مواءمة دقيقة بين ألواح (N-Type HPBC) وعواكس (Huawei Smart Inverter) متعددة المتعقبات لضمان استقرار العمل ضمن نوافذ الجهد المثلى، مع تصميم نظام حماية متكامل يحقق "الانتقائية الصارمة" (Selectivity).

أظهرت نتائج التحقق الرقمي عبر بناء "توأم رقمي" (Digital Twin) في برنامج (PVsyst) أن المنظومة حققت مؤشرات جدارة طاقية استثنائية؛ حيث بلغت "الإنتاجية النوعية" السنوية $1881 "kWh""/""kWp"$، وسجل "معامل الأداء" (PR) قيمة قياسية وصلت إلى $89.3%$، مع تحقيق كثافة استطاعة مساحية بلغت $119.59 W"/"m^2$. تخلص الدراسة إلى نجاح النموذج المقترح في تحقيق الاستقلال الطاقي المستدام للمنشأة وخفض "تكلفة الوحدة الطاقية" (LCOE)، مما يجعل هذا البحث مرجعاً تصميمياً موثوقاً للمباني الإدارية والتجارية ذات البيئات المقيدة مساحياً.

*الكلمات المفتاحية:* الطاقة الكهروضوئية المرتبطة بالشبكة، التثبيت المتدرج، المواءمة الكهربائية، PVsyst، معامل الأداء (PR)، التظليل الموضعي، الاستدامة الطاقية.
#pagebreak()

#v(2em)
#align(center)[#text(size: 30pt, weight: "bold")[ABSTRACT]]
#v(2em)

This research presents a comprehensive engineering study for the design and performance optimization of a *23.4 kWp grid-tied photovoltaic (PV) system*, specifically engineered to meet the energy requirements of a critical banking facility in Aleppo. The research problem addresses the technical conflict between the high demand for power reliability in financial institutions and the severe *spatial limitations* and structural constraints of urban rooftops, which typically induce critical shading losses.

The adopted methodology follows an *"Integrated Engineering Design Cycle,"* initiating with a precise geo-climatic solar resource assessment via the Global Solar Atlas platform. This is followed by the implementation of an innovative structural solution utilizing *"Terraced Mounting"* to maximize the *Land Utilization Factor (LUF)* while neutralizing mutual shading effects. Electrically, a rigorous matching process was executed between advanced *N-Type HPBC* modules and *Huawei Smart Multi-MPPT inverters* to ensure operational stability within optimal voltage windows, complemented by a protection system designed according to *strict selectivity* principles.

Digital verification results, obtained through the development of a *"Digital Twin"* in *PVsyst* software, demonstrate exceptional energy merit indicators: the annual *"Specific Yield"* reached *1881 kWh/kWp*, while the *"Performance Ratio" (PR)* recorded a benchmark value of *89.3%*, achieving an areal power density of *119.59 W/m²*. The study concludes that the proposed model successfully achieves sustainable energy independence for the facility and reduces the *Levelized Cost of Energy (LCOE)*, establishing this research as a reliable design reference for administrative and commercial buildings in space-constrained urban environments.

*Keywords:* Grid-Tied PV Systems, Terraced Mounting, Electrical Matching, PVsyst, Performance Ratio (PR), Localized Shading, Energy Sustainability.