import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Spor Yönetimi', style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    );
  }

  // AppBar'ın varsayılan yüksekliğini belirten zorunlu ayar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}