import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widget_updater.dart';

void main() {
  runApp(const WidgetlyApp());
}

class WidgetlyApp extends StatelessWidget {
  const WidgetlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widgetly",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111827), // neutral-900
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F2937), // neutral-800
          elevation: 0,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            FaIcon(FontAwesomeIcons.bus, size: 20, color: Colors.white),
            SizedBox(width: 8),
            Text("UX Pilot Widgets", style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: const [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.bell, size: 18),
            onPressed: null,
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.gear, size: 18),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              "Widget Dashboard",
              "Manage your homescreen widgets and preferences",
            ),
            const SizedBox(height: 16),
            const OverviewCards(),
            const SizedBox(height: 16),

            // Placeholders until we build the widgets
            const BusWidgetCard(), // BusWidgetCard
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // UsageStats
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // RecentActivity
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // QuickActions
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // ThemeSelector
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // NotificationSettings
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // DataUsage
            const SizedBox(height: 16),
            const Placeholder(fallbackHeight: 100), // SupportSection
            const SizedBox(height: 24),
            const Placeholder(fallbackHeight: 50), // Footer
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F2937),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.tableCellsLarge),
            label: "Widgets",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine),
            label: "Stats",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// --------------------
// Reusable Widgets
// --------------------

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionTitle(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class OverviewCards extends StatelessWidget {
  const OverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CardBox(
            icon: FontAwesomeIcons.chartLine,
            label: "Active",
            value: "3",
            footer: "Widgets",
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CardBox(
            icon: FontAwesomeIcons.clock,
            label: "Updates",
            value: "2m",
            footer: "Interval",
          ),
        ),
      ],
    );
  }
}

class CardBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String footer;

  const CardBox({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF374151)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(icon, color: Colors.grey, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            footer,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// --------------------
// Bus Schedules
// --------------------
class BusSchedules {
  static const b1Weekday = [
    "04:40",
    "05:00",
    "05:20",
    "05:40",
    "06:06",
    "06:18",
    "06:30",
    "06:42",
    "06:54",
    "07:06",
    "07:18",
    "07:30",
    "07:42",
    "07:54",
    "08:04",
    "08:14",
    "08:24",
    "08:34",
    "08:44",
    "08:56",
    "09:08",
    "09:20",
    "09:32",
    "09:44",
    "09:58",
    "10:12",
    "10:26",
    "10:40",
    "10:54",
    "11:08",
    "11:22",
    "11:36",
    "11:54",
    "12:08",
    "12:22",
    "12:36",
    "12:50",
    "13:04",
    "13:16",
    "13:28",
    "13:42",
    "13:56",
    "14:08",
    "14:18",
    "14:28",
    "14:38",
    "14:48",
    "14:58",
    "15:12",
    "15:28",
    "15:46",
    "16:04",
    "16:20",
    "16:36",
    "16:52",
    "17:06",
    "17:20",
    "17:34",
    "17:48",
    "18:02",
    "18:16",
    "18:32",
    "18:48",
    "19:04",
    "19:20",
    "19:36",
    "19:52",
    "20:06",
    "20:20",
    "20:40",
    "21:10",
    "21:40",
    "22:10",
    "22:40",
    "23:10",
  ];

  static const b1Weekend = [
    "05:00",
    "05:20",
    "05:40",
    "06:06",
    "06:18",
    "06:30",
    "06:42",
    "06:54",
    "07:06",
    "07:18",
    "07:32",
    "07:46",
    "08:00",
    "08:14",
    "08:28",
    "08:42",
    "08:56",
    "09:10",
    "09:24",
    "09:39",
    "09:55",
    "10:12",
    "10:28",
    "10:42",
    "10:58",
    "11:12",
    "11:28",
    "11:44",
    "12:00",
    "12:16",
    "12:32",
    "12:47",
    "13:01",
    "13:16",
    "13:34",
    "13:52",
    "14:12",
    "14:29",
    "14:47",
    "15:06",
    "15:26",
    "15:46",
    "16:06",
    "16:25",
    "16:43",
    "17:00",
    "17:17",
    "17:32",
    "17:46",
    "18:02",
    "18:16",
    "18:30",
    "18:45",
    "19:01",
    "19:17",
    "19:37",
    "19:52",
    "20:08",
    "20:24",
    "20:40",
    "21:10",
    "21:40",
    "22:10",
    "22:40",
    "23:10",
  ];

  static const b11Weekday = [
    "05:00",
    "05:30",
    "06:00",
    "06:16",
    "06:34",
    "06:53",
    "07:07",
    "07:23",
    "07:38",
    "07:53",
    "08:08",
    "08:23",
    "08:38",
    "08:53",
    "09:10",
    "09:25",
    "09:50",
    "10:10",
    "10:30",
    "10:50",
    "11:10",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:20",
    "14:40",
    "15:00",
    "15:20",
    "15:40",
    "16:00",
    "16:25",
    "16:45",
    "17:05",
    "17:20",
    "17:35",
    "17:55",
    "18:20",
    "18:45",
    "19:10",
    "19:30",
    "19:50",
    "20:15",
    "20:45",
    "21:15",
    "21:50",
    "22:25",
    "23:15",
  ];

  static const b11Weekend = [
    "05:00",
    "05:25",
    "05:50",
    "06:15",
    "06:40",
    "07:05",
    "07:30",
    "07:55",
    "08:25",
    "08:55",
    "09:20",
    "09:45",
    "10:10",
    "10:35",
    "11:00",
    "11:25",
    "11:50",
    "12:15",
    "12:40",
    "13:10",
    "13:40",
    "14:10",
    "14:40",
    "15:10",
    "15:40",
    "16:05",
    "16:30",
    "16:55",
    "17:20",
    "17:45",
    "18:10",
    "18:35",
    "19:00",
    "19:25",
    "19:50",
    "20:15",
    "20:45",
    "21:15",
    "21:50",
    "22:25",
    "23:15",
  ];
}

List<String> getNextDepartures(List<String> schedule, int count) {
  final now = DateTime.now();
  for (var i = 0; i < schedule.length; i++) {
    final parts = schedule[i].split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final dep = DateTime(now.year, now.month, now.day, hour, minute);
    if (dep.isAfter(now)) {
      return schedule.skip(i).take(count).toList();
    }
  }
  return []; // no more buses today
}

class BusWidgetCard extends StatefulWidget {
  const BusWidgetCard({super.key});

  @override
  State<BusWidgetCard> createState() => _BusWidgetCardState();
}

class _BusWidgetCardState extends State<BusWidgetCard> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    // Update clock + departures every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool get isWeekend {
    final weekday = _now.weekday;
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    final b1Schedule = isWeekend
        ? BusSchedules.b1Weekend
        : BusSchedules.b1Weekday;
    final b11Schedule = isWeekend
        ? BusSchedules.b11Weekend
        : BusSchedules.b11Weekday;

    final b1Next = getNextDepartures(b1Schedule, 2);
    final b11Next = getNextDepartures(b11Schedule, 2);
    WidgetUpdater.updateBusWidget(
      line1: "Б1",
      nextTimes1: b1Next,
      line2: "Б11",
      nextTimes2: b11Next,
    );

    final currentTime =
        "${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}";

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF374151)),
      ),
      child: Column(
        children: [
          // Card Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF374151))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.bus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bus Widget",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Изгрев → Меден Рудник",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "Now: $currentTime",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Chip(
                      label: Text(
                        "Live",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      backgroundColor: Color(0xFF111827),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    SizedBox(width: 6),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bus Lines
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BusLineRow(line: "Б1", times: b1Next),
                const SizedBox(height: 12),
                BusLineRow(line: "Б11", times: b11Next),
              ],
            ),
          ),

          // Action Row
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF374151))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF374151),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        // Show both schedules stacked
                        return DefaultTabController(
                          length: 2,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1F2937),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                Container(
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: [
                                    Tab(text: "Б1"),
                                    Tab(text: "Б11"),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      FullScheduleSheet(
                                        line: "Б1",
                                        schedule: isWeekend
                                            ? BusSchedules.b1Weekend
                                            : BusSchedules.b1Weekday,
                                      ),
                                      FullScheduleSheet(
                                        line: "Б11",
                                        schedule: isWeekend
                                            ? BusSchedules.b11Weekend
                                            : BusSchedules.b11Weekday,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.expand, size: 14),
                  label: const Text("Expand"),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B5563),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.thumbtack, size: 14),
                  label: const Text("Pin to homescreen"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BusLineRow extends StatelessWidget {
  final String line;
  final List<String> times;

  const BusLineRow({super.key, required this.line, required this.times});

  @override
  Widget build(BuildContext context) {
    // Show up to 3 upcoming departures
    final displayTimes = times.take(3).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF374151)),
      ),
      child: Row(
        children: [
          // Bus line circle
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                line,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Times inline
          Expanded(
            child: displayTimes.isEmpty
                ? const Text(
                    "No more buses today",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: displayTimes
                        .map(
                          (t) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              t,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

class FullScheduleSheet extends StatelessWidget {
  final String line;
  final List<String> schedule;

  const FullScheduleSheet({
    super.key,
    required this.line,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1F2937), // neutral-800
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                "Line $line Schedule",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: schedule.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      leading: const Icon(
                        Icons.schedule,
                        size: 18,
                        color: Colors.grey,
                      ),
                      title: Text(
                        schedule[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// --------------------
// TODO: Build real BusWidgetCard, UsageStats, RecentActivity,
// QuickActions, ThemeSelector, NotificationSettings, DataUsage,
// SupportSection, Footer widgets
// --------------------
