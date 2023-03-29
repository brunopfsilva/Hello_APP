import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hello_app/Common/routes.dart';
import '../models/terms_of_use_model.dart';

class TermsOfUseService {
  static Future<TermsOfUseModel> getTerm(int idCompany) async {
    var uri = Uri.parse("$baseUrl/api/terms/getTerm");

    try {
      final _dio = Dio();
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = 'Bearer ${globalUser.token}';
      _dio.options.queryParameters['idCompany'] = idCompany;

      final result =
          await _dio.get(uri.toString()).timeout(const Duration(seconds: 40));

      return new TermsOfUseModel(
          idTerm: result.data["id"],
          idCompany: result.data["idCompany"],
          term: result.data["term"]);
    } on DioError catch (error) {
      return new TermsOfUseModel(idTerm: 0, idCompany: 0, term: "");
    }
  }
}

Future<bool> saveAcceptTerm(int idTerm) async {
  var uri = Uri.parse("$baseUrl/api/terms/acceptTerm");

  try {
    final _dio = Dio();
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer ${globalUser.token}';

    var params = {
      "idPerson": globalUser.Id,
      "idCompany": globalUser.IdCompany,
      "idTerm": idTerm
    };

    var _body = jsonEncode(params);

    final result = await _dio
        .post(uri.toString(), data: _body)
        .timeout(const Duration(seconds: 40));

    return true;
  } on DioError catch (error) {
    return false;
  }
}
