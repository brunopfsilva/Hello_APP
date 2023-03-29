// ignore_for_file: public_member_api_docs, sort_constructors_first
class GlobalUserModel {
  int Id;
  int IdCompany;
  String userName;
  String Matriculation;
  String Situation;
  String TypeEmployee;
  String token;
  bool firstLogin;

  GlobalUserModel({
    required this.Id,
    required this.IdCompany,
    required this.userName,
    required this.Matriculation,
    required this.Situation,
    required this.TypeEmployee,
    required this.token,
    required this.firstLogin,
  });
}
