import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/user_profile.dart/cubit/user_profile_cubit.dart';
import 'package:restaurant/screens/user_profile.dart/user_profile_body.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserProfileCubit()..init(),
        child: BlocBuilder<UserProfileCubit, UserProfileState>(builder: (context, state) {
          if (state is UserProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserProfileLoadedState) {
            return UserProfileBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
