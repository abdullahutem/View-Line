class Branch {
  final String id;
  final String cityNameEn;
  final String cityNameAr;
  final String countryEn;
  final String countryAr;
  final String addressEn;
  final String addressAr;
  final String phoneNumber;
  final String email;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String workingHoursEn;
  final String workingHoursAr;
  final List<String> servicesEn;
  final List<String> servicesAr;

  const Branch({
    required this.id,
    required this.cityNameEn,
    required this.cityNameAr,
    required this.countryEn,
    required this.countryAr,
    required this.addressEn,
    required this.addressAr,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.workingHoursEn,
    required this.workingHoursAr,
    required this.servicesEn,
    required this.servicesAr,
  });
}
