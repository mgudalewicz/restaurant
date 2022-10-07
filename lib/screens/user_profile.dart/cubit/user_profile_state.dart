part of 'user_profile_cubit.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => <dynamic>[];
}

class UserProfileLoadingState extends UserProfileState {
  const UserProfileLoadingState();
}

class UserProfileLoadedState extends UserProfileState {
  const UserProfileLoadedState({
    required this.user,
    required this.orders,

  });

  final List<Order> orders;
  final User user;


  @override
  List<Object?> get props => <dynamic>[
        user,
        orders,

      ];
}