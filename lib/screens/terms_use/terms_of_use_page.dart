import 'package:flutter/material.dart';
import 'package:hello_app/screens/login/Models/Login.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';
import 'package:hello_app/service/terms_of_use_service.dart' as termsUse;

import '../../Common/routes.dart';
import '../alter_password/alter_password_page.dart';
import '../login/login_screen.dart';
import '../utilities/global_widgets.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Termos de Uso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: GlobalScrollbar(
                controller: null,
                child: FutureBuilderText(context, globalUser.IdCompany),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: checkValue,
                  onChanged: (value) {
                    setState(
                      () {
                        print(value);
                        checkValue = value!;
                      },
                    );
                  },
                ),
                Flexible(
                    child: Text(
                  "Por meio deste, concordo com os Termos de Uso.",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: double.infinity,
              onPressed: checkValue == false
                  ? null
                  : () async {
                      var idTerm = await termsUse.TermsOfUseService.getTerm(
                          globalUser.IdCompany);
                      var acceptTerm =
                          await termsUse.saveAcceptTerm(idTerm.idTerm);

                      if (acceptTerm) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlterPasswordPage(),
                            ));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      }
                    },
              child: const Text('Aceitar Termos!'),
            ),
          ],
        ),
      ),
    );
  }
}
