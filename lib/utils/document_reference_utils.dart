import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentReferenceUtils {
  static DocumentReference getDocRefFromCollection(DocumentReference docRef, String collectionName) {
    List<String> pathSegments = docRef.path.split('/');

    // Initialize an empty path
    String targetPath = '';

    for (int i = 0; i < pathSegments.length; i += 2) {
      if (pathSegments[i] == collectionName) {
        targetPath = '${pathSegments[i]}/${pathSegments[i + 1]}';
        break;
      }
    }

    if (targetPath.isEmpty) {
      throw Exception('A collection informada não se encontra no docRef fornecido.');
    }

    return FirebaseFirestore.instance.doc(targetPath);
  }

  /// Converte um [String] em um [DocumentReference].
  /// O [String] precisa estar no formato "collection/document".
  ///
  /// Exemplo: "users/123456".
  ///
  /// Se estiver buscando uma subcollection, o [String] precisa estar no formato "collection/document/collection/document".
  ///
  /// Exemplo: "users/123456/orders/654321".
  static DocumentReference getDocRefFromPath(String path) {
    return FirebaseFirestore.instance.doc(path);
  }
}
