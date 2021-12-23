enum FilterRange {
  all,
  experienceHtL,
  experienceLtH,
  priceHtL,
  priceLtH,
}

extension FilterRangeExtension on FilterRange {
  String get title {
    switch (this) {
      case FilterRange.all:
        return 'All';
      case FilterRange.experienceHtL:
        return 'Experience - High to Low';
      case FilterRange.experienceLtH:
        return 'Experience - Low to High';
      case FilterRange.priceHtL:
        return 'Price - High to Low';
      case FilterRange.priceLtH:
        return 'Price - Low to High';
      default:
        return 'All';
    }
  }
}
