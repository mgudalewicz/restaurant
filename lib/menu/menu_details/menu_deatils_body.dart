import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/home_page/home_page.dart';
import 'package:restaurant/menu/menu_details/cubit/menu_details_cubit.dart';
import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/widgets/app_bar_widget.dart';
import 'package:restaurant/widgets/dish.dart';
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
  List<String> extrasList = [];
  double prize = 0;
  int value = 0;
  int amount = 1;

  @override
  void initState() {
    thereAreAdditions = widget.state.extras.isNotEmpty;
    prize = widget.state.item.prize;
    if (widget.state.item.name == 'Schabowy') {
      extrasList.add(widget.state.extras.firstWhere((Extra extra) => extra.name == 'frytki').id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prize = widget.state.item.prize;
    if (thereAreAdditions == true) {
      for (var i = 0; i < extrasList.length; i++) {
        prize += widget.state.extras.firstWhere((Extra extra) => extra.id == extrasList[i]).prize;
      }
    }
    prize *= amount;
    return Scaffold(
      appBar: AppBarWidget(title: DishMapper.getName(widget.state.item.category)),
      bottomNavigationBar: AddToOrder(context),
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
                const SizedBox(height: 20),
                if (widget.state.item.name == 'Schabowy') _choiceAdditionToPorkchop(),
                const SizedBox(height: 20),
                _toppingsListtView(context),
                const SizedBox(height: 20),
                _doughListtView(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 25,
                      onPressed: (() => setState(() {
                            if (amount > 1) {
                              amount -= 1;
                            }
                          })),
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      amount.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      iconSize: 25,
                      onPressed: (() => setState(() {
                            amount += 1;
                          })),
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }

  Material AddToOrder(BuildContext context) {
    return Material(
      color: Colors.red,
      child: InkWell(
        onTap: () {
          context
              .read<MenuDetailsCubit>()
              .save(prize: prize, itemId: widget.state.item.id, orderId: 'test', amount: amount, extrasId: extrasList);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
          child: Center(
            child: Text(
              'Dodaj do zamówienia (${prize.toStringAsFixed(2)}zł)',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _toppingsListtView(BuildContext context) {
    List<Extra> toppingsList = widget.state.extras.where((Extra extra) => extra.subcategory == 'toppings').toList();
    bool isPizza = widget.state.item.category == Dish.pizza;
    if (toppingsList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isPizza ? 'Dodatki do pizzy' : 'Dodatki',
            style: const TextStyle(fontSize: 15.0),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final topping in toppingsList) ...[
                card(topping),
              ],
            ],
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _doughListtView(BuildContext context) {
    List<Extra> doughList = widget.state.extras.where((Extra extra) => extra.subcategory == 'dough').toList();
    if (doughList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Modyfikacja ciasta',
            style: TextStyle(fontSize: 15.0),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final dough in doughList) ...[
                card(dough),
              ],
            ],
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget card(Extra extra) {
    return GestureDetector(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        extra.name,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        'cena: ${extra.prize.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                  Checkbox(
                    value: extrasList.contains(extra.id),
                    onChanged: (bool? value) {
                      setState(
                        () {
                          if (value == true) {
                            extrasList.add(extra.id);
                          } else {
                            extrasList.remove(extra.id);
                          }
                          print(extrasList);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _choiceAdditionToPorkchop() {
    List<Extra> porkchopToppingsList =
        widget.state.extras.where((Extra extra) => extra.subcategory == 'porkchop').toList();
    if (porkchopToppingsList.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('Frytki'),
                Radio(
                    value: 0,
                    groupValue: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue!;
                        extrasList.add(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'frytki').id);
                        extrasList.remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ryż').id);
                        extrasList
                            .remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ziemniaki').id);
                      });
                    }),
              ],
            ),
            Column(
              children: [
                const Text('Ryż'),
                Radio(
                    value: 1,
                    groupValue: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue!;
                        extrasList.remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'frytki').id);
                        extrasList.add(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ryż').id);
                        extrasList
                            .remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ziemniaki').id);
                      });
                    }),
              ],
            ),
            Column(
              children: [
                const Text('Ziemniaki'),
                Radio(
                    value: 2,
                    groupValue: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue!;
                        extrasList.remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'frytki').id);
                        extrasList.remove(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ryż').id);
                        extrasList.add(porkchopToppingsList.firstWhere((Extra extra) => extra.name == 'ziemniaki').id);
                      });
                    }),
              ],
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
