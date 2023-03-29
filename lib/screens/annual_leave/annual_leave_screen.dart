import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';

class BancoDeHorasScreen extends StatelessWidget {
  const BancoDeHorasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Banco de Horas'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 75.0),
              const Text(
                'Saldo do dia\n05/05/2021',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyan,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.green,
                  ),
                  Text(
                    '1.30h',
                    style: TextStyle(fontSize: 45.0),
                  ),
                ],
              ),
              const SizedBox(height: 75.0),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Saldo do mês',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                    size: 25.0,
                                  ),
                                  Text(
                                    '3:30h',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Saldo geral',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.green,
                                    size: 25.0,
                                  ),
                                  Text(
                                    '20:00h',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
