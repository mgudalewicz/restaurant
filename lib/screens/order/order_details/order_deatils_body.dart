import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/models/suborder/suborder.dart';
import 'package:restaurant/screens/order/order_details/cubit/order_details_cubit.dart';
import 'package:restaurant/screens/order/order_details/order_details_screen.dart';
import 'package:restaurant/widgets/app_bar_widget.dart';
import 'package:restaurant/widgets/dish_mapper.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({
    super.key,
    required this.state,
  });

  final OrderDetailsLoadedState state;

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Zamówienie'),
      bottomNavigationBar: addToOrder(context),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final suborder in widget.state.suborder) ...[_pizzasListView(context, suborder)],
        ],
      ),
    );
  }

  Widget _pizzasListView(BuildContext context, Suborder suborder) {
    String prize = (suborder.amount * suborder.prize).toStringAsFixed(2);
    Item dinner = widget.state.items.firstWhere((Item item) => item.id == suborder.itemId);
    List<String> extrasName = [];
    for (final extraId in suborder.extrasId) {
      [extrasName.add(widget.state.extras.firstWhere((Extra extra) => extra.id == extraId).name)];
    }
    return Padding(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${dinner.name} (${DishMapper.getName(dinner.category)})',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (final extra in extrasName) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '+$extra',
                                  style: const TextStyle(fontSize: 12.0),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Ilość: ${suborder.amount}'),
                        Text('Cena: ${prize}zł'),
                      ],
                    ),
                    IconButton(
                      iconSize: 25,
                      onPressed: () {
                        context.read<OrderDetailsCubit>().deleteSuborder(
                              suborder: suborder,
                            );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OrderDetailsScreen(
                              orderId: widget.state.order.id,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addToOrder(BuildContext context) {
    return Material(
      color: Colors.red,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
          child: Center(
            child: Text(
              'Zamawiam (${widget.state.order.prize.toStringAsFixed(2)}zł)',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
