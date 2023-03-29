import 'package:flutter/material.dart';
import 'package:hello_app/screens/annual_leave/annual_leave_screen.dart';
import 'package:hello_app/screens/check_in_mirror/check_in_mirror_screen.dart';
import 'package:hello_app/screens/check_in/widgets/check_in_button.dart';
import 'package:hello_app/screens/check_in/widgets/check_in_chart.dart';
import 'package:hello_app/screens/check_in_pointing/check_in_pointing_screen.dart';
import 'package:hello_app/screens/check_in_register/check_in_register_screen.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ponto'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              CheckInButton(
                labelText: 'Registro',
                onPressed: () async {
                  final bool? registered = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckInRegisterScreen(),
                    ),
                  );
                  if (registered != null && registered) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Ponto registrado',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey[800],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ));
                  }
                },
              ),
              CheckInButton(
                labelText: 'Espelho',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckInMirrorScreen(),
                  ),
                ),
              ),
              CheckInButton(
                labelText: 'Banco de horas',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BancoDeHorasScreen(),
                  ),
                ),
              ),
              CheckInButton(
                labelText: 'Apontamento',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInPointingScreen(),
                  ),
                ),
              ),
              const Divider(
                height: 10.0,
                thickness: 2.0,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: const [Text('Horas trabalhadas - Maio 2021')],
              ),
              const SizedBox(height: 10.0),
              const CheckInChartWidget(),
              // Placeholder(fallbackHeight: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
