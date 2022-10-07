import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/models/order/order.dart';
import 'package:restaurant/screens/first_page.dart';
import 'package:restaurant/screens/order/order_details/order_details_screen.dart';
import 'package:restaurant/screens/user_profile.dart/cubit/user_profile_cubit.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UserProfileLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Adres Email:'),
                  Text(state.user.email.toString()),
                ],
              ),
              IconButton(
                iconSize: 25,
                onPressed: () {
                  context.read<UserProfileCubit>().signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.yellow),
          const Text('Twoje zamówienia:'),
          Expanded(child: _orderListView(context))
        ],
      ),
    );
  }

  Widget _orderListView(BuildContext context) {
    List<Order> ordersList = state.orders.where((Order order) => order.inProgress == false).toList();
    ordersList.sort((a, b) => b.prize.compareTo(a.prize));

    return ListView(
      shrinkWrap: true,
      children: [
        for (final order in ordersList) ...[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.yellow.shade400,
                elevation: 1.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      border: Border.all(color: Colors.yellow.shade400),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Wartość zamówienia: ${order.prize.toStringAsFixed(2)}zł',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(
                    orderId: order.id,
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
