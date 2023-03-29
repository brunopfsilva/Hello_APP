// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hello_app/service/terms_of_use_service.dart';

class TermsOfUseModel {
  String term;
  int idCompany;
  int idTerm;

  TermsOfUseModel({
    required this.term,
    required this.idCompany,
    required this.idTerm,
  });
}
