import 'package:flutter/material.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  String selectedBlock = "All";
  String selectedTime = "10:00 AM";

  final List<Map<String, dynamic>> labs = [
    {
      "name": "Computer Lab 1",
      "block": "Block A",
      "capacity": "60 Systems",
      "floor": "1st Floor",
      "status": "Available",
      "equipment": [
        "Desktop PCs",
        "Projector",
        "Wi-Fi",
      ],
      "color": Colors.blue,
      "icon": Icons.computer_rounded,
    },
    {
      "name": "Computer Lab 2",
      "block": "Block A",
      "capacity": "50 Systems",
      "floor": "2nd Floor",
      "status": "Booked",
      "equipment": [
        "Desktop PCs",
        "Projector",
        "Printer",
      ],
      "color": Colors.indigo,
      "icon": Icons.computer_rounded,
    },
    {
      "name": "AI & ML Lab",
      "block": "Block B",
      "capacity": "40 Systems",
      "floor": "2nd Floor",
      "status": "Available",
      "equipment": [
        "GPU Systems",
        "Python",
        "AI Tools",
      ],
      "color": Colors.deepPurple,
      "icon": Icons.smart_toy_rounded,
    },
    {
      "name": "IoT Lab",
      "block": "Block B",
      "capacity": "35 Seats",
      "floor": "3rd Floor",
      "status": "Available",
      "equipment": [
        "Arduino",
        "Sensors",
        "Raspberry Pi",
      ],
      "color": Colors.teal,
      "icon": Icons.memory_rounded,
    },
    {
      "name": "Networking Lab",
      "block": "Block C",
      "capacity": "45 Systems",
      "floor": "1st Floor",
      "status": "Available",
      "equipment": [
        "Routers",
        "Switches",
        "LAN Kits",
      ],
      "color": Colors.orange,
      "icon": Icons.lan_rounded,
    },
    {
      "name": "Electronics Lab",
      "block": "Block C",
      "capacity": "30 Seats",
      "floor": "2nd Floor",
      "status": "Booked",
      "equipment": [
        "Oscilloscope",
        "Arduino",
        "Power Supply",
      ],
      "color": Colors.redAccent,
      "icon": Icons.electrical_services_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredLabs = selectedBlock == "All"
        ? labs
        : labs.where((lab) => lab["block"] == selectedBlock).toList();

    final availableCount =
        filteredLabs.where((lab) => lab["status"] == "Available").length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FF),

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.science_rounded),
            SizedBox(width: 10),
            Text(
              "Laboratory Booking",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
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

      // ========================================================
      // BODY
      // ========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ==================================================
            // HEADER
            // ==================================================

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find a Laboratory 🧪",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Check availability, equipment and reserve a lab.",
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF673AB7),
                      ),
                      SizedBox(width: 9),
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

            // ==================================================
            // SUMMARY CARDS
            // ==================================================

            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    Icons.science_rounded,
                    "Total Labs",
                    "${labs.length}",
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
                    "${filteredLabs.length - availableCount}",
                    Colors.redAccent,
                    const Color(0xFFFFECEE),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _summaryCard(
                    Icons.access_time_rounded,
                    "Selected Time",
                    selectedTime,
                    Colors.orange,
                    const Color(0xFFFFF3DE),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ==================================================
            // SEARCH
            // ==================================================

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
                  hintText: "Search laboratory...",
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

            // ==================================================
            // BLOCK FILTER
            // ==================================================

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

            // ==================================================
            // TIME SELECTION
            // ==================================================

            const Text(
              "Select Time Slot",
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
                  _timeButton("04:00 PM"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // LAB SECTION HEADER
            // ==================================================

            Row(
              children: [
                const Icon(
                  Icons.science_rounded,
                  color: Color(0xFF673AB7),
                  size: 26,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Laboratories",
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

            // ==================================================
            // LAB GRID
            // ==================================================

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredLabs.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                return _labCard(filteredLabs[index]);
              },
            ),

            const SizedBox(height: 25),

            // ==================================================
            // INFO BANNER
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFEDE7FF),
                    Color(0xFFE6F4FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.tips_and_updates_rounded,
                    color: Color(0xFF673AB7),
                    size: 29,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "Tip: Check the equipment list before booking a laboratory for your project.",
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
          color: selected ? Colors.white : const Color(0xFF24213D),
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
  // LAB CARD
  // ============================================================

  Widget _labCard(Map<String, dynamic> lab) {
    final bool available = lab["status"] == "Available";
    final Color color = lab["color"];

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

          // Top
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  lab["icon"],
                  color: color,
                  size: 25,
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
                      available
                          ? Icons.circle
                          : Icons.circle,
                      size: 7,
                      color: available
                          ? Colors.green
                          : Colors.redAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lab["status"],
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

          // Lab name
          Text(
            lab["name"],
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
            lab["block"],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 12),

          // Capacity + floor
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
                  lab["capacity"],
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
                lab["floor"],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Equipment
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: (lab["equipment"] as List<String>)
                .map(
                  (equipment) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(.08),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      equipment,
                      style: TextStyle(
                        color: color,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          const Spacer(),

          // Book button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: available
                  ? () {
                      _showBookingDialog(
                        lab["name"],
                        lab["capacity"],
                        lab["equipment"],
                      );
                    }
                  : null,
              icon: Icon(
                available
                    ? Icons.calendar_month_rounded
                    : Icons.lock_outline_rounded,
                size: 17,
              ),
              label: Text(
                available ? "Book Lab" : "Booked",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade200,
                disabledForegroundColor: Colors.grey,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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

  void _showBookingDialog(
    String labName,
    String capacity,
    List<String> equipment,
  ) {
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
                Icons.science_rounded,
                color: Color(0xFF673AB7),
              ),
              SizedBox(width: 10),
              Text("Confirm Lab Booking"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialogRow("Laboratory", labName),
              const SizedBox(height: 12),
              _dialogRow("Date", "12 Sep 2026"),
              const SizedBox(height: 12),
              _dialogRow("Time", selectedTime),
              const SizedBox(height: 12),
              _dialogRow("Capacity", capacity),

              const SizedBox(height: 16),

              const Text(
                "Equipment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: equipment
                    .map(
                      (item) => Chip(
                        label: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        backgroundColor:
                            const Color(0xFFF0E9FF),
                        side: BorderSide.none,
                      ),
                    )
                    .toList(),
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
                      "$labName booked successfully!",
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
  // DIALOG ROW
  // ============================================================

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