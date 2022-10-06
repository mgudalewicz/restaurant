import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!, style: const TextStyle(fontSize: 25)) : null,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
