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
  const MenuErrorState({
    required this.error,
  });

  final String error;

  @override
  List<dynamic> get props => <dynamic>[
        error,
      ];
}
class MenuLoadedState extends MenuState {
  const MenuLoadedState({
    required this.items,
  });

  final List<Item> items;

  @override
  List<Object?> get props => <dynamic>[
        items,
      ];
}
