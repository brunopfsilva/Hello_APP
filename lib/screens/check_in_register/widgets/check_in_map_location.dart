import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class CheckInMapLocation extends StatefulWidget {
  final ValueChanged<Position>? onLocated;

  const CheckInMapLocation({Key? key, this.onLocated}) : super(key: key);

  @override
  _CheckInMapLocationState createState() => _CheckInMapLocationState();
}

class _CheckInMapLocationState extends State<CheckInMapLocation> {
  late MapController? _mapCtrl;
  bool _located = false;

  Future<void> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position devicePosition;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Localization service are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location service denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location service are permanently denied');
    }

    devicePosition = await Geolocator.getCurrentPosition();
    setState(() {
      _mapCtrl = MapController(
        location: LatLng(devicePosition.latitude, devicePosition.longitude),
        zoom: 16,
      );
      _located = true;
    });
    if (widget.onLocated != null) {
      widget.onLocated?.call(devicePosition);
    }
  }

  @override
  void initState() {
    _getPosition();
    super.initState();
  }

  @override
  void dispose() {
    if (_mapCtrl != null) {
      _mapCtrl!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: _located
                ? Map(
                    controller: _mapCtrl!,
                    builder: (context, x, y, z) => Image.network(
                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
                      fit: BoxFit.cover,
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          if (_located)
            const Positioned.fill(
              bottom: 32.0,
              child: Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 30.0,
              ),
            )
          else
            Container(
              width: 0.0,
              height: 0.0,
            ),
        ],
      ),
    );
  }
}
