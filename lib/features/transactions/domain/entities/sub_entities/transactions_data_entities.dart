class TransactionsDataEntities {
  final int id;
  final int serviceId;
  final String serviceTitleAr;
  final String serviceTitleEn;
  final String serviceSlug;
  final String name;
  final String passportNumber;
  final String attachment;
  final String phoneNumber;
  final String whatsappNumber;
  final int serviceStatusId;
  final String statusNameAr;
  final String statusNameEn;
  final String? statusColor;
  final String createdAt;
  final String updatedAt;

  const TransactionsDataEntities({
    required this.id,
    required this.serviceId,
    required this.serviceTitleAr,
    required this.serviceTitleEn,
    required this.serviceSlug,
    required this.name,
    required this.passportNumber,
    required this.attachment,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.serviceStatusId,
    required this.statusNameAr,
    required this.statusNameEn,
    this.statusColor,
    required this.createdAt,
    required this.updatedAt,
  });
}
