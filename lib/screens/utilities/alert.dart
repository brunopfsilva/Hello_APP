import 'package:flutter/material.dart';

alert(BuildContext context, String msg, String page) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(page),
          content: Text(msg),
          actions: <Widget>[
            MaterialButton(
                color: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      });
}
