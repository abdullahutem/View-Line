import 'package:flutter/material.dart';
import 'package:view_line/features/about_us/models/about_us_model.dart';
import 'package:view_line/features/about_us/models/employee_model.dart';
import 'package:view_line/features/about_us/models/partner_model.dart';
import 'package:view_line/features/home/models/advertisement.dart';
import 'package:view_line/features/home/models/main_service_model.dart';
import 'package:view_line/features/services/models/service.dart';

class MockData {
  static List<Advertisement> getAdvertisements() {
    return [
      Advertisement(
        id: '1',
        title: 'Summer Special',
        description: 'Get 30% off on all beach destinations this summer!',
        imageUrl:
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),

      Advertisement(
        id: '2',
        title: 'Adventure Awaits',
        description: 'Explore mountain trails with our exclusive packages',
        imageUrl:
            'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),
      Advertisement(
        id: '3',
        title: 'City Tours',
        description: 'Discover the worlds most beautiful cities',
        imageUrl:
            'https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      ),
    ];
  }

  static List<Service> getServices() {
    return [
      Service(
        id: '1',
        title: 'Maldives Beach Resort',
        subtitle: 'Luxury all-inclusive package',
        imageUrl:
            'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
        location: 'Maldives',
        date: '2025-12-15',
        cost: 2500.00,
        description:
            'Experience paradise with our exclusive Maldives package. Enjoy crystal-clear waters, white sandy beaches, and world-class amenities. This all-inclusive resort offers the perfect tropical getaway with water sports, spa treatments, and gourmet dining.',
        terms: [
          'Booking must be made at least 30 days in advance',
          'Cancellation fees apply if canceled within 14 days',
          'Travel insurance is mandatory',
          'Valid passport required with 6 months validity',
        ],
        requirements: [
          'Valid passport',
          'Travel visa (arranged by us)',
          'COVID-19 vaccination certificate',
          'Travel insurance',
        ],
        tripPlan: [
          'Day 1: Arrival and welcome drinks',
          'Day 2-3: Beach activities and water sports',
          'Day 4: Island hopping tour',
          'Day 5: Spa day and sunset cruise',
          'Day 6: Free day for personal exploration',
          'Day 7: Departure',
        ],
      ),
      Service(
        id: '2',
        title: 'Swiss Alps Adventure',
        subtitle: 'Mountain hiking and skiing',
        imageUrl:
            'https://images.unsplash.com/photo-1531366936337-7c912a4589a7',
        location: 'Switzerland',
        date: '2026-01-20',
        cost: 3200.00,
        description:
            'Embark on an unforgettable journey through the Swiss Alps. This adventure includes guided hiking tours, skiing lessons, and stays in cozy mountain lodges with stunning alpine views.',
        terms: [
          'Suitable for intermediate fitness levels',
          'Weather-dependent activities',
          'Equipment rental included',
          'Minimum age requirement: 16 years',
        ],
        requirements: [
          'Warm clothing and hiking boots',
          'Travel insurance with adventure sports coverage',
          'Basic fitness level',
          'Valid ID or passport',
        ],
        tripPlan: [
          'Day 1: Arrival in Zurich, transfer to resort',
          'Day 2: Ski lessons and practice',
          'Day 3: Guided mountain hiking',
          'Day 4: Cable car tour and photography',
          'Day 5: Free skiing or snowboarding',
          'Day 6: Visit local villages',
          'Day 7: Departure',
        ],
      ),
      Service(
        id: '3',
        title: 'Paris Cultural Tour',
        subtitle: 'Art, history, and cuisine',
        imageUrl:
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
        location: 'Paris, France',
        date: '2025-11-10',
        cost: 1800.00,
        description:
            'Immerse yourself in the City of Light. Visit iconic landmarks like the Eiffel Tower, Louvre Museum, and Notre-Dame Cathedral. Enjoy authentic French cuisine and explore charming Parisian neighborhoods.',
        terms: [
          'Hotel accommodation included',
          'Museum tickets pre-arranged',
          'Local guide provided',
          'Group size limited to 15 people',
        ],
        requirements: [
          'Valid passport',
          'Schengen visa (if applicable)',
          'Comfortable walking shoes',
          'Basic travel insurance',
        ],
        tripPlan: [
          'Day 1: Arrival and city orientation',
          'Day 2: Eiffel Tower and Seine River cruise',
          'Day 3: Louvre Museum and Latin Quarter',
          'Day 4: Versailles Palace day trip',
          'Day 5: Montmartre and Sacré-Cœur',
          'Day 6: Shopping and free time',
          'Day 7: Departure',
        ],
      ),
      Service(
        id: '4',
        title: 'Dubai Desert Safari',
        subtitle: 'Luxury desert experience',
        imageUrl:
            'https://images.unsplash.com/photo-1512453979798-5ea266f8880c',
        location: 'Dubai, UAE',
        date: '2025-10-28',
        cost: 1200.00,
        description:
            'Experience the magic of the Arabian desert. Enjoy dune bashing, camel rides, traditional entertainment, and a luxurious dinner under the stars in a Bedouin-style camp.',
        terms: [
          'Pickup and drop-off included',
          'Vegetarian meals available',
          'Not suitable for pregnant women',
          'Children under 3 years free',
        ],
        requirements: [
          'Comfortable clothing',
          'Sunglasses and sunscreen',
          'Camera for photos',
          'Valid ID',
        ],
        tripPlan: [
          'Day 1: Hotel pickup at 3 PM',
          'Dune bashing adventure (1 hour)',
          'Camel riding and sandboarding',
          'Traditional henna painting',
          'BBQ dinner with live entertainment',
          'Return to hotel by 9 PM',
        ],
      ),
      Service(
        id: '5',
        title: 'Bali Wellness Retreat',
        subtitle: 'Yoga, meditation, and relaxation',
        imageUrl:
            'https://images.unsplash.com/photo-1537996194471-e657df975ab4',
        location: 'Ubud, Bali',
        date: '2026-02-14',
        cost: 1500.00,
        description:
            'Rejuvenate your mind and body in the heart of Bali. This wellness retreat includes daily yoga sessions, meditation classes, spa treatments, and healthy organic meals in a peaceful jungle setting.',
        terms: [
          'Suitable for all skill levels',
          'Single and shared accommodations available',
          'All meals included',
          'Minimum 5-day stay',
        ],
        requirements: [
          'Yoga mat (can be provided)',
          'Comfortable exercise clothing',
          'Valid passport and visa',
          'Open mind and positive attitude',
        ],
        tripPlan: [
          'Day 1: Arrival and welcome ceremony',
          'Day 2-3: Morning yoga, afternoon meditation',
          'Day 4: Rice terrace trek and spa day',
          'Day 5: Balinese cooking class',
          'Day 6: Temple visit and cultural tour',
          'Day 7: Sunrise yoga and departure',
        ],
      ),
      Service(
        id: '6',
        title: 'Iceland Northern Lights',
        subtitle: 'Aurora viewing expedition',
        imageUrl:
            'https://images.unsplash.com/photo-1483347756197-71ef80e95f73',
        location: 'Reykjavik, Iceland',
        date: '2025-11-25',
        cost: 2800.00,
        description:
            'Witness the breathtaking Northern Lights in Iceland. This tour includes guided aurora hunting, visits to hot springs, glacier walks, and exploration of stunning Icelandic landscapes.',
        terms: [
          'Northern Lights viewing subject to weather',
          'Warm clothing rental available',
          '4x4 transportation provided',
          'Photography guidance included',
        ],
        requirements: [
          'Warm winter clothing',
          'Waterproof boots',
          'Camera with manual settings (recommended)',
          'Valid passport',
        ],
        tripPlan: [
          'Day 1: Arrival and Blue Lagoon visit',
          'Day 2: Golden Circle tour',
          'Day 3: Glacier hiking',
          'Day 4: Northern Lights hunt',
          'Day 5: South Coast waterfalls',
          'Day 6: Reykjavik city tour',
          'Day 7: Departure',
        ],
      ),
    ];
  }

  static AboutUsModel getAboutData() {
    return AboutUsModel(
      appName: 'Fly With Us',
      subtitle: 'Your trusted travel companion around the world',
      description:
          'Fly With Us is a travel platform that helps adventurers, families, and professionals discover amazing destinations, plan trips effortlessly, and connect with trusted travel partners. Our goal is to make every journey safe, enjoyable, and memorable. We provide comprehensive travel packages, expert guidance, and 24/7 support to ensure your travel experience is seamless from start to finish.',
      vision:
          'To become the leading travel companion that inspires exploration and connects people across the globe, making travel accessible, affordable, and unforgettable for everyone.',
      message:
          'We believe that traveling is more than moving between places — it\'s about connecting cultures, making memories, and discovering yourself. Every journey with us is an opportunity to grow, learn, and create stories that last a lifetime.',
      values: [
        'Customer Satisfaction',
        'Transparency and Trust',
        'Adventure and Discovery',
        'Safety and Comfort',
        'Innovation and Excellence',
        'Environmental Responsibility',
      ],
      partners: [
        const PartnerModel(
          id: '1',
          name: 'Skyline Airlines',
          logoUrl:
              'https://via.placeholder.com/150x150/2b388f/ffffff?text=Skyline',
        ),
        const PartnerModel(
          id: '2',
          name: 'Global Hotels',
          logoUrl:
              'https://via.placeholder.com/150x150/fe910b/ffffff?text=Hotels',
        ),
        const PartnerModel(
          id: '3',
          name: 'TravelPay',
          logoUrl:
              'https://via.placeholder.com/150x150/10B981/ffffff?text=TravelPay',
        ),
        const PartnerModel(
          id: '4',
          name: 'Adventure Tours',
          logoUrl:
              'https://via.placeholder.com/150x150/EF4444/ffffff?text=Tours',
        ),
        const PartnerModel(
          id: '5',
          name: 'Cruise Lines',
          logoUrl:
              'https://via.placeholder.com/150x150/8B5CF6/ffffff?text=Cruise',
        ),
      ],
      employees: [
        const EmployeeModel(
          id: '1',
          name: 'Sarah Johnson',
          position: 'CEO & Founder',
          imageUrl: 'https://i.pravatar.cc/300?img=1',
        ),
        const EmployeeModel(
          id: '2',
          name: 'Michael Chen',
          position: 'Chief Operating Officer',
          imageUrl: 'https://i.pravatar.cc/300?img=13',
        ),
        const EmployeeModel(
          id: '3',
          name: 'Emily Rodriguez',
          position: 'Head of Customer Experience',
          imageUrl: 'https://i.pravatar.cc/300?img=5',
        ),
        const EmployeeModel(
          id: '4',
          name: 'David Kumar',
          position: 'Travel Operations Manager',
          imageUrl: 'https://i.pravatar.cc/300?img=12',
        ),
        const EmployeeModel(
          id: '5',
          name: 'Jessica Williams',
          position: 'Marketing Director',
          imageUrl: 'https://i.pravatar.cc/300?img=9',
        ),
        const EmployeeModel(
          id: '6',
          name: 'Robert Taylor',
          position: 'Technology Lead',
          imageUrl: 'https://i.pravatar.cc/300?img=14',
        ),
      ],
    );
  }

  // static AboutUsModel getAboutUsData() {
  //   return AboutUsModel(
  //     appName: 'View Line',
  //     subtitle: 'Your trusted travel companion around the world',
  //     description:
  //         'View Line is a travel platform that helps adventurers, families, and professionals discover amazing destinations, plan trips effortlessly, and connect with trusted travel partners. Our goal is to make every journey safe, enjoyable, and memorable.',
  //     vision:
  //         'To become the leading travel companion that inspires exploration and connects people across the globe.',
  //     message:
  //         'We believe that traveling is more than moving between places — it’s about connecting cultures, making memories, and discovering yourself.',
  //     values: [
  //       'Customer Satisfaction',
  //       'Transparency and Trust',
  //       'Adventure and Discovery',
  //       'Safety and Comfort',
  //     ],
  //     partners: [
  //       Partner(name: 'Emirates', imageUrl: 'assets/images/Emirates_logo.svg'),
  //       Partner(
  //         name: 'Qatar Airways',
  //         imageUrl: 'assets/images/Qatar_Airways_logo.svg',
  //       ),
  //     ],
  //     team: [
  //       TeamMember(
  //         name: 'Alice Johnson',
  //         position: 'CEO & Founder',
  //         imageUrl:
  //             'assets/images/1Employee.png', // Make sure these paths exist
  //       ),
  //       TeamMember(
  //         name: 'Bob Smith',
  //         position: 'Chief Technology Officer',
  //         imageUrl: 'assets/images/2Employee.png',
  //       ),
  //       TeamMember(
  //         name: 'Clara White',
  //         position: 'Lead Designer',
  //         imageUrl: 'assets/images/3Employee.png',
  //       ),
  //       TeamMember(
  //         name: 'David Brown',
  //         position: 'Head of Marketing',
  //         imageUrl: 'assets/images/4Employee.png',
  //       ),
  //     ],
  //   );
  // }

  static List<MainService> getMainServices() {
    return [
      MainService(
        id: '1',
        title: 'Flight Ticketing',
        subtitle: 'Book flights easily with the best prices',
        imageUrl:
            'https://images.unsplash.com/photo-1436491865332-7a61a109cc05',
        icon: Icons.flight,
        description:
            'Our Flight Ticketing service provides you with access to thousands of airlines worldwide. Get competitive prices, flexible booking options, and 24/7 customer support for all your air travel needs.',
        overview:
            'We offer comprehensive flight booking services for domestic and international destinations. Our partnership with major airlines ensures you get the best deals and most convenient flight schedules. Whether you\'re traveling for business or pleasure, we make flight booking simple and hassle-free.',
        requirements: [
          'Valid passport (for international flights)',
          'Visa documentation (if required)',
          'Passenger details (full name, date of birth, contact info)',
          'Payment method (credit/debit card)',
          'Email address for ticket confirmation',
        ],
        costInformation:
            'Flight prices vary based on destination, travel dates, and booking class. We offer Economy, Premium Economy, Business, and First Class options. Prices start from \$150 for domestic flights and \$500 for international flights. Group discounts available for 10+ passengers. Early booking can save you up to 40%.',
        packages: const [
          ServicePackage(
            name: 'Economy Saver',
            description: 'Budget-friendly option with essential services',
            price: 'From \$150',
            features: [
              'Standard seat selection',
              'Carry-on baggage included',
              '20kg checked baggage',
              'In-flight meal',
              'Free date change (with fee)',
            ],
          ),
          ServicePackage(
            name: 'Business Class',
            description: 'Premium comfort and exclusive services',
            price: 'From \$800',
            features: [
              'Priority check-in and boarding',
              'Extra legroom and comfort',
              '40kg checked baggage',
              'Gourmet meals and drinks',
              'Lounge access',
              'Free date changes',
            ],
          ),
          ServicePackage(
            name: 'First Class',
            description: 'Ultimate luxury travel experience',
            price: 'From \$2,000',
            features: [
              'Fully reclining seats/beds',
              'Private suite (selected airlines)',
              'Unlimited baggage',
              'Fine dining and premium drinks',
              'Personal entertainment system',
              'Chauffeur service',
            ],
          ),
        ],
        contactInstructions:
            'Book your flight by calling our 24/7 hotline at +1-800-FLY-WITH or email us at flights@flywithus.com. You can also book directly through our app. Our travel consultants are ready to assist you with finding the perfect flight for your journey.',
      ),
      MainService(
        id: '2',
        title: 'Visa Assistance',
        subtitle: 'Get your visa processed quickly and hassle-free',
        imageUrl:
            'https://images.unsplash.com/photo-1554224155-6726b3ff858f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
        icon: Icons.assignment,
        description:
            'Our expert visa assistance team helps you navigate the complex visa application process. We handle documentation, appointments, and follow-ups to ensure your visa is approved on time.',
        overview:
            'We provide end-to-end visa services for tourist, business, work, and student visas across 150+ countries. Our experienced consultants are up-to-date with the latest visa requirements and regulations, ensuring your application has the best chance of approval.',
        requirements: [
          'Valid passport (minimum 6 months validity)',
          'Passport-sized photographs (2-4 recent photos)',
          'Completed visa application form',
          'Proof of accommodation',
          'Bank statements (last 3-6 months)',
          'Travel itinerary',
          'Travel insurance',
          'Employment letter or business documents',
        ],
        costInformation:
            'Visa service fees vary by destination and visa type. Our service fee ranges from \$50-\$200 plus government visa fees. Express processing available for urgent applications (additional \$100). We offer package deals for families and groups.',
        packages: const [
          ServicePackage(
            name: 'Standard Processing',
            description: 'Regular visa application service',
            price: '\$50 + Visa Fees',
            features: [
              'Document verification',
              'Application form assistance',
              'Appointment booking',
              'Basic consultation',
              'Processing time: 15-30 days',
            ],
          ),
          ServicePackage(
            name: 'Premium Service',
            description: 'Complete visa support with priority',
            price: '\$150 + Visa Fees',
            features: [
              'Complete documentation support',
              'Interview preparation',
              'Priority appointment',
              'Application tracking',
              'Processing time: 7-15 days',
              'Follow-up services',
            ],
          ),
          ServicePackage(
            name: 'Express VIP',
            description: 'Fastest visa processing available',
            price: '\$300 + Visa Fees',
            features: [
              'VIP consultation',
              'Same-day appointment',
              'Express documentation',
              'Interview coaching',
              'Processing time: 2-7 days',
              'Dedicated support',
              'Success guarantee or refund',
            ],
          ),
        ],
        contactInstructions:
            'Contact our visa specialists at visa@flywithus.com or call +1-800-VISA-NOW. Schedule a free consultation to discuss your visa requirements. Our offices are open Monday-Friday, 9 AM - 6 PM.',
      ),
      MainService(
        id: '3',
        title: 'Sightseeing Tours & Land Packages',
        subtitle: 'Explore amazing destinations with guided tours',
        imageUrl:
            'https://images.unsplash.com/photo-1488646953014-85cb44e25828',
        icon: Icons.tour,
        description:
            'Discover the world\'s most beautiful destinations with our expertly curated sightseeing tours and land packages. From historical landmarks to natural wonders, we offer unforgettable experiences.',
        overview:
            'Our sightseeing tours cover popular tourist destinations worldwide. Each tour is designed by travel experts and led by knowledgeable local guides who bring destinations to life with fascinating stories and insider knowledge. We handle all logistics including transportation, entrance fees, and meals.',
        requirements: [
          'Valid identification or passport',
          'Comfortable walking shoes',
          'Weather-appropriate clothing',
          'Camera (optional)',
          'Water bottle',
          'Basic travel insurance recommended',
          'Minimum age requirements may apply',
        ],
        costInformation:
            'Tour prices range from \$80 for half-day city tours to \$2,500 for multi-day land packages. Prices include transportation, guide services, entrance fees, and specified meals. Children under 12 receive 25% discount. Group discounts available for 8+ people.',
        packages: const [
          ServicePackage(
            name: 'City Explorer',
            description: 'Half-day city sightseeing tour',
            price: '\$80 per person',
            features: [
              'Duration: 4-5 hours',
              'Visit 4-6 major attractions',
              'Air-conditioned transport',
              'Professional guide',
              'Entrance fees included',
            ],
          ),
          ServicePackage(
            name: 'Heritage Journey',
            description: 'Full-day cultural and heritage tour',
            price: '\$150 per person',
            features: [
              'Duration: 8-10 hours',
              'Visit 8-10 attractions',
              'Lunch included',
              'Expert historian guide',
              'Small group (max 15)',
              'Photo opportunities',
            ],
          ),
          ServicePackage(
            name: 'Grand Adventure',
            description: 'Multi-day exploration package',
            price: 'From \$1,200',
            features: [
              'Duration: 5-7 days',
              'Hotel accommodation',
              'All meals included',
              'Multiple destinations',
              'Cultural experiences',
              'Adventure activities',
              '24/7 tour support',
            ],
          ),
        ],
        contactInstructions:
            'Book your tour at tours@flywithus.com or call +1-800-TOURS-US. Browse our complete tour catalog on our website. Custom tour packages available upon request. Book 30 days in advance for 10% early bird discount.',
      ),
      MainService(
        id: '4',
        title: 'Accommodation & Transportation',
        subtitle: 'Comfortable stays and reliable transport services',
        imageUrl:
            'https://images.unsplash.com/photo-1566073771259-6a8506099945',
        icon: Icons.hotel,
        description:
            'We provide quality accommodation ranging from budget hotels to luxury resorts, along with reliable transportation services including airport transfers, car rentals, and private chauffeurs.',
        overview:
            'Our accommodation partners include thousands of verified hotels, resorts, apartments, and vacation rentals worldwide. We also offer comprehensive transportation solutions to ensure your travel is comfortable and convenient from start to finish.',
        requirements: [
          'Valid ID or passport',
          'Credit card for security deposit',
          'Booking confirmation',
          'Special requests (if any)',
          'Driver\'s license (for car rentals)',
          'Arrival and departure details',
        ],
        costInformation:
            'Hotel rates start from \$50/night for budget options, \$150/night for mid-range hotels, and \$300+/night for luxury properties. Transportation costs vary: airport transfers from \$30, car rentals from \$40/day, private chauffeur services from \$80/day.',
        packages: const [
          ServicePackage(
            name: 'Budget Comfort',
            description: 'Affordable accommodation and basic transport',
            price: 'From \$50/night',
            features: [
              'Clean budget hotel',
              'Free WiFi',
              'Breakfast included',
              'Airport shuttle',
              'Standard room amenities',
            ],
          ),
          ServicePackage(
            name: 'Premium Stay',
            description: 'Mid-range hotels with car rental',
            price: 'From \$150/night',
            features: [
              '4-star hotel',
              'Luxury amenities',
              'Complimentary breakfast',
              'Car rental included',
              'Gym and pool access',
              'Concierge service',
            ],
          ),
          ServicePackage(
            name: 'VIP Experience',
            description: 'Luxury resort with private chauffeur',
            price: 'From \$400/night',
            features: [
              '5-star resort',
              'Suite accommodation',
              'All meals included',
              'Private chauffeur service',
              'Spa access',
              'Airport meet & greet',
              'Butler service',
            ],
          ),
        ],
        contactInstructions:
            'Reserve your accommodation and transportation at stay@flywithus.com or call +1-800-STAY-FLY. Specify your preferences and we\'ll find the perfect match. Flexible cancellation policies available on selected bookings.',
      ),
      MainService(
        id: '5',
        title: 'Umrah',
        subtitle: 'Complete Umrah packages with spiritual guidance',
        imageUrl:
            'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa',
        icon: Icons.mosque,
        description:
            'Perform Umrah with peace of mind through our comprehensive packages. We handle all arrangements including flights, accommodation near Haram, transportation, and spiritual guidance.',
        overview:
            'Our Umrah packages are designed to provide a comfortable and spiritually fulfilling experience. We offer accommodation in hotels close to the Holy Mosques in Makkah and Madinah, experienced guides for religious guidance, and all necessary ground arrangements.',
        requirements: [
          'Valid passport (minimum 6 months validity)',
          'Umrah visa',
          'Vaccination certificates (Meningitis, COVID-19)',
          'Passport-sized photographs',
          'Mahram requirement for women under 45',
          'Travel insurance',
          'Medical fitness certificate (for elderly)',
        ],
        costInformation:
            'Umrah packages range from \$1,500 for economy options to \$5,000+ for VIP packages. Prices vary based on hotel proximity to Haram, travel season, and package duration. Early booking discounts available. Payment plans offered for families.',
        packages: const [
          ServicePackage(
            name: 'Economy Umrah',
            description: 'Affordable Umrah package',
            price: 'From \$1,500',
            features: [
              'Duration: 10 days',
              'Economy class flights',
              '3-star hotel (walking distance)',
              'Shared transport',
              'Group spiritual guide',
              'Basic meals included',
            ],
          ),
          ServicePackage(
            name: 'Deluxe Umrah',
            description: 'Comfortable spiritual journey',
            price: 'From \$3,000',
            features: [
              'Duration: 14 days',
              'Business class flights',
              '4-star hotel near Haram',
              'Private transport',
              'Experienced guide',
              'All meals included',
              'Ziyarat tours',
            ],
          ),
          ServicePackage(
            name: 'VIP Umrah',
            description: 'Luxury pilgrimage experience',
            price: 'From \$6,000',
            features: [
              'Duration: 15-21 days',
              'First class flights',
              '5-star hotel with Haram view',
              'Private chauffeur',
              'Personal spiritual advisor',
              'Premium buffet meals',
              'Extended Ziyarat program',
              'VIP airport services',
            ],
          ),
        ],
        contactInstructions:
            'Book your Umrah package at umrah@flywithus.com or call our dedicated Umrah team at +1-800-UMRAH-FLY. Our Islamic scholars are available for consultation. Join our group departures or customize your own package. Payment plans available.',
      ),
      MainService(
        id: '6',
        title: 'Hajj',
        subtitle: 'Fully managed Hajj packages for a blessed journey',
        imageUrl: 'https://images.unsplash.com/photo-1542816417-0983c9c9ad53',
        icon: Icons.mosque_outlined,
        description:
            'Fulfill your religious obligation with our complete Hajj packages. We provide experienced guides, comfortable accommodation, transportation, and comprehensive support throughout your journey.',
        overview:
            'Our Hajj packages are meticulously planned to ensure your pilgrimage is spiritually rewarding and physically comfortable. We are licensed Hajj operators with years of experience. Our packages include comprehensive training sessions, experienced Mutawwif guides, and full logistical support.',
        requirements: [
          'Valid passport (minimum 6 months validity)',
          'Hajj visa through official lottery',
          'Vaccination certificates (mandatory)',
          'Medical fitness certificate',
          'Mahram for women',
          'Travel insurance',
          'Pre-departure Hajj training attendance',
          'Blood group documentation',
        ],
        costInformation:
            'Hajj packages range from \$5,000 for basic packages to \$15,000+ for premium options. Prices are set according to government regulations and include all mandatory services. Package cost covers flights, accommodation in Mina tents, Arafat, Muzdalifah, meals, and guidance. Payment schedule: 30% deposit, balance 60 days before departure.',
        packages: const [
          ServicePackage(
            name: 'Standard Hajj',
            description: 'Complete Hajj package with essentials',
            price: 'From \$5,500',
            features: [
              'Duration: 18-20 days',
              'Economy flights',
              'Shared accommodation',
              'Standard Mina tents',
              'Group guidance',
              'Three meals daily',
              'Bus transport',
              'Pre-departure training',
            ],
          ),
          ServicePackage(
            name: 'Comfort Hajj',
            description: 'Enhanced comfort and services',
            price: 'From \$9,000',
            features: [
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
          ),
          ServicePackage(
            name: 'Premium Hajj',
            description: 'Luxury Hajj with maximum comfort',
            price: 'From \$15,000',
            features: [
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
          ),
        ],
        contactInstructions:
            'Apply for Hajj packages at hajj@flywithus.com or call +1-800-HAJJ-2025. Applications open annually in Shawwal. Limited spots available. Attend our free Hajj preparation seminars. Previous pilgrims receive priority registration. Family packages available with discounts.',
      ),
    ];
  }
}
