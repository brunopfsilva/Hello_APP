import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Treinamentos'),
    );
  }
}
