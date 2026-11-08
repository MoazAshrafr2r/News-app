class ErrorModel {
  final String status;
  final String code;
  final String message;

  ErrorModel({
    this.status = 'error',
    this.code = 'unknown',
    this.message = 'An unknown error occurred.',
  });

  factory ErrorModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic> &&
        json['status'] != null &&
        json['code'] != null &&
        json['message'] != null) {
      return ErrorModel(
        status: json['status'].toString(),
        code: json['code'].toString(),
        message: json['message'].toString(),
      );
    }
    return ErrorModel(); 
  }
}
