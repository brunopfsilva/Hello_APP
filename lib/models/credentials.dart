class Credentials {
  String? cpf;
  String? password;
  bool? useBiometrics;
  DateTime? date;

  Credentials({this.cpf, this.password, this.useBiometrics, this.date});

  Map<String, dynamic> toMap() => {'cpf': cpf, 'password': password};
}
