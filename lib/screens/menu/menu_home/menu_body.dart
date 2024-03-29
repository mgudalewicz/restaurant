import 'package:flutter/material.dart';

import 'package:restaurant/models/item/item.dart';
import 'package:restaurant/screens/menu/menu_details/menu_details_screen.dart';
import 'package:restaurant/screens/menu/menu_home/cubit/menu_cubit.dart';
import 'package:restaurant/screens/menu/menu_home/widgets/menu_card.dart';
import 'package:restaurant/screens/order/order_details/order_details_screen.dart';
import 'package:restaurant/widgets/dish.dart';
import 'package:restaurant/widgets/dish_mapper.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({
    super.key,
    required this.state,
  });

  final MenuLoadedState state;

  @override
  State<MenuBody> createState() => _MenuBodyBodyState();
}

class _MenuBodyBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _pizzasListView(context),
                const SizedBox(height: 10),
                _mainCoursesListtView(context),
                const SizedBox(height: 10),
                _soupsListView(context),
                const SizedBox(height: 10),
                _drinksListView(context),
              ],
            ),
          ),
          if (widget.state.order.prize != 0) _orderButton(),
        ],
      ),
    );
  }

  Widget _orderButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: kToolbarHeight,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(
                  orderId: widget.state.order.id,
                ),
              ),
            );
          },
          child: Center(
            child: Text(
              'Zamówienie (${widget.state.order.prize.toStringAsFixed(2)}zł)',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pizzasListView(BuildContext context) {
    List<Item> pizzasList = widget.state.items.where((Item item) => item.category == Dish.pizza).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DishMapper.getName(Dish.pizza),
          style: const TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final pizza in pizzasList) ...[
              MenuCard(
                name: pizza.name,
                prize: pizza.prize,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuDetailsScreen(
                        id: pizza.id,
                        orderId: widget.state.order.id,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _mainCoursesListtView(BuildContext context) {
    List<Item> mainCoursesList = widget.state.items.where((Item item) => item.category == Dish.maincourse).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DishMapper.getName(Dish.maincourse),
          style: const TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final mainCourse in mainCoursesList) ...[
              MenuCard(
                name: mainCourse.name,
                prize: mainCourse.prize,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuDetailsScreen(
                        id: mainCourse.id,
                        orderId: widget.state.order.id,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _soupsListView(BuildContext context) {
    List<Item> soupsList = widget.state.items.where((Item item) => item.category == Dish.soups).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DishMapper.getName(Dish.soups),
          style: const TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final soup in soupsList) ...[
              MenuCard(
                name: soup.name,
                prize: soup.prize,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuDetailsScreen(
                        id: soup.id,
                        orderId: widget.state.order.id,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _drinksListView(BuildContext context) {
    List<Item> drinksList = widget.state.items.where((Item item) => item.category == Dish.drinks).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DishMapper.getName(Dish.drinks),
          style: const TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final drink in drinksList) ...[
              MenuCard(
                name: drink.name,
                prize: drink.prize,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuDetailsScreen(
                        orderId: widget.state.order.id,
                        id: drink.id,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ],
    );
  }
}
