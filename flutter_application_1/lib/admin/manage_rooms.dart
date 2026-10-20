import 'package:flutter/material.dart';

class ManageRooms extends StatefulWidget {
  const ManageRooms({super.key});

  @override
  State<ManageRooms> createState() => _ManageRoomsState();
}

class _ManageRoomsState extends State<ManageRooms> {
  final List<Map<String, String>> rooms = [
    {
      'name': 'Room 101',
      'capacity': '60',
      'block': 'Block A',
      'status': 'Available',
    },
    {
      'name': 'Room 102',
      'capacity': '50',
      'block': 'Block A',
      'status': 'Available',
    },
    {
      'name': 'Room 201',
      'capacity': '70',
      'block': 'Block B',
      'status': 'Available',
    },
  ];

  void addRoom() {
    final nameController = TextEditingController();
    final capacityController = TextEditingController();
    final blockController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Room'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Room Name',
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
                  controller: blockController,
                  decoration: const InputDecoration(
                    labelText: 'Block',
                    prefixIcon: Icon(Icons.business),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty ||
                    capacityController.text.trim().isEmpty ||
                    blockController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  rooms.add({
                    'name': nameController.text.trim(),
                    'capacity': capacityController.text.trim(),
                    'block': blockController.text.trim(),
                    'status': 'Available',
                  });
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Room added successfully'),
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

  void deleteRoom(int index) {
    final roomName = rooms[index]['name'] ?? 'Room';

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Room'),
          content: Text(
            'Are you sure you want to delete $roomName?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  rooms.removeAt(index);
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Room deleted'),
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
      final currentStatus = rooms[index]['status'];

      rooms[index]['status'] =
          currentStatus == 'Available'
              ? 'Unavailable'
              : 'Available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Rooms'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addRoom,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: rooms.isEmpty
          ? const Center(
              child: Text(
                'No rooms available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];

                final name = room['name'] ?? '';
                final capacity = room['capacity'] ?? '';
                final block = room['block'] ?? '';
                final status = room['status'] ?? 'Available';

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
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade50,
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
                              Icons.business,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              block,
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
                                deleteRoom(index);
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