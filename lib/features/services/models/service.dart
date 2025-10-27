class Service {
  final String id;
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final String imageUrl;
  final String locationEn;
  final String locationAr;
  final String date;
  final double cost;
  final String descriptionEn;
  final String descriptionAr;
  final List<String> termsEn;
  final List<String> termsAr;
  final List<String> requirementsEn;
  final List<String> requirementsAr;
  final List<String> tripPlanEn;
  final List<String> tripPlanAr;

  Service({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.imageUrl,
    required this.locationEn,
    required this.locationAr,
    required this.date,
    required this.cost,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.termsEn,
    required this.termsAr,
    required this.requirementsEn,
    required this.requirementsAr,
    required this.tripPlanEn,
    required this.tripPlanAr,
  });
}
