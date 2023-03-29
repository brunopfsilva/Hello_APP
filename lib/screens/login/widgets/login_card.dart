import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_app/models/credentials.dart';
import 'package:hello_app/screens/home/home_screen.dart';
import 'package:hello_app/screens/reset_password/reset_password_page.dart';
import 'package:provider/provider.dart';
import 'package:hello_app/core/biometrics.dart';
import 'package:hello_app/core/safe_storage.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:hello_app/service/login_service.dart' as loginApi;
import 'package:url_launcher/url_launcher.dart';
import '../../terms_use/terms_of_use_page.dart';
import '../../utilities/alert.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  String? cpf;
  String? password;
  late bool useBiometric;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _cpfCtrl;
  final TextEditingController _passwordCtrl = TextEditingController();
  final FocusNode _cpfFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final Biometrics _biometrics = Biometrics();
  bool _canCheckBiometric = false;
  late bool _enableBiometric;
  late bool _saveLogin;
  bool boolSingClick = false;
  bool _passwordVisible = false;

  Future<void> _checkBiometric() async {
    final bool biometric = await _biometrics.checkBiometric();
    setState(() {
      _canCheckBiometric = biometric;
    });
  }

  Future<void> _biometricAuth() async {
    final bool success = await _biometrics.biometricAuth();
    if (!success) return;
    _logIn();
  }

  Future<void> _logIn() async {
    var apiLogin =
        await loginApi.Loginservice.login(_cpfCtrl.text, _passwordCtrl.text);

    if (apiLogin.statusCode == 200) {
      if (_saveLogin && cpf == null) {
        final SafeStorage storage = SafeStorage();
        await storage.write('cpf', _cpfCtrl.text);
        await storage.write('password', _passwordCtrl.text);
        context.read<Credentials>().cpf = _cpfCtrl.text;
        context.read<Credentials>().password = _passwordCtrl.text;
      } else if (!_saveLogin && cpf != null) {
        final SafeStorage storage = SafeStorage();
        storage.getAll().then((value) {
          if (value != null) {
            storage.deleteAll();
          }
        });
      }

      if (apiLogin.data["firstLogin"] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TermsOfUse(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    } else {
      alert(context, apiLogin.message, "Login");
    }
  }

  openURL(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  void initState() {
    cpf = context.read<Credentials>().cpf;
    password = context.read<Credentials>().password;
    useBiometric = context.read<Credentials>().useBiometrics!;
    _enableBiometric = useBiometric;
    _checkBiometric();
    if (cpf != null) {
      _saveLogin = true;
      _cpfCtrl = TextEditingController(text: cpf);
    } else {
      _saveLogin = false;
      _cpfCtrl = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              enabled: !_saveLogin,
              controller: _cpfCtrl,
              focusNode: _cpfFocus,
              keyboardType: TextInputType.number,
              onEditingComplete: () => _cpfFocus.nextFocus(),
              textInputAction: TextInputAction.go,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 14) {
                  return 'Insira um CPF válido';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Usuário',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                isDense: true,
                filled: true,
                fillColor: Colors.grey[300]!.withOpacity(0.5),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              enabled: !_enableBiometric,
              controller: _passwordCtrl,
              focusNode: _passwordFocus,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              maxLength: 22,
              onFieldSubmitted: (_) => _passwordFocus.unfocus(),
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Insira uma senha válida';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Senha',
                counterText: '',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                isDense: true,
                filled: true,
                fillColor: Colors.grey[300]!.withOpacity(0.5),
                border: OutlineInputBorder(),
                //suffixIcon: ,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Switch(
                  value: _saveLogin,
                  onChanged: (value) {
                    setState(() {
                      _saveLogin = value;
                    });
                  },
                ),
                const Text('Lembrar meu usuário'),
              ],
            ),
            // Row(
            //   children: [
            //     Switch(
            //       value: _enableBiometric,
            //       onChanged: _canCheckBiometric && useBiometric
            //           ? (value) {
            //               setState(() {
            //                 _enableBiometric = value;
            //               });
            //             }
            //           : null,
            //     ),
            //     const Text('Leitor de digital'),
            //     const SizedBox(width: 5.0),
            //     const Icon(Icons.fingerprint_rounded),
            //   ],
            // ),
            const SizedBox(height: 15.0),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: double.infinity,
              onPressed: () async {
                boolSingClick = true;
                (context as Element).reassemble();
                _cpfFocus.unfocus();
                _passwordFocus.unfocus();
                if (_enableBiometric) {
                  await _biometricAuth();
                } else {
                  if (_formKey.currentState!.validate()) {
                    await _logIn();
                  }
                }
                boolSingClick = false;
                (context as Element).reassemble();
              },
              child: boolSingClick
                  ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text('Entrar'),
            ),
            MaterialButton(
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
                side: const BorderSide(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordPage()));
              },
              child: const Text('Esqueci a senha'),
            ),
            const SizedBox(height: 50.0),
            const Text('1.0'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Ajuda',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final Uri _url = Uri.parse(
                    'https://www.gcinetrhsoftware.com/politica-de-privacidade');
                openURL(_url);
              },
              child: const Text(
                'Política de privacidade Hello!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
