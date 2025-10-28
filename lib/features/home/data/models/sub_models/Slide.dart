import 'package:view_line/features/home/domain/entities/sub_enities/Slide_entities.dart';

class Slide extends SlideEntities {
  Slide({
    super.image,
    super.order,
    super.titleAr,
    super.titleEn,
    super.buttonUrl,
    super.buttonTextAr,
    super.buttonTextEn,
    super.descriptionAr,
    super.descriptionEn,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
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
