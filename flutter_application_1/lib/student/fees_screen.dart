import 'package:flutter/material.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  int selectedTab = 0;

  final double totalFees = 85000;
  final double paidFees = 60000;
  final double pendingFees = 25000;

  final List<Map<String, dynamic>> feeDetails = [
    {
      "title": "Tuition Fee",
      "amount": "₹45,000",
      "icon": Icons.school_rounded,
      "color": Colors.deepPurple,
      "status": "Paid",
    },
    {
      "title": "Hostel Fee",
      "amount": "₹20,000",
      "icon": Icons.hotel_rounded,
      "color": Colors.blue,
      "status": "Paid",
    },
    {
      "title": "Transport Fee",
      "amount": "₹10,000",
      "icon": Icons.directions_bus_rounded,
      "color": Colors.orange,
      "status": "Pending",
    },
    {
      "title": "Exam Fee",
      "amount": "₹5,000",
      "icon": Icons.assignment_rounded,
      "color": Colors.teal,
      "status": "Paid",
    },
    {
      "title": "Library Fee",
      "amount": "₹5,000",
      "icon": Icons.menu_book_rounded,
      "color": Colors.green,
      "status": "Pending",
    },
  ];

  final List<Map<String, String>> paymentHistory = [
    {
      "date": "05 Sep 2026",
      "amount": "₹20,000",
      "mode": "UPI",
      "status": "Successful",
      "receipt": "REC-2026-091",
    },
    {
      "date": "12 Aug 2026",
      "amount": "₹25,000",
      "mode": "Net Banking",
      "status": "Successful",
      "receipt": "REC-2026-074",
    },
    {
      "date": "15 Jul 2026",
      "amount": "₹15,000",
      "mode": "UPI",
      "status": "Successful",
      "receipt": "REC-2026-041",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double progress = paidFees / totalFees;

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
            Icon(Icons.account_balance_wallet_rounded),
            SizedBox(width: 10),
            Text(
              "Fees & Payments",
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
                  content: Text("No new fee notifications"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
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
                        "Fees Overview 💰",
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Track your academic fees and payment history.",
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
                    horizontal: 17,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                      SizedBox(width: 8),
                      Text(
                        "2026 - 27",
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

            // ======================================================
            // MAIN FEE SUMMARY
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF673AB7),
                    Color(0xFF7E57C2),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF673AB7).withOpacity(.20),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [

                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Academic Fee Status",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "2026 - 2027",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.verified_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Active",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: _whiteAmount(
                          "Total Fees",
                          "₹85,000",
                        ),
                      ),
                      Expanded(
                        child: _whiteAmount(
                          "Paid",
                          "₹60,000",
                        ),
                      ),
                      Expanded(
                        child: _whiteAmount(
                          "Pending",
                          "₹25,000",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      const Text(
                        "Payment Progress",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${(progress * 100).toInt()}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Colors.white24,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // PENDING ALERT
            // ======================================================

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4DF),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.orange.withOpacity(.25),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Pending",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8A5A00),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "₹25,000 is pending. Due date: 30 Sep 2026",
                          style: TextStyle(
                            color: Color(0xFF806B42),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Pay"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

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
                      "Fee Details",
                      0,
                    ),
                  ),
                  Expanded(
                    child: _tabButton(
                      "Payment History",
                      1,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // TAB CONTENT
            // ======================================================

            if (selectedTab == 0)
              _feeDetailsSection()
            else
              _paymentHistorySection(),

            const SizedBox(height: 25),

            // ======================================================
            // SUPPORT CARD
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
                    Icons.support_agent_rounded,
                    color: Color(0xFF673AB7),
                    size: 30,
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Need help with your fees?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF39325B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Contact the college accounts office.",
                          style: TextStyle(
                            fontSize: 12,
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
                            "Accounts office contact: 04288-XXXXXX",
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Color(0xFF673AB7),
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
  // WHITE AMOUNT
  // ============================================================

  Widget _whiteAmount(
    String title,
    String amount,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
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
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FEE DETAILS
  // ============================================================

  Widget _feeDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Fee Breakdown",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF24213D),
          ),
        ),

        const SizedBox(height: 15),

        ...feeDetails.map(
          (fee) => _feeCard(fee),
        ),
      ],
    );
  }

  // ============================================================
  // FEE CARD
  // ============================================================

  Widget _feeCard(
    Map<String, dynamic> fee,
  ) {
    final bool paid = fee["status"] == "Paid";
    final Color color = fee["color"];

    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [

          // Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(.11),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              fee["icon"],
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  fee["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF24213D),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  paid
                      ? "Payment completed"
                      : "Payment required",
                  style: TextStyle(
                    color: paid
                        ? Colors.green
                        : Colors.orange,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                fee["amount"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF24213D),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: paid
                      ? const Color(0xFFE8F8EF)
                      : const Color(0xFFFFF0DC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  fee["status"],
                  style: TextStyle(
                    color: paid
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
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
  // PAYMENT HISTORY
  // ============================================================

  Widget _paymentHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Payment History",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF24213D),
          ),
        ),

        const SizedBox(height: 15),

        ...paymentHistory.map(
          (payment) => _paymentCard(payment),
        ),
      ],
    );
  }

  // ============================================================
  // PAYMENT CARD
  // ============================================================

  Widget _paymentCard(
    Map<String, String> payment,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
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
              color: const Color(0xFFE8F8EF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  payment["amount"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF24213D),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${payment["date"]} • ${payment["mode"]}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Receipt: ${payment["receipt"]}",
                  style: const TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F8EF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Successful",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _showReceipt(payment);
                },
                child: const Text(
                  "View Receipt",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF673AB7),
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
  // RECEIPT DIALOG
  // ============================================================

  void _showReceipt(
    Map<String, String> payment,
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
                Icons.receipt_long_rounded,
                color: Color(0xFF673AB7),
              ),
              SizedBox(width: 10),
              Text("Payment Receipt"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F8EF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                  size: 40,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Payment Successful",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              _receiptRow(
                "Amount",
                payment["amount"]!,
              ),

              _receiptRow(
                "Date",
                payment["date"]!,
              ),

              _receiptRow(
                "Payment Mode",
                payment["mode"]!,
              ),

              _receiptRow(
                "Receipt No.",
                payment["receipt"]!,
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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Receipt download feature can be connected later.",
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.download_rounded),
              label: const Text("Download"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // RECEIPT ROW
  // ============================================================

  Widget _receiptRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}