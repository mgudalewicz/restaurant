import 'package:flutter/material.dart';
import 'package:restaurant/menu/menu_screen.dart';
import 'package:restaurant/user_profile.dart/user_profile.dart';
import 'package:restaurant/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.pageIndex,
  });

  final int? pageIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.pageIndex != null) {
      currentIndex = widget.pageIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      home: Scaffold(
        appBar: AppBarWidget(title: currentIndex == 0 ? 'Menu' : 'Twoje konto'),
        body: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const MenuScreen();
          }
          return const UserProfile();
        }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.black,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          fixedColor: Colors.white,
          onTap: (newIndex) {
            setState(
              () {
                currentIndex = newIndex;
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Twoje konto',
            ),
          ],
        ),
      ),
    );
  }
}
