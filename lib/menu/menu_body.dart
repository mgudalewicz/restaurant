import 'package:flutter/material.dart';
import 'package:restaurant/menu/cubit/menu_cubit.dart';
import 'package:restaurant/menu/widgets/menu_card.dart';
import 'package:restaurant/models/drink/drink.dart';
import 'package:restaurant/models/main_course/main_course.dart';
import 'package:restaurant/models/pizza/pizza.dart';
import 'package:restaurant/models/soups/soup.dart';

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
  late List<Drink> drinksList = widget.state.drinks;
  late List<MainCourse> mainCoursesList = widget.state.mainCourses;
  late List<Pizza> pizzasList = widget.state.pizzas;
  late List<Soup> soupsList = widget.state.soups;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _pizzasListView(context, pizzasList),
          const SizedBox(height: 10),
          _mainCoursesListtView(context, mainCoursesList),
          const SizedBox(height: 10),
          _soupsListView(context, soupsList),
          const SizedBox(height: 10),
          _drinksListView(context, drinksList),
        ],
      ),
    );
  }

  Widget _pizzasListView(BuildContext context, List<Pizza> pizzasList) {
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
                prize: pizza.prize.toString(),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _mainCoursesListtView(BuildContext context, List<MainCourse> mainCoursesList) {
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
                prize: mainCourse.prize.toString(),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _soupsListView(BuildContext context, List<Soup> soupsList) {
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
                prize: soup.prize.toString(),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _drinksListView(BuildContext context, List<Drink> drinksList) {
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
                prize: drink.prize.toString(),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
