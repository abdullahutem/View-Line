import 'package:view_line/features/home/domain/entities/sub_enities/feature_entities.dart';

class Feature extends FeatureEntities {
  Feature({
    super.icon,
    super.titleAr,
    super.titleEn,
    super.descriptionAr,
    super.descriptionEn,
    required super.textAr,
    required super.textEn,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
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

class SocialMediaModel extends SocialMediaEntities {
  SocialMediaModel({
    super.twitter,
    super.youtube,
    super.facebook,
    super.linkedin,
    super.instagram,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
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

class Item extends ItemEntities {
  Item({
    super.icon,
    super.titleAr,
    super.titleEn,
    super.descriptionAr,
    super.descriptionEn,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      icon: json['icon'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
    );
  }
}

class Project extends ProjectEntities {
  Project({super.image, super.category, super.titleAr, super.titleEn});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      image: json['image'],
      category: json['category'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
    );
  }
}

class Testimonial extends TestimonialEntities {
  Testimonial({
    super.image,
    super.rating,
    super.nameAr,
    super.nameEn,
    super.commentAr,
    super.commentEn,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      image: json['image'],
      rating: json['rating'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      commentAr: json['comment_ar'],
      commentEn: json['comment_en'],
    );
  }
}

class Stat extends StatEntities {
  Stat({super.icon, super.number, super.suffix, super.labelAr, super.labelEn});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      icon: json['icon'],
      number: json['number'],
      suffix: json['suffix'],
      labelAr: json['label_ar'],
      labelEn: json['label_en'],
    );
  }
}

class Member extends MemberEntities {
  Member({
    super.image,
    super.bioAr,
    super.bioEn,
    super.nameAr,
    super.nameEn,
    super.positionAr,
    super.positionEn,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
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
