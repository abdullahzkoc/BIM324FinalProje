import 'package:cloud_firestore/cloud_firestore.dart';
import '../modeller/spormodeli.dart';

class FirebaseServisi {
  static final FirebaseFirestore _Veritabani = FirebaseFirestore.instance;

  // Anlık (Gerçek zamanlı) veri akışı için Stream kullanıyoruz
  static Stream<List<SporModeli>> SporlariGetir() {
    return _Veritabani.collection('sporlar').snapshots().map((Koleksiyon) {
      return Koleksiyon.docs.map((Dokuman) {
        return SporModeli(
          Id: Dokuman.id,
          SporAdi: Dokuman['sporAdi'] ?? 'İsimsiz', // Firebase'deki alan adıyla birebir aynı olmalı
          Aciklama: Dokuman['aciklama'] ?? '',      // Firebase'deki alan adıyla birebir aynı olmalı
          ResimUrl: Dokuman['resimUrl'] ?? '',      // Supabase'den kopyaladığın link buraya düşüyor
        );
      }).toList();
    });
  }
}