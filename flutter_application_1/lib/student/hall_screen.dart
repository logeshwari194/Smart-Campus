import 'package:flutter/material.dart';

class HallScreen extends StatefulWidget {
  const HallScreen({super.key});

  @override
  State<HallScreen> createState() => _HallScreenState();
}

class _HallScreenState extends State<HallScreen> {
  String selectedBlock = "All";
  String selectedTime = "10:00 AM";

  DateTime selectedDate = DateTime(2026, 9, 12);

  final List<Map<String, dynamic>> halls = [
    {
      "name": "Main Seminar Hall",
      "block": "Block A",
      "capacity": "500 Seats",
      "floor": "Ground Floor",
      "status": "Available",
      "facilities": [
        "AC",
        "Projector",
        "Mic",
        "Wi-Fi",
      ],
      "icon": Icons.groups_rounded,
      "color": Colors.deepPurple,
    },
    {
      "name": "Mini Seminar Hall",
      "block": "Block A",
      "capacity": "200 Seats",
      "floor": "1st Floor",
      "status": "Booked",
      "facilities": [
        "AC",
        "Projector",
        "Mic",
      ],
      "icon": Icons.co_present_rounded,
      "color": Colors.blue,
    },
    {
      "name": "Auditorium",
      "block": "Block B",
      "capacity": "800 Seats",
      "floor": "Ground Floor",
      "status": "Available",
      "facilities": [
        "AC",
        "LED Screen",
        "Mic",
        "Wi-Fi",
      ],
      "icon": Icons.theater_comedy_rounded,
      "color": Colors.orange,
    },
    {
      "name": "Conference Hall",
      "block": "Block B",
      "capacity": "120 Seats",
      "floor": "2nd Floor",
      "status": "Available",
      "facilities": [
        "AC",
        "Projector",
        "Video Call",
      ],
      "icon": Icons.business_center_rounded,
      "color": Colors.teal,
    },
    {
      "name": "Innovation Hall",
      "block": "Block C",
      "capacity": "250 Seats",
      "floor": "1st Floor",
      "status": "Available",
      "facilities": [
        "AC",
        "Smart Board",
        "Wi-Fi",
      ],
      "icon": Icons.lightbulb_rounded,
      "color": Colors.green,
    },
    {
      "name": "Training Hall",
      "block": "Block C",
      "capacity": "100 Seats",
      "floor": "2nd Floor",
      "status": "Booked",
      "facilities": [
        "Projector",
        "Mic",
        "Wi-Fi",
      ],
      "icon": Icons.school_rounded,
      "color": Colors.redAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredHalls = selectedBlock == "All"
        ? halls
        : halls.where((hall) => hall["block"] == selectedBlock).toList();

    final availableCount =
        filteredHalls.where((hall) => hall["status"] == "Available").length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FF),

      // ============================================================
      // APP BAR
      // ============================================================

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.account_balance_rounded),
            SizedBox(width: 10),
            Text(
              "Hall Booking",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xFF673AB7),
              ),
            ),
          ),
        ],
      ),

      // ============================================================
      // BODY
      // ============================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ======================================================
            // HEADER
            // ======================================================

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find a Hall 🏛️",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Choose a hall for seminars, events and meetings.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Date
                InkWell(
                  onTap: _selectDate,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.04),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFF673AB7),
                        ),
                        const SizedBox(width: 9),
                        Text(
                          _formatDate(selectedDate),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ======================================================
            // SUMMARY CARDS
            // ======================================================

            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    Icons.account_balance_rounded,
                    "Total Halls",
                    "${halls.length}",
                    Colors.deepPurple,
                    const Color(0xFFF0E9FF),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _summaryCard(
                    Icons.check_circle_rounded,
                    "Available",
                    "$availableCount",
                    Colors.green,
                    const Color(0xFFE8F8EF),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _summaryCard(
                    Icons.event_busy_rounded,
                    "Booked",
                    "${filteredHalls.length - availableCount}",
                    Colors.redAccent,
                    const Color(0xFFFFECEE),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _summaryCard(
                    Icons.access_time_rounded,
                    "Time",
                    selectedTime,
                    Colors.orange,
                    const Color(0xFFFFF3DE),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ======================================================
            // SEARCH
            // ======================================================

            Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 14,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search hall...",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF673AB7),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0E9FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F7FC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // BLOCK FILTER
            // ======================================================

            const Text(
              "Select Block",
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
                  _blockButton("All"),
                  _blockButton("Block A"),
                  _blockButton("Block B"),
                  _blockButton("Block C"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // TIME SLOT
            // ======================================================

            Row(
              children: [
                const Text(
                  "Select Time Slot",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Text(
                  _formatDate(selectedDate),
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                  _timeButton("04:00 PM"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ======================================================
            // HALL SECTION
            // ======================================================

            Row(
              children: [
                const Icon(
                  Icons.account_balance_rounded,
                  color: Color(0xFF673AB7),
                  size: 26,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Available Halls",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$availableCount Available",
                    style: const TextStyle(
                      color: Color(0xFF673AB7),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 17),

            // ======================================================
            // HALL GRID
            // ======================================================

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredHalls.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                return _hallCard(filteredHalls[index]);
              },
            ),

            const SizedBox(height: 25),

            // ======================================================
            // INFORMATION BANNER
            // ======================================================

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
                    size: 29,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "Please check hall facilities and capacity before confirming your booking.",
                      style: TextStyle(
                        color: Color(0xFF51477A),
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
  // SUMMARY CARD
  // ============================================================

  Widget _summaryCard(
    IconData icon,
    String title,
    String value,
    Color color,
    Color background,
  ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BLOCK BUTTON
  // ============================================================

  Widget _blockButton(String block) {
    final bool selected = selectedBlock == block;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(block),
        selected: selected,
        onSelected: (_) {
          setState(() {
            selectedBlock = block;
          });
        },
        selectedColor: const Color(0xFF673AB7),
        backgroundColor: Colors.white,
        side: BorderSide.none,
        labelStyle: TextStyle(
          color: selected
              ? Colors.white
              : const Color(0xFF24213D),
          fontWeight: FontWeight.w600,
        ),
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
        selectedColor: const Color(0xFFE4D8FF),
        backgroundColor: Colors.white,
        side: BorderSide.none,
        labelStyle: TextStyle(
          color: selected
              ? const Color(0xFF673AB7)
              : const Color(0xFF555555),
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }

  // ============================================================
  // HALL CARD
  // ============================================================

  Widget _hallCard(Map<String, dynamic> hall) {
    final bool available = hall["status"] == "Available";
    final Color color = hall["color"];

    final List<String> facilities =
        List<String>.from(hall["facilities"]);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.045),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ------------------------------------------------------
          // ICON + STATUS
          // ------------------------------------------------------

          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  hall["icon"],
                  color: color,
                  size: 26,
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: available
                      ? const Color(0xFFE7F8EF)
                      : const Color(0xFFFFE8E9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: available
                          ? Colors.green
                          : Colors.redAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      hall["status"],
                      style: TextStyle(
                        color: available
                            ? Colors.green.shade700
                            : Colors.redAccent,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ------------------------------------------------------
          // HALL NAME
          // ------------------------------------------------------

          Text(
            hall["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24213D),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            hall["block"],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 12),

          // ------------------------------------------------------
          // CAPACITY + FLOOR
          // ------------------------------------------------------

          Row(
            children: [
              const Icon(
                Icons.people_outline_rounded,
                size: 17,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  hall["capacity"],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ),

              const Icon(
                Icons.layers_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),

              Text(
                hall["floor"],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ------------------------------------------------------
          // FACILITIES
          // ------------------------------------------------------

          const Text(
            "Facilities",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF555555),
            ),
          ),

          const SizedBox(height: 6),

          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: facilities.map((facility) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(.08),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  facility,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),

          const Spacer(),

          // ------------------------------------------------------
          // BUTTONS
          // ------------------------------------------------------

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _showHallDetails(hall);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF673AB7),
                    side: const BorderSide(
                      color: Color(0xFF673AB7),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ElevatedButton(
                  onPressed: available
                      ? () {
                          _showBookingDialog(hall);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF673AB7),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade200,
                    disabledForegroundColor: Colors.grey,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Text(
                    available ? "Book" : "Booked",
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DATE PICKER
  // ============================================================

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2026, 9, 12),
      lastDate: DateTime(2027, 12, 31),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF673AB7),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // ============================================================
  // HALL DETAILS
  // ============================================================

  void _showHallDetails(Map<String, dynamic> hall) {
    final List<String> facilities =
        List<String>.from(hall["facilities"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: Row(
            children: [
              Icon(
                hall["icon"],
                color: hall["color"],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  hall["name"],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailRow(
                Icons.business_rounded,
                "Block",
                hall["block"],
              ),
              const SizedBox(height: 12),
              _detailRow(
                Icons.people_rounded,
                "Capacity",
                hall["capacity"],
              ),
              const SizedBox(height: 12),
              _detailRow(
                Icons.layers_rounded,
                "Location",
                hall["floor"],
              ),
              const SizedBox(height: 18),

              const Text(
                "Available Facilities",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: facilities.map((item) {
                  return Chip(
                    label: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    backgroundColor:
                        const Color(0xFFF0E9FF),
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // BOOKING DIALOG
  // ============================================================

  void _showBookingDialog(Map<String, dynamic> hall) {
    final List<String> facilities =
        List<String>.from(hall["facilities"]);

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
                "Hall",
                hall["name"],
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Date",
                _formatDate(selectedDate),
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Time",
                selectedTime,
              ),
              const SizedBox(height: 12),
              _dialogRow(
                "Capacity",
                hall["capacity"],
              ),

              const SizedBox(height: 18),

              const Text(
                "Facilities",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: facilities.map((item) {
                  return Chip(
                    label: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    backgroundColor:
                        const Color(0xFFF0E9FF),
                    side: BorderSide.none,
                  );
                }).toList(),
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
                      "${hall["name"]} booked successfully!",
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

  // ============================================================
  // DETAIL ROW
  // ============================================================

  Widget _detailRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF673AB7),
          size: 20,
        ),
        const SizedBox(width: 10),
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

  // ============================================================
  // DIALOG ROW
  // ============================================================

  Widget _dialogRow(
    String title,
    String value,
  ) {
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

  // ============================================================
  // DATE FORMAT
  // ============================================================

  String _formatDate(DateTime date) {
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');

    return "$day/$month/${date.year}";
  }
}