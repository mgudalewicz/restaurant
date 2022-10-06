import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/menu/menu_details/cubit/menu_details_cubit.dart';
import 'package:restaurant/menu/menu_details/menu_deatils_body.dart';

class MenuDetailsScreen extends StatelessWidget {
  const MenuDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MenuDetailsCubit()..init(id),
        child: BlocBuilder<MenuDetailsCubit, MenuDetailsState>(builder: (context, state) {
          if (state is MenuDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MenuDetailsLoadedState) {
            return MenuDetailsBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
