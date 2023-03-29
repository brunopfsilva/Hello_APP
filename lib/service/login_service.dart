import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hello_app/models/global_user_model.dart';
import 'package:hello_app/models/login_models.dart';
import 'package:hello_app/screens/utilities/global_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common/routes.dart';
import '../models/response_request_model.dart';

class Loginservice {
  static Future<LoginModel> login(String user, String password) async {
    user = user.replaceAll(".", "").replaceAll("-", "");
    var uri = Uri.parse("$baseUrl/api/login");
    var params = {"user": user, "password": password};

    final _dio = Dio();

    try {
      _dio.options.headers['content-Type'] = 'application/json';
      final resultLogin = await _dio.post(uri.toString(), data: params);

      if (resultLogin.statusCode == 200) {
        var uriGetMe = Uri.parse("$baseUrl/api/Employee/getMe");
        _dio.options.headers['Authorization'] =
            'Bearer ${resultLogin.data["token"]}';

        final result = await _dio.getUri(uriGetMe);

        var sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("idUser", result.data["id"].toString());
        sharedPreferences.setString(
            "idLogin", result.data["idLogin"].toString());
        sharedPreferences.setString(
            "idCompany", result.data["idCompany"].toString());
        sharedPreferences.setString("user", result.data["name"]);
        sharedPreferences.setString(
            "employeeMatriculation", result.data["matriculation"]);
        sharedPreferences.setString(
            "employeeType", result.data["employeeType"]);
        sharedPreferences.setString("userSituation", result.data["situation"]);
        sharedPreferences.setString("tokenjwt", resultLogin.data["token"]);
        sharedPreferences.setBool("firstLogin", resultLogin.data["firstLogin"]);

        globalUser = GlobalUserModel(
            Id: result.data["id"],
            IdCompany: result.data["company"]["idCompany"],
            userName: result.data["name"],
            token: resultLogin.data["token"],
            firstLogin: resultLogin.data["firstLogin"],
            Matriculation: result.data["matriculation"],
            Situation: result.data["situation"],
            TypeEmployee: result.data["employeeType"]);

        return new LoginModel(
            success: true,
            statusCode: resultLogin.statusCode,
            data: resultLogin.data,
            message: "");
      } else {
        return new LoginModel(
            success: false,
            statusCode: resultLogin.statusCode,
            data: null,
            message: "A conexão expirou");
      }
    } on DioError catch (error) {
      if (error.response == null) {
        return new LoginModel(
            success: false,
            statusCode: 500,
            data: null,
            message: "A conexão expirou");
      }

      return new LoginModel(
          success: false,
          statusCode: error.response!.statusCode,
          data: error.response!.data,
          message: error.response!.data.toString());
    }
  }

  static Future<ResponseRequestModel> recoverPassword(String email) async {
    var uri = Uri.parse("$baseUrl/api/recoverPassword");

    try {
      final _dio = Dio();
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.queryParameters['email'] = email;

      final result =
          await _dio.put(uri.toString()).timeout(const Duration(seconds: 40));
      return new ResponseRequestModel(
          statusCode: result.statusCode,
          success: result.data["success"],
          message: result.data["message"]);
    } on DioError catch (error) {
      return new ResponseRequestModel(
          statusCode: error.response?.statusCode,
          success: error.response?.data["success"],
          message: error.response?.data["message"]);
    }
  }

  static Future<ResponseRequestModel> alterPassword(
      String password, String confirmPassword) async {
    try {
      var uri = Uri.parse("$baseUrl/api/alterPassword");

      var params = {
        "idUser": globalUser.Id,
        "password": password,
        "confirmPassword": confirmPassword
      };
      var _body = jsonEncode(params);

      final _dio = Dio();
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = 'Bearer ${globalUser.token}';

      final result = await _dio
          .put(uri.toString(), data: _body)
          .timeout(const Duration(seconds: 40));
      return new ResponseRequestModel(
          statusCode: result.statusCode, success: true, message: result.data);
    } on DioError catch (error) {
      return new ResponseRequestModel(
          statusCode: error.response?.statusCode,
          success: false,
          message: error.response?.data);
    }
  }
}
