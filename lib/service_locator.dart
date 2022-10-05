import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'managers/_managers.dart';
import 'providers/_provider.dart';

final sl = GetIt.instance;

void configureDepenedencies() {
  //Firebase
  sl.registerSingleton(FirebaseFirestore.instance);
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(FirebaseStorage.instance);

  //Provider
  sl.registerFactory(() => DrinksDataProvider());
  sl.registerFactory(() => ExtrasDataProvider());
  sl.registerFactory(() => MainCoursesDataProvider());
  sl.registerFactory(() => PizzasDataProvider());
  sl.registerFactory(() => SoupsDataProvider());

  //Manager
  sl.registerFactory(() => DrinksDataManager());
  sl.registerFactory(() => ExtrasDataManager());
  sl.registerFactory(() => MainCoursesDataManager());
  sl.registerFactory(() => PizzasDataManager());
  sl.registerFactory(() => SoupsDataManager());

}
