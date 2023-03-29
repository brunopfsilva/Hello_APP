import 'package:flutter/material.dart';

class MuralCard extends StatefulWidget {
  final String? message;
  final String? imageURL;
  final String date;
  bool favorite;
  int likes;

  MuralCard({
    required this.date,
    required this.favorite,
    required this.likes,
    this.message,
    this.imageURL,
    Key? key,
  }) : super(key: key);

  @override
  _MuralCardState createState() => _MuralCardState();
}

class _MuralCardState extends State<MuralCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.date),
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigo[600]!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.imageURL == null)
                  const SizedBox()
                else
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 250.0,
                      maxHeight: 250.0,
                    ),
                    child: Image.network(
                      widget.imageURL!,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (widget.message == null)
                  const SizedBox()
                else
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Text(widget.message!),
                  ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        splashRadius: 20.0,
                        icon: widget.favorite
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border_rounded),
                        color: widget.favorite ? Colors.red : null,
                        onPressed: () {
                          setState(() {
                            !widget.favorite ? widget.likes++ : widget.likes--;
                            widget.favorite = !widget.favorite;
                          });
                        },
                      ),
                      Text(widget.likes.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
