import 'package:flutter/material.dart';
import 'servisler/sharedpreferencesservice.dart';
import 'ekranlar/anaekran.dart';
import 'ekranlar/kategoriekrani.dart';
import 'ekranlar/profilekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  bool Koyutemami = await SharedPreferencesServisi.TemaGetir();
  runApp(AnaUygulama(Koyutemami: Koyutemami));
}

class AnaUygulama extends StatefulWidget {
  final bool Koyutemami;

  const AnaUygulama({super.key, required this.Koyutemami});

  @override
  State<AnaUygulama> createState() => AnaUygulamaDurumu();
}

class AnaUygulamaDurumu extends State<AnaUygulama> {
  late bool Koyutema;

  @override
  void initState() {
    super.initState();
    Koyutema = widget.Koyutemami;
  }

  void TemayiGuncelle(bool Deger) {
    setState(() {
      Koyutema = Deger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spor Yönetimi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      themeMode: Koyutema ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => AnaEkran(TemaDegistirici: TemayiGuncelle),
        '/kategoriler': (context) => KategoriEkrani(TemaDegistirici: TemayiGuncelle),
        '/profil': (context) => ProfilEkrani(TemaDegistirici: TemayiGuncelle), // 'ı' harfi 'i' olarak düzeltildi
      },
    );
  }
}