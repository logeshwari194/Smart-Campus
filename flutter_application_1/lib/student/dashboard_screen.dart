import 'package:flutter/material.dart';

import 'classroom_screen.dart';
import 'lab_screen.dart';
import 'hall_screen.dart';
import 'bus_screen.dart';

/// Smart Campus Student Portal dashboard.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _questionController = TextEditingController();
  int _selectedNav = 0;
  String _aiAnswer = '';

  static const Color purple = Color(0xFF5B2BBF);
  static const Color deepPurple = Color(0xFF2E167E);
  static const Color ink = Color(0xFF15133F);
  static const Color pageBg = Color(0xFFF5F7FF);

  final List<_ServiceData> _services = const [
    _ServiceData(
      title: 'Classroom',
      subtitle: 'Book classroom',
      image: 'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=600',
      icon: Icons.school_rounded,
      color: Color(0xFF6B35D0),
      page: ClassroomScreen(),
    ),
    _ServiceData(
      title: 'Labs',
      subtitle: 'Book laboratory',
      image: 'https://images.unsplash.com/photo-1581092921461-eab62e97a780?w=600',
      icon: Icons.science_rounded,
      color: Color(0xFF168DF2),
      page: LabScreen(),
    ),
    _ServiceData(
      title: 'Hall',
      subtitle: 'Book seminar hall',
      image: 'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?w=600',
      icon: Icons.groups_rounded,
      color: Color(0xFFFF9B21),
      page: HallScreen(),
    ),
    _ServiceData(
      title: 'Bus Routes',
      subtitle: 'View bus routes',
      image: 'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?w=600',
      icon: Icons.directions_bus_rounded,
      color: Color(0xFF0CB9B0),
      page: BusScreen(),
    ),
  ];

  final List<_BookingData> _bookings = const [
    _BookingData('Classroom A101', 'B.Tech - CSE', '14 Sep 2026', '10:00 AM', Icons.school_rounded, Color(0xFF6736C8)),
    _BookingData('Lab 2', 'Physics Lab', '15 Sep 2026', '02:00 PM', Icons.science_rounded, Color(0xFF168DF2)),
    _BookingData('Seminar Hall', 'Workshop', '16 Sep 2026', '11:00 AM', Icons.groups_rounded, Color(0xFFFF9B21)),
  ];

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _openPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _askAssistant() {
    final question = _questionController.text.trim();
    if (question.isEmpty) {
      _showSnack('Type a question for the AI Assistant.');
      return;
    }
    setState(() {
      _aiAnswer =
          'Thanks for asking! I can help you find campus services, bookings, labs, and bus routes. For "$question", please check the relevant Campus Services card.';
    });
    _questionController.clear();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1440),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWelcome(),
                        const SizedBox(height: 28),
                        _buildAiAssistant(),
                        if (_aiAnswer.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                            child: Text(_aiAnswer, style: const TextStyle(color: ink, height: 1.4)),
                          ),
                        ],
                        const SizedBox(height: 28),
                        const Text('Campus Services', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: ink)),
                        const SizedBox(height: 16),
                        _buildServices(),
                        const SizedBox(height: 24),
                        _buildLowerPanels(),
                        const SizedBox(height: 18),
                        _buildNotifications(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF6335C2), Color(0xFF4B27A4)]),
      ),
      child: Row(
        children: [
          const Icon(Icons.school_rounded, size: 42, color: Colors.white),
          const SizedBox(width: 14),
          const Expanded(child: Text('Smart Campus', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white))),
          IconButton(onPressed: () => _showSnack('You are all caught up!'), icon: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 30)),
          const SizedBox(width: 12),
          CircleAvatar(backgroundColor: Colors.white, radius: 23, child: Icon(Icons.person_rounded, color: purple, size: 30)),
        ],
      ),
    );
  }

  Widget _buildWelcome() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 2),
      child: LayoutBuilder(builder: (context, constraints) {
        final narrow = constraints.maxWidth < 620;
        final greeting = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hi, Student 👋', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: Colors.white)),
            SizedBox(height: 5),
            Text('Welcome to Smart Campus', style: TextStyle(fontSize: 22, color: Color(0xFFE6DEFF))),
          ],
        );
        final date = Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: const Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.calendar_month_rounded, color: purple, size: 28),
            SizedBox(width: 12),
            Text('12 Sep 2026', style: TextStyle(color: purple, fontSize: 18, fontWeight: FontWeight.w800)),
          ]),
        );
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF4323A0), Color(0xFF2D1A80)]),
            borderRadius: BorderRadius.circular(22),
          ),
          child: narrow
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [greeting, const SizedBox(height: 18), date])
              : Row(children: [Expanded(child: greeting), date]),
        );
      }),
    );
  }

  Widget _buildAiAssistant() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF6735E4), Color(0xFF168FF5)]),
        borderRadius: BorderRadius.circular(22),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        final narrow = constraints.maxWidth < 650;
        final robot = Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(color: Colors.white.withOpacity(.17), shape: BoxShape.circle, border: Border.all(color: Colors.white24, width: 3)),
          child: const Icon(Icons.smart_toy_rounded, size: 88, color: Colors.white),
        );
        final content = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('AI Assistant', style: TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          const Text('Ask anything about your campus...', style: TextStyle(fontSize: 19, color: Colors.white)),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 8),
            decoration: BoxDecoration(color: const Color(0xFFF1F1FF), borderRadius: BorderRadius.circular(40)),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _questionController,
                  onSubmitted: (_) => _askAssistant(),
                  decoration: const InputDecoration(border: InputBorder.none, hintText: 'Type your question here...', hintStyle: TextStyle(color: Color(0xFF9695B7), fontSize: 17)),
                ),
              ),
              IconButton(
                onPressed: _askAssistant,
                style: IconButton.styleFrom(backgroundColor: purple, foregroundColor: Colors.white, padding: const EdgeInsets.all(13)),
                icon: const Icon(Icons.send_rounded),
              ),
            ]),
          ),
        ]);
        return narrow
            ? Column(children: [robot, const SizedBox(height: 18), content])
            : Row(children: [robot, const SizedBox(width: 28), Expanded(child: content)]);
      }),
    );
  }

  // ============================================================
  // CAMPUS SERVICES (small boxes)
  // ============================================================

  Widget _buildServices() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _services.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 260, // box width: 200 = chinna, 320 = perusa
        mainAxisExtent: 200, // box height
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => _serviceCard(_services[index]),
    );
  }

  Widget _serviceCard(_ServiceData service) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openPage(service.page),
        child: Stack(fit: StackFit.expand, children: [
          Image.network(
            service.image,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                color: service.color.withOpacity(.12),
                child: const Center(child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))),
              );
            },
            errorBuilder: (context, error, stack) => Container(
              color: service.color.withOpacity(.22),
              child: Icon(service.icon, size: 60, color: service.color),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xE800071D)],
                stops: [0.30, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 14,
            bottom: 12,
            right: 54,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: service.color,
                  shape: BoxShape.circle,
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3))],
                ),
                child: Icon(service.icon, color: Colors.white, size: 22),
              ),
              const SizedBox(height: 6),
              Text(
                service.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800, shadows: [Shadow(color: Colors.black54, blurRadius: 5)]),
              ),
              Text(
                service.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ]),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white.withOpacity(.28),
              child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildLowerPanels() {
    return LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth >= 850;
      final stats = _buildStatistics();
      final bookings = _buildBookings();
      if (!wide) return Column(children: [stats, const SizedBox(height: 18), bookings]);
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: stats), const SizedBox(width: 18), Expanded(child: bookings)]);
    });
  }

  Widget _panel({required String title, required IconData icon, required Widget child, String? action}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE0E5FF))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, color: purple, size: 25),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 21, color: ink, fontWeight: FontWeight.w800))),
          if (action != null) TextButton(onPressed: () => _showSnack('Opening $title'), child: Text(action, style: const TextStyle(color: purple))),
        ]),
        const SizedBox(height: 14),
        child,
      ]),
    );
  }

  Widget _buildStatistics() {
    final stats = [
      _StatData('1,248', 'Total Students', Icons.groups_rounded, const Color(0xFF6C35CA), const Color(0xFFF7F0FF)),
      _StatData('48', 'Total Classrooms', Icons.menu_book_rounded, const Color(0xFF168DF2), const Color(0xFFF0F7FF)),
      _StatData('12', 'Total Labs', Icons.science_rounded, const Color(0xFFFF9B21), const Color(0xFFFFF6EB)),
      _StatData('8', 'Bus Routes', Icons.directions_bus_rounded, const Color(0xFF0BA66B), const Color(0xFFEFFBF4)),
    ];
    return _panel(
      title: 'Campus Statistics',
      icon: Icons.bar_chart_rounded,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 1.65,
        children: stats
            .map((s) => Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: s.bg, borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    Container(width: 50, height: 50, decoration: BoxDecoration(color: s.color, shape: BoxShape.circle), child: Icon(s.icon, color: Colors.white, size: 27)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(s.value, style: const TextStyle(fontSize: 23, color: ink, fontWeight: FontWeight.w800)),
                        Text(s.label, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: Color(0xFF555B91))),
                      ]),
                    ),
                  ]),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildBookings() {
    return _panel(
      title: 'Upcoming Bookings',
      icon: Icons.calendar_month_rounded,
      action: 'View All',
      child: Column(children: _bookings.map((b) => _bookingRow(b)).toList()),
    );
  }

  Widget _bookingRow(_BookingData booking) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE8EBF8)))),
      child: Row(children: [
        CircleAvatar(radius: 23, backgroundColor: booking.color, child: Icon(booking.icon, color: Colors.white, size: 25)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(booking.title, style: const TextStyle(color: ink, fontWeight: FontWeight.w800, fontSize: 14)),
            const SizedBox(height: 5),
            Text(booking.subtitle, style: const TextStyle(color: Color(0xFF666B9B), fontSize: 13)),
          ]),
        ),
        const SizedBox(width: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(booking.date, style: const TextStyle(color: Color(0xFF666B9B), fontSize: 13)),
          const SizedBox(height: 5),
          Text(booking.time, style: const TextStyle(color: Color(0xFF666B9B), fontSize: 13)),
        ]),
        const SizedBox(width: 7),
        const Icon(Icons.chevron_right_rounded, color: Color(0xFF6570A0), size: 25),
      ]),
    );
  }

  Widget _buildNotifications() {
    return _panel(
      title: 'Notifications',
      icon: Icons.notifications_active_rounded,
      action: 'View All',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(color: const Color(0xFFFBF1FF), borderRadius: BorderRadius.circular(12)),
        child: const Row(children: [
          Icon(Icons.circle, size: 12, color: Color(0xFFEC3D8A)),
          SizedBox(width: 14),
          Expanded(child: Text('Campus maintenance scheduled on 20 Sep 2026', style: TextStyle(color: Color(0xFF303568), fontSize: 14))),
          Text('2 hours ago', style: TextStyle(color: Color(0xFF6A6D9C), fontSize: 12)),
          SizedBox(width: 10),
          Icon(Icons.chevron_right_rounded, color: purple),
        ]),
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      (Icons.home_rounded, 'Home'),
      (Icons.notifications_none_rounded, 'Alerts'),
      (Icons.calendar_month_rounded, 'Bookings'),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, -3))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = _selectedNav == index;
          return InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              setState(() => _selectedNav = index);
              if (index != 0) _showSnack('${items[index].$2} selected');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 3),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(color: selected ? const Color(0xFFE8DCFF) : Colors.transparent, borderRadius: BorderRadius.circular(30)),
                  child: Icon(items[index].$1, color: selected ? purple : const Color(0xFF626174), size: 25),
                ),
                const SizedBox(height: 2),
                Text(items[index].$2, style: TextStyle(color: selected ? purple : const Color(0xFF626174), fontSize: 12, fontWeight: selected ? FontWeight.w700 : FontWeight.w500)),
              ]),
            ),
          );
        }),
      ),
    );
  }
}

class _ServiceData {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final Color color;
  final Widget page;
  const _ServiceData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class _StatData {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final Color bg;
  const _StatData(this.value, this.label, this.icon, this.color, this.bg);
}

class _BookingData {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final IconData icon;
  final Color color;
  const _BookingData(this.title, this.subtitle, this.date, this.time, this.icon, this.color);
}