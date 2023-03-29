import 'package:flutter/material.dart';
import 'package:hello_app/screens/mural/widgets/mural_card.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';
import 'package:hello_app/screens/shared/global_title.dart';

import '../../Common/routes.dart';
import '../utilities/global_widgets.dart';

class MuralScreen extends StatefulWidget {
  MuralScreen({Key? key}) : super(key: key);

  @override
  _MuralScreenState createState() => _MuralScreenState();
}

class _MuralScreenState extends State<MuralScreen> {
  final FocusNode _focus = FocusNode();
  final ScrollController _scrollCtrl = ScrollController();
  final List<Map<String, dynamic>> _originalPosts = [
    {
      'date': '23/05/2021',
      'favorite': false,
      'likes': 4,
      'message': null,
      'imageURL': 'https://pavbca.com/walldb/original/7/a/c/581365.jpg',
    },
    {
      'date': '23/10/2020',
      'favorite': false,
      'likes': 28,
      'message':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id risus at felis varius dignissim. Ut a tincidunt magna. Sed sem arcu, egestas ut risus non, ultrices facilisis sapien. Curabitur at mattis velit, aliquet egestas tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce malesuada, est sit amet dictum porta, erat turpis maximus justo, quis aliquet tortor nunc id orci. Cras molestie magna finibus libero eleifend pharetra. Aliquam sagittis, turpis at dapibus fringilla, dui felis sollicitudin elit, vel laoreet nibh neque ac ipsum. Morbi felis nibh, imperdiet nec laoreet a, lobortis vel metus. Proin placerat ipsum et erat convallis, molestie pellentesque mi interdum. Quisque porta dictum quam, ac ultrices lorem dignissim ultrices. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec iaculis libero ex, ut tempor lacus dignissim at. Aenean et egestas nisi.',
      'imageURL': null,
    },
  ];
  late List<Map<String, dynamic>> _posts;

  void _search(String text) {
    List<Map<String, dynamic>> result;
    if (text.isNotEmpty) {
      result = _originalPosts
          .where((element) =>
              element['message'] != null &&
              element['message'].toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      result = _originalPosts;
    }
    setState(() {
      _posts = result;
    });
  }

  @override
  void initState() {
    _posts = List<Map<String, dynamic>>.from(_originalPosts).toList();
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Mural'),
      body: Column(
        children: [
          GlobalTitle(
            userName: globalUser.userName,
            message: 'acompanhe as notícias e fique conectado!',
            focusNode: _focus,
            onTextChange: _search,
          ),
          Expanded(
            child: GlobalScrollbar(
              controller: _scrollCtrl,
              child: ListView.builder(
                controller: _scrollCtrl,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemCount: _posts.length,
                itemBuilder: (_, index) => MuralCard(
                  date: _posts[index]['date'],
                  favorite: _posts[index]['favorite'],
                  likes: _posts[index]['likes'],
                  imageURL: _posts[index]['imageURL'],
                  message: _posts[index]['message'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
