// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  dynamic data;
  String message;
  int? statusCode;
  bool success;

  LoginModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });
}
