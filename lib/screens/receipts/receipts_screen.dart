import 'package:flutter/material.dart';
import 'package:hello_app/screens/receipts/widgets/receipts_tile.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';
import 'package:hello_app/screens/shared/global_title.dart';

import '../../Common/routes.dart';
import '../utilities/global_widgets.dart';

class ReceiptsScreen extends StatefulWidget {
  ReceiptsScreen({Key? key}) : super(key: key);

  @override
  _ReceiptsScreenState createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  final ScrollController _scrollCtrl = ScrollController();
  final FocusNode _focus = FocusNode();
  final List<Map<String, String>> _originalReceipts = [
    {'title': 'Título 1', 'subtitle': 'Subtítulo 1'},
    {'title': 'Título 2', 'subtitle': 'Subtítulo 2'},
    {'title': 'Título 3', 'subtitle': 'Subtítulo 3'},
    {'title': 'Título 4', 'subtitle': 'Subtítulo 4'},
    {'title': 'Título 5', 'subtitle': 'Subtítulo 5'},
    {'title': 'Título 6', 'subtitle': 'Subtítulo 6'},
  ];
  late List<Map<String, String>> _receipts;

  void _search(String text) {
    List<Map<String, String>> result;
    if (text.isNotEmpty) {
      result = _receipts
          .where((element) =>
              element['title']!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      result = _originalReceipts;
    }
    setState(() {
      _receipts = result;
    });
  }

  @override
  void initState() {
    _receipts = List<Map<String, String>>.from(_originalReceipts).toList();
    super.initState();
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recibos'),
      body: Column(
        children: [
          GlobalTitle(
            userName: globalUser.userName,
            message: 'aqui estão seus Recibos dos últimos 12 meses.',
            focusNode: _focus,
            onTextChange: _search,
          ),
          Expanded(
            child: GlobalScrollbar(
              controller: _scrollCtrl,
              child: ListView.separated(
                controller: _scrollCtrl,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemCount: _receipts.length,
                separatorBuilder: (_, __) => Divider(
                  thickness: 0.0,
                  height: 0.0,
                  color: Colors.grey.withOpacity(0.4),
                ),
                itemBuilder: (_, index) => ReceiptsTile(
                  title: _receipts[index]['title']!,
                  subtitle: _receipts[index]['subtitle']!,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
