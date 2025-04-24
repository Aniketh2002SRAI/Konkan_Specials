enum LocationStatus {
  initial,
  granted,
  denied,
  deniedForever,
  disabled,
  error,
}

class LocationModel {
  final LocationStatus status;
  final double? latitude;
  final double? longitude;
  final String? errorMessage;

  LocationModel({
    required this.status,
    this.latitude,
    this.longitude,
    this.errorMessage,
  });

  String? get locationString {
    if (latitude != null && longitude != null) {
      return '$latitude, $longitude';
    }
    return null;
  }

  bool get hasLocation => latitude != null && longitude != null;
  bool get hasError => errorMessage != null;
  bool get isGranted => status == LocationStatus.granted;
}
