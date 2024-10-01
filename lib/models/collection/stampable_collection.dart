import 'package:ceia_components/models/collection/firebase_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';

class StampableCollection extends FirebaseCollection {
  DateTime? createdAt;
  DateTime? updatedAt;
  CommonPersonInfo? author;

  StampableCollection(
      {super.id,
      this.createdAt,
      this.updatedAt,
      this.author,
      super.docRef});
}
