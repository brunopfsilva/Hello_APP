import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/date_view.dart';

class PointingCard extends StatelessWidget {
  final DateDetails? dateDetails;

  const PointingCard({required this.dateDetails, Key? key})
      : assert(dateDetails != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateView(dateDetails: dateDetails),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xff313640),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Minha escala',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expediente:',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const Text(
                        '08:00 as 18:00',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intervalo:',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const Text(
                        '12:00 as 14:00',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Container(
                          width: 50,
                          child: const Icon(Icons.edit_rounded),
                        ),
                        backgroundColor: const Color(0xff686C73),
                        onPressed: () {},
                      ),
                      ActionChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Container(
                          width: 50,
                          child: const Text(
                            '12:00',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        backgroundColor: const Color(0xff686C73),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Container(
                          width: 50,
                          child: const Text(
                            '14:00',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        backgroundColor: const Color(0xff686C73),
                        onPressed: () {},
                      ),
                      ActionChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Container(
                          width: 50,
                          child: const Text(
                            '18:00',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        backgroundColor: const Color(0xff686C73),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(height: 0.0),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff686C73),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(1, 1),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.camera_alt_rounded),
                        SizedBox(width: 8.0),
                        Text('Declarações/Atestados'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff686C73),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(1, 1),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.person_rounded),
                        SizedBox(width: 8.0),
                        Text('Aprovação gestor/RH'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff686C73),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(1, 1),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.insert_drive_file_rounded),
                        SizedBox(width: 8.0),
                        Text('Justificativas'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
