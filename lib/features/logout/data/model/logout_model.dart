class LogoutModel {
  final bool success;
  final String message;
  final int statusCode;

  LogoutModel({
    required this.success,
    required this.message,
    required this.statusCode,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 200,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'status_code': statusCode};
  }
}
