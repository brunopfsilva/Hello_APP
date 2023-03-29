import 'package:hello_app/core/http_client.dart';

class Services {
  final HttpClient? httpClient;

  Services(this.httpClient) : assert(httpClient != null);

  Future<Map<String, dynamic>> logIn(Map data) async =>
      await httpClient!.post('', body: data);
}
