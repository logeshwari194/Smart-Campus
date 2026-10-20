import 'package:flutter/material.dart';
import '../admin/admin_login.dart';
import '../student/student_dashboard.dart';
import 'register_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  // ============================================================
  // STUDENT LOGIN
  // ============================================================

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter Email / Roll Number and Password',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const StudentDashboard(),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // ========================================================
        // AI BACKGROUND
        // ========================================================

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF311B92),
              Color(0xFF6A1B9A),
              Color(0xFF1565C0),
            ],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // ==================================================
                  // AI LOGO
                  // ==================================================

                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),

                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 25,
                          spreadRadius: 3,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ==================================================
                  // PROJECT TITLE
                  // ==================================================

                  const Text(
                    'SMART CAMPUS',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'AI-Powered Campus Management',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // CENTER LOGIN BOX
                  // ==================================================

                  Container(
                    width: double.infinity,

                    constraints: const BoxConstraints(
                      maxWidth: 430,
                    ),

                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(28),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        // ==========================================
                        // WELCOME
                        // ==========================================

                        const Text(
                          'Welcome Back 👋',

                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A148C),
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Login to continue to Smart Campus',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ==========================================
                        // AI BADGE
                        // ==========================================

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E5F5),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: const Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Icon(
                                Icons.smart_toy,
                                size: 17,
                                color: Colors.deepPurple,
                              ),

                              SizedBox(width: 7),

                              Text(
                                'AI Smart Access',

                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ==========================================
                        // EMAIL / ROLL NUMBER
                        // ==========================================

                        TextField(
                          controller: emailController,

                          keyboardType:
                              TextInputType.emailAddress,

                          decoration: InputDecoration(
                            labelText: 'Email / Roll Number',
                            hintText:
                                'Enter your email or roll number',

                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xFF6A1B9A),
                            ),

                            filled: true,

                            fillColor:
                                const Color(0xFFF7F7F7),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            enabledBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            focusedBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),

                              borderSide: const BorderSide(
                                color: Color(0xFF6A1B9A),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ==========================================
                        // PASSWORD
                        // ==========================================

                        TextField(
                          controller: passwordController,

                          obscureText: obscurePassword,

                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText:
                                'Enter your password',

                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF6A1B9A),
                            ),

                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword =
                                      !obscurePassword;
                                });
                              },

                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons
                                        .visibility_off_outlined,

                                color: Colors.deepPurple,
                              ),
                            ),

                            filled: true,

                            fillColor:
                                const Color(0xFFF7F7F7),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            enabledBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            focusedBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),

                              borderSide: const BorderSide(
                                color: Color(0xFF6A1B9A),
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ==========================================
                        // LOGIN BUTTON
                        // ==========================================

                        SizedBox(
                          width: double.infinity,
                          height: 55,

                          child: ElevatedButton.icon(
                            onPressed: login,

                            icon: const Icon(
                              Icons.login,
                            ),

                            label: const Text(
                              'LOGIN',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),

                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF6A1B9A),

                              foregroundColor:
                                  Colors.white,

                              elevation: 5,

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ==========================================
                        // OR
                        // ==========================================

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade300,
                              ),
                            ),

                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(
                                horizontal: 12,
                              ),

                              child: Text(
                                'OR',

                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        // ==========================================
                        // ADMIN LOGIN
                        // ==========================================

                        SizedBox(
                          width: double.infinity,
                          height: 50,

                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminLoginScreen(),
                                ),
                              );
                            },

                            icon: const Icon(
                              Icons.admin_panel_settings,
                            ),

                            label: const Text(
                              'ADMIN LOGIN',

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            style:
                                OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color(0xFF6A1B9A),

                              side: const BorderSide(
                                color: Color(0xFF6A1B9A),
                                width: 1.5,
                              ),

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ==========================================
                        // REGISTER
                        // ==========================================

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [
                            const Text(
                              "Don't have an account?",

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },

                              child: const Text(
                                'Register',

                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ==================================================
                  // AI STATUS
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 9,
                        height: 9,

                        decoration:
                            const BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        'AI Campus Assistant Ready',

                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Smart • Secure • Connected',

                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}