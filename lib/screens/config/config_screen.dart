import 'package:flutter/material.dart';
import 'package:hello_app/models/credentials.dart';
import 'package:provider/provider.dart';
import 'package:hello_app/core/biometrics.dart';
import 'package:hello_app/core/safe_storage.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final SafeStorage _storage = SafeStorage();
  bool _biometrics = false;
  bool _visiblePassword = false;
  bool _canCheckBiometric = false;
  String _password = '**********';

  Future<void> _checkBiometric() async {
    final Biometrics biometrics = Biometrics();
    if (await biometrics.deviceSupported() &&
        context.read<Credentials>().cpf != null) {
      final bool biometric = await biometrics.checkBiometric();
      setState(() {
        _canCheckBiometric = biometric;
      });
    } else {
      setState(() {
        _canCheckBiometric = false;
      });
    }
  }

  void _showPassword() {
    if (_visiblePassword) {
      setState(() {
        _visiblePassword = false;
        _password = '**********';
      });
    } else {
      setState(() {
        _visiblePassword = true;
        _password = 'user_password';
      });
    }
  }

  @override
  void initState() {
    _checkBiometric();
    _biometrics = context.read<Credentials>().useBiometrics!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Configurações'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              value: _biometrics,
              onChanged: _canCheckBiometric
                  ? (value) async {
                      if (value) {
                        await _storage.write('biometric', 'true');
                        context.read<Credentials>().useBiometrics = true;
                      } else {
                        await _storage.delete('biometric');
                        context.read<Credentials>().useBiometrics = false;
                      }
                      setState(() {
                        _biometrics = value;
                      });
                    }
                  : null,
              title: const Text('Usar biometria'),
              secondary: const Icon(Icons.fingerprint_rounded),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Senha',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              title: Text(_password),
              onTap: () {
                _showPassword();
              },
              trailing: _visiblePassword
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded),
              tileColor: Colors.grey.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
