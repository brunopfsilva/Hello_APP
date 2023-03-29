import 'dart:convert';
import 'package:dio/dio.dart';

class HttpClient {
  final Dio _dio = Dio();

  HttpClient() {
    _dio.options.baseUrl = '';
  }

  Future<Map<String, dynamic>> post(String path, {Map? body}) async {
    final Response res = await _dio.post(path, data: body);
    return jsonDecode(res.data);
  }

  Future<Map<String, dynamic>> get(String path) async {
    final Response res = await _dio.get(path);
    return jsonDecode(res.data);
  }
}
