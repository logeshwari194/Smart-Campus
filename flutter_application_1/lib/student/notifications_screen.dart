import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedFilter = 0;

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Booking Confirmed",
      "message":
          "Your Smart Classroom booking for Room 204 has been approved.",
      "time": "10 min ago",
      "category": "Booking",
      "icon": Icons.event_available_rounded,
      "color": Colors.green,
      "read": false,
    },
    {
      "title": "Bus Route Update",
      "message":
          "Route 01 will depart from Tiruchengode Bus Stand at 7:30 AM tomorrow.",
      "time": "35 min ago",
      "category": "Bus",
      "icon": Icons.directions_bus_rounded,
      "color": Colors.blue,
      "read": false,
    },
    {
      "title": "Fee Payment Reminder",
      "message":
          "Your semester fee payment is due on 25 September 2026.",
      "time": "2 hours ago",
      "category": "Fees",
      "icon": Icons.account_balance_wallet_rounded,
      "color": Colors.orange,
      "read": false,
    },
    {
      "title": "Lab Booking Pending",
      "message":
          "Your AI & ML Lab booking request is waiting for admin approval.",
      "time": "4 hours ago",
      "category": "Booking",
      "icon": Icons.pending_actions_rounded,
      "color": Colors.deepPurple,
      "read": true,
    },
    {
      "title": "New Academic Notice",
      "message":
          "Internal assessment timetable has been published.",
      "time": "Yesterday",
      "category": "Academic",
      "icon": Icons.school_rounded,
      "color": Colors.indigo,
      "read": true,
    },
    {
      "title": "Campus Announcement",
      "message":
          "Technical symposium registration is now open for students.",
      "time": "Yesterday",
      "category": "Academic",
      "icon": Icons.campaign_rounded,
      "color": Colors.pink,
      "read": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount =
        notifications.where((item) => item["read"] == false).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FF),

      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.notifications_active_rounded),
            SizedBox(width: 10),
            Text(
              "Notifications",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: "Mark all as read",
            onPressed: () {
              setState(() {
                for (final item in notifications) {
                  item["read"] = true;
                }
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("All notifications marked as read"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.done_all_rounded),
          ),
          const SizedBox(width: 5),
        ],
      ),

      // ==========================================================
      // BODY
      // ==========================================================

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
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Notifications 🔔",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        unreadCount == 0
                            ? "You're all caught up!"
                            : "You have $unreadCount unread notifications.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Unread badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$unreadCount",
                        style: const TextStyle(
                          color: Color(0xFF673AB7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Unread",
                        style: TextStyle(
                          color: Color(0xFF673AB7),
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                  hintText: "Search notifications...",
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

            const SizedBox(height: 22),

            // ======================================================
            // FILTER CHIPS
            // ======================================================

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip("All", 0),
                  _filterChip("Unread", 1),
                  _filterChip("Academic", 2),
                  _filterChip("Booking", 3),
                  _filterChip("Bus", 4),
                  _filterChip("Fees", 5),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // NOTIFICATION TITLE
            // ======================================================

            Row(
              children: [
                const Text(
                  "Recent Notifications",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Text(
                  "${notifications.length} total",
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ======================================================
            // NOTIFICATION LIST
            // ======================================================

            ...List.generate(
              notifications.length,
              (index) => _notificationCard(
                notifications[index],
                index,
              ),
            ),

            const SizedBox(height: 15),

            // ======================================================
            // SETTINGS CARD
            // ======================================================

            Container(
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
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.settings_rounded,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notification Preferences",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF39325B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Manage which notifications you receive.",
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
                      _showPreferencesDialog();
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
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
  // FILTER CHIP
  // ============================================================

  Widget _filterChip(
    String title,
    int index,
  ) {
    final bool selected = selectedFilter == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.only(right: 9),
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF673AB7)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: selected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Text(
          title,
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
  // NOTIFICATION CARD
  // ============================================================

  Widget _notificationCard(
    Map<String, dynamic> item,
    int index,
  ) {
    final bool unread = item["read"] == false;
    final Color color = item["color"];

    return GestureDetector(
      onTap: () {
        setState(() {
          item["read"] = true;
        });

        _showNotificationDetails(item);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: unread
              ? const Color(0xFFFDFCFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: unread
                ? const Color(0xFFE2D8FF)
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ----------------------------------------------------
            // ICON
            // ----------------------------------------------------

            Stack(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    item["icon"],
                    color: color,
                    size: 25,
                  ),
                ),

                if (unread)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 14),

            // ----------------------------------------------------
            // CONTENT
            // ----------------------------------------------------

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item["title"],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: unread
                                ? FontWeight.bold
                                : FontWeight.w600,
                            color: const Color(0xFF24213D),
                          ),
                        ),
                      ),

                      Text(
                        item["time"],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  Text(
                    item["message"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(.09),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          item["category"],
                          style: TextStyle(
                            color: color,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Spacer(),

                      PopupMenuButton<String>(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          size: 19,
                          color: Colors.grey,
                        ),
                        onSelected: (value) {
                          if (value == "read") {
                            setState(() {
                              item["read"] = true;
                            });
                          } else if (value == "delete") {
                            setState(() {
                              notifications.removeAt(index);
                            });
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "read",
                            child: Row(
                              children: [
                                Icon(
                                  Icons.done_rounded,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Text("Mark as read"),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: "delete",
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline_rounded,
                                  size: 18,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 8),
                                Text("Delete"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
  // NOTIFICATION DETAILS
  // ============================================================

  void _showNotificationDetails(
    Map<String, dynamic> item,
  ) {
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
                item["icon"],
                color: item["color"],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item["title"],
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                item["message"],
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Category: ${item["category"]}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Received: ${item["time"]}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
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
  // FILTER DIALOG
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
                "Notification Filters",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(
                  Icons.mark_email_unread_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Unread only"),
                onTap: () {
                  setState(() {
                    selectedFilter = 1;
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.school_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Academic"),
                onTap: () {
                  setState(() {
                    selectedFilter = 2;
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.event_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Booking"),
                onTap: () {
                  setState(() {
                    selectedFilter = 3;
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.directions_bus_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: const Text("Bus"),
                onTap: () {
                  setState(() {
                    selectedFilter = 4;
                  });
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

  // ============================================================
  // PREFERENCES
  // ============================================================

  void _showPreferencesDialog() {
    bool academic = true;
    bool booking = true;
    bool bus = true;
    bool fees = true;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              title: const Text(
                "Notification Preferences",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: const Text("Academic"),
                    subtitle:
                        const Text("Academic announcements"),
                    value: academic,
                    activeColor:
                        const Color(0xFF673AB7),
                    onChanged: (value) {
                      setDialogState(() {
                        academic = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Bookings"),
                    subtitle:
                        const Text("Booking status updates"),
                    value: booking,
                    activeColor:
                        const Color(0xFF673AB7),
                    onChanged: (value) {
                      setDialogState(() {
                        booking = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Bus"),
                    subtitle:
                        const Text("Transport updates"),
                    value: bus,
                    activeColor:
                        const Color(0xFF673AB7),
                    onChanged: (value) {
                      setDialogState(() {
                        bus = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Fees"),
                    subtitle:
                        const Text("Payment reminders"),
                    value: fees,
                    activeColor:
                        const Color(0xFF673AB7),
                    onChanged: (value) {
                      setDialogState(() {
                        fees = value;
                      });
                    },
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Notification preferences saved",
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
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}