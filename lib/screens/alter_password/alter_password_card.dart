import 'package:flutter/material.dart';

// class AlterPasswordCard extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     Future<String?> _validatePassword(String valueCurrent) async {
//       RegExp regex = RegExp(
//           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//       var passNonNullValue = valueCurrent ?? "";
//       if (passNonNullValue.isEmpty) {
//         return ("Senha obrigatória");
//       } else if (passNonNullValue.length < 8) {
//         return ("Senha Deve ter pelo menos 8 caracteres");
//       } else if (!regex.hasMatch(passNonNullValue)) {
//         return ("A senha deve conter caracteres especiais, maiúscula, minúscula e dígitos.");
//       }
//       return null;
//     }
//   }
// }
