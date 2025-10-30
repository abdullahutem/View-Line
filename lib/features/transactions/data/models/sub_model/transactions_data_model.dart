import 'package:view_line/features/transactions/domain/entities/sub_entities/transactions_data_entities.dart';

class TransactionsDataModel extends TransactionsDataEntities {
  const TransactionsDataModel({
    required super.id,
    required super.serviceId,
    required super.serviceTitleAr,
    required super.serviceTitleEn,
    required super.serviceSlug,
    required super.name,
    required super.passportNumber,
    required super.attachment,
    required super.phoneNumber,
    required super.whatsappNumber,
    required super.serviceStatusId,
    required super.statusNameAr,
    required super.statusNameEn,
    required super.statusColor,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TransactionsDataModel.fromJson(Map<String, dynamic> json) {
    return TransactionsDataModel(
      id: json['id'] ?? 0,
      serviceId: json['service_id'] ?? 0,
      serviceTitleAr: json['service_title_ar'] ?? '',
      serviceTitleEn: json['service_title_en'] ?? '',
      serviceSlug: json['service_slug'] ?? '',
      name: json['name'] ?? '',
      passportNumber: json['passport_number'] ?? '',
      attachment: json['attachment'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      whatsappNumber: json['whatsapp_number'] ?? '',
      serviceStatusId: json['service_status_id'] ?? 0,
      statusNameAr: json['status_name_ar'] ?? '',
      statusNameEn: json['status_name_en'] ?? '',
      statusColor: json['status_color'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
