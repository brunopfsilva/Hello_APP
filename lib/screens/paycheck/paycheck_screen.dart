import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';
import 'package:hello_app/screens/shared/global_title.dart';
import 'package:hello_app/screens/utilities/global_widgets.dart';
import 'package:hello_app/service/paycheks_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Common/routes.dart';

class PaycheckScreen extends StatefulWidget {
  PaycheckScreen({Key? key}) : super(key: key);

  @override
  _PaycheckScreenState createState() => _PaycheckScreenState();
}

ScrollController _scrollCtrl = ScrollController();

class _PaycheckScreenState extends State<PaycheckScreen> {
  final FocusNode _focus = FocusNode();

  late List<Map<String, String>> paychecks;

  _refresh(String progressString) {
    setState(() {
      this.progressString = progressString;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool downloading = false;
  String progressString = '';
  String downloadPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Contracheques',
      ),
      body: Column(
        children: [
          GlobalTitle(
            userName: globalUser.userName,
            message: 'aqui estão seus contracheques dos últimos 12 meses.',
            focusNode: _focus,
            // onTextChange: search,
          ),
          Expanded(
            child: GlobalScrollbar(
                controller: _scrollCtrl,
                child: FutureBuilderAccount(_refresh, context)),
          ),
        ],
      ),
    );
  }
}
