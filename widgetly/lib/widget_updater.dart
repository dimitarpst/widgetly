import 'package:home_widget/home_widget.dart';

class WidgetUpdater {
  static Future<void> updateBusWidget({
    required String line1,
    required List<String> nextTimes1,
    required String line2,
    required List<String> nextTimes2,
  }) async {
    final now = DateTime.now();

    String toRelative(String raw) {
      final parts = raw.split(":");
      final dep = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
      final diff = dep.difference(now).inMinutes;
      if (diff < 0) return "--"; // already passed

      final hours = diff ~/ 60; // integer division
      final minutes = diff % 60;

      if (hours > 0) {
        if (minutes > 0) {
          return "$hoursч $minutesм";
        } else {
          return "$hoursч";
        }
      } else {
        return "$minutesм";
      }
    }

    // Take max 3 departures, pad with "--"
    List<String> pad(List<String> times) {
      final list = times.take(3).toList();
      while (list.length < 3) {
        list.add("--");
      }
      return list;
    }

    final rel1 = pad(nextTimes1).map(toRelative).toList();
    final abs1 = pad(nextTimes1).toList();

    final rel2 = pad(nextTimes2).map(toRelative).toList();
    final abs2 = pad(nextTimes2).toList();

    await HomeWidget.saveWidgetData('line1', line1);
    await HomeWidget.saveWidgetData('times1_relative', rel1.join(","));
    await HomeWidget.saveWidgetData('times1_absolute', abs1.join(","));

    await HomeWidget.saveWidgetData('line2', line2);
    await HomeWidget.saveWidgetData('times2_relative', rel2.join(","));
    await HomeWidget.saveWidgetData('times2_absolute', abs2.join(","));

    await HomeWidget.updateWidget(
      name: 'BusAppWidgetProvider',
      androidName: 'BusAppWidgetProvider',
    );
  }
}
