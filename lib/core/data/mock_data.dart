import 'package:flutter/material.dart';
import 'package:view_line/features/about_us/models/about_us_model.dart';
import 'package:view_line/features/about_us/models/branch.dart';
import 'package:view_line/features/about_us/models/employee_model.dart';
import 'package:view_line/features/about_us/models/partner_model.dart';
import 'package:view_line/features/home/models/achievement.dart';
import 'package:view_line/features/home/models/advertisement.dart';
import 'package:view_line/features/home/models/customer_review.dart';
import 'package:view_line/features/home/models/main_service_model.dart';
import 'package:view_line/features/portfolio/models/portfolio_item.dart';
import 'package:view_line/features/services/models/service.dart';

class MockData {
  static List<Advertisement> getAdvertisements() {
    return [
      Advertisement(
        id: '1',
        titleEn: 'Summer Special',
        titleAr: 'عروض الصيف',
        descriptionEn: 'Get 30% off on all beach destinations this summer!',
        descriptionAr: 'احصل على خصم 30٪ على جميع الوجهات الشاطئية هذا الصيف!',
        imageUrl:
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),
      Advertisement(
        id: '2',
        titleEn: 'Adventure Awaits',
        titleAr: 'المغامرة تنتظر',
        descriptionEn: 'Explore mountain trails with our exclusive packages',
        descriptionAr: 'استكشف مسارات الجبال مع باقاتنا الحصرية',
        imageUrl:
            'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),
      Advertisement(
        id: '3',
        titleEn: 'City Tours',
        titleAr: 'جولات المدينة',
        descriptionEn: 'Discover the worlds most beautiful cities',
        descriptionAr: 'اكتشف أجمل مدن العالم',
        imageUrl:
            'https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),
    ];
  }

  static List<Service> getServices() {
    return [
      Service(
        id: '1',
        titleEn: 'Maldives Beach Resort',
        titleAr: 'منتجع شاطئ جزر المالديف',
        subtitleEn: 'Luxury all-inclusive package',
        subtitleAr: 'باقة فاخرة شاملة كل شيء',
        imageUrl:
            'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
        locationEn: 'Maldives',
        locationAr: 'جزر المالديف',
        date: '2025-12-15',
        cost: 2500.00,
        descriptionEn:
            'Experience paradise with our exclusive Maldives package. Enjoy crystal-clear waters, white sandy beaches, and world-class amenities. This all-inclusive resort offers the perfect tropical getaway with water sports, spa treatments, and gourmet dining.',
        descriptionAr:
            'جرب الجنة مع باقة المالديف الحصرية. استمتع بمياه صافية وشواطئ رملية بيضاء ومرافق عالمية المستوى. يقدم هذا المنتجع الشامل كل شيء الإجازة الاستوائية المثالية مع الرياضات المائية والعلاج في المنتجعات الصحية وتناول الطعام الفاخر.',
        termsEn: [
          'Booking must be made at least 30 days in advance',
          'Cancellation fees apply if canceled within 14 days',
          'Travel insurance is mandatory',
          'Valid passport required with 6 months validity',
        ],
        termsAr: [
          'يجب الحجز قبل 30 يومًا على الأقل',
          'تطبق رسوم إلغاء إذا تم الإلغاء خلال 14 يومًا',
          'تأمين السفر إلزامي',
          'جواز سفر ساري المفعول مطلوب مع صلاحية 6 أشهر',
        ],
        requirementsEn: [
          'Valid passport',
          'Travel visa (arranged by us)',
          'COVID-19 vaccination certificate',
          'Travel insurance',
        ],
        requirementsAr: [
          'جواز سفر ساري',
          'تأشيرة سفر (نحن نرتبها)',
          'شهادة تطعيم COVID-19',
          'تأمين سفر',
        ],
        tripPlanEn: [
          'Day 1: Arrival and welcome drinks',
          'Day 2-3: Beach activities and water sports',
          'Day 4: Island hopping tour',
          'Day 5: Spa day and sunset cruise',
          'Day 6: Free day for personal exploration',
          'Day 7: Departure',
        ],
        tripPlanAr: [
          'اليوم 1: الوصول ومشروبات الترحيب',
          'اليوم 2-3: أنشطة الشاطئ والرياضات المائية',
          'اليوم 4: جولة التنقل بين الجزر',
          'اليوم 5: يوم سبا ورحلة بحرية عند الغروب',
          'اليوم 6: يوم حر للاستكشاف الشخصي',
          'اليوم 7: المغادرة',
        ],
      ),
      Service(
        id: '2',
        titleEn: 'Swiss Alps Adventure',
        titleAr: 'مغامرة جبال الألب السويسرية',
        subtitleEn: 'Mountain hiking and skiing',
        subtitleAr: 'تسلق الجبال والتزلج',
        imageUrl:
            'https://images.unsplash.com/photo-1531366936337-7c912a4589a7',
        locationEn: 'Switzerland',
        locationAr: 'سويسرا',
        date: '2026-01-20',
        cost: 3200.00,
        descriptionEn:
            'Embark on an unforgettable journey through the Swiss Alps. This adventure includes guided hiking tours, skiing lessons, and stays in cozy mountain lodges with stunning alpine views.',
        descriptionAr:
            'انطلق في رحلة لا تُنسى عبر جبال الألب السويسرية. تتضمن هذه المغامرة جولات مشي إرشادية ودروس تزلج وإقامة في بيوت جبلية مريحة بإطلالات جبال الألب الرائعة.',
        termsEn: [
          'Suitable for intermediate fitness levels',
          'Weather-dependent activities',
          'Equipment rental included',
          'Minimum age requirement: 16 years',
        ],
        termsAr: [
          'مناسب لمستويات اللياقة المتوسطة',
          'الأنشطة تعتمد على الطقس',
          'تأجير المعدات مشمول',
          'الحد الأدنى للعمر: 16 سنة',
        ],
        requirementsEn: [
          'Warm clothing and hiking boots',
          'Travel insurance with adventure sports coverage',
          'Basic fitness level',
          'Valid ID or passport',
        ],
        requirementsAr: [
          'ملابس دافئة وأحذية hiking',
          'تأمين سفر يشمل الرياضات المغامرة',
          'مستوى لياقة أساسي',
          'هوية سارية أو جواز سفر',
        ],
        tripPlanEn: [
          'Day 1: Arrival in Zurich, transfer to resort',
          'Day 2: Ski lessons and practice',
          'Day 3: Guided mountain hiking',
          'Day 4: Cable car tour and photography',
          'Day 5: Free skiing or snowboarding',
          'Day 6: Visit local villages',
          'Day 7: Departure',
        ],
        tripPlanAr: [
          'اليوم 1: الوصول إلى زيورخ، الانتقال إلى المنتجع',
          'اليوم 2: دروس تزلج وتدريب',
          'اليوم 3: تسلق جبال بإرشاد',
          'اليوم 4: جولة تلفريك وتصوير',
          'اليوم 5: تزلج حر أو تزلج على اللوح',
          'اليوم 6: زيارة القرى المحلية',
          'اليوم 7: المغادرة',
        ],
      ),
      Service(
        id: '3',
        titleEn: 'Paris Cultural Tour',
        titleAr: 'جولة باريس الثقافية',
        subtitleEn: 'Art, history, and cuisine',
        subtitleAr: 'فن، تاريخ، ومطبخ',
        imageUrl:
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
        locationEn: 'Paris, France',
        locationAr: 'باريس، فرنسا',
        date: '2025-11-10',
        cost: 1800.00,
        descriptionEn:
            'Immerse yourself in the City of Light. Visit iconic landmarks like the Eiffel Tower, Louvre Museum, and Notre-Dame Cathedral. Enjoy authentic French cuisine and explore charming Parisian neighborhoods.',
        descriptionAr:
            'انغمس في مدينة النور. قم بزيارة المعالم الشهيرة مثل برج إيفل ومتحف اللوفر وكاتدرائية نوتردام. استمتع بالمأكولات الفرنسية الأصيلة واستكشف أحياء باريس الساحرة.',
        termsEn: [
          'Hotel accommodation included',
          'Museum tickets pre-arranged',
          'Local guide provided',
          'Group size limited to 15 people',
        ],
        termsAr: [
          'الإقامة في الفندق مشمولة',
          'تذاكر المتاحف مرتبة مسبقًا',
          'مرشد محلي مقدم',
          'عدد المجموعة محدود بـ 15 شخصًا',
        ],
        requirementsEn: [
          'Valid passport',
          'Schengen visa (if applicable)',
          'Comfortable walking shoes',
          'Basic travel insurance',
        ],
        requirementsAr: [
          'جواز سفر ساري',
          'تأشيرة شنغن (إذا كانت مطلوبة)',
          'أحذية مريحة للمشي',
          'تأمين سفر أساسي',
        ],
        tripPlanEn: [
          'Day 1: Arrival and city orientation',
          'Day 2: Eiffel Tower and Seine River cruise',
          'Day 3: Louvre Museum and Latin Quarter',
          'Day 4: Versailles Palace day trip',
          'Day 5: Montmartre and Sacré-Cœur',
          'Day 6: Shopping and free time',
          'Day 7: Departure',
        ],
        tripPlanAr: [
          'اليوم 1: الوصول وتوجيه المدينة',
          'اليوم 2: برج إيفل ورحلة نهر السين',
          'اليوم 3: متحف اللوفر والحي اللاتيني',
          'اليوم 4: رحلة يومية لقصر فرساي',
          'اليوم 5: مونمارتر وكنيسة القلب المقدس',
          'اليوم 6: تسوق ووقت حر',
          'اليوم 7: المغادرة',
        ],
      ),
      Service(
        id: '4',
        titleEn: 'Dubai Desert Safari',
        titleAr: 'سفاري صحراء دبي',
        subtitleEn: 'Luxury desert experience',
        subtitleAr: 'تجربة صحراوية فاخرة',
        imageUrl:
            'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
        locationEn: 'Dubai, UAE',
        locationAr: 'دبي، الإمارات',
        date: '2025-10-28',
        cost: 1200.00,
        descriptionEn:
            'Experience the magic of the Arabian desert. Enjoy dune bashing, camel rides, traditional entertainment, and a luxurious dinner under the stars in a Bedouin-style camp.',
        descriptionAr:
            'جرب سحر الصحراء العربية. استمتع بركوب الكثبان وركوب الجمال والترفيه التقليدي وعشاء فاخر تحت النجوم في مخيم على الطريقة البدوية.',
        termsEn: [
          'Pickup and drop-off included',
          'Vegetarian meals available',
          'Not suitable for pregnant women',
          'Children under 3 years free',
        ],
        termsAr: [
          'الاستلام والتوصيل مشمولان',
          'وجبات نباتية متاحة',
          'غير مناسب للحوامل',
          'الأطفال تحت 3 سنوات مجانًا',
        ],
        requirementsEn: [
          'Comfortable clothing',
          'Sunglasses and sunscreen',
          'Camera for photos',
          'Valid ID',
        ],
        requirementsAr: [
          'ملابس مريحة',
          'نظارات شمسية وواقي شمس',
          'كاميرا للصور',
          'هوية سارية',
        ],
        tripPlanEn: [
          'Day 1: Hotel pickup at 3 PM',
          'Dune bashing adventure (1 hour)',
          'Camel riding and sandboarding',
          'Traditional henna painting',
          'BBQ dinner with live entertainment',
          'Return to hotel by 9 PM',
        ],
        tripPlanAr: [
          'اليوم 1: الاستلام من الفندق الساعة 3 مساءً',
          'مغامرة ركوب الكثبان (ساعة واحدة)',
          'ركوب الجمال والتزلج على الرمال',
          'رسم الحناء التقليدي',
          'عشاء شواء مع ترفيه حي',
          'العودة إلى الفندق بحلول الساعة 9 مساءً',
        ],
      ),
      Service(
        id: '5',
        titleEn: 'Bali Wellness Retreat',
        titleAr: 'ملاذ بالي للصحة',
        subtitleEn: 'Yoga, meditation, and relaxation',
        subtitleAr: 'يوجا، تأمل، واسترخاء',
        imageUrl:
            'https://images.unsplash.com/photo-1537996194471-e657df975ab4',
        locationEn: 'Ubud, Bali',
        locationAr: 'أوبود، بالي',
        date: '2026-02-14',
        cost: 1500.00,
        descriptionEn:
            'Rejuvenate your mind and body in the heart of Bali. This wellness retreat includes daily yoga sessions, meditation classes, spa treatments, and healthy organic meals in a peaceful jungle setting.',
        descriptionAr:
            'جدد عقلك وجسمك في قلب بالي. يتضمن هذا الملاذ الصحي جلسات يوجا يومية ودروس تأمل وعلاجات سبا ووجبات عضوية صحية في إطار غابي هادئ.',
        termsEn: [
          'Suitable for all skill levels',
          'Single and shared accommodations available',
          'All meals included',
          'Minimum 5-day stay',
        ],
        termsAr: [
          'مناسب لجميع مستويات المهارة',
          'إقامة فردية ومشتركة متاحة',
          'جميع الوجبات مشمولة',
          'الحد الأدنى للإقامة 5 أيام',
        ],
        requirementsEn: [
          'Yoga mat (can be provided)',
          'Comfortable exercise clothing',
          'Valid passport and visa',
          'Open mind and positive attitude',
        ],
        requirementsAr: [
          'سجادة يوجا (يمكن توفيرها)',
          'ملابس تمرين مريحة',
          'جواز سفر ساري وتأشيرة',
          'عقل منفتح وموقف إيجابي',
        ],
        tripPlanEn: [
          'Day 1: Arrival and welcome ceremony',
          'Day 2-3: Morning yoga, afternoon meditation',
          'Day 4: Rice terrace trek and spa day',
          'Day 5: Balinese cooking class',
          'Day 6: Temple visit and cultural tour',
          'Day 7: Sunrise yoga and departure',
        ],
        tripPlanAr: [
          'اليوم 1: الوصول ومراسم الترحيب',
          'اليوم 2-3: يوجا الصباح، تأمل المساء',
          'اليوم 4: رحلة مصاطب الأرز ويوم سبا',
          'اليوم 5: فصل طبخ باليني',
          'اليوم 6: زيارة المعبد وجولة ثقافية',
          'اليوم 7: يوجا شروق الشمس والمغادرة',
        ],
      ),
      Service(
        id: '6',
        titleEn: 'Iceland Northern Lights',
        titleAr: 'أضواء الشمال في آيسلندا',
        subtitleEn: 'Aurora viewing expedition',
        subtitleAr: 'رحلة مشاهدة الأورورا',
        imageUrl:
            'https://images.unsplash.com/photo-1483347756197-71ef80e95f73',
        locationEn: 'Reykjavik, Iceland',
        locationAr: 'ريكيافيك، آيسلندا',
        date: '2025-11-25',
        cost: 2800.00,
        descriptionEn:
            'Witness the breathtaking Northern Lights in Iceland. This tour includes guided aurora hunting, visits to hot springs, glacier walks, and exploration of stunning Icelandic landscapes.',
        descriptionAr:
            'شاهد أضواء الشمال الرائعة في آيسلندا. تتضمن هذه الجولة صيد الأورورا بإرشاد، وزيارات للينابيع الساخنة، ومشي على الأنهار الجليدية، واستكشاف المناظر الطبيعية الآيسلندية المذهلة.',
        termsEn: [
          'Northern Lights viewing subject to weather',
          'Warm clothing rental available',
          '4x4 transportation provided',
          'Photography guidance included',
        ],
        termsAr: [
          'مشاهدة أضواء الشمال تخضع للطقس',
          'تأجير ملابس دافئة متاح',
          'وسائل نقل 4x4 مضمونة',
          'إرشاد التصوير مشمول',
        ],
        requirementsEn: [
          'Warm winter clothing',
          'Waterproof boots',
          'Camera with manual settings (recommended)',
          'Valid passport',
        ],
        requirementsAr: [
          'ملابس شتوية دافئة',
          'أحذية مقاومة للماء',
          'كاميرا بإعدادات يدوية (موصى بها)',
          'جواز سفر ساري',
        ],
        tripPlanEn: [
          'Day 1: Arrival and Blue Lagoon visit',
          'Day 2: Golden Circle tour',
          'Day 3: Glacier hiking',
          'Day 4: Northern Lights hunt',
          'Day 5: South Coast waterfalls',
          'Day 6: Reykjavik city tour',
          'Day 7: Departure',
        ],
        tripPlanAr: [
          'اليوم 1: الوصول وزيارة البحيرة الزرقاء',
          'اليوم 2: جولة الدائرة الذهبية',
          'اليوم 3: تسلق الأنهار الجليدية',
          'اليوم 4: صيد أضواء الشمال',
          'اليوم 5: شلالات الساحل الجنوبي',
          'اليوم 6: جولة مدينة ريكيافيك',
          'اليوم 7: المغادرة',
        ],
      ),
    ];
  }

  static AboutUsModel getAboutData() {
    return AboutUsModel(
      appNameEn: 'View Line',
      appNameAr: 'فيو لاين',
      subtitleEn: 'Your trusted travel companion around the world',
      subtitleAr: 'رفيق سفرك الموثوق حول العالم',
      descriptionEn:
          'View Line is a travel platform that helps adventurers, families, and professionals discover amazing destinations, plan trips effortlessly, and connect with trusted travel partners. Our goal is to make every journey safe, enjoyable, and memorable. We provide comprehensive travel packages, expert guidance, and 24/7 support to ensure your travel experience is seamless from start to finish.',
      descriptionAr:
          'فيو لاين هي منصة سفر تساعد المغامرين والعائلات والمحترفين على اكتشاف الوجهات المذهلة، وتخطيط الرحلات بسهولة، والاتصال بشركاء السفر الموثوقين. هدفنا هو جعل كل رحلة آمنة وممتعة ولا تُنسى. نقدم باقات سفر شاملة، وإرشادات من خبراء، ودعم على مدار الساعة طوال أيام الأسبوع لضمان أن تجربة سفرك سلسة من البداية إلى النهاية.',
      visionEn:
          'To become the leading travel companion that inspires exploration and connects people across the globe, making travel accessible, affordable, and unforgettable for everyone.',
      visionAr:
          'أن نصبح رفيق السفر الرائد الذي يلهم الاستكشاف ويوصل الناس عبر العالم، مما يجعل السفر في متناول الجميع وبأسعار معقولة ولا يُنسى للجميع.',
      messageEn:
          'We believe that traveling is more than moving between places — it\'s about connecting cultures, making memories, and discovering yourself. Every journey with us is an opportunity to grow, learn, and create stories that last a lifetime.',
      messageAr:
          'نحن نؤمن أن السفر هو أكثر من مجرد التنقل بين الأماكن - إنه يتعلق بالتواصل بين الثقافات، وخلق الذكريات، واكتشاف نفسك. كل رحلة معنا هي فرصة للنمو والتعلم وخلق قصص تدوم مدى الحياة.',
      valuesEn: [
        'Customer Satisfaction',
        'Transparency and Trust',
        'Adventure and Discovery',
        'Safety and Comfort',
        'Innovation and Excellence',
        'Environmental Responsibility',
      ],
      valuesAr: [
        'رضا العملاء',
        'الشفافية والثقة',
        'المغامرة والاكتشاف',
        'السلامة والراحة',
        'الابتكار والتميز',
        'المسؤولية البيئية',
      ],
      partners: [
        const PartnerModel(
          id: '1',
          nameEn: 'Skyline Airlines',
          nameAr: 'طيران سكاي لاين',
          logoUrl: 'assets/images/Skyline_Airlines.svg',
        ),
        const PartnerModel(
          id: '2',
          nameEn: 'Emirates Airlines',
          nameAr: 'طيران الإمارات',
          logoUrl: 'assets/images/Emirates_logo.svg',
        ),
        const PartnerModel(
          id: '3',
          nameEn: 'Qatar Airways',
          nameAr: 'الخطوط الجوية القطرية',
          logoUrl: 'assets/images/Qatar_Airways_logo.svg',
        ),
      ],
      employees: [
        const EmployeeModel(
          id: '1',
          nameEn: 'Sarah Johnson',
          nameAr: 'سارة جونسون',
          positionEn: 'CEO & Founder',
          positionAr: 'الرئيس التنفيذي والمؤسس',
          imageUrl: 'https://i.pravatar.cc/300?img=1',
        ),
        const EmployeeModel(
          id: '2',
          nameEn: 'Michael Chen',
          nameAr: 'مايكل تشين',
          positionEn: 'Chief Operating Officer',
          positionAr: 'مدير العمليات',
          imageUrl: 'https://i.pravatar.cc/300?img=13',
        ),
        const EmployeeModel(
          id: '4',
          nameEn: 'David Kumar',
          nameAr: 'ديفيد كومار',
          positionEn: 'Travel Operations Manager',
          positionAr: 'مدير عمليات السفر',
          imageUrl: 'https://i.pravatar.cc/300?img=12',
        ),
        const EmployeeModel(
          id: '6',
          nameEn: 'Robert Taylor',
          nameAr: 'روبرت تايلور',
          positionEn: 'Technology Lead',
          positionAr: 'قائد التكنولوجيا',
          imageUrl: 'https://i.pravatar.cc/300?img=14',
        ),
      ],
    );
  }

  static List<MainService> getMainServices() {
    return [
      MainService(
        id: '1',
        titleEn: 'Flight Ticketing',
        titleAr: 'حجز تذاكر الطيران',
        subtitleEn: 'Book flights easily with the best prices',
        subtitleAr: 'احجز رحلات الطيران بسهولة بأفضل الأسعار',
        imageUrl:
            'https://images.unsplash.com/photo-1436491865332-7a61a109cc05',
        icon: Icons.flight,
        descriptionEn:
            'Our Flight Ticketing service provides you with access to thousands of airlines worldwide. Get competitive prices, flexible booking options, and 24/7 customer support for all your air travel needs.',
        descriptionAr:
            'تقدم خدمة حجز تذاكر الطيران لدينا الوصول إلى آلاف شركات الطيران حول العالم. احصل على أسعار تنافسية، وخيارات حجز مرنة، ودعم عملاء على مدار الساعة طوال أيام الأسبوع لجميع احتياجات سفرك الجوي.',
        overviewEn:
            'We offer comprehensive flight booking services for domestic and international destinations. Our partnership with major airlines ensures you get the best deals and most convenient flight schedules. Whether you\'re traveling for business or pleasure, we make flight booking simple and hassle-free.',
        overviewAr:
            'نقدم خدمات حجز طيران شاملة للوجهات المحلية والدولية. تضمن شراكتنا مع شركات الطيران الكبرى حصولك على أفضل الصفولات وجداول الرحلات الأكثر ملاءمة. سواء كنت مسافرًا للعمل أو المتعة، فإننا نجعل حجز الطيران بسيطًا وخاليًا من المتاعب.',
        requirementsEn: [
          'Valid passport (for international flights)',
          'Visa documentation (if required)',
          'Passenger details (full name, date of birth, contact info)',
          'Payment method (credit/debit card)',
          'Email address for ticket confirmation',
        ],
        requirementsAr: [
          'جواز سفر ساري (للرحلات الدولية)',
          'وثائق التأشيرة (إذا لزم الأمر)',
          'تفاصيل المسافر (الاسم الكامل، تاريخ الميلاد، معلومات الاتصال)',
          'طريقة الدفع (بطاقة ائتمان/خصم)',
          'عنوان البريد الإلكتروني لتأكيد التذكرة',
        ],
        costInformationEn:
            'Flight prices vary based on destination, travel dates, and booking class. We offer Economy, Premium Economy, Business, and First Class options. Prices start from \$150 for domestic flights and \$500 for international flights. Group discounts available for 10+ passengers. Early booking can save you up to 40%.',
        costInformationAr:
            'تختلف أسعار الطيران حسب الوجهة، وتواريخ السفر، وفئة الحجز. نقدم خيارات الاقتصاد، والاقتصاد المميز، ورجال الأعمال، والدرجة الأولى. تبدأ الأسعار من 150 دولارًا للرحلات الداخلية و 500 دولار للرحلات الدولية. خصومات جماعية متاحة لـ 10+ مسافرين. يمكن أن يوفر لك الحجز المبكر حتى 40%.',
        packages: const [
          ServicePackage(
            nameEn: 'Economy Saver',
            nameAr: 'اقتصاد موفر',
            descriptionEn: 'Budget-friendly option with essential services',
            descriptionAr: 'خيار مناسب للميزانية مع الخدمات الأساسية',
            price: '\$150',
            featuresEn: [
              'Standard seat selection',
              'Carry-on baggage included',
              '20kg checked baggage',
              'In-flight meal',
              'Free date change (with fee)',
            ],
            featuresAr: [
              'اختيار مقعد قياسي',
              'الأمتعة المحمولة مشمولة',
              'أمتعة مسجلة 20 كجم',
              'وجبة على متن الطائرة',
              'تغيير التاريخ مجانًا (مع رسوم)',
            ],
          ),
          ServicePackage(
            nameEn: 'Business Class',
            nameAr: 'درجة رجال الأعمال',
            descriptionEn: 'Premium comfort and exclusive services',
            descriptionAr: 'راحة متميزة وخدمات حصرية',
            price: '\$800',
            featuresEn: [
              'Priority check-in and boarding',
              'Extra legroom and comfort',
              '40kg checked baggage',
              'Gourmet meals and drinks',
              'Lounge access',
              'Free date changes',
            ],
            featuresAr: [
              'الأولوية في التسجيل والصعود',
              'مساحة إضافية للقدمين والراحة',
              'أمتعة مسجلة 40 كجم',
              'وجبات ومشروبات فاخرة',
              'الوصول إلى صالة الانتظار',
              'تغييرات التاريخ مجانًا',
            ],
          ),
          ServicePackage(
            nameEn: 'First Class',
            nameAr: 'الدرجة الأولى',
            descriptionEn: 'Ultimate luxury travel experience',
            descriptionAr: 'تجربة سفر فاخرة نهائية',
            price: '\$2,000',
            featuresEn: [
              'Fully reclining seats/beds',
              'Private suite (selected airlines)',
              'Unlimited baggage',
              'Fine dining and premium drinks',
              'Personal entertainment system',
              'Chauffeur service',
            ],
            featuresAr: [
              'مقاعد/أسرة قابلة للاستلقاء بالكامل',
              'جناح خاص (شركات طيران مختارة)',
              'أمتعة غير محدودة',
              'تناول طعام راقي ومشروبات متميزة',
              'نظام ترفيه شخصي',
              'خدمة سائق',
            ],
          ),
        ],
        contactInstructionsEn:
            'Book your flight by calling our 24/7 hotline at +1-800-FLY-WITH or email us at flights@flywithus.com. You can also book directly through our app. Our travel consultants are ready to assist you with finding the perfect flight for your journey.',
        contactInstructionsAr:
            'احجز رحلتك عن طريق الاتصال بالخط الساخن على مدار الساعة على الرقم +1-800-FLY-WITH أو راسلنا على flights@flywithus.com. يمكنك أيضًا الحجز مباشرة من خلال تطبيقنا. مستشارو السفر لدينا على استعداد لمساعدتك في العثور على الرحلة المثالية لرحلتك.',
      ),
      MainService(
        id: '2',
        titleEn: 'Visa Assistance',
        titleAr: 'المساعدة في التأشيرة',
        subtitleEn: 'Get your visa processed quickly and hassle-free',
        subtitleAr: 'احصل على تأشيرتك معالجة بسرعة وبدون متاعب',
        imageUrl:
            'https://images.unsplash.com/photo-1554224155-6726b3ff858f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
        icon: Icons.assignment,
        descriptionEn:
            'Our expert visa assistance team helps you navigate the complex visa application process. We handle documentation, appointments, and follow-ups to ensure your visa is approved on time.',
        descriptionAr:
            'يساعدك فريق المساعدة في التأشيرات الخبير لدينا على التنقل في عملية تقديم طلب التأشيرة المعقدة. نحن نتعامل مع الوثائق والمواعيد والمتابعات لضمان الموافقة على تأشيرتك في الوقت المحدد.',
        overviewEn:
            'We provide end-to-end visa services for tourist, business, work, and student visas across 150+ countries. Our experienced consultants are up-to-date with the latest visa requirements and regulations, ensuring your application has the best chance of approval.',
        overviewAr:
            'نقدم خدمات تأشيرة شاملة لتأشيرات السياحة والأعمال والعمل والطلاب في أكثر من 150 دولة. مستشارونا ذوو الخبرة محدثون بأحدث متطلبات ولوائح التأشيرات، مما يضمن أن طلبك لديه أفضل فرصة للموافقة.',
        requirementsEn: [
          'Valid passport (minimum 6 months validity)',
          'Passport-sized photographs (2-4 recent photos)',
          'Completed visa application form',
          'Proof of accommodation',
          'Bank statements (last 3-6 months)',
          'Travel itinerary',
          'Travel insurance',
          'Employment letter or business documents',
        ],
        requirementsAr: [
          'جواز سفر ساري (الحد الأدنى 6 أشهر صلاحية)',
          'صور بحجم جواز السفر (2-4 صور حديثة)',
          'نموذج طلب تأشيرة مكتمل',
          'إثبات الإقامة',
          'كشوف الحسابات المصرفية (آخر 3-6 أشهر)',
          'برنامج الرحلة',
          'تأمين السفر',
          'خطاب التوظيف أو مستندات العمل',
        ],
        costInformationEn:
            'Visa service fees vary by destination and visa type. Our service fee ranges from \$50-\$200 plus government visa fees. Express processing available for urgent applications (additional \$100). We offer package deals for families and groups.',
        costInformationAr:
            'تختلف رسوم خدمة التأشيرة حسب الوجهة ونوع التأشيرة. تتراوح رسوم الخدمة لدينا من 50 إلى 200 دولار بالإضافة إلى رسوم التأشيرة الحكومية. معالجة عاجلة متاحة للطلبات العاجلة (100 دولار إضافية). نقدم صفقات مجمعة للعائلات والمجموعات.',
        packages: const [
          ServicePackage(
            nameEn: 'Standard Processing',
            nameAr: 'المعالجة القياسية',
            descriptionEn: 'Regular visa application service',
            descriptionAr: 'خدمة طلب تأشيرة عادية',
            price: '\$50',
            featuresEn: [
              'Document verification',
              'Application form assistance',
              'Appointment booking',
              'Basic consultation',
              'Processing time: 15-30 days',
            ],
            featuresAr: [
              'التحقق من الوثائق',
              'مساعدة نموذج الطلب',
              'حجز الموعد',
              'استشارة أساسية',
              'وقت المعالجة: 15-30 يومًا',
            ],
          ),
          ServicePackage(
            nameEn: 'Premium Service',
            nameAr: 'خدمة مميزة',
            descriptionEn: 'Complete visa support with priority',
            descriptionAr: 'دعم تأشيرة كامل مع أولوية',
            price: '\$150',
            featuresEn: [
              'Complete documentation support',
              'Interview preparation',
              'Priority appointment',
              'Application tracking',
              'Processing time: 7-15 days',
              'Follow-up services',
            ],
            featuresAr: [
              'دعم وثائقي كامل',
              'التحضير للمقابلة',
              'موعد بأولوية',
              'تتبع الطلب',
              'وقت المعالجة: 7-15 يومًا',
              'خدمات المتابعة',
            ],
          ),
          ServicePackage(
            nameEn: 'Express VIP',
            nameAr: 'خدمة سريعة VIP',
            descriptionEn: 'Fastest visa processing available',
            descriptionAr: 'أسرع معالجة تأشيرة متاحة',
            price: '\$300',
            featuresEn: [
              'VIP consultation',
              'Same-day appointment',
              'Express documentation',
              'Interview coaching',
              'Processing time: 2-7 days',
              'Dedicated support',
              'Success guarantee or refund',
            ],
            featuresAr: [
              'استشارة VIP',
              'موعد في نفس اليوم',
              'توثيق سريع',
              'تدريب على المقابلة',
              'وقت المعالجة: 2-7 أيام',
              'دعم مخصص',
              'ضمان النجاح أو استرداد الأموال',
            ],
          ),
        ],
        contactInstructionsEn:
            'Contact our visa specialists at visa@flywithus.com or call +1-800-VISA-NOW. Schedule a free consultation to discuss your visa requirements. Our offices are open Monday-Friday, 9 AM - 6 PM.',
        contactInstructionsAr:
            'اتصل بأخصائيي التأشيرات لدينا على visa@flywithus.com أو اتصل بالرقم +1-800-VISA-NOW. حدد موعدًا لاستشارة مجانية لمناقشة متطلبات التأشيرة الخاصة بك. مكاتبنا مفتوحة من الاثنين إلى الجمعة، من 9 صباحًا حتى 6 مساءً.',
      ),
      // Continue with the same pattern for other services...
      MainService(
        id: '3',
        titleEn: 'Sightseeing Tours & Land Packages',
        titleAr: 'جولات سياحية وباقات برية',
        subtitleEn: 'Explore amazing destinations with guided tours',
        subtitleAr: 'استكشف الوجهات المذهلة مع جولات إرشادية',
        imageUrl:
            'https://images.unsplash.com/photo-1488646953014-85cb44e25828',
        icon: Icons.tour,
        descriptionEn:
            'Discover the world\'s most beautiful destinations with our expertly curated sightseeing tours and land packages. From historical landmarks to natural wonders, we offer unforgettable experiences.',
        descriptionAr:
            'اكتشف أجمل الوجهات في العالم مع جولات sightseeing المدروسة بعناية وباقاتنا البرية. من المعالم التاريخية إلى عجائب الطبيعة، نقدم تجارب لا تُنسى.',
        overviewEn:
            'Our sightseeing tours cover popular tourist destinations worldwide. Each tour is designed by travel experts and led by knowledgeable local guides who bring destinations to life with fascinating stories and insider knowledge. We handle all logistics including transportation, entrance fees, and meals.',
        overviewAr:
            'تغطي جولات sightseeing لدينا الوجهات السياحية الشهيرة حول العالم. تم تصميم كل جولة بواسطة خبراء السفر ويقودها مرشدون محليون متمرسون يجعلون الوجهات تنبض بالحياة بقصص رائعة ومعرفة داخلية. نحن نتعامل مع جميع الخدمات اللوجستية بما في ذلك النقل ورسوم الدخل والوجبات.',
        requirementsEn: [
          'Valid identification or passport',
          'Comfortable walking shoes',
          'Weather-appropriate clothing',
          'Camera (optional)',
          'Water bottle',
          'Basic travel insurance recommended',
          'Minimum age requirements may apply',
        ],
        requirementsAr: [
          'هوية سارية أو جواز سفر',
          'أحذية مريحة للمشي',
          'ملابس مناسبة للطقس',
          'كاميرا (اختياري)',
          'زجاجة ماء',
          'يوصى بتأمين سفر أساسي',
          'قد تنطبق متطلبات عمرية دنيا',
        ],
        costInformationEn:
            'Tour prices range from \$80 for half-day city tours to \$2,500 for multi-day land packages. Prices include transportation, guide services, entrance fees, and specified meals. Children under 12 receive 25% discount. Group discounts available for 8+ people.',
        costInformationAr:
            'تتراوح أسعار الجولات من 80 دولارًا لجولات المدينة نصف اليومية إلى 2500 دولار للباقات البرية متعددة الأيام. تشمل الأسعار النقل وخدمات المرشدين ورسوم الدخول والوجبات المحددة. يحصل الأطفال دون سن 12 على خصم 25%. خصومات جماعية متاحة لـ 8+ أشخاص.',
        packages: const [
          ServicePackage(
            nameEn: 'City Explorer',
            nameAr: 'مستكشف المدينة',
            descriptionEn: 'Half-day city sightseeing tour',
            descriptionAr: 'جولة sightseeing نصف يومية في المدينة',
            price: '\$80',
            featuresEn: [
              'Duration: 4-5 hours',
              'Visit 4-6 major attractions',
              'Air-conditioned transport',
              'Professional guide',
              'Entrance fees included',
            ],
            featuresAr: [
              'المدة: 4-5 ساعات',
              'زيارة 4-6 معالم رئيسية',
              'نقل مكيف',
              'مرشد محترف',
              'رسوم الدخول مشمولة',
            ],
          ),
          ServicePackage(
            nameEn: 'Heritage Journey',
            nameAr: 'رحلة التراث',
            descriptionEn: 'Full-day cultural and heritage tour',
            descriptionAr: 'جولة ثقافية وتراثية ليوم كامل',
            price: '\$150',
            featuresEn: [
              'Duration: 8-10 hours',
              'Visit 8-10 attractions',
              'Lunch included',
              'Expert historian guide',
              'Small group (max 15)',
              'Photo opportunities',
            ],
            featuresAr: [
              'المدة: 8-10 ساعات',
              'زيارة 8-10 معالم',
              'الغداء مشمول',
              'مرشد مؤرخ خبير',
              'مجموعة صغيرة (15 كحد أقصى)',
              'فرص التصوير',
            ],
          ),
          ServicePackage(
            nameEn: 'Grand Adventure',
            nameAr: 'المغامرة الكبرى',
            descriptionEn: 'Multi-day exploration package',
            descriptionAr: 'باقة استكشاف متعددة الأيام',
            price: '\$1,200',
            featuresEn: [
              'Duration: 5-7 days',
              'Hotel accommodation',
              'All meals included',
              'Multiple destinations',
              'Cultural experiences',
              'Adventure activities',
              '24/7 tour support',
            ],
            featuresAr: [
              'المدة: 5-7 أيام',
              'الإقامة في الفندق',
              'جميع الوجبات مشمولة',
              'وجهات متعددة',
              'تجارب ثقافية',
              'أنشطة المغامرة',
              'دعم الجولة 24/7',
            ],
          ),
        ],
        contactInstructionsEn:
            'Book your tour at tours@flywithus.com or call +1-800-TOURS-US. Browse our complete tour catalog on our website. Custom tour packages available upon request. Book 30 days in advance for 10% early bird discount.',
        contactInstructionsAr:
            'احجز جولتك على tours@flywithus.com أو اتصل بالرقم +1-800-TOURS-US. تصفح كتالوج الجولات الكامل على موقعنا. باقات جولات مخصصة متاحة عند الطلب. احجز قبل 30 يومًا للحصول على خصم 10% للحجز المبكر.',
      ),
      MainService(
        id: '4',
        titleEn: 'Accommodation & Transportation',
        titleAr: 'الإقامة والمواصلات',
        subtitleEn: 'Comfortable stays and reliable transport services',
        subtitleAr: 'إقامات مريحة وخدمات نقل موثوقة',
        imageUrl:
            'https://images.unsplash.com/photo-1566073771259-6a8506099945',
        icon: Icons.hotel,
        descriptionEn:
            'We provide quality accommodation ranging from budget hotels to luxury resorts, along with reliable transportation services including airport transfers, car rentals, and private chauffeurs.',
        descriptionAr:
            'نقدم إقامة عالية الجودة تتراوح من الفنادق الاقتصادية إلى المنتجعات الفاخرة، بالإضافة إلى خدمات النقل الموثوقة بما في ذلك خدمات النقل من المطار، وتأجير السيارات، والسائقين الخاصين.',
        overviewEn:
            'Our accommodation partners include thousands of verified hotels, resorts, apartments, and vacation rentals worldwide. We also offer comprehensive transportation solutions to ensure your travel is comfortable and convenient from start to finish.',
        overviewAr:
            'تشمل شركاؤنا في الإقامة آلاف الفنادق والمنتجعات والشقق والإيجارات السياحية حول العالم. كما نقدم حلول نقل شاملة لضمان راحتك وسهولة تنقلك طوال الرحلة.',
        requirementsEn: [
          'Valid ID or passport',
          'Credit card for security deposit',
          'Booking confirmation',
          'Special requests (if any)',
          'Driver\'s license (for car rentals)',
          'Arrival and departure details',
        ],
        requirementsAr: [
          'هوية سارية أو جواز سفر',
          'بطاقة ائتمان للتأمين',
          'تأكيد الحجز',
          'الطلبات الخاصة (إن وجدت)',
          'رخصة قيادة (لتأجير السيارات)',
          'تفاصيل الوصول والمغادرة',
        ],
        costInformationEn:
            'Hotel rates start from \$50/night for budget options, \$150/night for mid-range hotels, and \$300+/night for luxury properties. Transportation costs vary: airport transfers from \$30, car rentals from \$40/day, private chauffeur services from \$80/day.',
        costInformationAr:
            'تبدأ أسعار الفنادق من 50 دولارًا لليلة للفنادق الاقتصادية، و150 دولارًا للفنادق المتوسطة، وأكثر من 300 دولار للفنادق الفاخرة. تختلف تكاليف النقل: النقل من المطار يبدأ من 30 دولارًا، وتأجير السيارات من 40 دولارًا في اليوم، وخدمة السائق الخاص من 80 دولارًا في اليوم.',
        packages: const [
          ServicePackage(
            nameEn: 'Budget Comfort',
            nameAr: 'راحة اقتصادية',
            descriptionEn: 'Affordable accommodation and basic transport',
            descriptionAr: 'إقامة ميسورة مع وسائل نقل أساسية',
            price: '\$50',
            featuresEn: [
              'Clean budget hotel',
              'Free WiFi',
              'Breakfast included',
              'Airport shuttle',
              'Standard room amenities',
            ],
            featuresAr: [
              'فندق اقتصادي نظيف',
              'واي فاي مجاني',
              'يشمل الإفطار',
              'خدمة نقل من المطار',
              'مرافق الغرفة الأساسية',
            ],
          ),
          ServicePackage(
            nameEn: 'Premium Stay',
            nameAr: 'إقامة مميزة',
            descriptionEn: 'Mid-range hotels with car rental',
            descriptionAr: 'فنادق متوسطة المستوى مع تأجير سيارات',
            price: '\$150',
            featuresEn: [
              '4-star hotel',
              'Luxury amenities',
              'Complimentary breakfast',
              'Car rental included',
              'Gym and pool access',
              'Concierge service',
            ],
            featuresAr: [
              'فندق 4 نجوم',
              'مرافق فاخرة',
              'إفطار مجاني',
              'يشمل تأجير السيارة',
              'استخدام الصالة الرياضية والمسبح',
              'خدمة استقبال',
            ],
          ),
          ServicePackage(
            nameEn: 'VIP Experience',
            nameAr: 'تجربة كبار الشخصيات',
            descriptionEn: 'Luxury resort with private chauffeur',
            descriptionAr: 'منتجع فاخر مع سائق خاص',
            price: '\$400',
            featuresEn: [
              '5-star resort',
              'Suite accommodation',
              'All meals included',
              'Private chauffeur service',
              'Spa access',
              'Airport meet & greet',
              'Butler service',
            ],
            featuresAr: [
              'منتجع 5 نجوم',
              'إقامة في جناح فاخر',
              'تشمل جميع الوجبات',
              'سائق خاص',
              'دخول السبا',
              'استقبال في المطار',
              'خدمة الخادم الشخصي',
            ],
          ),
        ],
        contactInstructionsEn:
            'Reserve your accommodation and transportation at stay@flywithus.com or call +1-800-STAY-FLY. Specify your preferences and we\'ll find the perfect match. Flexible cancellation policies available on selected bookings.',
        contactInstructionsAr:
            'احجز إقامتك ومواصلاتك عبر البريد stay@flywithus.com أو اتصل على +1-800-STAY-FLY. حدد تفضيلاتك وسنجد الخيار الأنسب لك. تتوفر سياسات إلغاء مرنة في بعض الحجوزات.',
      ),

      // ----------------------------------------
      MainService(
        id: '5',
        titleEn: 'Umrah',
        titleAr: 'العمرة',
        subtitleEn: 'Complete Umrah packages with spiritual guidance',
        subtitleAr: 'برامج عمرة متكاملة مع التوجيه الروحي',
        imageUrl:
            'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa',
        icon: Icons.mosque,
        descriptionEn:
            'Perform Umrah with peace of mind through our comprehensive packages. We handle all arrangements including flights, accommodation near Haram, transportation, and spiritual guidance.',
        descriptionAr:
            'أدِّ العمرة براحة وطمأنينة من خلال باقاتنا الشاملة التي تتضمن الرحلات الجوية، والإقامة القريبة من الحرم، والنقل، والإرشاد الديني.',
        overviewEn:
            'Our Umrah packages are designed to provide a comfortable and spiritually fulfilling experience. We offer accommodation in hotels close to the Holy Mosques in Makkah and Madinah, experienced guides for religious guidance, and all necessary ground arrangements.',
        overviewAr:
            'تم تصميم باقات العمرة لدينا لتوفير تجربة مريحة ومليئة بالسكينة الروحية. نقدم إقامة في فنادق قريبة من الحرمين الشريفين بمكة والمدينة، مع مرشدين ذوي خبرة وإعدادات كاملة للنقل والخدمات الأرضية.',
        requirementsEn: [
          'Valid passport (minimum 6 months validity)',
          'Umrah visa',
          'Vaccination certificates (Meningitis, COVID-19)',
          'Passport-sized photographs',
          'Mahram requirement for women under 45',
          'Travel insurance',
          'Medical fitness certificate (for elderly)',
        ],
        requirementsAr: [
          'جواز سفر ساري لمدة لا تقل عن 6 أشهر',
          'تأشيرة عمرة',
          'شهادات التطعيم (الحمى الشوكية وكوفيد-19)',
          'صور شخصية',
          'محرم للنساء دون 45 عامًا',
          'تأمين سفر',
          'شهادة لياقة طبية (للمسنين)',
        ],
        costInformationEn:
            'Umrah packages range from \$1,500 for economy options to \$5,000+ for VIP packages. Prices vary based on hotel proximity to Haram, travel season, and package duration. Early booking discounts available. Payment plans offered for families.',
        costInformationAr:
            'تتراوح باقات العمرة من 1500 دولار للخيارات الاقتصادية إلى أكثر من 5000 دولار للباقات الفاخرة. تختلف الأسعار حسب قرب الفندق من الحرم، وموسم السفر، ومدة الباقة. خصومات للحجز المبكر وخطط دفع للعائلات.',
        packages: const [
          ServicePackage(
            nameEn: 'Economy Umrah',
            nameAr: 'عمرة اقتصادية',
            descriptionEn: 'Affordable Umrah package',
            descriptionAr: 'باقة عمرة بأسعار مناسبة',
            price: '\$1,500',
            featuresEn: [
              'Duration: 10 days',
              'Economy class flights',
              '3-star hotel (walking distance)',
              'Shared transport',
              'Group spiritual guide',
              'Basic meals included',
            ],
            featuresAr: [
              'المدة: 10 أيام',
              'رحلات جوية اقتصادية',
              'فندق 3 نجوم (قريب سيرًا)',
              'نقل جماعي',
              'مرشد ديني جماعي',
              'يشمل الوجبات الأساسية',
            ],
          ),
          ServicePackage(
            nameEn: 'Deluxe Umrah',
            nameAr: 'عمرة فاخرة',
            descriptionEn: 'Comfortable spiritual journey',
            descriptionAr: 'رحلة روحية مريحة',
            price: '\$3,000',
            featuresEn: [
              'Duration: 14 days',
              'Business class flights',
              '4-star hotel near Haram',
              'Private transport',
              'Experienced guide',
              'All meals included',
              'Ziyarat tours',
            ],
            featuresAr: [
              'المدة: 14 يومًا',
              'رحلات درجة رجال الأعمال',
              'فندق 4 نجوم قريب من الحرم',
              'نقل خاص',
              'مرشد ذو خبرة',
              'يشمل جميع الوجبات',
              'جولات زيارات دينية',
            ],
          ),
          ServicePackage(
            nameEn: 'VIP Umrah',
            nameAr: 'عمرة كبار الشخصيات',
            descriptionEn: 'Luxury pilgrimage experience',
            descriptionAr: 'تجربة عمرة فاخرة',
            price: '\$6,000',
            featuresEn: [
              'Duration: 15-21 days',
              'First class flights',
              '5-star hotel with Haram view',
              'Private chauffeur',
              'Personal spiritual advisor',
              'Premium buffet meals',
              'Extended Ziyarat program',
              'VIP airport services',
            ],
            featuresAr: [
              'المدة: 15-21 يومًا',
              'رحلات الدرجة الأولى',
              'فندق 5 نجوم بإطلالة على الحرم',
              'سائق خاص',
              'مستشار ديني شخصي',
              'وجبات فاخرة',
              'برنامج زيارات موسع',
              'خدمات مطار كبار الشخصيات',
            ],
          ),
        ],
        contactInstructionsEn:
            'Book your Umrah package at umrah@flywithus.com or call our dedicated Umrah team at +1-800-UMRAH-FLY. Our Islamic scholars are available for consultation. Join our group departures or customize your own package. Payment plans available.',
        contactInstructionsAr:
            'احجز باقة العمرة الخاصة بك عبر umrah@flywithus.com أو اتصل بفريق العمرة على الرقم +1-800-UMRAH-FLY. لدينا علماء شرعيون متاحون للاستشارة. يمكنك الانضمام إلى رحلاتنا الجماعية أو تخصيص باقتك الخاصة. تتوفر خطط دفع مرنة.',
      ),

      // ----------------------------------------
      MainService(
        id: '6',
        titleEn: 'Hajj',
        titleAr: 'الحج',
        subtitleEn: 'Fully managed Hajj packages for a blessed journey',
        subtitleAr: 'باقات حج متكاملة لرحلة مباركة',
        imageUrl: 'https://images.unsplash.com/photo-1542816417-0983c9c9ad53',
        icon: Icons.mosque_outlined,
        descriptionEn:
            'Fulfill your religious obligation with our complete Hajj packages. We provide experienced guides, comfortable accommodation, transportation, and comprehensive support throughout your journey.',
        descriptionAr:
            'أدِّ فريضة الحج من خلال باقاتنا الشاملة التي تتضمن مرشدين ذوي خبرة، إقامة مريحة، نقل آمن، ودعم متكامل طوال الرحلة.',
        overviewEn:
            'Our Hajj packages are meticulously planned to ensure your pilgrimage is spiritually rewarding and physically comfortable. We are licensed Hajj operators with years of experience. Our packages include comprehensive training sessions, experienced Mutawwif guides, and full logistical support.',
        overviewAr:
            'تم إعداد باقات الحج بعناية لضمان تجربة روحانية مريحة ومثمرة. نحن مشغلو حج معتمدون بخبرة سنوات طويلة. تشمل باقاتنا جلسات تدريب شاملة ومرشدين ذوي خبرة ودعمًا لوجستيًا كاملاً.',
        requirementsEn: [
          'Valid passport (minimum 6 months validity)',
          'Hajj visa through official lottery',
          'Vaccination certificates (mandatory)',
          'Medical fitness certificate',
          'Mahram for women',
          'Travel insurance',
          'Pre-departure Hajj training attendance',
          'Blood group documentation',
        ],
        requirementsAr: [
          'جواز سفر ساري لمدة لا تقل عن 6 أشهر',
          'تأشيرة حج من خلال القرعة الرسمية',
          'شهادات التطعيم (إلزامية)',
          'شهادة لياقة طبية',
          'محرم للنساء',
          'تأمين سفر',
          'حضور دورة تدريبية قبل السفر',
          'توثيق فصيلة الدم',
        ],
        costInformationEn:
            'Hajj packages range from \$5,000 for basic packages to \$15,000+ for premium options. Prices are set according to government regulations and include all mandatory services. Package cost covers flights, accommodation in Mina tents, Arafat, Muzdalifah, meals, and guidance. Payment schedule: 30% deposit, balance 60 days before departure.',
        costInformationAr:
            'تتراوح باقات الحج من 5000 دولار للباقات الأساسية إلى أكثر من 15000 دولار للباقات الفاخرة. الأسعار محددة وفقًا للوائح الحكومية وتشمل جميع الخدمات الأساسية. تشمل التكلفة الرحلات الجوية، والإقامة في خيام منى، وعرفات، ومزدلفة، والوجبات، والإرشاد. جدول الدفع: 30٪ مقدمًا والباقي قبل السفر بـ60 يومًا.',
        packages: const [
          ServicePackage(
            nameEn: 'Standard Hajj',
            nameAr: 'حج قياسي',
            descriptionEn: 'Complete Hajj package with essentials',
            descriptionAr: 'باقة حج شاملة تتضمن الأساسيات',
            price: '\$5,500',
            featuresEn: [
              'Duration: 18-20 days',
              'Economy flights',
              'Shared accommodation',
              'Standard Mina tents',
              'Group guidance',
              'Three meals daily',
              'Bus transport',
              'Pre-departure training',
            ],
            featuresAr: [
              'المدة: 18-20 يومًا',
              'رحلات اقتصادية',
              'إقامة مشتركة',
              'خيام منى قياسية',
              'إرشاد جماعي',
              'ثلاث وجبات يوميًا',
              'نقل بالحافلات',
              'تدريب قبل السفر',
            ],
          ),
          ServicePackage(
            nameEn: 'Comfort Hajj',
            nameAr: 'حج مريح',
            descriptionEn: 'Enhanced comfort and services',
            descriptionAr: 'راحة وخدمات محسّنة',
            price: '\$9,000',
            featuresEn: [
              'Duration: 20-25 days',
              'Business class flights',
              'Better located hotels',
              'Improved Mina tents',
              'Smaller group size',
              'Premium meals',
              'Better transport',
              'Medical support',
              'Experienced Mutawwif',
            ],
            featuresAr: [
              'المدة: 20-25 يومًا',
              'رحلات درجة رجال الأعمال',
              'فنادق أفضل موقعًا',
              'خيام منى محسّنة',
              'عدد أقل من الحجاج في المجموعة',
              'وجبات فاخرة',
              'نقل أفضل',
              'دعم طبي',
              'مطوّف ذو خبرة',
            ],
          ),
          ServicePackage(
            nameEn: 'Premium Hajj',
            nameAr: 'حج فاخر',
            descriptionEn: 'Luxury Hajj with maximum comfort',
            descriptionAr: 'حج فاخر مع أقصى درجات الراحة',
            price: '\$15,000',
            featuresEn: [
              'Duration: 25-30 days',
              'First class flights',
              '5-star hotels near Haram',
              'VIP Mina tents with AC',
              'Private guidance',
              'Gourmet meals',
              'Private transport',
              'Medical team',
              'Porter services',
              '24/7 personal assistance',
            ],
            featuresAr: [
              'المدة: 25-30 يومًا',
              'رحلات الدرجة الأولى',
              'فنادق 5 نجوم قريبة من الحرم',
              'خيام منى فاخرة مزودة بتكييف',
              'إرشاد خاص',
              'وجبات فاخرة',
              'نقل خاص',
              'فريق طبي',
              'خدمة حمالين',
              'مساعدة شخصية على مدار الساعة',
            ],
          ),
        ],
        contactInstructionsEn:
            'Apply for Hajj packages at hajj@flywithus.com or call +1-800-HAJJ-2025. Applications open annually in Shawwal. Limited spots available. Attend our free Hajj preparation seminars. Previous pilgrims receive priority registration. Family packages available with discounts.',
        contactInstructionsAr:
            'قدِّم طلبك لحزم الحج عبر البريد hajj@flywithus.com أو اتصل على +1-800-HAJJ-2025. يبدأ التسجيل سنويًا في شهر شوال. الأماكن محدودة. احضر ندواتنا المجانية للتحضير للحج. يحصل الحجاج السابقون على أولوية التسجيل. تتوفر خصومات للعائلات.',
      ),
    ];
  }

  static List<PortfolioItem> getPortfolioItems() {
    return [
      PortfolioItem(
        id: '1',
        titleEn: 'Summer Trip to Paris',
        titleAr: 'رحلة الصيف إلى باريس',
        subtitleEn: '7 days in Europe with guided tours',
        subtitleAr: '7 أيام في أوروبا مع جولات إرشادية',
        coverImageUrl:
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
        date: 'June 2024',
        duration: '7 Days',
        locationEn: 'Paris, France',
        locationAr: 'باريس، فرنسا',
        participantsCount: 45,
        shortDescriptionEn:
            'An unforgettable journey through the heart of Paris, exploring iconic landmarks and hidden gems.',
        shortDescriptionAr:
            'رحلة لا تُنسى عبر قلب باريس، تستكشف المعالم الشهيرة والكنوز المخفية.',
        fullDescriptionEn:
            'Our Paris Summer Trip was a magical experience that brought together 45 travelers from around the world. Over seven incredible days, we explored the City of Light\'s most iconic landmarks including the Eiffel Tower, Louvre Museum, Notre-Dame Cathedral, and the charming streets of Montmartre. Guests enjoyed authentic French cuisine at carefully selected restaurants, took romantic Seine River cruises, and discovered hidden gems known only to locals. The trip included expert guided tours, comfortable accommodations in a 4-star hotel near the Champs-Élysées, and plenty of free time for personal exploration. Our professional guides shared fascinating stories about Paris\'s rich history, art, and culture, making this journey both educational and entertaining.',
        fullDescriptionAr:
            'كانت رحلة باريس الصيفية تجربة سحرية جمعت 45 مسافرًا من جميع أنحاء العالم. على مدى سبعة أيام مذهلة، استكشفنا أبرز معالم مدينة النور بما في ذلك برج إيفل، ومتحف اللوفر، وكاتدرائية نوتردام، وشوارع مونمارتر الساحرة. استمتع الضيوف بالمأكولات الفرنسية الأصيلة في مطاعم مختارة بعناية، وتجولوا في رحلات نهر السين الرومانسية، واكتشفوا كنوزًا مخفية لا يعرفها سوى السكان المحليين. تضمنت الرحلة جولات إرشادية يقدمها خبراء، وإقامة مريحة في فندق 4 نجوم بالقرب من الشانزليزيه، والكثير من الوقت الحر للاستكشاف الشخصي. شاركنا أدلاءنا المحترفون قصصًا رائعة عن تاريخ باريس الغني وفنها وثقافتها، مما جعل هذه الرحلة تعليمية وترفيهية.',
        galleryImages: [
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
          'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f',
          'https://images.unsplash.com/photo-1499856871958-5b9627545d1a',
          'https://images.unsplash.com/photo-1431274172761-fca41d930114',
          'https://images.unsplash.com/photo-1550340499-a6c60fc8287c',
        ],
        highlightsEn: [
          'Visited the Eiffel Tower at sunset',
          'Private tour of the Louvre Museum',
          'Seine River dinner cruise',
          'Explored Montmartre and Sacré-Cœur',
          'Day trip to Versailles Palace',
          'French cooking class experience',
          'Wine tasting in local cellar',
        ],
        highlightsAr: [
          'زيارة برج إيفل عند غروب الشمس',
          'جولة خاصة في متحف اللوفر',
          'رحلة عشاء في نهر السين',
          'استكشاف مونمارتر وكنيسة القلب المقدس',
          'رحلة يومية إلى قصر فرساي',
          'تجربة فصل الطبخ الفرنسي',
          'تذوق النبيذ في قبو محلي',
        ],
        testimonials: [
          Testimonial(
            nameEn: 'Sarah Williams',
            nameAr: 'سارة ويليامز',
            commentEn:
                'This trip exceeded all my expectations! The guides were knowledgeable, the hotels were perfect, and Paris was absolutely magical. I can\'t wait to book my next trip with Fly With Us!',
            commentAr:
                'تجاوزت هذه الرحلة كل توقعاتي! كان المرشدون على دراية، وكانت الفنادق مثالية، وكانت باريس سحرية تمامًا. لا يمكنني الانتظار لحجز رحلتي القادمة مع Fly With Us!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          Testimonial(
            nameEn: 'Michael Chen',
            nameAr: 'مايكل تشين',
            commentEn:
                'Best organized tour I\'ve ever been on. Every detail was perfectly planned, and we got to see both the famous sites and hidden local spots. Highly recommended!',
            commentAr:
                'أفضل جولة منظمة شاركت فيها على الإطلاق. تم التخطيط لكل تفصيلة بشكل مثالي، وتمكنا من رؤية المواقع الشهيرة والأماكن المحلية المخفية. موصى به بشدة!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=13',
          ),
          Testimonial(
            nameEn: 'Emma Rodriguez',
            nameAr: 'إيما رودريغيز',
            commentEn:
                'The perfect blend of structure and freedom. Our guide was fantastic, and the group was wonderful. Paris will forever hold a special place in my heart!',
            commentAr:
                'مزيج مثالي من الهيكل والحرية. كان دليلنا رائعًا، وكانت المجموعة رائعة. ستحتفظ باريس دائمًا بمكانة خاصة في قلبي!',
            rating: 4.5,
            avatarUrl: 'https://i.pravatar.cc/150?img=4',
          ),
        ],
      ),
      PortfolioItem(
        id: '2',
        titleEn: 'Maldives Beach Paradise',
        titleAr: 'جنة شواطئ المالديف',
        subtitleEn: 'Luxury resort experience in tropical heaven',
        subtitleAr: 'تجربة منتجع فاخرة في الجنة الاستوائية',
        coverImageUrl:
            'https://images.unsplash.com/photo-1514282401047-d79a71a590e8',
        date: 'March 2024',
        duration: '10 Days',
        locationEn: 'Maldives',
        locationAr: 'جزر المالديف',
        participantsCount: 32,
        shortDescriptionEn:
            'Ultimate relaxation at a 5-star overwater resort with crystal-clear waters and white sandy beaches.',
        shortDescriptionAr:
            'استرخاء مثالي في منتجع 5 نجوم فوق الماء بمياه صافية وشواطئ رملية بيضاء.',
        fullDescriptionEn:
            'Our Maldives Beach Paradise package delivered the ultimate tropical escape for 32 fortunate guests. This luxury experience featured 10 days of pure bliss at an exclusive 5-star overwater resort. Guests stayed in stunning overwater villas with direct access to the turquoise lagoon, enjoyed world-class spa treatments, and indulged in gourmet international cuisine. Activities included snorkeling in vibrant coral reefs, sunset dolphin cruises, private island picnics, and water sports like kayaking, paddleboarding, and jet skiing. The resort\'s infinity pool, underwater restaurant, and pristine beaches provided endless opportunities for relaxation and memorable photos. This trip was perfect for couples, families, and anyone seeking a luxurious beach getaway.',
        fullDescriptionAr:
            'قدمت باقة جنة شواطئ المالديف لدينا الهروب الاستوائي المثالي لـ 32 ضيفًا محظوظًا. تضمنت تجربة الرفاهية هذه 10 أيام من النعيم الخالص في منتجع حصري من فئة 5 نجوم فوق الماء. أقام الضيوف في فيلات مذهلة فوق الماء مع وصول مباشر إلى البحيرة الفيروزية، واستمتعوا بعلاجات سبا عالمية المستوى، وانغمسوا في المأكولات الدولية الفاخرة. شملت الأنشطة الغوص في الشعاب المرجانية النابضة بالحياة، ورحلات دولفين عند غروب الشمس، ونزهات خاصة على الجزيرة، والرياضات المائية مثل التجديف والتزلج على الأمواج والتزلج المائي. وفرت بركة السباحة اللانهائية في المنتجع، والمطعم تحت الماء، والشواطئ البكر فرصًا لا نهاية لها للاسترخاء والصور التذكارية. كانت هذه الرحلة مثالية للأزواج والعائلات وأي شخص يبحث عن عطلة شاطئية فاخرة.',
        galleryImages: [
          'https://images.unsplash.com/photo-1514282401047-d79a71a590e8',
          'https://images.unsplash.com/photo-1573843981267-be1999ff37cd',
          'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f',
          'https://images.unsplash.com/photo-1559827260-dc66d52bef19',
          'https://images.unsplash.com/photo-1602002418082-a4443e081dd1',
        ],
        highlightsEn: [
          'Overwater villa with private pool',
          'Snorkeling with sea turtles',
          'Sunset dolphin watching cruise',
          'Couples spa treatment',
          'Underwater restaurant dinner',
          'Private sandbank picnic',
          'Water sports activities',
          'Beach bonfire night',
        ],
        highlightsAr: [
          'فيلا فوق الماء مع مسبح خاص',
          'الغوص مع سلاحف البحر',
          'رحلة مراقبة الدلافين عند الغروب',
          'علاج سبا للأزواج',
          'عشاء في مطعم تحت الماء',
          'نزهة على الرمل الخاص',
          'أنشطة الرياضات المائية',
          'ليلة نار على الشاطئ',
        ],
        testimonials: [
          Testimonial(
            nameEn: 'David Kumar',
            nameAr: 'ديفيد كومار',
            commentEn:
                'Pure paradise! The overwater villa was stunning, the service impeccable, and the waters were the clearest I\'ve ever seen. Worth every penny!',
            commentAr:
                'جنة خالصة! كانت الفيلا فوق الماء مذهلة، والخدمة لا تشوبها شائبة، والمياه كانت الأصفى التي رأيتها على الإطلاق. تستحق كل قرش!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=12',
          ),
          Testimonial(
            nameEn: 'Jennifer Lee',
            nameAr: 'جينيفر لي',
            commentEn:
                'Our honeymoon was absolutely perfect thanks to Fly With Us. The resort exceeded expectations and the activities were amazing. We\'ll treasure these memories forever!',
            commentAr:
                'كان شهر العسل لدينا مثاليًا تمامًا بفضل Fly With Us. تجاوز المنتجع التوقعات وكانت الأنشطة مذهلة. سنعتز بهذه الذكريات إلى الأبد!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=33',
          ),
        ],
      ),
      PortfolioItem(
        id: '3',
        titleEn: 'Dubai Desert Adventure',
        titleAr: 'مغامرة صحراء دبي',
        subtitleEn: 'Thrilling safari and luxury city experience',
        subtitleAr: 'تجربة سفاري مثيرة وتجربة مدينة فاخرة',
        coverImageUrl:
            'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
        date: 'February 2024',
        duration: '5 Days',
        locationEn: 'Dubai, UAE',
        locationAr: 'دبي، الإمارات',
        participantsCount: 28,
        shortDescriptionEn:
            'Experience the perfect blend of desert adventure and modern luxury in the heart of Dubai.',
        shortDescriptionAr:
            'جرب المزيج المثالي من مغامرة الصحراء والرفاهية الحديثة في قلب دبي.',
        fullDescriptionEn:
            'Our Dubai Desert Adventure combined thrilling desert experiences with the glamour of this futuristic city. Twenty-eight adventurers experienced the best of both worlds - from dune bashing and camel rides in the golden desert to shopping in luxury malls and dining in world-class restaurants. The trip included stays at a 5-star hotel on the Dubai Marina, a desert safari with traditional dinner and entertainment, visits to Burj Khalifa, Dubai Mall, and the Gold Souk. Guests enjoyed a dhow cruise on Dubai Creek, explored the historic Al Fahidi district, and witnessed the spectacular Dubai Fountain show. The highlight was our overnight desert camping experience under the stars, complete with traditional Bedouin hospitality.',
        fullDescriptionAr:
            'جمعت مغامرة صحراء دبي لدينا بين تجارب الصحراء المثيرة وبريق هذه المدينة المستقبلية. جرب 28 مغامرًا أفضل ما في العالمين - من ركوب الكثبان وركوب الجمال في الصحراء الذهبية إلى التسوق في مراكز التسوق الفاخرة وتناول الطعام في مطاعم عالمية المستوى. تضمنت الرحلة الإقامة في فندق 5 نجوم على دبي مارينا، وسفاري صحراوي مع عشاء تقليدي وترفيه، وزيارات لبرج خليفة، ودبي مول، وسوق الذهب. استمتع الضيوف برحلة على سفينة داو في خور دبي، واستكشفوا منطقة الفهيدي التاريخية، وشاهدوا عرض نافورة دبي المذهل. كان أبرز ما في الرحلة تجربة التخييم الصحراوي لليلة واحدة تحت النجوم، مع كرم الضيافة البدوية التقليدية.',
        galleryImages: [
          'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
          'https://images.unsplash.com/photo-1546412414-e1885259563a',
          'https://images.unsplash.com/photo-1518684079-3c830dcef090',
          'https://images.unsplash.com/photo-1582672060674-bc2bd808a8b5',
          'https://images.unsplash.com/photo-1566073771259-6a8506099945',
        ],
        highlightsEn: [
          'Burj Khalifa sunset viewing',
          'Desert safari with dune bashing',
          'Traditional Bedouin camp dinner',
          'Dubai Marina dhow cruise',
          'Gold Souk shopping experience',
          'Overnight desert camping',
          'Dubai Mall and Fountain show',
          'Camel riding adventure',
        ],
        highlightsAr: [
          'مشاهدة غروب الشمس من برج خليفة',
          'سفاري صحراوي مع ركوب الكثبان',
          'عشاء في مخيم بدوي تقليدي',
          'رحلة على سفينة داو في دبي مارينا',
          'تجربة التسوق في سوق الذهب',
          'تخييم صحراوي لليلة واحدة',
          'دبي مول وعرض النافورة',
          'مغامرة ركوب الجمال',
        ],
        testimonials: [
          Testimonial(
            nameEn: 'Robert Taylor',
            nameAr: 'روبرت تايلور',
            commentEn:
                'Dubai was incredible! The desert safari was thrilling, the city is stunning, and our guide made sure we experienced everything. Absolutely loved it!',
            commentAr:
                'كانت دبي لا تصدق! كان السفاري الصحراوي مثيرًا، والمدينة مذهلة، وتأكد دليلنا من أننا جربنا كل شيء. أحببته تمامًا!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=14',
          ),
          Testimonial(
            nameEn: 'Lisa Anderson',
            nameAr: 'ليزا أندرسون',
            commentEn:
                'Perfect balance of adventure and luxury. The desert camp was authentic and the city tours were comprehensive. Great value for money!',
            commentAr:
                'توازن مثالي بين المغامرة والرفاهية. كان المخيم الصحراوي أصليًا وكانت جولات المدينة شاملة. قيمة رائعة مقابل المال!',
            rating: 4.5,
            avatarUrl: 'https://i.pravatar.cc/150?img=11',
          ),
        ],
      ),
      PortfolioItem(
        id: '4',
        titleEn: 'Umrah Journey 2024',
        titleAr: 'رحلة العمرة 2024',
        subtitleEn: 'Spiritual pilgrimage to the Holy Cities',
        subtitleAr: 'رحلة حج روحية إلى المدن المقدسة',
        coverImageUrl:
            'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa',
        date: 'January 2024',
        duration: '14 Days',
        locationEn: 'Makkah & Madinah',
        locationAr: 'مكة المكرمة والمدينة المنورة',
        participantsCount: 120,
        shortDescriptionEn:
            'A blessed journey to Makkah and Madinah with complete spiritual guidance and comfortable arrangements.',
        shortDescriptionAr:
            'رحلة مباركة إلى مكة المكرمة والمدينة المنورة مع توجيه روحي كامل وترتيبات مريحة.',
        fullDescriptionEn:
            'Our Umrah Journey brought together 120 pilgrims for a deeply spiritual and memorable experience. The 14-day program included comfortable stays at 4-star hotels within walking distance of Haram in both Makkah and Madinah. Our experienced religious guides provided comprehensive spiritual support, teaching proper rituals and leading group prayers. The package included all transportation, three meals daily, and extensive Ziyarat tours covering significant Islamic historical sites. Pilgrims visited the Cave of Hira, Quba Mosque, Qiblatain Mosque, Uhud Mountain, and many other sacred locations. The trip was carefully organized to ensure both spiritual fulfillment and physical comfort, with medical support available 24/7. Many participants described this as a life-changing experience.',
        fullDescriptionAr:
            'جمعت رحلة العمرة لدينا 120 حاجًا لتجربة روحية عميقة لا تُنسى. تضمن البرنامج لمدة 14 يومًا إقامة مريحة في فنادق 4 نجوم على مسافة قريبة من الحرم في كل من مكة المكرمة والمدينة المنورة. قدم مرشدونا الدينيون ذوو الخبرة دعمًا روحيًا شاملاً، حيث علموا الطقوس الصحيحة وقادوا الصلوات الجماعية. تضمنت الباقة جميع وسائل النقل، وثلاث وجبات يوميًا، وجولات زيارة شاملة تغطي المواقع التاريخية الإسلامية الهامة. زار الحجاج غار حراء، ومسجد قباء، ومسجد القبلتين، وجبل أحد، والعديد من المواقع المقدسة الأخرى. تم تنظيم الرحلة بعناية لضمان الوفاء الروحي والراحة الجسدية، مع توفر الدعم الطبي على مدار الساعة. وصف العديد من المشاركين هذه التجربة بأنها تجربة غيرت حياتهم.',
        galleryImages: [
          'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa',
          'https://images.unsplash.com/photo-1580418827493-f2b22c0a76cb',
          'https://images.unsplash.com/photo-1564769625905-50e93615e769',
          'https://images.unsplash.com/photo-1590950151697-473629afd72e',
        ],
        highlightsEn: [
          'Accommodation near Haram',
          'Experienced religious guides',
          'Comprehensive Ziyarat tours',
          'Cave of Hira visit',
          'Quba Mosque prayers',
          'Uhud Mountain exploration',
          'Historical Islamic sites',
          '24/7 medical support',
          'Group spiritual sessions',
        ],
        highlightsAr: [
          'الإقامة بالقرب من الحرم',
          'مرشدون دينيون ذوو خبرة',
          'جولات زيارة شاملة',
          'زيارة غار حراء',
          'الصلاة في مسجد قباء',
          'استكشاف جبل أحد',
          'مواقع إسلامية تاريخية',
          'دعم طبي على مدار الساعة',
          'جلسات روحية جماعية',
        ],
        testimonials: [
          Testimonial(
            nameEn: 'Ahmed Hassan',
            nameAr: 'أحمد حسن',
            commentEn:
                'Alhamdulillah, this was the most beautiful experience of my life. The organization was excellent and our guide was very knowledgeable. May Allah bless the entire team.',
            commentAr:
                'الحمد لله، كانت هذه أجمل تجربة في حياتي. كان التنظيم ممتازًا وكان دليلنا على دراية كبيرة. بارك الله في الفريق بأكمله.',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=22',
          ),
          Testimonial(
            nameEn: 'Fatima Ali',
            nameAr: 'فاطمة علي',
            commentEn:
                'Everything was perfect from start to finish. The hotels were close to Haram, meals were delicious, and the Ziyarat tours were very informative. Highly recommended!',
            commentAr:
                'كان كل شيء مثاليًا من البداية إلى النهاية. كانت الفنادق قريبة من الحرم، والوجبات لذيذة، وكانت جولات الزيارة مفيدة جدًا. موصى به بشدة!',
            rating: 5.0,
            avatarUrl: 'https://i.pravatar.cc/150?img=22',
          ),
        ],
      ),
      // Continue with the same pattern for remaining portfolio items (5, 6)...
    ];
  }

  static List<Achievement> getAchievements() {
    return const [
      Achievement(
        id: '1',
        icon: Icons.people,
        number: 15000,
        labelEn: 'Happy Travelers',
        labelAr: 'مسافرون سعداء',
        suffix: '+',
        color: Color(0xFFFE910B), // Primary
      ),
      Achievement(
        id: '2',
        icon: Icons.flight_takeoff,
        number: 500,
        labelEn: 'Successful Trips',
        labelAr: 'رحلات ناجحة',
        suffix: '+',
        color: Color(0xFF2B388F), // Secondary
      ),
      Achievement(
        id: '3',
        icon: Icons.public,
        number: 75,
        labelEn: 'Destinations',
        labelAr: 'وجهات سفر',
        suffix: '+',
        color: Color(0xFF10B981), // Success
      ),
      Achievement(
        id: '4',
        icon: Icons.star,
        number: 98,
        labelEn: 'Satisfaction Rate',
        labelAr: 'معدل الرضا',
        suffix: '%',
        color: Color(0xFFF59E0B), // Amber
      ),
      Achievement(
        id: '5',
        icon: Icons.verified,
        number: 12,
        labelEn: 'Years Experience',
        labelAr: 'سنوات الخبرة',
        suffix: '+',
        color: Color(0xFF8B5CF6), // Purple
      ),
      Achievement(
        id: '6',
        icon: Icons.emoji_events,
        number: 25,
        labelEn: 'Awards Won',
        labelAr: 'جوائز تم الفوز بها',
        suffix: '+',
        color: Color(0xFFEC4899), // Pink
      ),
    ];
  }

  static List<CustomerReview> getCustomerReviews() {
    return const [
      CustomerReview(
        id: '1',
        customerNameEn: 'Sarah Johnson',
        customerNameAr: 'سارة جونسون',
        profileImageUrl: 'https://i.pravatar.cc/150?img=1',
        rating: 5.0,
        commentEn:
            'Absolutely amazing experience! The team was professional, the accommodations were perfect, and every detail was taken care of. This was truly a trip of a lifetime. I can\'t wait to book my next adventure with Fly With Us!',
        commentAr:
            'تجربة مذهلة تمامًا! كان الفريق محترفًا، والإقامة كانت مثالية، وتم الاهتمام بكل التفاصيل. كانت هذه حقًا رحلة العمر. لا يمكنني الانتظار لحجز مغامرتي القادمة مع Fly With Us!',
        tripNameEn: 'Summer Trip to Paris',
        tripNameAr: 'رحلة الصيف إلى باريس',
        destinationEn: 'Paris, France',
        destinationAr: 'باريس، فرنسا',
        date: 'June 2024',
      ),
      CustomerReview(
        id: '2',
        customerNameEn: 'Michael Chen',
        customerNameAr: 'مايكل تشين',
        profileImageUrl: 'https://i.pravatar.cc/150?img=13',
        rating: 5.0,
        commentEn:
            'Best travel company ever! From booking to the actual trip, everything was seamless. The guides were knowledgeable and friendly. Highly recommend Fly With Us to anyone looking for quality travel experiences.',
        commentAr:
            'أفضل شركة سفر على الإطلاق! من الحجز إلى الرحلة الفعلية، كان كل شيء سلسًا. كان المرشدون على دراية وودودين. أوصي بشدة بـ Fly With Us لأي شخص يبحث عن تجارب سفر عالية الجودة.',
        tripNameEn: 'Maldives Beach Paradise',
        tripNameAr: 'جنة شواطئ المالديف',
        destinationEn: 'Maldives',
        destinationAr: 'جزر المالديف',
        date: 'March 2024',
      ),
      CustomerReview(
        id: '3',
        customerNameEn: 'Emily Rodriguez',
        customerNameAr: 'إيميلي رودريغيز',
        profileImageUrl: 'https://i.pravatar.cc/150?img=4',
        rating: 4.5,
        commentEn:
            'Great service and attention to detail! The entire trip was well organized. Our guide was fantastic and made sure we had the best experience. Will definitely travel with them again.',
        commentAr:
            'خدمة رائعة واهتمام بالتفاصيل! كانت الرحلة بأكملها منظمة جيدًا. كان دليلنا رائعًا وتأكد من حصولنا على أفضل تجربة. سأسافر معهم مرة أخرى بالتأكيد.',
        tripNameEn: 'Dubai Desert Adventure',
        tripNameAr: 'مغامرة صحراء دبي',
        destinationEn: 'Dubai, UAE',
        destinationAr: 'دبي، الإمارات',
        date: 'February 2024',
      ),
      CustomerReview(
        id: '4',
        customerNameEn: 'David Kumar',
        customerNameAr: 'ديفيد كومار',
        profileImageUrl: 'https://i.pravatar.cc/150?img=12',
        rating: 5.0,
        commentEn:
            'The spiritual journey was beautifully organized. Every aspect of the Umrah was handled with care and respect. The accommodations were comfortable and close to the holy sites. Thank you for making this sacred journey so memorable.',
        commentAr:
            'تم تنظيم الرحلة الروحية بشكل جميل. تم التعامل مع كل جانب من جوانب العمرة بعناية واحترام. كانت أماكن الإقامة مريحة وقريبة من الأماكن المقدسة. شكرًا لكم على جعل هذه الرحلة المقدسة لا تُنسى.',
        tripNameEn: 'Umrah Journey 2024',
        tripNameAr: 'رحلة العمرة 2024',
        destinationEn: 'Makkah & Madinah',
        destinationAr: 'مكة المكرمة والمدينة المنورة',
        date: 'January 2024',
      ),
      CustomerReview(
        id: '5',
        customerNameEn: 'Jennifer Lee',
        customerNameAr: 'جينيفر لي',
        profileImageUrl: 'https://i.pravatar.cc/150?img=33',
        rating: 5.0,
        commentEn:
            'Our honeymoon was perfect thanks to Fly With Us! The resort exceeded all expectations, and the service was impeccable. Every moment was magical. We created memories that will last forever.',
        commentAr:
            'كان شهر عسلنا مثاليًا بفضل Fly With Us! تجاوز المنتجع كل التوقعات، وكانت الخدمة لا تشوبها شائبة. كانت كل لحظة سحرية. صنعنا ذكريات ستستمر إلى الأبد.',
        tripNameEn: 'Maldives Honeymoon',
        tripNameAr: 'شهر العسل في المالديف',
        destinationEn: 'Maldives',
        destinationAr: 'جزر المالديف',
        date: 'April 2024',
      ),
      CustomerReview(
        id: '6',
        customerNameEn: 'Robert Taylor',
        customerNameAr: 'روبرت تايلور',
        profileImageUrl: 'https://i.pravatar.cc/150?img=14',
        rating: 4.5,
        commentEn:
            'Excellent organization and fantastic value for money. The Swiss Alps trip was breathtaking. The ski instructors were patient and professional. A truly unforgettable winter vacation!',
        commentAr:
            'تنظيم ممتاز وقيمة رائعة مقابل المال. كانت رحلة جبال الألب السويسرية تأخذ الأنفاس. كان مدربو التزلج صبورين ومحترفين. عطلة شتوية لا تُنسى حقًا!',
        tripNameEn: 'Swiss Alps Winter Escape',
        tripNameAr: 'هروب الشتاء في جبال الألب السويسرية',
        destinationEn: 'Swiss Alps, Switzerland',
        destinationAr: 'جبال الألب السويسرية، سويسرا',
        date: 'December 2023',
      ),
      CustomerReview(
        id: '7',
        customerNameEn: 'Lisa Anderson',
        customerNameAr: 'ليزا أندرسون',
        profileImageUrl: 'https://i.pravatar.cc/150?img=10',
        rating: 5.0,
        commentEn:
            'Perfect blend of adventure and luxury! The Dubai trip exceeded my expectations. From desert safaris to city tours, everything was amazing. The team made sure we experienced the best of Dubai.',
        commentAr:
            'مزيج مثالي من المغامرة والرفاهية! تجاوزت رحلة دبي توقعاتي. من سفاري الصحراء إلى جولات المدينة، كان كل شيء مذهلاً. تأكد الفريق من أننا جربنا أفضل ما في دبي.',
        tripNameEn: 'Dubai Explorer',
        tripNameAr: 'مستكشف دبي',
        destinationEn: 'Dubai, UAE',
        destinationAr: 'دبي، الإمارات',
        date: 'November 2023',
      ),
      CustomerReview(
        id: '8',
        customerNameEn: 'James Wilson',
        customerNameAr: 'جيمس ويلسون',
        profileImageUrl: 'https://i.pravatar.cc/150?img=15',
        rating: 5.0,
        commentEn:
            'Turkey was incredible! The historical sites were fascinating, and our guide made history come alive. The hot air balloon ride in Cappadocia was the highlight. Highly professional service throughout.',
        commentAr:
            'كانت تركيا لا تصدق! كانت المواقع التاريخية رائعة، وجعل دليلنا التاريخ ينبض بالحياة. كانت رحلة المنطاد في كابادوكيا هي أبرز ما في الرحلة. خدمة عالية الاحترافية طوال الوقت.',
        tripNameEn: 'Turkey Cultural Tour',
        tripNameAr: 'جولة تركيا الثقافية',
        destinationEn: 'Istanbul & Cappadocia',
        destinationAr: 'إسطنبول وكابادوكيا',
        date: 'October 2023',
      ),
      CustomerReview(
        id: '9',
        customerNameEn: 'Maria Garcia',
        customerNameAr: 'ماريا غارسيا',
        profileImageUrl: 'https://i.pravatar.cc/150?img=20',
        rating: 4.5,
        commentEn:
            'Wonderful family vacation! The kids loved every minute. The itinerary was perfect for families with children. Great balance of activities and relaxation. Thank you for creating such beautiful memories!',
        commentAr:
            'عطلة عائلية رائعة! أحب الأطفال كل دقيقة. كان البرنامج مثاليًا للعائلات التي لديها أطفال. توازن رائع بين الأنشطة والاسترخاء. شكرًا لكم على صنع مثل هذه الذكريات الجميلة!',
        tripNameEn: 'Bali Family Adventure',
        tripNameAr: 'مغامرة بالي العائلية',
        destinationEn: 'Bali, Indonesia',
        destinationAr: 'بالي، إندونيسيا',
        date: 'September 2023',
      ),
      CustomerReview(
        id: '10',
        customerNameEn: 'Ahmed Hassan',
        customerNameAr: 'أحمد حسن',
        profileImageUrl: 'https://i.pravatar.cc/150?img=43',
        rating: 5.0,
        commentEn:
            'Alhamdulillah, the Umrah experience was smooth and spiritually fulfilling. The team was very helpful and knowledgeable. Hotels were excellent and close to Haram. May Allah bless the entire team.',
        commentAr:
            'الحمد لله، كانت تجربة العمرة سلسة ومرضية روحياً. كان الفريق مفيدًا جدًا وعلى دراية. كانت الفنادق ممتازة وقريبة من الحرم. بارك الله في الفريق بأكمله.',
        tripNameEn: 'Ramadan Umrah',
        tripNameAr: 'عمرة رمضان',
        destinationEn: 'Makkah & Madinah',
        destinationAr: 'مكة المكرمة والمدينة المنورة',
        date: 'March 2023',
      ),
      CustomerReview(
        id: '11',
        customerNameEn: 'Sophie Martin',
        customerNameAr: 'صوفي مارتن',
        profileImageUrl: 'https://i.pravatar.cc/150?img=16',
        rating: 5.0,
        commentEn:
            'Solo traveler here, and I felt safe and well-cared for the entire trip! The group was friendly, and the guide made sure everyone was included. Paris was magical, and I made friends for life!',
        commentAr:
            'مسافر منفرد هنا، وشعرت بالأمان والرعاية الجيدة طوال الرحلة! كانت المجموعة ودودة، وتأكد الدليل من إشراك الجميع. كانت باريس سحرية، وقد كونت أصدقاء مدى الحياة!',
        tripNameEn: 'Solo Paris Adventure',
        tripNameAr: 'مغامرة باريس المنفردة',
        destinationEn: 'Paris, France',
        destinationAr: 'باريس، فرنسا',
        date: 'May 2024',
      ),
      CustomerReview(
        id: '12',
        customerNameEn: 'Patricia Green',
        customerNameAr: 'باتريشيا غرين',
        profileImageUrl: 'https://i.pravatar.cc/150?img=23',
        rating: 5.0,
        commentEn:
            'Every detail was perfect! From the moment we arrived until departure, everything ran smoothly. The accommodations were luxurious, the food was delicious, and the sights were breathtaking. Worth every penny!',
        commentAr:
            'كانت كل التفاصيل مثالية! من لحظة وصولنا حتى المغادرة، سار كل شيء بسلاسة. كانت أماكن الإقامة فاخرة، والطعام لذيذ، والمشاهد تأخذ الأنفاس. تستحق كل قرش!',
        tripNameEn: 'European Grand Tour',
        tripNameAr: 'الجولة الأوروبية الكبرى',
        destinationEn: 'Europe',
        destinationAr: 'أوروبا',
        date: 'July 2023',
      ),
    ];
  }

  static List<Branch> getBranches() {
    return const [
      Branch(
        id: '1',
        cityNameEn: 'Dubai',
        cityNameAr: 'دبي',
        countryEn: 'United Arab Emirates',
        countryAr: 'الإمارات العربية المتحدة',
        addressEn:
            'Sheikh Zayed Road, Business Bay Tower, Floor 15, Office 1501',
        addressAr: 'طريق الشيخ زايد، برج بيزنس باي، الطابق 15، مكتب 1501',
        phoneNumber: '+971-4-123-4567',
        email: 'dubai@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
        latitude: 25.2048,
        longitude: 55.2708,
        workingHoursEn: 'Sun-Thu: 9:00 AM - 6:00 PM',
        workingHoursAr: 'الأحد-الخميس: 9:00 صباحاً - 6:00 مساءً',
        servicesEn: [
          'Flight Booking',
          'Visa Assistance',
          'Hotel Reservations',
          'Tour Packages',
        ],
        servicesAr: [
          'حجز الطيران',
          'المساعدة في التأشيرة',
          'حجوزات الفنادق',
          'باقات الجولات',
        ],
      ),
      Branch(
        id: '2',
        cityNameEn: 'London',
        cityNameAr: 'لندن',
        countryEn: 'United Kingdom',
        countryAr: 'المملكة المتحدة',
        addressEn: '123 Oxford Street, Westminster, London W1D 2HG',
        addressAr: '123 شارع أكسفورد، وستمنستر، لندن W1D 2HG',
        phoneNumber: '+44-20-7123-4567',
        email: 'london@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad',
        latitude: 51.5074,
        longitude: -0.1278,
        workingHoursEn: 'Mon-Fri: 9:00 AM - 6:00 PM, Sat: 10:00 AM - 4:00 PM',
        workingHoursAr:
            'الاثنين-الجمعة: 9:00 صباحاً - 6:00 مساءً، السبت: 10:00 صباحاً - 4:00 مساءً',
        servicesEn: [
          'European Tours',
          'Flight Booking',
          'Travel Insurance',
          'Group Bookings',
        ],
        servicesAr: [
          'جولات أوروبا',
          'حجز الطيران',
          'تأمين السفر',
          'حجوزات المجموعات',
        ],
      ),
      Branch(
        id: '3',
        cityNameEn: 'New York',
        cityNameAr: 'نيويورك',
        countryEn: 'United States',
        countryAr: 'الولايات المتحدة',
        addressEn: '456 Fifth Avenue, Manhattan, New York, NY 10018',
        addressAr: '456 الجادة الخامسة، مانهاتن، نيويورك، NY 10018',
        phoneNumber: '+1-212-555-0123',
        email: 'newyork@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9',
        latitude: 40.7128,
        longitude: -74.0060,
        workingHoursEn: 'Mon-Fri: 8:00 AM - 7:00 PM, Sat: 10:00 AM - 5:00 PM',
        workingHoursAr:
            'الاثنين-الجمعة: 8:00 صباحاً - 7:00 مساءً، السبت: 10:00 صباحاً - 5:00 مساءً',
        servicesEn: [
          'International Travel',
          'Corporate Bookings',
          'Cruise Packages',
          'Luxury Travel',
        ],
        servicesAr: [
          'السفر الدولي',
          'حجوزات الشركات',
          'باقات الرحلات البحرية',
          'السفر الفاخر',
        ],
      ),
      Branch(
        id: '4',
        cityNameEn: 'Singapore',
        cityNameAr: 'سنغافورة',
        countryEn: 'Singapore',
        countryAr: 'سنغافورة',
        addressEn: '789 Orchard Road, #10-01 Plaza Singapore, Singapore 238839',
        addressAr: '789 طريق أورشارد، #10-01 بلازا سنغافورة، سنغافورة 238839',
        phoneNumber: '+65-6123-4567',
        email: 'singapore@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1525625293386-3f8f99389edd',
        latitude: 1.3521,
        longitude: 103.8198,
        workingHoursEn: 'Mon-Sat: 9:00 AM - 8:00 PM, Sun: 11:00 AM - 6:00 PM',
        workingHoursAr:
            'الاثنين-السبت: 9:00 صباحاً - 8:00 مساءً، الأحد: 11:00 صباحاً - 6:00 مساءً',
        servicesEn: [
          'Asia Pacific Tours',
          'Business Travel',
          'Honeymoon Packages',
          'Visa Services',
        ],
        servicesAr: [
          'جولات آسيا والمحيط الهادئ',
          'سفر الأعمال',
          'باقات شهر العسل',
          'خدمات التأشيرة',
        ],
      ),
      Branch(
        id: '5',
        cityNameEn: 'Paris',
        cityNameAr: 'باريس',
        countryEn: 'France',
        countryAr: 'فرنسا',
        addressEn: '45 Avenue des Champs-Élysées, 75008 Paris',
        addressAr: '45 جادة الشانزليزيه، 75008 باريس',
        phoneNumber: '+33-1-4567-8900',
        email: 'paris@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
        latitude: 48.8566,
        longitude: 2.3522,
        workingHoursEn: 'Mon-Sat: 9:30 AM - 7:00 PM',
        workingHoursAr: 'الاثنين-السبت: 9:30 صباحاً - 7:00 مساءً',
        servicesEn: [
          'European Travel',
          'Cultural Tours',
          'Romantic Getaways',
          'Rail Passes',
        ],
        servicesAr: [
          'السفر في أوروبا',
          'جولات ثقافية',
          'عطلات رومانسية',
          'تصاريح السكك الحديدية',
        ],
      ),
      Branch(
        id: '6',
        cityNameEn: 'Tokyo',
        cityNameAr: 'طوكيو',
        countryEn: 'Japan',
        countryAr: 'اليابان',
        addressEn: '1-2-3 Shibuya, Shibuya City, Tokyo 150-0002',
        addressAr: '1-2-3 شيبويا، مدينة شيبويا، طوكيو 150-0002',
        phoneNumber: '+81-3-1234-5678',
        email: 'tokyo@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf',
        latitude: 35.6762,
        longitude: 139.6503,
        workingHoursEn: 'Mon-Fri: 9:00 AM - 6:00 PM, Sat: 10:00 AM - 5:00 PM',
        workingHoursAr:
            'الاثنين-الجمعة: 9:00 صباحاً - 6:00 مساءً، السبت: 10:00 صباحاً - 5:00 مساءً',
        servicesEn: [
          'Japan Travel',
          'Cultural Experiences',
          'Business Travel',
          'Rail Tours',
        ],
        servicesAr: [
          'السفر إلى اليابان',
          'تجارب ثقافية',
          'سفر الأعمال',
          'جولات السكك الحديدية',
        ],
      ),
      Branch(
        id: '7',
        cityNameEn: 'Sydney',
        cityNameAr: 'سيدني',
        countryEn: 'Australia',
        countryAr: 'أستراليا',
        addressEn: '100 George Street, The Rocks, Sydney NSW 2000',
        addressAr: '100 شارع جورج، ذا روكس، سيدني NSW 2000',
        phoneNumber: '+61-2-9876-5432',
        email: 'sydney@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9',
        latitude: -33.8688,
        longitude: 151.2093,
        workingHoursEn: 'Mon-Fri: 8:30 AM - 5:30 PM, Sat: 10:00 AM - 3:00 PM',
        workingHoursAr:
            'الاثنين-الجمعة: 8:30 صباحاً - 5:30 مساءً، السبت: 10:00 صباحاً - 3:00 مساءً',
        servicesEn: [
          'Australia Tours',
          'Adventure Travel',
          'Wildlife Tours',
          'Beach Packages',
        ],
        servicesAr: [
          'جولات أستراليا',
          'سفر المغامرات',
          'جولات الحياة البرية',
          'باقات الشاطئ',
        ],
      ),
      Branch(
        id: '8',
        cityNameEn: 'Istanbul',
        cityNameAr: 'إسطنبول',
        countryEn: 'Turkey',
        countryAr: 'تركيا',
        addressEn: 'Istiklal Caddesi No:123, Beyoğlu, Istanbul 34433',
        addressAr: 'شارع استقلال رقم 123، بيوغلو، إسطنبول 34433',
        phoneNumber: '+90-212-345-6789',
        email: 'istanbul@flywithus.com',
        imageUrl:
            'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200',
        latitude: 41.0082,
        longitude: 28.9784,
        workingHoursEn: 'Mon-Sat: 9:00 AM - 7:00 PM',
        workingHoursAr: 'الاثنين-السبت: 9:00 صباحاً - 7:00 مساءً',
        servicesEn: [
          'Turkey Tours',
          'Historical Tours',
          'Mediterranean Cruises',
          'Shopping Tours',
        ],
        servicesAr: [
          'جولات تركيا',
          'جولات تاريخية',
          'رحلات بحرية في البحر المتوسط',
          'جولات التسوق',
        ],
      ),
    ];
  }
}
