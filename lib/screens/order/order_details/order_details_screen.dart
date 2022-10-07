import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/order/order_details/cubit/order_details_cubit.dart';
import 'package:restaurant/screens/order/order_details/order_deatils_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    Key? key,
        required this.orderId,

  }) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OrderDetailsCubit()..init(orderId),
        child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(builder: (context, state) {
          if (state is OrderDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderDetailsLoadedState) {
            return OrderDetailsBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
