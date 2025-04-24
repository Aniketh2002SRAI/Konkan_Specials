import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:konkanspecials/model/location_model/location_model.dart';

class LocationService extends ChangeNotifier {
  static final LocationService _instance = LocationService._();
  static LocationService get instance => _instance;

  LocationService._() {
    // Initialize with initial state
    _updateLocationModel(status: LocationStatus.initial);
    // Get location on initialization
    getLocation();
  }

  LocationModel? _locationModel;
  LocationModel? get locationModel => _locationModel;

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getLocation() async {
    try {
      // Check if we already have a valid location
      if (_locationModel?.isGranted == true &&
          _locationModel?.hasLocation == true) {
        return; // Use cached location
      }

      // Check if location services are enabled
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _updateLocationModel(
          status: LocationStatus.disabled,
          errorMessage:
              'Location services are disabled. Please enable them to continue.',
        );
        await Geolocator.openLocationSettings();
        return;
      }

      // Only check permissions if location services are enabled
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _updateLocationModel(
            status: LocationStatus.denied,
            errorMessage:
                'Location permissions are denied. Please grant permission to continue.',
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _updateLocationModel(
          status: LocationStatus.deniedForever,
          errorMessage:
              'Location permissions are permanently denied. Please enable them in app settings.',
        );
        await Geolocator.openAppSettings();
        return;
      }

      // Get current position only if we have permission
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        final Position position = await getCurrentPosition();
        _updateLocationModel(
          status: LocationStatus.granted,
          latitude: position.latitude,
          longitude: position.longitude,
        );
      }
    } catch (e) {
      _updateLocationModel(
        status: LocationStatus.error,
        errorMessage: 'Failed to get location: ${e.toString()}',
      );
    }
  }

  Future<void> refreshLocation() async {
    _updateLocationModel(status: LocationStatus.initial);
    await getLocation();
  }

  void _updateLocationModel({
    required LocationStatus status,
    double? latitude,
    double? longitude,
    String? errorMessage,
  }) {
    _locationModel = LocationModel(
      status: status,
      latitude: latitude,
      longitude: longitude,
      errorMessage: errorMessage,
    );
    notifyListeners();
  }
}
