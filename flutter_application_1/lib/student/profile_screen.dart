import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String studentName = "Logeshwari S";
  String studentId = "IT2026-019";
  String department = "Information Technology";
  String year = "3rd Year";
  String email = "logeshwari@example.com";
  String phone = "+91 98765 43210";

  @override
  Widget build(BuildContext context) {
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
            Icon(Icons.person_rounded),
            SizedBox(width: 10),
            Text(
              "My Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _showEditProfile,
            icon: const Icon(Icons.edit_rounded),
            tooltip: "Edit Profile",
          ),
        ],
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            // ======================================================
            // PROFILE HEADER
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF673AB7),
                    Color(0xFF512DA8),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF673AB7)
                        .withOpacity(.20),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [

                  // Profile picture
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor:
                              Color(0xFFEDE7FF),
                          child: Icon(
                            Icons.person_rounded,
                            size: 55,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF673AB7),
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 15,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    studentName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "$studentId • $year",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.85),
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      department,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // QUICK STATS
            // ======================================================

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    Icons.event_available_rounded,
                    "12",
                    "Bookings",
                    Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    Icons.check_circle_rounded,
                    "94%",
                    "Attendance",
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    Icons.notifications_active_rounded,
                    "3",
                    "Unread",
                    Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ======================================================
            // PERSONAL INFORMATION
            // ======================================================

            _sectionTitle(
              "Personal Information",
              Icons.badge_rounded,
            ),

            const SizedBox(height: 12),

            _infoCard(
              Icons.person_outline_rounded,
              "Full Name",
              studentName,
            ),

            _infoCard(
              Icons.badge_outlined,
              "Student ID",
              studentId,
            ),

            _infoCard(
              Icons.school_outlined,
              "Department",
              department,
            ),

            _infoCard(
              Icons.calendar_month_outlined,
              "Academic Year",
              year,
            ),

            const SizedBox(height: 20),

            // ======================================================
            // CONTACT INFORMATION
            // ======================================================

            _sectionTitle(
              "Contact Information",
              Icons.contact_mail_rounded,
            ),

            const SizedBox(height: 12),

            _infoCard(
              Icons.email_outlined,
              "Email Address",
              email,
            ),

            _infoCard(
              Icons.phone_outlined,
              "Phone Number",
              phone,
            ),

            const SizedBox(height: 20),

            // ======================================================
            // ACCOUNT SETTINGS
            // ======================================================

            _sectionTitle(
              "Account & Settings",
              Icons.settings_rounded,
            ),

            const SizedBox(height: 12),

            _menuCard(
              Icons.edit_rounded,
              "Edit Profile",
              "Update your personal information",
              () {
                _showEditProfile();
              },
            ),

            _menuCard(
              Icons.notifications_outlined,
              "Notification Settings",
              "Manage your notifications",
              () {
                _showNotificationSettings();
              },
            ),

            _menuCard(
              Icons.lock_outline_rounded,
              "Privacy & Security",
              "Password and account security",
              () {
                _showSecurityDialog();
              },
            ),

            _menuCard(
              Icons.help_outline_rounded,
              "Help & Support",
              "Get help with Smart Campus",
              () {
                _showHelpDialog();
              },
            ),

            const SizedBox(height: 15),

            // ======================================================
            // LOGOUT
            // ======================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _showLogoutDialog,
                icon: const Icon(
                  Icons.logout_rounded,
                ),
                label: const Text(
                  "Logout",
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(
                    color: Colors.redAccent,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Smart Campus • Student Portal",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
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
      padding: const EdgeInsets.symmetric(
        vertical: 17,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 22,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24213D),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle(
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF673AB7),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF24213D),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // INFO CARD
  // ============================================================

  Widget _infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF673AB7),
              size: 21,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFF24213D),
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
  // MENU CARD
  // ============================================================

  Widget _menuCard(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(17),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
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
                color: const Color(0xFFEDE7FF),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF673AB7),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF24213D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EDIT PROFILE
  // ============================================================

  void _showEditProfile() {
    final nameController =
        TextEditingController(text: studentName);
    final emailController =
        TextEditingController(text: email);
    final phoneController =
        TextEditingController(text: phone);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon:
                        const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon:
                        const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    prefixIcon:
                        const Icon(Icons.phone_outlined),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  studentName =
                      nameController.text;
                  email = emailController.text;
                  phone = phoneController.text;
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Profile updated successfully",
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
  }

  // ============================================================
  // NOTIFICATION SETTINGS
  // ============================================================

  void _showNotificationSettings() {
    bool booking = true;
    bool academic = true;
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
                "Notification Settings",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: const Text("Bookings"),
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
                    title: const Text("Academic"),
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
                    title: const Text("Bus"),
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
                  onPressed: () =>
                      Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // SECURITY
  // ============================================================

  void _showSecurityDialog() {
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
                Icons.security_rounded,
                color: Color(0xFF673AB7),
              ),
              SizedBox(width: 10),
              Text("Privacy & Security"),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading:
                    Icon(Icons.lock_outline_rounded),
                title: Text("Change Password"),
                subtitle:
                    Text("Update your account password"),
              ),
              ListTile(
                leading:
                    Icon(Icons.verified_user_outlined),
                title: Text("Account Protection"),
                subtitle:
                    Text("Your account is protected"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // HELP
  // ============================================================

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            "Help & Support",
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.email_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: Text("Email Support"),
                subtitle:
                    Text("support@smartcampus.edu"),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone_rounded,
                  color: Color(0xFF673AB7),
                ),
                title: Text("Campus Support"),
                subtitle:
                    Text("04288-XXXXXX"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            "Logout?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Are you sure you want to logout from Smart Campus?",
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Logged out successfully",
                    ),
                    backgroundColor: Colors.redAccent,
                    behavior:
                        SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}