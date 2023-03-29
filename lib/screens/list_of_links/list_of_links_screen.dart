import 'package:flutter/material.dart';
import 'package:hello_app/screens/home/home_screen.dart';
import 'package:hello_app/screens/login/login_screen.dart';

class ListOfLinks extends StatelessWidget {
  final List<String> vinculos = [
    'SANTOS LTDA',
    'BDA TERCERIZAÇÃO',
    'HOSPITAL PEDRO MARCO'
  ];

  ListOfLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Text('SAIR'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Qual vínculo empregáticio você quer acessar?',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: vinculos.length,
              itemBuilder: (_, index) => OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vinculos[index],
                      style: TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15.0,
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
