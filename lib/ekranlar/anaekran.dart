import 'package:flutter/material.dart';
import '../widgetlar/global/customappbar.dart';
import '../widgetlar/global/customappdrawer.dart';
import '../widgetlar/global/custombottomnavbar.dart';
import '../widgetlar/components/customcard.dart';
import '../modeller/spormodeli.dart';
import 'detayekrani.dart';

class AnaEkran extends StatefulWidget {
  final Function(bool) TemaDegistirici;

  const AnaEkran({super.key, required this.TemaDegistirici});

  @override
  State<AnaEkran> createState() => AnaEkranDurumu();
}

class AnaEkranDurumu extends State<AnaEkran> {
  int Seciliindeks = 0;

  // Geçici veri listesi (İleride Firebase NoSQL ve Supabase servislerine bağlanacak)
  final List<SporModeli> Sporlistesi = [
    SporModeli(Id: '1', SporAdi: 'Futbol Yönetimi', Aciklama: 'Futbol takımlarının idari, finansal ve teknik süreçlerinin modern yöntemlerle planlanması ve yönetilmesi işlemidir.', ResimUrl: 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2'),
    SporModeli(Id: '2', SporAdi: 'Basketbol Analizi', Aciklama: 'Takım performansları, oyuncu istatistikleri ve taktiksel şablonların dijital altyapı üzerinde koordine edilmesi.', ResimUrl: 'https://images.unsplash.com/photo-1546519638-68e109498ffc'),
    SporModeli(Id: '3', SporAdi: 'Tenis Organizasyonu', Aciklama: 'Bireysel turnuvalar, kort rezervasyonları ve sporcu lisanslama adımlarının tek merkezden takibi.', ResimUrl: 'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0'),
  ];

  void IndeksDegistir(int Indeks) {
    setState(() {
      Seciliindeks = Indeks;
    });
    if (Indeks == 1) {
      Navigator.pushReplacementNamed(context, '/kategoriler');
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
        itemCount: Sporlistesi.length,
        itemBuilder: (context, Indeks) {
          final Gecerlispor = Sporlistesi[Indeks];
          return CustomCard(
            Baslik: Gecerlispor.SporAdi,
            Altbaslik: Gecerlispor.Aciklama,
            ResimYolu: Gecerlispor.ResimUrl,
            TiklamaFonksiyonu: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetayEkrani(Gecerlispor: Gecerlispor),
                ),
              );
            },
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