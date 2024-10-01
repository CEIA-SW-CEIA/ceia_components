class ListUtils {
  static List<String> dynamicToStringList(dynamic list) {
    return list != null ? (list as List).map((element) => element as String).toList() : [];
  }
}
