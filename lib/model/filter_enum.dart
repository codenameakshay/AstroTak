enum FilterRange {
  all,
  pastWeek,
  pastMonth,
  pastYear,
  custom,
}

extension FilterRangeExtension on FilterRange {
  String get title {
    switch (this) {
      case FilterRange.all:
        return 'All';
      case FilterRange.pastWeek:
        return 'Past Week';
      case FilterRange.pastMonth:
        return 'Past Month';
      case FilterRange.pastYear:
        return 'Past Year';
      case FilterRange.custom:
        return 'Custom';
      default:
        return 'All';
    }
  }
}
