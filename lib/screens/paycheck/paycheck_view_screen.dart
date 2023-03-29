// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

class PaycheckViewScreen extends StatefulWidget {
  final String? path;
  final String? title;

  PaycheckViewScreen({Key? key, this.path, this.title}) : super(key: key);

  _PaycheckViewScreenState createState() => _PaycheckViewScreenState();
}

class _PaycheckViewScreenState extends State<PaycheckViewScreen>
    with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 22, 33, 1),
      appBar: AppBar(
        title: Text(widget.title ?? ""),
        backgroundColor: Color.fromRGBO(16, 22, 33, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share_rounded),
            onPressed: () {
              Share.shareFiles([widget.path ?? ""], text: 'Contracheque');
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
    );
  }
}
