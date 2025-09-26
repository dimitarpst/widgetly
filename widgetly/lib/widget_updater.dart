import 'package:home_widget/home_widget.dart';

class WidgetUpdater {
  static Future<void> updateBusWidget({
    required String line1,
    required List<String> nextTimes1,
    required String line2,
    required List<String> nextTimes2,
  }) async {
    final now = DateTime.now();

    String toRelative(List<String> rawTimes) {
      return rawTimes
          .take(3)
          .map((raw) {
            final parts = raw.split(":");
            final dep = DateTime(
              now.year,
              now.month,
              now.day,
              int.parse(parts[0]),
              int.parse(parts[1]),
            );
            final diff = dep.difference(now).inMinutes;
            return "$diff мин";
          })
          .join(",");
    }

    await HomeWidget.saveWidgetData('line1', line1);
    await HomeWidget.saveWidgetData('times1', toRelative(nextTimes1));
    await HomeWidget.saveWidgetData('line2', line2);
    await HomeWidget.saveWidgetData('times2', toRelative(nextTimes2));

    await HomeWidget.updateWidget(
      name: 'BusAppWidgetProvider',
      androidName: 'BusAppWidgetProvider',
    );
  }
}
