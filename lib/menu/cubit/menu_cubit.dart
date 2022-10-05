import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/managers/_managers.dart';
import 'package:restaurant/models/drink/drink.dart';
import 'package:restaurant/models/main_course/main_course.dart';
import 'package:restaurant/models/pizza/pizza.dart';
import 'package:restaurant/models/soups/soup.dart';
import 'package:restaurant/service_locator.dart';
import 'package:rxdart/rxdart.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuLoadingState());

  final DrinksDataManager _drinksDataManager = sl();
  final MainCoursesDataManager _mainMainCoursesDataManager = sl();
  final PizzasDataManager _pizzasDataManager = sl();
  final SoupsDataManager _soupsDataManager = sl();


  StreamSubscription<dynamic>? _subscription;

  Future<void> init() async {
    await _drinksDataManager.fetch();
    await _mainMainCoursesDataManager.fetch();
    await _pizzasDataManager.fetch();
    await _soupsDataManager.fetch();


    _subscription = CombineLatestStream.combine4(
      _drinksDataManager.getAllDrinks(),
      _mainMainCoursesDataManager.getAllMainCourses(),
      _pizzasDataManager.getAllPizzas(),
      _soupsDataManager.getAllSoups(),
      (
        List<Drink> drinks,
        List<MainCourse> mainMainCourses,
        List<Pizza> pizzas,
        List<Soup> soups,

      ) {
        emit(
          MenuLoadedState(
            mainCourses: mainMainCourses,
            pizzas: pizzas,
            soups: soups,
            drinks: drinks,
          ),
        );
      },
    ).listen((_) {});
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}