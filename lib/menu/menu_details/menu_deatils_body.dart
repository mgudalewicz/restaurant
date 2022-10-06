import 'package:flutter/material.dart';
import 'package:restaurant/menu/menu_details/cubit/menu_details_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
