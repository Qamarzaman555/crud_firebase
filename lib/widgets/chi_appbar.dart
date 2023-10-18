import 'package:flutter/material.dart';

class CHIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CHIAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      // backgroundColor: Colors.orange,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
