import 'package:flutter/material.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({super.key});

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  String selectedBuilding = "All";
  String selectedTime = "10:00 AM";

  final List<Map<String, dynamic>> classrooms = [
    {
      "name": "Classroom A-101",
      "building": "Block A",
      "capacity": "60 Seats",
      "floor": "1st Floor",
      "status": "Available",
      "icon": Icons.meeting_room_rounded,
    },
    {
      "name": "Classroom A-102",
      "building": "Block A",
      "capacity": "50 Seats",
      "floor": "1st Floor",
      "status": "Available",
      "icon": Icons.meeting_room_rounded,
    },
    {
      "name": "Classroom B-201",
      "building": "Block B",
      "capacity": "70 Seats",
      "floor": "2nd Floor",
      "status": "Booked",
      "icon": Icons.meeting_room_rounded,
    },
    {
      "name": "Classroom B-202",
      "building": "Block B",
      "capacity": "45 Seats",
      "floor": "2nd Floor",
      "status": "Available",
      "icon": Icons.meeting_room_rounded,
    },
    {
      "name": "Smart Room C-301",
      "building": "Block C",
      "capacity": "80 Seats",
      "floor": "3rd Floor",
      "status": "Available",
      "icon": Icons.co_present_rounded,
    },
    {
      "name": "Seminar Room C-302",
      "building": "Block C",
      "capacity": "100 Seats",
      "floor": "3rd Floor",
      "status": "Booked",
      "icon": Icons.groups_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredClassrooms = selectedBuilding == "All"
        ? classrooms
        : classrooms
            .where((room) => room["building"] == selectedBuilding)
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.school_rounded),
            SizedBox(width: 10),
            Text(
              "Classroom Booking",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------------------------------
            // HEADER
            // --------------------------------------------------

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find a Classroom 🏫",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Choose a classroom and reserve your preferred time.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF673AB7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "12 Sep 2026",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // --------------------------------------------------
            // SEARCH
            // --------------------------------------------------

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search classroom...",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF673AB7),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF7F5FB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // --------------------------------------------------
            // FILTERS
            // --------------------------------------------------

            const Text(
              "Select Building",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24213D),
              ),
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterButton("All"),
                  _filterButton("Block A"),
                  _filterButton("Block B"),
                  _filterButton("Block C"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --------------------------------------------------
            // TIME
            // --------------------------------------------------

            const Text(
              "Select Time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24213D),
              ),
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _timeButton("09:00 AM"),
                  _timeButton("10:00 AM"),
                  _timeButton("11:00 AM"),
                  _timeButton("12:00 PM"),
                  _timeButton("02:00 PM"),
                  _timeButton("03:00 PM"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // --------------------------------------------------
            // AVAILABLE CLASSROOMS
            // --------------------------------------------------

            Row(
              children: [
                const Icon(
                  Icons.meeting_room_rounded,
                  color: Color(0xFF673AB7),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Available Classrooms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Text(
                  "${filteredClassrooms.length} Rooms",
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // --------------------------------------------------
            // CLASSROOM GRID
            // --------------------------------------------------

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredClassrooms.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.35,
              ),
              itemBuilder: (context, index) {
                final room = filteredClassrooms[index];

                return _classroomCard(room);
              },
            ),

            const SizedBox(height: 25),

            // --------------------------------------------------
            // INFORMATION
            // --------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFEDE7FF),
                    Color(0xFFE7F4FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF673AB7),
                    size: 28,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "Please book classrooms at least 30 minutes before your session.",
                      style: TextStyle(
                        color: Color(0xFF4A4270),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // FILTER BUTTON
  // ============================================================

  Widget _filterButton(String value) {
    final bool selected = selectedBuilding == value;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(value),
        selected: selected,
        onSelected: (_) {
          setState(() {
            selectedBuilding = value;
          });
        },
        selectedColor: const Color(0xFF673AB7),
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: selected ? Colors.white : const Color(0xFF24213D),
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }

  // ============================================================
  // TIME BUTTON
  // ============================================================

  Widget _timeButton(String time) {
    final bool selected = selectedTime == time;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(time),
        selected: selected,
        onSelected: (_) {
          setState(() {
            selectedTime = time;
          });
        },
        selectedColor: const Color(0xFFE5D9FF),
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: selected
              ? const Color(0xFF673AB7)
              : const Color(0xFF555555),
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }

  // ============================================================
  // CLASSROOM CARD
  // ============================================================

  Widget _classroomCard(Map<String, dynamic> room) {
    final bool available = room["status"] == "Available";

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: available
                      ? const Color(0xFFEDE7FF)
                      : const Color(0xFFFFE9E9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  room["icon"],
                  color: available
                      ? const Color(0xFF673AB7)
                      : Colors.redAccent,
                  size: 25,
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: available
                      ? const Color(0xFFE7F8EE)
                      : const Color(0xFFFFE8E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  room["status"],
                  style: TextStyle(
                    color: available
                        ? Colors.green.shade700
                        : Colors.redAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            room["name"],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24213D),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            room["building"],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(
                Icons.people_outline_rounded,
                size: 17,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                room["capacity"],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.layers_outlined,
                size: 17,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                room["floor"],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: available
                  ? () {
                      _showBookingDialog(
                        room["name"],
                        selectedTime,
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade200,
                disabledForegroundColor: Colors.grey,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                available ? "Book Now" : "Not Available",
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOOKING DIALOG
  // ============================================================

  void _showBookingDialog(String room, String time) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.event_available_rounded,
                color: Color(0xFF673AB7),
              ),
              SizedBox(width: 10),
              Text("Confirm Booking"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialogRow(
                "Classroom",
                room,
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Date",
                "12 Sep 2026",
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Time",
                time,
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Status",
                "Available",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$room booked successfully!",
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
              ),
              child: const Text("Confirm Booking"),
            ),
          ],
        );
      },
    );
  }

  Widget _dialogRow(String title, String value) {
    return Row(
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}