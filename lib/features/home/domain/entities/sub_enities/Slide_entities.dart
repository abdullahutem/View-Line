class SlideEntities {
  final String? image;
  final int? order;
  final String? titleAr;
  final String? titleEn;
  final String? buttonUrl;
  final String? buttonTextAr;
  final String? buttonTextEn;
  final String? descriptionAr;
  final String? descriptionEn;

  SlideEntities({
    this.image,
    this.order,
    this.titleAr,
    this.titleEn,
    this.buttonUrl,
    this.buttonTextAr,
    this.buttonTextEn,
    this.descriptionAr,
    this.descriptionEn,
  });

  factory SlideEntities.fromJson(Map<String, dynamic> json) {
    return SlideEntities(
      image: json['image'],
      order: json['order'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      buttonUrl: json['button_url'],
      buttonTextAr: json['button_text_ar'],
      buttonTextEn: json['button_text_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
    );
  }
}
