import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_app/screens/check_in_register/widgets/camera_image.dart';
import 'package:hello_app/screens/check_in_register/widgets/check_in_map_location.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:intl/intl.dart';

class CheckInRegisterScreen extends StatefulWidget {
  const CheckInRegisterScreen({Key? key}) : super(key: key);

  @override
  _CheckInRegisterScreenState createState() => _CheckInRegisterScreenState();
}

class _CheckInRegisterScreenState extends State<CheckInRegisterScreen> {
  String? _actualTime;
  Timer? _timer;
  File? _image;
  Position? _position;

  void _getTime() {
    if (mounted) {
      setState(() {
        _actualTime = DateFormat.Hm('pt_BR').format(DateTime.now());
      });
    }
  }

  @override
  void initState() {
    _getTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Registro de ponto',
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _position != null && _image != null
            ? () {
                Navigator.pop(context, true);
              }
            : null,
        disabledElevation: 25.0,
        label: const Text('Registrar ponto'),
        icon: const Icon(Icons.done_rounded),
        backgroundColor: _position != null && _image != null
            ? null
            : Theme.of(context).accentColor.withOpacity(0.4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: _height * 0.05),
              const Text(
                'Olá, user_name!',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: _height * 0.02),
              Text(
                _actualTime!,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _height * 0.05),
              CameraImage(
                onTakePhoto: (image) {
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SizedBox(height: _height * 0.05),
              CheckInMapLocation(
                onLocated: (position) {
                  setState(() {
                    _position = position;
                  });
                },
              ),
              SizedBox(height: _height * 0.055),
            ],
          ),
        ),
      ),
    );
  }
}
