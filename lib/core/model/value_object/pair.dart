class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);

  Map<String, dynamic> toMap({
    required String firstKey,
    required String secondKey,
  }) =>
      {firstKey: first, secondKey: second};

  factory Pair.fromMap(Map<String, dynamic> map, {required String firstKey, required String secondKey}) {
    return Pair(
      map[firstKey] as A,
      map[secondKey] as B,
    );
  }

  @override
  String toString() {
    return 'Pair($first, $second)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair && runtimeType == other.runtimeType && first == other.first && second == other.second;

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}
