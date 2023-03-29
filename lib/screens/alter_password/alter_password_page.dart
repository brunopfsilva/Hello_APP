import 'package:flutter/material.dart';
import 'package:hello_app/service/login_service.dart' as loginApi;
import '../../Common/routes.dart';
import '../home/home_screen.dart';
import '../utilities/alert.dart';

class AlterPasswordPage extends StatelessWidget {
  AlterPasswordPage({Key? key}) : super(key: key);

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          child: Builder(builder: (context) {
            return Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/images/Logo_hello_128x128.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Redefinir  senha",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Por favor, informe sua nova senha.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  validator: (PassCurrentValue) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    var passNonNullValue = PassCurrentValue ?? "";
                    if (passNonNullValue.isEmpty) {
                      return ("Senha obrigatória");
                    } else if (passNonNullValue.length < 8) {
                      return ("Senha Deve ter pelo menos 8 caracteres");
                    } else if (!regex.hasMatch(passNonNullValue)) {
                      return ("A senha deve conter caracteres especiais, maiúscula, minúscula e dígitos.");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPassword,
                  validator: (confirmPasswordCurrentValue) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    var passNonNullValue = confirmPasswordCurrentValue ?? "";
                    if (passNonNullValue.isEmpty) {
                      return ("Senha obrigatória");
                    } else if (passNonNullValue.length < 6) {
                      return ("Password Must be more than 5 characters");
                    } else if (!regex.hasMatch(passNonNullValue)) {
                      return ("A senha deve conter caracteres especiais, maiúscula, minúscula e dígitos.");
                    } else if (confirmPassword == password) {
                      return ("Password Must be more than 5 characters");
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirme sua senha",
                      labelStyle: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  onPressed: () async {
                    if (Form.of(context)?.validate() ?? false) {
                      var apiLogin = await loginApi.Loginservice.alterPassword(
                          password.text, confirmPassword.text);

                      if (apiLogin.statusCode == 200) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } else {
                        alert(context, apiLogin.message, "Recuperar Senha!");
                      }
                    }
                  },
                  child: Text("Confirmar"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
