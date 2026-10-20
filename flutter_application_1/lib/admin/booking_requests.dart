import 'package:flutter/material.dart';

class BookingRequests extends StatefulWidget {
  const BookingRequests({super.key});

  @override
  State<BookingRequests> createState() => _BookingRequestsState();
}

class _BookingRequestsState extends State<BookingRequests> {
  // =====================================================
  // BOOKING REQUEST DATA
  // =====================================================

  final List<Map<String, String>> requests = [
    {
      'type': 'Classroom',
      'room': 'CR-201',
      'date': '20/08/2026',
      'time': '11:00 AM - 12:00 PM',
      'student': 'Logeshwari',
      'status': 'Pending',
    },
    {
      'type': 'Lab',
      'room': 'LAB-101',
      'date': '21/08/2026',
      'time': '10:00 AM - 11:00 AM',
      'student': 'Student 02',
      'status': 'Pending',
    },
    {
      'type': 'Hall',
      'room': 'SEMINAR HALL',
      'date': '22/08/2026',
      'time': '02:00 PM - 04:00 PM',
      'student': 'Student 03',
      'status': 'Pending',
    },
  ];

  // =====================================================
  // APPROVE BOOKING
  // =====================================================

  void approveBooking(int index) {
    setState(() {
      requests[index]['status'] = 'Approved';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking Approved'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // =====================================================
  // REJECT BOOKING
  // =====================================================

  void rejectBooking(int index) {
    setState(() {
      requests[index]['status'] = 'Rejected';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking Rejected'),
        backgroundColor: Colors.red,
      ),
    );
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Requests',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      // =================================================
      // BODY
      // =================================================

      body: requests.isEmpty
          ? const Center(
              child: Text(
                'No Booking Requests',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];

                return buildBookingCard(
                  context,
                  index,
                  request,
                );
              },
            ),
    );
  }

  // =====================================================
  // BOOKING CARD
  // =====================================================

  Widget buildBookingCard(
    BuildContext context,
    int index,
    Map<String, String> request,
  ) {
    final String status =
        request['status'] ?? 'Pending';

    Color statusColor;

    if (status == 'Approved') {
      statusColor = Colors.green;
    } else if (status == 'Rejected') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.orange;
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =================================================
            // TYPE + STATUS
            // =================================================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            Colors.deepPurple.shade50,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Icon(
                        getBookingIcon(
                          request['type'] ?? '',
                        ),
                        color: Colors.deepPurple,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      request['type'] ?? '',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // STATUS
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        statusColor.withOpacity(0.12),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Divider(),

            const SizedBox(height: 10),

            // =================================================
            // ROOM
            // =================================================

            buildInfoRow(
              Icons.location_on,
              'Room / Hall',
              request['room'] ?? '',
            ),

            const SizedBox(height: 12),

            // =================================================
            // DATE
            // =================================================

            buildInfoRow(
              Icons.calendar_month,
              'Date',
              request['date'] ?? '',
            ),

            const SizedBox(height: 12),

            // =================================================
            // TIME
            // =================================================

            buildInfoRow(
              Icons.access_time,
              'Time',
              request['time'] ?? '',
            ),

            const SizedBox(height: 12),

            // =================================================
            // STUDENT
            // =================================================

            buildInfoRow(
              Icons.person,
              'Requested By',
              request['student'] ?? '',
            ),

            const SizedBox(height: 20),

            // =================================================
            // APPROVE / REJECT BUTTONS
            // =================================================

            if (status == 'Pending')
              Row(
                children: [
                  // APPROVE
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        approveBooking(index);
                      },

                      icon: const Icon(
                        Icons.check,
                      ),

                      label: const Text(
                        'APPROVE',
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green,
                        foregroundColor:
                            Colors.white,
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // REJECT
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        rejectBooking(index);
                      },

                      icon: const Icon(
                        Icons.close,
                      ),

                      label: const Text(
                        'REJECT',
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red,
                        foregroundColor:
                            Colors.white,
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            // =================================================
            // APPROVED MESSAGE
            // =================================================

            if (status == 'Approved')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Booking approved successfully',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            // =================================================
            // REJECTED MESSAGE
            // =================================================

            if (status == 'Rejected')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Booking rejected',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
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

  // =====================================================
  // INFO ROW
  // =====================================================

  Widget buildInfoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.deepPurple,
        ),

        const SizedBox(width: 12),

        Text(
          '$title:',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // BOOKING ICON
  // =====================================================

  IconData getBookingIcon(String type) {
    switch (type) {
      case 'Classroom':
        return Icons.class_;

      case 'Lab':
        return Icons.computer;

      case 'Hall':
        return Icons.meeting_room;

      default:
        return Icons.calendar_month;
    }
  }
}

