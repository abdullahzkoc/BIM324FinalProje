import 'package:flutter/material.dart';
import '../widgetlar/global/customappbar.dart';
import '../widgetlar/global/customappdrawer.dart';
import '../widgetlar/global/custombottomnavbar.dart';
import '../servisler/sqliteservice.dart';
import '../modeller/kullanicimodeli.dart';

class ProfilEkrani extends StatefulWidget {
  final Function(bool) TemaDegistirici;

  const ProfilEkrani({super.key, required this.TemaDegistirici});

  @override
  State<ProfilEkrani> createState() => ProfilEkraniDurumu();
}

class ProfilEkraniDurumu extends State<ProfilEkrani> {
  int Seciliindeks = 2;
  KullaniciModeli? Gecerlikullanici;

  @override
  void initState() {
    super.initState();
    KullaniciyiYukle();
  }

  Future<void> KullaniciyiYukle() async {
    KullaniciModeli? Veri = await SqliteServisi.Ornek.KullaniciyiGetir();
    if (mounted) {
      setState(() {
        Gecerlikullanici = Veri;
      });
    }
  }

  void IndeksDegistir(int Indeks) {
    setState(() {
      Seciliindeks = Indeks;
    });
    if (Indeks == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (Indeks == 1) {
      Navigator.pushReplacementNamed(context, '/kategoriler');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: CustomAppDrawer(TemaDegistirici: widget.TemaDegistirici),
      body: Gecerlikullanici == null
          ? const Center(child: CircularProgressIndicator(color: Colors.indigo))
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.indigo.shade100,
                      backgroundImage: NetworkImage(Gecerlikullanici!.ProfilResmiUrl),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '${Gecerlikullanici!.Ad} ${Gecerlikullanici!.Soyad}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Gecerlikullanici!.Eposta,
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.star_border, color: Colors.indigo),
                              title: Text('Sistem Yetkisi'),
                              trailing: Text('Tam Yetki', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.security, color: Colors.indigo),
                              title: Text('Veritabanı Türü'),
                              trailing: Text('SQLite Yerel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: CustomBottomNavBar(
        Seciliindeks: Seciliindeks,
        IndeksDegistirici: IndeksDegistir,
      ),
    );
  }
}