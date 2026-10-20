import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController rollNumberController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void register() {
    final name = nameController.text.trim();
    final rollNumber = rollNumberController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword =
        confirmPasswordController.text.trim();

    if (name.isEmpty ||
        rollNumber.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all fields',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Passwords do not match',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Registration successful!',
        ),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        if (mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

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

              child: Container(
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
                    // AI ICON
                    // ==========================================

                    Container(
                      width: 75,
                      height: 75,

                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF6A1B9A),
                            Color(0xFF1565C0),
                          ],
                        ),
                      ),

                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==========================================
                    // TITLE
                    // ==========================================

                    const Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A148C),
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Join Smart Campus',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ==========================================
                    // NAME
                    // ==========================================

                    TextField(
                      controller: nameController,

                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your name',

                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.deepPurple,
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==========================================
                    // ROLL NUMBER
                    // ==========================================

                    TextField(
                      controller: rollNumberController,

                      decoration: InputDecoration(
                        labelText: 'Roll Number',
                        hintText: 'Enter roll number',

                        prefixIcon: const Icon(
                          Icons.badge_outlined,
                          color: Colors.deepPurple,
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==========================================
                    // EMAIL
                    // ==========================================

                    TextField(
                      controller: emailController,

                      keyboardType:
                          TextInputType.emailAddress,

                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email address',

                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.deepPurple,
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==========================================
                    // PASSWORD
                    // ==========================================

                    TextField(
                      controller: passwordController,

                      obscureText: obscurePassword,

                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Create password',

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.deepPurple,
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
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==========================================
                    // CONFIRM PASSWORD
                    // ==========================================

                    TextField(
                      controller:
                          confirmPasswordController,

                      obscureText:
                          obscureConfirmPassword,

                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter password',

                        prefixIcon: const Icon(
                          Icons.lock_reset,
                          color: Colors.deepPurple,
                        ),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword =
                                  !obscureConfirmPassword;
                            });
                          },
                          icon: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons
                                    .visibility_off_outlined,
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ==========================================
                    // REGISTER BUTTON
                    // ==========================================

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton.icon(
                        onPressed: register,

                        icon: const Icon(
                          Icons.person_add_alt_1,
                        ),

                        label: const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
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

                    const SizedBox(height: 15),

                    // ==========================================
                    // BACK TO LOGIN
                    // ==========================================

                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                      ),

                      label: const Text(
                        'Back to Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      '✨ Smart • Secure • Connected',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    rollNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}