import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Item>> fetchAllItem() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.items).get();

    final Map<String, Item> items = <String, Item>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Item item = Item.fromJson(doc.data()..['id'] = doc.id);
      items[doc.id] = item;
    }

    return items;
  }

  Stream<List<Item>> getItemsStream() {
    return _firebaseFirestore.collection(Collections.items).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Item.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
