import 'package:flutter/material.dart';

class ManageBusRoutes extends StatefulWidget {
  const ManageBusRoutes({super.key});

  @override
  State<ManageBusRoutes> createState() => _ManageBusRoutesState();
}

class _ManageBusRoutesState extends State<ManageBusRoutes> {
  final List<Map<String, String>> routes = [
    {
      'route': 'Route 1',
      'bus': 'TN 01 AB 1234',
      'from': 'Chennai',
      'to': 'College',
      'time': '7:30 AM',
      'status': 'Active',
    },
    {
      'route': 'Route 2',
      'bus': 'TN 01 CD 5678',
      'from': 'Tambaram',
      'to': 'College',
      'time': '8:00 AM',
      'status': 'Active',
    },
    {
      'route': 'Route 3',
      'bus': 'TN 01 EF 9012',
      'from': 'Avadi',
      'to': 'College',
      'time': '7:45 AM',
      'status': 'Active',
    },
  ];

  void addRoute() {
    final routeController = TextEditingController();
    final busController = TextEditingController();
    final fromController = TextEditingController();
    final toController = TextEditingController();
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Bus Route'),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: routeController,
                  decoration: const InputDecoration(
                    labelText: 'Route Name',
                    prefixIcon: Icon(Icons.route),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: busController,
                  decoration: const InputDecoration(
                    labelText: 'Bus Number',
                    prefixIcon: Icon(Icons.directions_bus),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: fromController,
                  decoration: const InputDecoration(
                    labelText: 'Starting Point',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: toController,
                  decoration: const InputDecoration(
                    labelText: 'Destination',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: timeController,
                  decoration: const InputDecoration(
                    labelText: 'Departure Time',
                    prefixIcon: Icon(Icons.access_time),
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
                if (routeController.text.trim().isEmpty ||
                    busController.text.trim().isEmpty ||
                    fromController.text.trim().isEmpty ||
                    toController.text.trim().isEmpty ||
                    timeController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter all route details',
                      ),
                    ),
                  );
                  return;
                }

                setState(() {
                  routes.add({
                    'route': routeController.text.trim(),
                    'bus': busController.text.trim(),
                    'from': fromController.text.trim(),
                    'to': toController.text.trim(),
                    'time': timeController.text.trim(),
                    'status': 'Active',
                  });
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Bus route added successfully',
                    ),
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

  void deleteRoute(int index) {
    final routeName = routes[index]['route'] ?? 'Route';

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Route'),

          content: Text(
            'Are you sure you want to delete $routeName?',
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
                  routes.removeAt(index);
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Bus route deleted',
                    ),
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
      if (routes[index]['status'] == 'Active') {
        routes[index]['status'] = 'Inactive';
      } else {
        routes[index]['status'] = 'Active';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Bus Routes'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addRoute,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: routes.isEmpty
          ? const Center(
              child: Text(
                'No bus routes available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: routes.length,

              itemBuilder: (context, index) {
                final route = routes[index];

                final routeName = route['route'] ?? '';
                final bus = route['bus'] ?? '';
                final from = route['from'] ?? '';
                final to = route['to'] ?? '';
                final time = route['time'] ?? '';
                final status = route['status'] ?? 'Active';

                final isActive = status == 'Active';

                return Card(
                  elevation: 4,

                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),

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
                                Icons.directions_bus,
                                size: 30,
                                color: Colors.deepPurple,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    routeName,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    bus,
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
                                changeStatus(index);
                              },

                              icon: Icon(
                                isActive
                                    ? Icons.toggle_on
                                    : Icons.toggle_off,

                                size: 35,

                                color: isActive
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            const Icon(
                              Icons.trip_origin,
                              size: 20,
                              color: Colors.deepPurple,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                'From: $from',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.red,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                'To: $to',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 20,
                              color: Colors.orange,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              'Departure: $time',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.green.shade50
                                    : Colors.red.shade50,

                                borderRadius:
                                    BorderRadius.circular(20),
                              ),

                              child: Text(
                                status,

                                style: TextStyle(
                                  color: isActive
                                      ? Colors.green
                                      : Colors.red,

                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            IconButton(
                              onPressed: () {
                                deleteRoute(index);
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