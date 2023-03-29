// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseRequestModel {
  int? statusCode;
  bool success;
  String message;

  ResponseRequestModel({
    required this.statusCode,
    required this.success,
    required this.message,
  });
}
