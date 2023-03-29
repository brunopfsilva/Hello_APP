import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraImage extends StatefulWidget {
  final ValueChanged<File>? onTakePhoto;

  const CameraImage({Key? key, this.onTakePhoto}) : super(key: key);

  @override
  _CameraImageState createState() => _CameraImageState();
}

class _CameraImageState extends State<CameraImage> {
  File? _image;

  Future<void> _getPhoto() async {
    final PickedFile? photo = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
      if (widget.onTakePhoto != null) {
        widget.onTakePhoto?.call(_image!);
      }
    }
  }

  void _confirmNewPhoto() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Nova foto'),
            onTap: () async {
              await _getPhoto();
            },
          ),
          ListTile(
            title: const Text('Cancelar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
        image: _image != null
            ? DecorationImage(
                image: FileImage(_image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              if (_image == null) {
                await _getPhoto();
              } else {
                _confirmNewPhoto();
              }
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              alignment: _image != null ? Alignment.bottomRight : null,
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: double.infinity,
              child: const Icon(Icons.camera_alt_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
