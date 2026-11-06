
class ErrorModel {
  String? status;
  String? code;
  String? message;

  ErrorModel({this.status, this.code, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

}

 