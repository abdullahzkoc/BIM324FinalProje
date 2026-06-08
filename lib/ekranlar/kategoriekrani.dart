import 'package:flutter/material.dart';
import '../widgetlar/global/customappbar.dart';
import '../widgetlar/global/customappdrawer.dart';
import '../widgetlar/global/custombottomnavbar.dart';

class KategoriEkrani extends StatefulWidget {
  final Function(bool) TemaDegistirici;

  const KategoriEkrani({super.key, required this.TemaDegistirici});

  @override
  State<KategoriEkrani> createState() => KategoriEkraniDurumu();
}

class KategoriEkraniDurumu extends State<KategoriEkrani> {
  int Seciliindeks = 1;

  final List<String> Kategoriler = [
    'Takım Yönetimi',
    'Bireysel Performans',
    'Salon Sporları',
    'Açık Alan Organizasyonları'
  ];

  void IndeksDegistir(int Indeks) {
    setState(() {
      Seciliindeks = Indeks;
    });
    if (Indeks == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (Indeks == 2) {
      Navigator.pushReplacementNamed(context, '/profil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: CustomAppDrawer(TemaDegistirici: widget.TemaDegistirici),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: Kategoriler.length,
        itemBuilder: (context, Indeks) {
          final Kategori = Kategoriler[Indeks];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.sports, color: Colors.indigo),
              title: Text(Kategori, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$Kategori detayları yakında aktif edilecek.')),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        Seciliindeks: Seciliindeks,
        IndeksDegistirici: IndeksDegistir,
      ),
    );
  }
}