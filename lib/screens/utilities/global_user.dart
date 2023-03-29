import 'package:hello_app/models/global_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalUser {
  Future<GlobalUserModel> getUser() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var idUser = await (sharedPreferences.getString("id") ?? "0");
    var idCompany = await (sharedPreferences.getString("idCompany") ?? "0");
    var user = await (sharedPreferences.getString("user") ?? "");
    var accessToken = await (sharedPreferences.getString("tokenjwt") ?? "");
    var firstLogin = await (sharedPreferences.getBool("firstLogin") ?? false);
    var employeeMatriculation =
        await (sharedPreferences.getString("employeeMatriculation") ?? "");
    var employeeType =
        await (sharedPreferences.getString("employeeType") ?? "");
    var userSituation =
        await (sharedPreferences.getString("userSituation") ?? "");

    return new GlobalUserModel(
        Id: int.parse(idUser),
        IdCompany: int.parse(idCompany),
        userName: user,
        token: accessToken,
        firstLogin: firstLogin,
        Matriculation: employeeMatriculation,
        Situation: userSituation,
        TypeEmployee: employeeType);
  }
}
