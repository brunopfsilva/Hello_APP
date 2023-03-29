import 'package:flutter/services.dart';
//import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class Biometrics {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> checkBiometric() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (err) {
      return Future.error(err);
    }
  }

  Future<bool> deviceSupported() async {
    return _auth.isDeviceSupported();
  }

  Future<bool> biometricAuth() async {
    try {
      return _auth.authenticate(
        localizedReason: 'Toque no censor para entrar.',
        // androidAuthStrings: AndroidAuthMessages(
        //   signInTitle: 'Autenticação solicitada',
        //   biometricHint: 'Verificação de identidade',
        //   cancelButton: 'Cancelar',
        // ),
        // stickyAuth: true,
        // useErrorDialogs: true,
        // biometricOnly: true,
        // iOSAuthStrings: IOSAuthMessages(
        //   cancelButton: 'Cancelar',
        // ),
      );
    } on PlatformException catch (err) {
      return Future.error(err);
    }
  }
}
