class Permission {
  final String name;
  final String value;

  Permission({
    required this.name,
    required this.value,
  });

  bool canRead() {
    if (value.toUpperCase().contains('read'.toUpperCase())) {
      return true;
    }

    return false;
  }

  bool canWrite() {
    if (value.toUpperCase() == 'read_write'.toUpperCase()) {
      return true;
    }

    return false;
  }

  Map<String, dynamic> toCache() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory Permission.fromCache(Map<String, dynamic> cache) {
    return Permission(
      name: cache['name'],
      value: cache['value'],
    );
  }
}
