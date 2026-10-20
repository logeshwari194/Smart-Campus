import 'package:flutter/material.dart';

class ManageFees extends StatefulWidget {
  const ManageFees({super.key});

  @override
  State<ManageFees> createState() => _ManageFeesState();
}

class _ManageFeesState extends State<ManageFees> {
  final List<Map<String, String>> fees = [
    {
      'course': 'B.Tech IT',
      'year': '3rd Year',
      'tuition': '85000',
      'exam': '5000',
      'bus': '15000',
    },
    {
      'course': 'B.E CSE',
      'year': '3rd Year',
      'tuition': '85000',
      'exam': '5000',
      'bus': '15000',
    },
    {
      'course': 'B.Tech AI & DS',
      'year': '3rd Year',
      'tuition': '90000',
      'exam': '5000',
      'bus': '15000',
    },
  ];

  void addFee() {
    final courseController = TextEditingController();
    final yearController = TextEditingController();
    final tuitionController = TextEditingController();
    final examController = TextEditingController();
    final busController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Fee Structure'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: courseController,
                  decoration: const InputDecoration(
                    labelText: 'Course',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: yearController,
                  decoration: const InputDecoration(
                    labelText: 'Year',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: tuitionController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tuition Fee',
                    prefixIcon: Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: examController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Exam Fee',
                    prefixIcon: Icon(Icons.assignment),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: busController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Bus Fee',
                    prefixIcon: Icon(Icons.directions_bus),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                if (courseController.text.trim().isEmpty ||
                    yearController.text.trim().isEmpty ||
                    tuitionController.text.trim().isEmpty ||
                    examController.text.trim().isEmpty ||
                    busController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields'),
                    ),
                  );
                  return;
                }

                setState(() {
                  fees.add({
                    'course': courseController.text.trim(),
                    'year': yearController.text.trim(),
                    'tuition': tuitionController.text.trim(),
                    'exam': examController.text.trim(),
                    'bus': busController.text.trim(),
                  });
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fee structure added successfully'),
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteFee(int index) {
    final course = fees[index]['course'] ?? 'Fee';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Fee'),
          content: Text(
            'Are you sure you want to delete $course fee structure?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  fees.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fee structure deleted'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Fees'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addFee,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: fees.isEmpty
          ? const Center(
              child: Text(
                'No fee structure available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: fees.length,
              itemBuilder: (context, index) {
                final fee = fees[index];

                final course = fee['course'] ?? '';
                final year = fee['year'] ?? '';
                final tuition = fee['tuition'] ?? '0';
                final exam = fee['exam'] ?? '0';
                final bus = fee['bus'] ?? '0';

                final total =
                    (int.tryParse(tuition) ?? 0) +
                    (int.tryParse(exam) ?? 0) +
                    (int.tryParse(bus) ?? 0);

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade50,
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.currency_rupee,
                                color: Colors.deepPurple,
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    year,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                deleteFee(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 25),

                        buildFeeRow(
                          'Tuition Fee',
                          tuition,
                          Icons.school,
                        ),

                        const SizedBox(height: 10),

                        buildFeeRow(
                          'Exam Fee',
                          exam,
                          Icons.assignment,
                        ),

                        const SizedBox(height: 10),

                        buildFeeRow(
                          'Bus Fee',
                          bus,
                          Icons.directions_bus,
                        ),

                        const Divider(height: 25),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Fee',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              '₹$total',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget buildFeeRow(
    String title,
    String amount,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),

        Text(
          '₹$amount',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}