import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/menu/menu_home/cubit/menu_cubit.dart';
import 'package:restaurant/screens/menu/menu_home/menu_body.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MenuCubit()..init(),
        child: BlocBuilder<MenuCubit, MenuState>(builder: (context, state) {
          if (state is MenuLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MenuLoadedState) {
            return MenuBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
