import 'package:flutter/material.dart';
import '../../servisler/sqliteservice.dart';
import '../../servisler/sharedpreferencesservice.dart';
import '../../modeller/kullanicimodeli.dart';

class CustomAppDrawer extends StatefulWidget {
  // Temayı değiştirdiğimizde ana uygulamanın anında tepki vermesi için fonksiyon alıyoruz
  final Function(bool) TemaDegistirici;

  const CustomAppDrawer({super.key, required this.TemaDegistirici});

  @override
  State<CustomAppDrawer> createState() => CustomAppDrawerDurumu();
}

class CustomAppDrawerDurumu extends State<CustomAppDrawer> {
  KullaniciModeli? Gecerlikullanici;
  bool Koyutema = false;

  @override
  void initState() {
    super.initState();
    BilgileriYukle();
  }

  Future<void> BilgileriYukle() async {
    // SQLite'tan senin bilgilerini çeker
    KullaniciModeli? Veri = await SqliteServisi.Ornek.KullaniciyiGetir();
    // SharedPreferences'tan hafızaya alınmış tema ayarını okur
    bool Temadurumu = await SharedPreferencesServisi.TemaGetir();

    if (mounted) {
      setState(() {
        Gecerlikullanici = Veri;
        Koyutema = Temadurumu;
      });
    }
  }

  void TemaAyarla(bool Deger) async {
    await SharedPreferencesServisi.TemaKaydet(Deger); // Yeni ayarı telefona kaydet
    setState(() { Koyutema = Deger; });
    widget.TemaDegistirici(Deger); // Ana uygulamanın (main.dart) rengini anında değiştir
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.indigo),
            accountName: Text(Gecerlikullanici != null ? '${Gecerlikullanici!.Ad} ${Gecerlikullanici!.Soyad}' : 'Yükleniyor...'),
            accountEmail: Text(Gecerlikullanici?.Eposta ?? 'Bekleyiniz...'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: Gecerlikullanici != null
                  ? NetworkImage(Gecerlikullanici!.ProfilResmiUrl)
                  : null,
              child: Gecerlikullanici == null ? const CircularProgressIndicator(color: Colors.indigo) : null,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Ana Sayfa'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Kategoriler'),
            onTap: () => Navigator.pushReplacementNamed(context, '/kategoriler'),
          ),
          const Spacer(),
          const Divider(),
          // Tema Değiştirme Butonu (Switch)
          SwitchListTile(
            title: const Text('Koyu Tema', style: TextStyle(fontWeight: FontWeight.bold)),
            secondary: Icon(Koyutema ? Icons.dark_mode : Icons.light_mode, color: Colors.indigo),
            value: Koyutema,
            onChanged: TemaAyarla,
            activeThumbColor: Colors.indigo,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}