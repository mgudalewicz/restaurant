import 'package:restaurant/models/pizza/pizza.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:restaurant/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PizzasDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Pizza>> fetchAllPizza() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.pizza).get();

    final Map<String, Pizza> pizzas = <String, Pizza>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Pizza pizza = Pizza.fromJson(doc.data()..['id'] = doc.id);
      pizzas[doc.id] = pizza;
    }

    return pizzas;
  }

  Stream<List<Pizza>> getPizzasStream() {
    return _firebaseFirestore.collection(Collections.pizza).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Pizza.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }
}
