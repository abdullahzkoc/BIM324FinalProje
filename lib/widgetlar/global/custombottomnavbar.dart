import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int Seciliindeks;
  final Function(int) IndeksDegistirici;

  const CustomBottomNavBar({
    super.key, 
    required this.Seciliindeks, 
    required this.IndeksDegistirici
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Seciliindeks,
      onTap: IndeksDegistirici,
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Kategoriler'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}