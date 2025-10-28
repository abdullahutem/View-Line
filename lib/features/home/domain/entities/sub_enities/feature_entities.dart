class FeatureEntities {
  final String? icon;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? textAr;
  final String? textEn;

  FeatureEntities({
    this.icon,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    required this.textAr,
    required this.textEn,
  });

  factory FeatureEntities.fromJson(Map<String, dynamic> json) {
    return FeatureEntities(
      icon: json['icon'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      textAr: json['text_ar'],
      textEn: json['text_en'],
    );
  }
}

class ItemEntities {
  final String? icon;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;

  ItemEntities({
    this.icon,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
  });

  factory ItemEntities.fromJson(Map<String, dynamic> json) {
    return ItemEntities(
      icon: json['icon'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
    );
  }
}

class ProjectEntities {
  final String? image;
  final String? category;
  final String? titleAr;
  final String? titleEn;

  ProjectEntities({this.image, this.category, this.titleAr, this.titleEn});

  factory ProjectEntities.fromJson(Map<String, dynamic> json) {
    return ProjectEntities(
      image: json['image'],
      category: json['category'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
    );
  }
}

class TestimonialEntities {
  final String? image;
  final int? rating;
  final String? nameAr;
  final String? nameEn;
  final String? commentAr;
  final String? commentEn;

  TestimonialEntities({
    this.image,
    this.rating,
    this.nameAr,
    this.nameEn,
    this.commentAr,
    this.commentEn,
  });

  factory TestimonialEntities.fromJson(Map<String, dynamic> json) {
    return TestimonialEntities(
      image: json['image'],
      rating: json['rating'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      commentAr: json['comment_ar'],
      commentEn: json['comment_en'],
    );
  }
}

class StatEntities {
  final String? icon;
  final String? number;
  final String? suffix;
  final String? labelAr;
  final String? labelEn;

  StatEntities({
    this.icon,
    this.number,
    this.suffix,
    this.labelAr,
    this.labelEn,
  });

  factory StatEntities.fromJson(Map<String, dynamic> json) {
    return StatEntities(
      icon: json['icon'],
      number: json['number'],
      suffix: json['suffix'],
      labelAr: json['label_ar'],
      labelEn: json['label_en'],
    );
  }
}

class SocialMediaEntities {
  final String? twitter;
  final String? youtube;
  final String? facebook;
  final String? linkedin;
  final String? instagram;

  SocialMediaEntities({
    this.twitter,
    this.youtube,
    this.facebook,
    this.linkedin,
    this.instagram,
  });

  factory SocialMediaEntities.fromJson(Map<String, dynamic> json) {
    return SocialMediaEntities(
      twitter: json['twitter'] as String?,
      youtube: json['youtube'] as String?,
      facebook: json['facebook'] as String?,
      linkedin: json['linkedin'] as String?,
      instagram: json['instagram'] as String?,
    );
  }

  Map<String, String?> toMap() {
    return {
      'twitter': twitter,
      'youtube': youtube,
      'facebook': facebook,
      'linkedin': linkedin,
      'instagram': instagram,
    };
  }
}

class MemberEntities {
  final String? image;
  final String? bioAr;
  final String? bioEn;
  final String? nameAr;
  final String? nameEn;
  final String? positionAr;
  final String? positionEn;

  MemberEntities({
    this.image,
    this.bioAr,
    this.bioEn,
    this.nameAr,
    this.nameEn,
    this.positionAr,
    this.positionEn,
  });

  factory MemberEntities.fromJson(Map<String, dynamic> json) {
    return MemberEntities(
      image: json['image'],
      bioAr: json['bio_ar'],
      bioEn: json['bio_en'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      positionAr: json['position_ar'],
      positionEn: json['position_en'],
    );
  }
}
