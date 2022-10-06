import 'package:flutter/material.dart';
import 'package:restaurant/menu/menu_details/cubit/menu_details_cubit.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/widgets/app_bar_widget.dart';
import 'package:restaurant/widgets/dish_mapper.dart';

class MenuDetailsBody extends StatefulWidget {
  const MenuDetailsBody({
    super.key,
    required this.state,
  });

  final MenuDetailsLoadedState state;

  @override
  State<MenuDetailsBody> createState() => _MenuDetailsBodyState();
}

class _MenuDetailsBodyState extends State<MenuDetailsBody> {
  bool thereAreAdditions = false;

  @override
  void initState() {
    thereAreAdditions = widget.state.extras.isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: DishMapper.getName(widget.state.item.category)),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Text(
            widget.state.item.name,
            style: const TextStyle(fontSize: 30.0),
          ),
          if (thereAreAdditions)
            Column(
              children: [
                _toppingsListtView(context),
              ],
            ),
        ],
      ),
    );
  }

  Widget _toppingsListtView(BuildContext context) {
    List<Extra> toppingsList = widget.state.extras.where((Extra extra) => extra.subcategory == 'toppings').toList();
    if (toppingsList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dodatki',
            style: TextStyle(fontSize: 25.0),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final topping in toppingsList) ...[
                Column(
                  children: [
                    Text(topping.name),
                    Text('cena: ${topping.prize.toStringAsFixed(2)}'),
                  ],
                )
              ],
            ],
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
