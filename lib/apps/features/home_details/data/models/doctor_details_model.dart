class DoctorDetailsModel {
  final String name;
  final String specialty;
  final String price;
  final String doctorImagePath;
  final String favoriteIconPath;
  final String mapImagePath;

  final int running;
  final int ongoing;
  final int patient;

  final List<String> services;

  const DoctorDetailsModel({
    required this.name,
    required this.specialty,
    required this.price,
    required this.doctorImagePath,
    required this.favoriteIconPath,
    required this.mapImagePath,
    required this.running,
    required this.ongoing,
    required this.patient,
    required this.services,
  });
}