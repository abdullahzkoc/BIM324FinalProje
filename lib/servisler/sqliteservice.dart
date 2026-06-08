import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modeller/kullanicimodeli.dart';

class SqliteServisi {
  static final SqliteServisi Ornek = SqliteServisi._Iceriden();
  static Database? _Veritabani;

  SqliteServisi._Iceriden();

  Future<Database> get VeritabaniGetir async {
    if (_Veritabani != null) return _Veritabani!;
    _Veritabani = await VeritabaniBaslat();
    return _Veritabani!;
  }

  Future<Database> VeritabaniBaslat() async {
    String Yol = join(await getDatabasesPath(), 'spor_yonetimi.db');
    return await openDatabase(
      Yol,
      version: 1,
      onCreate: TabloOlustur,
    );
  }

  Future<void> TabloOlustur(Database Db, int Versiyon) async {
    await Db.execute('''
      CREATE TABLE kullanici(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        ad TEXT, 
        soyad TEXT, 
        eposta TEXT, 
        profil_resmi_url TEXT
      )
    ''');

    // Cihaza veritabanı ilk kurulduğunda senin bilgilerini otomatik ekler
    await Db.insert('kullanici', {
      'ad': 'Abdullah Zakir',
      'soyad': 'Koç',
      'eposta': '030723051@izu.edu.tr',
      // Supabase entegrasyonuna kadar geçici bir profil ikonu
      'profil_resmi_url': 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png' 
    });
  }

  Future<KullaniciModeli?> KullaniciyiGetir() async {
    Database Db = await VeritabaniGetir;
    List<Map<String, dynamic>> Sonuclar = await Db.query('kullanici', limit: 1);
    if (Sonuclar.isNotEmpty) {
      return KullaniciModeli.HaritadanOlustur(Sonuclar.first);
    }
    return null;
  }
}