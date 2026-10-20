import 'package:flutter/material.dart';

class ManageHalls extends StatefulWidget {
  const ManageHalls({super.key});

  @override
  State<ManageHalls> createState() => _ManageHallsState();
}

class _ManageHallsState extends State<ManageHalls> {
  final List<Map<String, String>> halls = [
    {
      'name': 'Seminar Hall',
      'capacity': '200',
      'location': 'Block A',
      'status': 'Available',
    },
    {
      'name': 'Auditorium',
      'capacity': '500',
      'location': 'Main Block',
      'status': 'Available',
    },
    {
      'name': 'Conference Hall',
      'capacity': '100',
      'location': 'Block B',
      'status': 'Available',
    },
  ];

  void addHall() {
    final nameController = TextEditingController();
    final capacityController = TextEditingController();
    final locationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Hall'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Hall Name',
                    prefixIcon: Icon(Icons.meeting_room),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: capacityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Capacity',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    prefixIcon: Icon(Icons.location_on),
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
                if (nameController.text.trim().isEmpty ||
                    capacityController.text.trim().isEmpty ||
                    locationController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  halls.add({
                    'name': nameController.text.trim(),
                    'capacity': capacityController.text.trim(),
                    'location': locationController.text.trim(),
                    'status': 'Available',
                  });
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hall added successfully'),
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

  void deleteHall(int index) {
    final hallName = halls[index]['name'] ?? 'Hall';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Hall'),
          content: Text(
            'Are you sure you want to delete $hallName?',
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
                  halls.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hall deleted'),
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

  void changeStatus(int index) {
    setState(() {
      if (halls[index]['status'] == 'Available') {
        halls[index]['status'] = 'Unavailable';
      } else {
        halls[index]['status'] = 'Available';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Halls'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addHall,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: halls.isEmpty
          ? const Center(
              child: Text(
                'No halls available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: halls.length,
              itemBuilder: (context, index) {
                final hall = halls[index];

                final name = hall['name'] ?? '';
                final capacity = hall['capacity'] ?? '';
                final location = hall['location'] ?? '';
                final status = hall['status'] ?? 'Available';

                final isAvailable = status == 'Available';

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    Colors.deepPurple.shade50,
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.meeting_room,
                                color: Colors.deepPurple,
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                changeStatus(index);
                              },
                              icon: Icon(
                                isAvailable
                                    ? Icons.toggle_on
                                    : Icons.toggle_off,
                                size: 35,
                                color: isAvailable
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Capacity: $capacity',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              location,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: isAvailable
                                    ? Colors.green.shade50
                                    : Colors.red.shade50,
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: isAvailable
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            IconButton(
                              onPressed: () {
                                deleteHall(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
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
}