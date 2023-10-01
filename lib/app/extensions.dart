extension NonNullString on String? {
  String orEmpty() {
    return this ?? "";
  }
}

extension nonNullInt on int? {
  orZero() {
    if (this == null) {
      return 0;
    } else {
      return this;
    }
  }
}
