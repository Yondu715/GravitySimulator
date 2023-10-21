import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});


  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => goBack(context),
    ));
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
