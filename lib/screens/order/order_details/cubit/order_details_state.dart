part of 'order_details_cubit.dart';

abstract class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object?> get props => <dynamic>[];
}

class OrderDetailsLoadingState extends OrderDetailsState {
  const OrderDetailsLoadingState();
}

class OrderDetailsLoadedState extends OrderDetailsState {
  const OrderDetailsLoadedState({
    required this.suborder,
    required this.order,
    required this.items,
    required this.extras,
  });

  final List<Suborder> suborder;
  final Order order;
  final List<Item> items;
  final List<Extra> extras;

  @override
  List<Object?> get props => <dynamic>[
        suborder,
        order,
        items,
        extras,
      ];
}
