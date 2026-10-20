import 'package:flutter/material.dart';

import '../screens/login_screens.dart';
import 'classroom_screen.dart';
import 'lab_screen.dart';
import 'hall_screen.dart';
import 'fees_screen.dart';
import 'bus_screen.dart';
import 'bookings_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int selectedIndex = 0;

  final Color primaryColor = const Color(0xFF673AB7);

  void openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // ==================================================
  // LOGOUT
  // ==================================================

  void logout() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.logout_rounded, color: Color(0xFF673AB7)),
              SizedBox(width: 10),
              Text("Logout"),
            ],
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(dialogContext); // dialog close

                // Firebase use panna idhai uncomment pannunga:
                // await FirebaseAuth.instance.signOut();

                if (!mounted) return;

                // Ella pazhaya screens-um remove panni login-ku poga
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
              ),
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FC),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smart Campus",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Student Portal",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => openPage(const NotificationsScreen()),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: () => openPage(const ProfileScreen()),
            icon: const Icon(Icons.account_circle_outlined),
          ),
          IconButton(
            tooltip: "Logout",
            onPressed: logout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: _buildHome(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE7DDFB),
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (index == 1) {
            openPage(const NotificationsScreen());
          } else if (index == 2) {
            openPage(const BookingsScreen());
          } else if (index == 3) {
            openPage(const ProfileScreen());
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications_rounded),
            label: "Alerts",
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month_rounded),
            label: "Bookings",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =====================================================
          // WELCOME
          // =====================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF673AB7), Color(0xFF512DA8)],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(.20),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening 👋",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Logeshwari S",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Information Technology • 3rd Year",
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Student ID : IT2026-019",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // =====================================================
          // STAT CARDS
          // =====================================================

          Row(
            children: [
              Expanded(
                child: _statCard(
                  Icons.fact_check_rounded,
                  "94%",
                  "Attendance",
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  Icons.account_balance_wallet_rounded,
                  "Paid",
                  "Fees",
                  Colors.blue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // =====================================================
          // QUICK ACCESS (full width, auto height)
          // =====================================================

          const Text(
            "Quick Access",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 13),

          _buildQuickAccess(),

          const SizedBox(height: 25),

          // =====================================================
          // TODAY
          // =====================================================

          const Text(
            "Today's Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 13),

          _overviewCard(
            Icons.school_rounded,
            "Current Class",
            "Advanced Database Management",
            "Room 204 • 10:00 AM",
            Colors.deepPurple,
          ),

          _overviewCard(
            Icons.computer_rounded,
            "Next Lab",
            "AI & Machine Learning Lab",
            "Lab 3 • 2:00 PM",
            Colors.blue,
          ),

          const SizedBox(height: 20),

          // =====================================================
          // UPCOMING BOOKING
          // =====================================================

          Row(
            children: [
              const Text(
                "Upcoming Booking",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => openPage(const BookingsScreen()),
                child: const Text("View All"),
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.04),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.event_available_rounded,
                  color: Color(0xFF673AB7),
                  size: 32,
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smart Classroom",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Room 204 • 15 Sep 2026",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Approved",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // =====================================================
          // CAMPUS SERVICES
          // =====================================================

          const Text(
            "Campus Services",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 13),

          _serviceCard(
            Icons.payments_rounded,
            "Fees & Payments",
            "View fee payment details",
            Colors.orange,
            const FeesScreen(),
          ),

          _serviceCard(
            Icons.calendar_month_rounded,
            "My Bookings",
            "Manage all bookings",
            Colors.indigo,
            const BookingsScreen(),
          ),

          _serviceCard(
            Icons.notifications_active_rounded,
            "Notifications",
            "View campus updates",
            Colors.pink,
            const NotificationsScreen(),
          ),

          // ================= LOGOUT CARD =================
          InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: logout,
            child: Container(
              margin: const EdgeInsets.only(bottom: 11),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.035),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(Icons.logout_rounded, color: Colors.red),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Sign out from your account",
                          style: TextStyle(color: Colors.grey, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          // =====================================================
          // MOTIVATION
          // =====================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFF673AB7),
                  size: 30,
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Text(
                    "Keep going! 🚀\nYour attendance is excellent. Keep maintaining your progress!",
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.5,
                      color: Color(0xFF4A3C68),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ============================================================
  // QUICK ACCESS GRID (full width + auto height)
  // ============================================================

  Widget _buildQuickAccess() {
    final items = <_QuickData>[
      _QuickData(
        icon: Icons.class_rounded,
        title: "Classroom",
        subtitle: "Find classrooms",
        color: Colors.deepPurple,
        imageUrl:
            "https://images.unsplash.com/photo-1562774053-701939374585?w=700&q=80",
        page: const ClassroomScreen(),
      ),
      _QuickData(
        icon: Icons.computer_rounded,
        title: "Labs",
        subtitle: "Lab availability",
        color: Colors.blue,
        imageUrl:
            "https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=700&q=80",
        page: const LabScreen(),
      ),
      _QuickData(
        icon: Icons.meeting_room_rounded,
        title: "Halls",
        subtitle: "Book halls",
        color: Colors.orange,
        imageUrl:
            "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=700&q=80",
        page: const HallScreen(),
      ),
      _QuickData(
        icon: Icons.directions_bus_rounded,
        title: "Bus",
        subtitle: "Bus routes",
        color: Colors.green,
        imageUrl:
            "https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=700&q=80",
        page: const BusScreen(),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const double gap = 14;

        // Wide screen = 4 boxes oru row, phone = 2 boxes
        final int columns = constraints.maxWidth >= 700 ? 4 : 2;

        final double cardWidth =
            (constraints.maxWidth - (gap * (columns - 1))) / columns;

        // Height width-ku etha maari auto (min 150, max 240)
        final double cardHeight = (cardWidth * 0.72).clamp(150.0, 240.0);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: gap,
            mainAxisSpacing: gap,
            mainAxisExtent: cardHeight,
          ),
          itemBuilder: (context, index) => _quickCard(items[index]),
        );
      },
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard(
    IconData icon,
    String value,
    String title,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 27),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // QUICK CARD (image on top, text below)
  // ============================================================

  Widget _quickCard(_QuickData data) {
    return Material(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(.12),
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => openPage(data.page),
        child: Column(
          children: [
            // ================= IMAGE =================
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: data.color.withOpacity(.08),
                      child: const Center(
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: data.color.withOpacity(.1),
                    child: Icon(data.icon, color: data.color, size: 46),
                  ),
                ),
              ),
            ),

            // ================= TEXT =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
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
  // OVERVIEW CARD
  // ============================================================

  Widget _overviewCard(
    IconData icon,
    String title,
    String subject,
    String details,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: const TextStyle(color: Colors.grey, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICE CARD
  // ============================================================

  Widget _serviceCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
    Widget page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => openPage(page),
      child: Container(
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: color.withOpacity(.1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 9),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// QUICK ACCESS DATA MODEL
// ============================================================

class _QuickData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String imageUrl;
  final Widget page;

  const _QuickData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imageUrl,
    required this.page,
  });
}