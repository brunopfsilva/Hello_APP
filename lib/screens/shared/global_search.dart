import 'package:flutter/material.dart';

class GlobalSearch extends StatefulWidget {
  final FocusNode focusNode;
  final Function(String)? onTextChange;

  const GlobalSearch({
    required this.focusNode,
    this.onTextChange,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalSearchState createState() => _GlobalSearchState();
}

class _GlobalSearchState extends State<GlobalSearch> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      onTap: () {
        setState(() {
          _selected = true;
        });
      },
      onEditingComplete: () {
        _selected = false;
      },
      onChanged: widget.onTextChange,
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Pesquisar...',
        suffixIcon: Icon(
          Icons.search_rounded,
          color: _selected ? Theme.of(context).accentColor : null,
        ),
      ),
    );
  }
}
