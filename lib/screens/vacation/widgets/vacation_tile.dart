import 'package:flutter/material.dart';

class VacationTile extends StatelessWidget {
  final String? periodText;
  final String? joyText;

  const VacationTile({
    required this.periodText,
    required this.joyText,
    Key? key,
  })  : assert(periodText != null || joyText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Período aquisitivo: $periodText',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Gozo: $joyText',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.library_books_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cloud_download_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.event_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
