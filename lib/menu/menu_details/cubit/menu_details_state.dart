part of 'menu_details_cubit.dart';

abstract class MenuDetailsState extends Equatable {
  const MenuDetailsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class MenuDetailsLoadingState extends MenuDetailsState {
  const MenuDetailsLoadingState();
}

class MenuDetailsLoadedState extends MenuDetailsState {
  const MenuDetailsLoadedState({
    required this.item,
    required this.extras,

  });

  final Item item;
  final List<Extra> extras;

  @override
  List<Object?> get props => <dynamic>[
        item,
        extras,
      ];
}
