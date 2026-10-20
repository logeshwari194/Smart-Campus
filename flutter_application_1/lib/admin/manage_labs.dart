import 'package:flutter/material.dart';

class ManageLabs extends StatefulWidget {
  const ManageLabs({super.key});

  @override
  State<ManageLabs> createState() => _ManageLabsState();
}

class _ManageLabsState extends State<ManageLabs> {
  // =========================================================
  // LAB DATA
  // =========================================================

  List<Map<String, dynamic>> labs = [
    {
      'name': 'Computer Lab 1',
      'room': 'LAB-101',
      'capacity': '60',
      'status': 'Available',
    },
    {
      'name': 'Computer Lab 2',
      'room': 'LAB-102',
      'capacity': '50',
      'status': 'Available',
    },
    {
      'name': 'IoT Lab',
      'room': 'LAB-201',
      'capacity': '40',
      'status': 'Available',
    },
  ];

  // =========================================================
  // ADD / EDIT LAB
  // =========================================================

  void showLabDialog({int? index}) {
    final bool isEdit = index != null;

    final TextEditingController nameController =
        TextEditingController(
      text: isEdit ? labs[index]['name'].toString() : '',
    );

    final TextEditingController roomController =
        TextEditingController(
      text: isEdit ? labs[index]['room'].toString() : '',
    );

    final TextEditingController capacityController =
        TextEditingController(
      text: isEdit ? labs[index]['capacity'].toString() : '',
    );

    String status = isEdit
        ? (labs[index]['status'] ?? 'Available').toString()
        : 'Available';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                isEdit ? 'Edit Lab' : 'Add Lab',
              ),

              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // LAB NAME
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Lab Name',
                        prefixIcon: Icon(Icons.computer),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ROOM NUMBER
                    TextField(
                      controller: roomController,
                      decoration: const InputDecoration(
                        labelText: 'Room Number',
                        prefixIcon: Icon(Icons.meeting_room),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CAPACITY
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

                    // STATUS
                    DropdownButtonFormField<String>(
                      value: status,
                      decoration: const InputDecoration(
                        labelText: 'Status',
                        prefixIcon: Icon(Icons.check_circle),
                        border: OutlineInputBorder(),
                      ),

                      items: const [
                        DropdownMenuItem(
                          value: 'Available',
                          child: Text('Available'),
                        ),
                        DropdownMenuItem(
                          value: 'Maintenance',
                          child: Text('Maintenance'),
                        ),
                        DropdownMenuItem(
                          value: 'Unavailable',
                          child: Text('Unavailable'),
                        ),
                      ],

                      onChanged: (value) {
                        setDialogState(() {
                          status = value ?? 'Available';
                        });
                      },
                    ),
                  ],
                ),
              ),

              // =================================================
              // BUTTONS
              // =================================================

              actions: [

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCEL'),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isEmpty ||
                        roomController.text.trim().isEmpty ||
                        capacityController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please fill all fields',
                          ),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      final Map<String, dynamic> labData = {
                        'name': nameController.text.trim(),
                        'room': roomController.text.trim(),
                        'capacity':
                            capacityController.text.trim(),
                        'status': status,
                      };

                      if (isEdit) {
                        labs[index] = labData;
                      } else {
                        labs.add(labData);
                      }
                    });

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isEdit
                              ? 'Lab updated successfully'
                              : 'Lab added successfully',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    isEdit ? 'UPDATE' : 'ADD',
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // =========================================================
  // DELETE LAB
  // =========================================================

  void deleteLab(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Lab'),
          content: const Text(
            'Are you sure you want to delete this lab?',
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  labs.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Lab deleted successfully',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),

              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }

  // =========================================================
  // MAIN UI
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // =======================================================
      // APP BAR
      // =======================================================

      appBar: AppBar(
        title: const Text('Manage Labs'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      // =======================================================
      // BODY
      // =======================================================

      body: labs.isEmpty
          ? const Center(
              child: Text(
                'No Labs Available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: labs.length,

              itemBuilder: (context, index) {

                final lab = labs[index];

                final String name =
                    (lab['name'] ?? 'Unknown Lab').toString();

                final String room =
                    (lab['room'] ?? 'N/A').toString();

                final String capacity =
                    (lab['capacity'] ?? '0').toString();

                final String status =
                    (lab['status'] ?? 'Available').toString();

                final bool isAvailable =
                    status == 'Available';

                return Card(
                  elevation: 4,

                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // =====================================
                        // TOP ROW
                        // =====================================

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
                                Icons.computer,
                                size: 30,
                                color:
                                    Colors.deepPurple,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    name,
                                    style:
                                        const TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    room,
                                    style:
                                        const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // STATUS
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 10,
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

                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        const Divider(),

                        const SizedBox(height: 10),

                        // =====================================
                        // CAPACITY
                        // =====================================

                        Row(
                          children: [

                            const Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              'Capacity: $capacity',
                              style:
                                  const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // =====================================
                        // ACTION BUTTONS
                        // =====================================

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end,

                          children: [

                            OutlinedButton.icon(
                              onPressed: () {
                                showLabDialog(
                                  index: index,
                                );
                              },

                              icon: const Icon(
                                Icons.edit,
                                size: 18,
                              ),

                              label:
                                  const Text('EDIT'),
                            ),

                            const SizedBox(width: 10),

                            ElevatedButton.icon(
                              onPressed: () {
                                deleteLab(index);
                              },

                              icon: const Icon(
                                Icons.delete,
                                size: 18,
                              ),

                              label:
                                  const Text('DELETE'),

                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red,
                                foregroundColor:
                                    Colors.white,
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

      // =======================================================
      // ADD LAB BUTTON
      // =======================================================

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () {
          showLabDialog();
        },

        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Lab',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}