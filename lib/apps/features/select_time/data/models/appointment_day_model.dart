class AppointmentDayModel {
  final String day;
  final String date;
  final int availableSlots;

  final List<String> afternoonSlots;
  final List<String> eveningSlots;

  final String? nextAvailability;

  const AppointmentDayModel({
    required this.day,
    required this.date,
    required this.availableSlots,
    required this.afternoonSlots,
    required this.eveningSlots,
    this.nextAvailability,
  });

  bool get hasSlots {
    return afternoonSlots.isNotEmpty ||
        eveningSlots.isNotEmpty;
  }
}