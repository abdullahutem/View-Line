class CustomerReview {
  final String id;
  final String customerNameEn;
  final String customerNameAr;
  final String profileImageUrl;
  final double rating;
  final String commentEn;
  final String commentAr;
  final String tripNameEn;
  final String tripNameAr;
  final String destinationEn;
  final String destinationAr;
  final String date;

  const CustomerReview({
    required this.id,
    required this.customerNameEn,
    required this.customerNameAr,
    required this.profileImageUrl,
    required this.rating,
    required this.commentEn,
    required this.commentAr,
    required this.tripNameEn,
    required this.tripNameAr,
    required this.destinationEn,
    required this.destinationAr,
    required this.date,
  });
}
