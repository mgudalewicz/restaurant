import 'package:flutter/material.dart';
import 'package:restaurant/menu/menu_home/cubit/menu_cubit.dart';
import 'package:restaurant/menu/menu_home/widgets/menu_card.dart';
import 'package:restaurant/models/item/item.dart';

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
      body: ListView(
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
    );
  }

  Widget _pizzasListView(BuildContext context) {
    List<Item> pizzasList = widget.state.items.where((Item item) => item.category == 'pizza').toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pizza',
          style: TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final pizza in pizzasList) ...[
              MenuCard(
                name: pizza.name,
                prize: pizza.prize,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _mainCoursesListtView(BuildContext context) {
    List<Item> mainCoursesList = widget.state.items.where((Item item) => item.category == 'main_course').toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Danie Główne',
          style: TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final mainCourse in mainCoursesList) ...[
              MenuCard(
                name: mainCourse.name,
                prize: mainCourse.prize,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _soupsListView(BuildContext context) {
    List<Item> soupsList = widget.state.items.where((Item item) => item.category == 'soups').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Zupy',
          style: TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final soup in soupsList) ...[
              MenuCard(
                name: soup.name,
                prize: soup.prize,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _drinksListView(BuildContext context) {
    List<Item> drinksList = widget.state.items.where((Item item) => item.category == 'drinks').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Napoje',
          style: TextStyle(fontSize: 25.0),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final drink in drinksList) ...[
              MenuCard(
                name: drink.name,
                prize: drink.prize,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
