import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:hello_app/Common/routes.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/paychecks_model.dart';

class PaychecksService {
  Future<List<PaycheckModel>> ListPaycheck() async {
    var uri = Uri.parse("$baseUrl/api/paychecks/listPaychecks");

    try {
      final _dio = Dio();
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = 'Bearer ${globalUser.token}';

      final result =
          await _dio.get(uri.toString()).timeout(const Duration(seconds: 40));

      List<PaycheckModel> list = result.data
          .map<PaycheckModel>((c) => PaycheckModel.fromJson(c))
          .toList();
      return list;
    } on DioError catch (error) {
      return List.empty();
    }
  }

  Future<dynamic> DownloadPaycheck(
      PaycheckModel paycheck, Function _refresh) async {
    var uri = Uri.parse("$baseUrl/api/paychecks/downloadPaycheck");
    var downloadedFilePath = await getDownloadFolderPath();

    try {
      final _dio = Dio();
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = 'Bearer ${globalUser.token}';
      _dio.options.queryParameters['filePathName'] =
          paycheck.linkPaycheckDownload;
      _dio.options.queryParameters['idCompany'] = globalUser.IdCompany;

      var downloadedPath =
          '${downloadedFilePath}/${paycheck.namePaycheck}-${paycheck.subNamePaycheck}.pdf';

      await _dio.download(uri.toString(), downloadedPath);

      return downloadedPath;
    } on DioError catch (error) {
      print(error);
    }
  }

  Future<bool> getStoragePermission() async {
    return await Permission.storage.request().isGranted;
  }

  Future<String> getDownloadFolderPath() async {
    return await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
  }
}
