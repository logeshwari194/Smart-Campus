import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> bookings = [
    {
      "title": "Smart Classroom",
      "location": "Block A - Room 204",
      "type": "Classroom",
      "date": "18 Sep 2026",
      "time": "10:00 AM - 12:00 PM",
      "status": "Confirmed",
      "statusColor": Colors.green,
      "icon": Icons.meeting_room_rounded,
      "purpose": "Project Discussion",
      "bookingId": "BK-2026-1024",
    },
    {
      "title": "AI & ML Lab",
      "location": "Block B - Lab 03",
      "type": "Lab",
      "date": "20 Sep 2026",
      "time": "02:00 PM - 04:00 PM",
      "status": "Pending",
      "statusColor": Colors.orange,
      "icon": Icons.computer_rounded,
      "purpose": "Mini Project",
      "bookingId": "BK-2026-1038",
    },
    {
      "title": "Seminar Hall",
      "location": "Main Block - Hall 01",
      "type": "Hall",
      "date": "24 Sep 2026",
      "time": "09:30 AM - 01:00 PM",
      "status": "Confirmed",
      "statusColor": Colors.green,
      "icon": Icons.event_rounded,
      "purpose": "Technical Symposium",
      "bookingId": "BK-2026-1051",
    },
    {
      "title": "Programming Lab",
      "location": "Block C - Lab 02",
      "type": "Lab",
      "date": "28 Sep 2026",
      "time": "01:00 PM - 03:00 PM",
      "status": "Cancelled",
      "statusColor": Colors.red,
      "icon": Icons.code_rounded,
      "purpose": "Coding Practice",
      "bookingId": "BK-2026-1060",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            Icon(Icons.calendar_month_rounded),
            SizedBox(width: 10),
            Text(
              "My Bookings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Booking information refreshed"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.refresh_rounded),
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Bookings 📋",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Manage your classrooms, labs and halls.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    _showNewBookingDialog();
                  },
                  icon: const Icon(
                    Icons.add_rounded,
                    size: 18,
                  ),
                  label: const Text("New Booking"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF673AB7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
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
                    Icons.calendar_today_rounded,
                    "3",
                    "Upcoming",
                    Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: _summaryCard(
                    Icons.check_circle_rounded,
                    "2",
                    "Confirmed",
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: _summaryCard(
                    Icons.pending_actions_rounded,
                    "1",
                    "Pending",
                    Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ======================================================
            // SEARCH
            // ======================================================

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF673AB7),
                  ),
                  hintText: "Search bookings...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showFilterDialog();
                    },
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // TABS
            // ======================================================

            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _tabButton(
                      "Upcoming",
                      0,
                    ),
                  ),
                  Expanded(
                    child: _tabButton(
                      "All Bookings",
                      1,
                    ),
                  ),
                  Expanded(
                    child: _tabButton(
                      "History",
                      2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // SECTION TITLE
            // ======================================================

            Row(
              children: [
                Text(
                  selectedTab == 0
                      ? "Upcoming Bookings"
                      : selectedTab == 1
                          ? "All Bookings"
                          : "Booking History",
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Text(
                  "${bookings.length} Bookings",
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ======================================================
            // BOOKING LIST
            // ======================================================

            ...List.generate(
              bookings.length,
              (index) => _bookingCard(
                bookings[index],
                index,
              ),
            ),

            const SizedBox(height: 10),

            // ======================================================
            // HELP CARD
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFEDE7FF),
                    Color(0xFFE8F4FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.help_outline_rounded,
                    color: Color(0xFF673AB7),
                    size: 30,
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Need help with a booking?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF39325B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Contact the campus administration office.",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF676080),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Admin support: 04288-XXXXXX",
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
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
    String value,
    String title,
    Color color,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: color.withOpacity(.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24213D),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TAB BUTTON
  // ============================================================

  Widget _tabButton(
    String title,
    int index,
  ) {
    final bool selected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF673AB7)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BOOKING CARD
  // ============================================================

  Widget _bookingCard(
    Map<String, dynamic> booking,
    int index,
  ) {
    final Color statusColor = booking["statusColor"];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 13,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [

          // ------------------------------------------------------
          // TOP
          // ------------------------------------------------------

          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  booking["icon"],
                  color: const Color(0xFF673AB7),
                  size: 28,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking["type"],
                      style: const TextStyle(
                        color: Color(0xFF673AB7),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      booking["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF24213D),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: statusColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      booking["status"],
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ------------------------------------------------------
          // LOCATION
          // ------------------------------------------------------

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF673AB7),
                size: 19,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  booking["location"],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          // ------------------------------------------------------
          // DATE & TIME
          // ------------------------------------------------------

          Row(
            children: [
              Expanded(
                child: _detailItem(
                  Icons.calendar_today_rounded,
                  "Date",
                  booking["date"],
                ),
              ),
              Expanded(
                child: _detailItem(
                  Icons.access_time_rounded,
                  "Time",
                  booking["time"],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // ------------------------------------------------------
          // PURPOSE
          // ------------------------------------------------------

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F7FC),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.description_outlined,
                  color: Color(0xFF673AB7),
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Purpose:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  booking["purpose"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ------------------------------------------------------
          // BUTTONS
          // ------------------------------------------------------

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showBookingDetails(booking);
                  },
                  icon: const Icon(
                    Icons.visibility_outlined,
                    size: 16,
                  ),
                  label: const Text("View Details"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                        const Color(0xFF673AB7),
                    side: const BorderSide(
                      color: Color(0xFF673AB7),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: booking["status"] == "Cancelled"
                      ? null
                      : () {
                          _cancelBooking(
                            booking,
                          );
                        },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 16,
                  ),
                  label: const Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        Colors.grey.shade200,
                    disabledForegroundColor:
                        Colors.grey,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
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
  // DETAIL ITEM
  // ============================================================

  Widget _detailItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF673AB7),
          size: 17,
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BOOKING DETAILS DIALOG
  // ============================================================

  void _showBookingDetails(
    Map<String, dynamic> booking,
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
                Icons.event_note_rounded,
                color: Color(0xFF673AB7),
              ),
              SizedBox(width: 10),
              Text("Booking Details"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogRow(
                Icons.confirmation_number_rounded,
                "Booking ID",
                booking["bookingId"],
              ),
              _dialogRow(
                Icons.category_rounded,
                "Type",
                booking["type"],
              ),
              _dialogRow(
                Icons.meeting_room_rounded,
                "Resource",
                booking["title"],
              ),
              _dialogRow(
                Icons.location_on_rounded,
                "Location",
                booking["location"],
              ),
              _dialogRow(
                Icons.calendar_today_rounded,
                "Date",
                booking["date"],
              ),
              _dialogRow(
                Icons.access_time_rounded,
                "Time",
                booking["time"],
              ),
              _dialogRow(
                Icons.description_rounded,
                "Purpose",
                booking["purpose"],
              ),
              _dialogRow(
                Icons.verified_rounded,
                "Status",
                booking["status"],
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
  // DIALOG ROW
  // ============================================================

  Widget _dialogRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: const Color(0xFF673AB7),
          ),
          const SizedBox(width: 8),
          Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CANCEL BOOKING
  // ============================================================

  void _cancelBooking(
    Map<String, dynamic> booking,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Cancel Booking?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to cancel ${booking["title"]}?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  booking["status"] = "Cancelled";
                  booking["statusColor"] = Colors.red;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Booking cancelled successfully",
                    ),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text("Yes, Cancel"),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // NEW BOOKING
  // ============================================================

  void _showNewBookingDialog() {
    String selectedType = "Classroom";

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              title: const Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: Color(0xFF673AB7),
                  ),
                  SizedBox(width: 9),
                  Text("New Booking"),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: InputDecoration(
                      labelText: "Booking Type",
                      prefixIcon: const Icon(
                        Icons.category_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "Classroom",
                        child: Text("Classroom"),
                      ),
                      DropdownMenuItem(
                        value: "Lab",
                        child: Text("Lab"),
                      ),
                      DropdownMenuItem(
                        value: "Hall",
                        child: Text("Hall"),
                      ),
                    ],
                    onChanged: (value) {
                      setDialogState(() {
                        selectedType = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "Purpose",
                      prefixIcon: const Icon(
                        Icons.description_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Select Date",
                      prefixIcon: const Icon(
                        Icons.calendar_today_rounded,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2027),
                        initialDate: DateTime.now(),
                      );
                    },
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

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Booking request submitted successfully",
                        ),
                        backgroundColor: Colors.green,
                        behavior:
                            SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF673AB7),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Submit Request"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // FILTER
  // ============================================================

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                "Filter Bookings",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(
                  Icons.meeting_room_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Classroom"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.computer_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Lab"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.event_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Hall"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}