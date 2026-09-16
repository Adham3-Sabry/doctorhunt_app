import 'package:doctorhunt_app/apps/features/select_time/data/models/appointment_day_model.dart';
import 'package:doctorhunt_app/apps/features/select_time/presentation/widgets/appointment_action_button.dart';
import 'package:doctorhunt_app/apps/features/select_time/presentation/widgets/time_slot_button.dart';
import 'package:flutter/material.dart';


import '../widgets/appointment_date_card.dart';
import '../widgets/appointment_doctor_card.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({
    super.key,
  });

  @override
  State<SelectTimeScreen> createState() =>
      _SelectTimeScreenState();
}

class _SelectTimeScreenState
    extends State<SelectTimeScreen> {
  // ===========================================================
  // SELECTED DATE
  // ===========================================================

  int selectedDateIndex = 1;

  // ===========================================================
  // SELECTED TIME
  // ===========================================================

  String? selectedTime;

  // ===========================================================
  // TEMP DATA
  //
  // Later this list can come directly from API.
  // ===========================================================

  final List<AppointmentDayModel> days = const [
    AppointmentDayModel(
      day: 'Today',
      date: '23 Feb',
      availableSlots: 0,
      afternoonSlots: [],
      eveningSlots: [],
      nextAvailability: 'wed, 24 Feb',
    ),

    AppointmentDayModel(
      day: 'Tomorrow',
      date: '24 Feb',
      availableSlots: 9,
      afternoonSlots: [
        '1:00 PM',
        '1:30 PM',
        '2:00 PM',
        '2:30 PM',
        '3:00 PM',
        '3:30 PM',
        '4:00 PM',
      ],
      eveningSlots: [
        '5:00 PM',
        '5:30 PM',
        '6:00 PM',
        '6:30 PM',
        '7:00 PM',
      ],
    ),

    AppointmentDayModel(
      day: 'Thu',
      date: '25 Feb',
      availableSlots: 10,
      afternoonSlots: [
        '1:00 PM',
        '1:30 PM',
        '2:00 PM',
      ],
      eveningSlots: [
        '5:00 PM',
        '5:30 PM',
        '6:00 PM',
      ],
    ),

    AppointmentDayModel(
      day: 'Fri',
      date: '26 Feb',
      availableSlots: 7,
      afternoonSlots: [
        '1:00 PM',
        '2:00 PM',
        '3:00 PM',
      ],
      eveningSlots: [
        '5:00 PM',
        '6:00 PM',
      ],
    ),
  ];

  // ===========================================================
  // DOCTOR IMAGE
  // PUT YOUR IMAGE PATH HERE
  // ===========================================================

  final String doctorImagePath = '';

  // ===========================================================
  // FAVORITE IMAGE
  // PUT YOUR RED HEART IMAGE PATH HERE
  // ===========================================================

  final String favoriteIconPath = 'asssets/images/like.png';

  @override
  Widget build(BuildContext context) {
    final selectedDay = days[selectedDateIndex];

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // =====================================================
          // BACKGROUND
          // =====================================================

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE6F8FF),
                  Colors.white,
                  Color(0xFFE8FFF7),
                ],
                stops: [
                  0.0,
                  0.55,
                  1.0,
                ],
              ),
            ),
          ),

          // =====================================================
          // CONTENT
          // =====================================================

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =================================================
                  // HEADER
                  // =================================================

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(9),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 15,
                              color: Color(0xFF71809F),
                            ),
                          ),
                        ),

                        const SizedBox(width: 18),

                        const Text(
                          'Select Time',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF303030),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // =================================================
                  // DOCTOR CARD
                  // =================================================

                  AppointmentDoctorCard(
                    doctorName: 'Dr. Shruti Kedia',
                    clinicName:
                        'Upasana Dental Clinic, salt lake',
                    price: '28.00',
                    imagePath: doctorImagePath,
                    favoriteIconPath: favoriteIconPath,
                  ),

                  const SizedBox(height: 24),

                  // =================================================
                  // DATE SELECTOR
                  // =================================================

                  SizedBox(
                    height: 54,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics:
                          const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      itemCount: days.length,
                      separatorBuilder: (_, __) {
                        return const SizedBox(width: 16);
                      },
                      itemBuilder: (context, index) {
                        final day = days[index];

                        return AppointmentDateCard(
                          day: day,
                          selected:
                              selectedDateIndex == index,
                          onTap: () {
                            setState(() {
                              selectedDateIndex = index;

                              // Reset selected time
                              // whenever date changes.
                              selectedTime = null;
                            });
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =================================================
                  // SELECTED DATE TITLE
                  // =================================================

                  Center(
                    child: Text(
                      '${selectedDay.day}, ${selectedDay.date}',
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF303030),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // IF THERE ARE NO SLOTS
                  // =================================================

                  if (!selectedDay.hasSlots)
                    _NoSlotsView(
                      nextAvailability:
                          selectedDay.nextAvailability,
                      onNextAvailability: () {
                        // TODO:
                        // Navigate to next availability.
                      },
                      onContactClinic: () {
                        // TODO:
                        // Contact clinic.
                      },
                    )
                  else
                    // =================================================
                    // AVAILABLE SLOTS
                    // =================================================
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // =============================================
                        // AFTERNOON
                        // =============================================

                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Afternoon 7 slots',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF303030),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        _TimeSlotsWrap(
                          slots:
                              selectedDay.afternoonSlots,
                          selectedTime: selectedTime,
                          onSelect: (time) {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                        ),

                        const SizedBox(height: 24),

                        // =============================================
                        // EVENING
                        // =============================================

                        Padding(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Evening ${selectedDay.eveningSlots.length} slots',
                            style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF303030),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        _TimeSlotsWrap(
                          slots:
                              selectedDay.eveningSlots,
                          selectedTime: selectedTime,
                          onSelect: (time) {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                        ),
                      ],
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






class _TimeSlotsWrap extends StatelessWidget {
  final List<String> slots;
  final String? selectedTime;
  final ValueChanged<String> onSelect;

  const _TimeSlotsWrap({
    required this.slots,
    required this.selectedTime,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: slots.map((time) {
          return TimeSlotButton(
            time: time,
            selected: selectedTime == time,
            onTap: () {
              onSelect(time);
            },
          );
        }).toList(),
      ),
    );
  }
}



class _NoSlotsView extends StatelessWidget {
  final String? nextAvailability;
  final VoidCallback onNextAvailability;
  final VoidCallback onContactClinic;

  const _NoSlotsView({
    required this.nextAvailability,
    required this.onNextAvailability,
    required this.onContactClinic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 34,
      ),
      child: Column(
        children: [
          const Text(
            'No slots available',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7883A1),
            ),
          ),

          const SizedBox(height: 24),

          AppointmentActionButton(
            title: nextAvailability == null
                ? 'Next availability'
                : 'Next availability on $nextAvailability',
            onTap: onNextAvailability,
          ),

          const SizedBox(height: 14),

          const Text(
            'OR',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7883A1),
            ),
          ),

          const SizedBox(height: 14),

          AppointmentActionButton(
            title: 'Contact Clinic',
            outlined: true,
            onTap: onContactClinic,
          ),
        ],
      ),
    );
  }
}