import 'package:flutter/material.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  String selectedYear = '3rd Year';
  String selectedSemester = '5th Semester';

  final List<String> years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  final List<String> semesters = [
    '1st Semester',
    '2nd Semester',
    '3rd Semester',
    '4th Semester',
    '5th Semester',
    '6th Semester',
    '7th Semester',
    '8th Semester',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================================================
      // APP BAR
      // ==================================================

      appBar: AppBar(
        title: const Text('Fees Structure'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      // ==================================================
      // BODY
      // ==================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ==================================================
            // HEADER
            // ==================================================

            const Text(
              'Fees Structure 💰',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'View your semester-wise college fee details.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // SELECT YEAR
            // ==================================================

            const Text(
              'Select Year',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              initialValue: selectedYear,

              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.school,
                  color: Colors.deepPurple,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              items: years.map((year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),

              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedYear = value;
                });
              },
            ),

            const SizedBox(height: 25),

            // ==================================================
            // SELECT SEMESTER
            // ==================================================

            const Text(
              'Select Semester',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              initialValue: selectedSemester,

              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_month,
                  color: Colors.deepPurple,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              items: semesters.map((semester) {
                return DropdownMenuItem<String>(
                  value: semester,
                  child: Text(semester),
                );
              }).toList(),

              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedSemester = value;
                });
              },
            ),

            const SizedBox(height: 30),

            // ==================================================
            // SELECTED DETAILS
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(14),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Selected Academic Details',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Year: $selectedYear',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'Semester: $selectedSemester',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // FEE DETAILS TITLE
            // ==================================================

            const Text(
              'Fee Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // FEE CARDS
            // ==================================================

            buildFeeCard(
              'Tuition Fee',
              '₹45,000',
              Icons.school,
            ),

            buildFeeCard(
              'Examination Fee',
              '₹2,000',
              Icons.assignment,
            ),

            buildFeeCard(
              'Library Fee',
              '₹1,000',
              Icons.library_books,
            ),

            buildFeeCard(
              'Laboratory Fee',
              '₹2,500',
              Icons.computer,
            ),

            buildFeeCard(
              'Sports Fee',
              '₹500',
              Icons.sports_cricket,
            ),

            buildFeeCard(
              'Development Fee',
              '₹1,500',
              Icons.account_balance,
            ),

            const SizedBox(height: 10),

            // ==================================================
            // TOTAL FEES
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    'Total Fees',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '₹52,500',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // VIEW RECEIPT BUTTON
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () {
                  showReceiptMessage(context);
                },

                icon: const Icon(
                  Icons.receipt_long,
                ),

                label: const Text(
                  'VIEW FEE RECEIPT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // PAYMENT STATUS
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.green,
                ),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Fee Information Available',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Please contact the accounts department for payment details.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
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

  // ======================================================
  // FEE CARD
  // ======================================================

  Widget buildFeeCard(
    String title,
    String amount,
    IconData icon,
  ) {
    return Card(
      elevation: 3,

      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [

            // ICON
            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(width: 15),

            // TITLE
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // AMOUNT
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================
  // RECEIPT MESSAGE
  // ======================================================

  void showReceiptMessage(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.receipt_long,
                color: Colors.deepPurple,
              ),

              SizedBox(width: 10),

              Text('Fee Receipt'),
            ],
          ),

          content: Text(
            'Year: $selectedYear\n'
            'Semester: $selectedSemester\n\n'
            'Total Fees: ₹52,500\n\n'
            'Receipt generation will be available soon.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}