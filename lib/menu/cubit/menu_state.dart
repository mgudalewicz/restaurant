part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => <dynamic>[];
}

class MenuLoadingState extends MenuState {
  const MenuLoadingState();
}

class MenuErrorState extends MenuState {
  const MenuErrorState();
}

class MenuLoadedState extends MenuState {
  const MenuLoadedState({
    required this.pizzas,
    required this.mainCourses,
    required this.soups,
    required this.drinks,

  });

  final List<Pizza> pizzas;
  final List<MainCourse> mainCourses;
  final List<Soup> soups;
  final List<Drink> drinks;


  @override
  List<Object?> get props => <dynamic>[
        pizzas,
        mainCourses,
        soups,
        drinks,
      ];
}
