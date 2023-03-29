import 'package:flutter/material.dart';
import 'package:hello_app/models/credentials.dart';
import 'package:provider/provider.dart';
import 'package:hello_app/core/safe_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future<void> _nextScreen() async {
    final SafeStorage storage = SafeStorage();
    final Map<String, String>? credential = await storage.getAll();
    if (credential!['date'] == null) {
      final DateTime date = DateTime.now().add(const Duration(days: 30));
      context.read<Credentials>().date = date;
      await storage.write('date', date.toString());
    } else {
      context.read<Credentials>().date = DateTime.tryParse(credential['date']!);
    }
    context.read<Credentials>().cpf = credential['cpf'];
    context.read<Credentials>().password = credential['password'];
    context.read<Credentials>().useBiometrics =
        credential['biometric'] == 'true';

    Future.delayed(
      const Duration(seconds: 7),
      () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  void initState() {
    _nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/app_logo_splash.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
