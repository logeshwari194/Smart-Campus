import 'package:flutter/material.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  int selectedRoute = 0;

  final List<Map<String, dynamic>> routes = [
    {
      "route": "Route 01",
      "name": "Tiruchengode → College",
      "bus": "TN 34 AB 1024",
      "driver": "Mr. Kumar",
      "phone": "98765 43210",
      "pickup": "Tiruchengode Bus Stand",
      "drop": "College Main Gate",
      "departure": "07:30 AM",
      "arrival": "08:15 AM",
      "seats": "18 / 50",
      "status": "On Time",
      "statusColor": Colors.green,
      "icon": Icons.directions_bus_rounded,
    },
    {
      "route": "Route 02",
      "name": "Namakkal → College",
      "bus": "TN 34 AB 2048",
      "driver": "Mr. Ravi",
      "phone": "98765 12340",
      "pickup": "Namakkal Bus Stand",
      "drop": "College Main Gate",
      "departure": "07:15 AM",
      "arrival": "08:20 AM",
      "seats": "32 / 50",
      "status": "Running",
      "statusColor": Colors.blue,
      "icon": Icons.directions_bus_rounded,
    },
    {
      "route": "Route 03",
      "name": "Erode → College",
      "bus": "TN 33 CD 3056",
      "driver": "Mr. Suresh",
      "phone": "98765 67890",
      "pickup": "Erode Central Bus Stand",
      "drop": "College Main Gate",
      "departure": "07:00 AM",
      "arrival": "08:30 AM",
      "seats": "42 / 50",
      "status": "Few Seats",
      "statusColor": Colors.orange,
      "icon": Icons.directions_bus_rounded,
    },
    {
      "route": "Route 04",
      "name": "Salem → College",
      "bus": "TN 30 EF 4012",
      "driver": "Mr. Mani",
      "phone": "98654 32109",
      "pickup": "Salem New Bus Stand",
      "drop": "College Main Gate",
      "departure": "06:45 AM",
      "arrival": "08:10 AM",
      "seats": "50 / 50",
      "status": "Full",
      "statusColor": Colors.red,
      "icon": Icons.directions_bus_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            Icon(Icons.directions_bus_rounded),
            SizedBox(width: 10),
            Text(
              "Campus Bus",
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
                  content: Text("Bus information refreshed"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.refresh_rounded),
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

            const Text(
              "Campus Bus 🚌",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24213D),
              ),
            ),

            const SizedBox(height: 7),

            Text(
              "Find your route, bus timings and seat availability.",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // LIVE STATUS BANNER
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
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
                    color: const Color(0xFF673AB7).withOpacity(.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Campus Transport",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "All buses are operating",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Last updated 2 minutes ago",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.greenAccent,
                          size: 8,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "LIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // SEARCH
            // ======================================================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.04),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF673AB7),
                  ),
                  hintText: "Search route or pickup point...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ======================================================
            // QUICK STATS
            // ======================================================

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    Icons.directions_bus_rounded,
                    "4",
                    "Active Buses",
                    Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _statCard(
                    Icons.route_rounded,
                    "12",
                    "Bus Stops",
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _statCard(
                    Icons.event_seat_rounded,
                    "192",
                    "Available Seats",
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ======================================================
            // ROUTES HEADER
            // ======================================================

            Row(
              children: [
                const Text(
                  "Available Routes",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF24213D),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "4 Routes",
                    style: TextStyle(
                      color: Color(0xFF673AB7),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ======================================================
            // ROUTE CARDS
            // ======================================================

            ...List.generate(
              routes.length,
              (index) => _routeCard(
                routes[index],
                index,
              ),
            ),

            const SizedBox(height: 15),

            // ======================================================
            // TRANSPORT INFORMATION
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
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF673AB7),
                    size: 29,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "Please reach your pickup point 10 minutes before the scheduled departure time.",
                      style: TextStyle(
                        color: Color(0xFF51477A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard(
    IconData icon,
    String value,
    String title,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: color.withOpacity(.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24213D),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ROUTE CARD
  // ============================================================

  Widget _routeCard(
    Map<String, dynamic> route,
    int index,
  ) {
    final bool selected = selectedRoute == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRoute = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: selected
                ? const Color(0xFF673AB7)
                : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 13,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [

            // ------------------------------------------------------
            // TOP
            // ------------------------------------------------------

            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.directions_bus_rounded,
                    color: Color(0xFF673AB7),
                    size: 29,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        route["route"],
                        style: const TextStyle(
                          color: Color(0xFF673AB7),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        route["name"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24213D),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: route["statusColor"]
                        .withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 7,
                        color: route["statusColor"],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        route["status"],
                        style: TextStyle(
                          color: route["statusColor"],
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------------
            // ROUTE PATH
            // ------------------------------------------------------

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F7FC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [

                  Column(
                    children: [
                      const Icon(
                        Icons.radio_button_checked_rounded,
                        color: Color(0xFF673AB7),
                        size: 19,
                      ),
                      Container(
                        height: 30,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                    ],
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          route["pickup"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          route["drop"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        route["departure"],
                        style: const TextStyle(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        route["arrival"],
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 17),

            // ------------------------------------------------------
            // BUS INFO
            // ------------------------------------------------------

            Row(
              children: [
                Expanded(
                  child: _infoItem(
                    Icons.confirmation_number_rounded,
                    "Bus Number",
                    route["bus"],
                  ),
                ),
                Expanded(
                  child: _infoItem(
                    Icons.event_seat_rounded,
                    "Seats",
                    route["seats"],
                  ),
                ),
                Expanded(
                  child: _infoItem(
                    Icons.person_rounded,
                    "Driver",
                    route["driver"],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // ------------------------------------------------------
            // BUTTONS
            // ------------------------------------------------------

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _showRouteDetails(route);
                    },
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      size: 17,
                    ),
                    label: const Text("Details"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          const Color(0xFF673AB7),
                      side: const BorderSide(
                        color: Color(0xFF673AB7),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            "${route["route"]} selected",
                          ),
                          behavior:
                              SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.navigation_rounded,
                      size: 17,
                    ),
                    label: const Text("Track Bus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF673AB7),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INFO ITEM
  // ============================================================

  Widget _infoItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF673AB7),
          size: 19,
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xFF24213D),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ROUTE DETAILS
  // ============================================================

  void _showRouteDetails(
    Map<String, dynamic> route,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.directions_bus_rounded,
                color: Color(0xFF673AB7),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  route["route"],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogRow(
                Icons.route_rounded,
                "Route",
                route["name"],
              ),
              _dialogRow(
                Icons.confirmation_number_rounded,
                "Bus",
                route["bus"],
              ),
              _dialogRow(
                Icons.person_rounded,
                "Driver",
                route["driver"],
              ),
              _dialogRow(
                Icons.phone_rounded,
                "Contact",
                route["phone"],
              ),
              _dialogRow(
                Icons.location_on_rounded,
                "Pickup",
                route["pickup"],
              ),
              _dialogRow(
                Icons.flag_rounded,
                "Drop",
                route["drop"],
              ),
              _dialogRow(
                Icons.access_time_rounded,
                "Departure",
                route["departure"],
              ),
              _dialogRow(
                Icons.event_seat_rounded,
                "Seats",
                route["seats"],
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
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Bus tracking started",
                    ),
                    backgroundColor: Colors.green,
                    behavior:
                        SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF673AB7),
                foregroundColor: Colors.white,
              ),
              child: const Text("Track Bus"),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DIALOG ROW
  // ============================================================

  Widget _dialogRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF673AB7),
          ),
          const SizedBox(width: 9),
          Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}