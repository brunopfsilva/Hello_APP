import 'package:flutter/material.dart';
import 'package:hello_app/service/login_service.dart' as loginApi;
import '../utilities/alert.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/Logo_hello_128x128.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Por favor, informe o E-mail associado a seu conta, para restauração de sua senha.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
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
            MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: double.infinity,
              onPressed: () async {
                var apiLogin = await loginApi.Loginservice.recoverPassword(
                    emailController.text);
                alert(context, apiLogin.message, "Recuperar Senha!");
              },
              child: const Text('Recuperar'),
            ),
          ],
        ),
      ),
    );
  }
}
