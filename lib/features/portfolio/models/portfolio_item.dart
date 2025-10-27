class PortfolioItem {
  final String id;
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final String coverImageUrl;
  final String date;
  final String duration;
  final String locationEn;
  final String locationAr;
  final int participantsCount;
  final String shortDescriptionEn;
  final String shortDescriptionAr;
  final String fullDescriptionEn;
  final String fullDescriptionAr;
  final List<String> galleryImages;
  final List<String> highlightsEn;
  final List<String> highlightsAr;
  final List<Testimonial> testimonials;

  PortfolioItem({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.coverImageUrl,
    required this.date,
    required this.duration,
    required this.locationEn,
    required this.locationAr,
    required this.participantsCount,
    required this.shortDescriptionEn,
    required this.shortDescriptionAr,
    required this.fullDescriptionEn,
    required this.fullDescriptionAr,
    required this.galleryImages,
    required this.highlightsEn,
    required this.highlightsAr,
    required this.testimonials,
  });
}

class Testimonial {
  final String nameEn;
  final String nameAr;
  final String commentEn;
  final String commentAr;
  final double rating;
  final String avatarUrl;

  const Testimonial({
    required this.nameEn,
    required this.nameAr,
    required this.commentEn,
    required this.commentAr,
    required this.rating,
    required this.avatarUrl,
  });
}
