import 'package:intl/intl.dart';

import '';

extension DTExtension on DateTime? {
  List<DateTime> get getDatesForWeek {
    if (this == null) {
      return [];
    }
    List<DateTime> datesInWeek = [];
    DateTime startOfWeek = this!.subtract(Duration(days: this!.weekday - 1));
    for (int i = 0; i < 7; i++) {
      datesInWeek.add(startOfWeek.add(Duration(days: i)));
    }
    return datesInWeek;
  }

  int get weeksDifference {
    if (this == null) {
      return 0;
    }
    final currentDate = DateTime.now();
    final difference = this!.difference(currentDate);
    final weeksDiff = (difference.inSeconds / (7 * 24 * 60 * 60));
    if (weeksDiff > 0) {
      return weeksDiff.ceil();
    }
    return weeksDiff.floor();
  }

  DateTime get startOfWeek {
    if (this == null) {
      return DateTime.now();
    }
    return this!.subtract(Duration(days: this!.weekday - 1));
  }

  DateTime get endOfWeek {
    if (this == null) {
      return DateTime.now();
    }
    return this!.add(Duration(days: DateTime.daysPerWeek - this!.weekday));
  }

  String get formattedWeek {
    if (this == null) {
      return '';
    }

    final startOfWeek = this!.subtract(Duration(days: this!.weekday - 1));
    final endOfWeek = this!.add(Duration(days: DateTime.daysPerWeek - this!.weekday));

    final startMonth = DateFormat.MMM().format(startOfWeek);
    final endMonth = DateFormat.MMM().format(endOfWeek);

    String startPart = '${startOfWeek.day} $startMonth';
    String endPart = '${endOfWeek.day} $endMonth';

    if (startOfWeek.year != DateTime.now().year) {
      startPart = '$startPart ${startOfWeek.year}';
    }
    if (endOfWeek.year != DateTime.now().year) {
      endPart = '$endPart ${endOfWeek.year}';
    }

    return '$startPart - $endPart';
  }

  String get formattedDay {
    if (this == null) {
      return '';
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

  if (this!.isAtSameMomentAs(today)) {
      return 'today';
    } else if (this!.isAtSameMomentAs(yesterday)) {
      return 'yesterday';
    } else if (this!.isAtSameMomentAs(tomorrow)) {
      return 'tomorrow';
    } else if (this!.year == now.year) {
      final dateFormat = DateFormat('dd MMM');
      return dateFormat.format(this!);
    } else {
      final dateFormat = DateFormat('dd MMM y');
      return dateFormat.format(this!);
    }
  }

}