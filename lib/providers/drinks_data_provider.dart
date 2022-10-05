import 'package:restaurant/models/drink/drink.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrinksDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Drink>> fetchAllDrink() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection('drink').get();

    final Map<String, Drink> drinks = <String, Drink>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Drink drink = Drink.fromJson(doc.data()..['id'] = doc.id);
      drinks[doc.id] = drink;
    }

    return drinks;
  }

  Stream<List<Drink>> getDrinkStream() {
    return _firebaseFirestore.collection('drink').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Drink.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
