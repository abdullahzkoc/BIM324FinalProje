class SupabaseServisi {
  

  static const String KovaAdi = 'spor_resimleri';
  
  // İleride Firebase'e uzun uzun link yazmak yerine sadece 
  // 'futbol.jpg' yazarak linki otomatik oluşturmak istersen kullanabileceğin yardımcı fonksiyon:
  static String ResimLinkiOlustur(String ProjeUrl, String ResimAdi) {
    return '$ProjeUrl/storage/v1/object/public/$KovaAdi/$ResimAdi';
  }

  // Gelecekte eklenecek resim yükleme fonksiyonunun taslağı
  static Future<bool> ResimYukle(String DosyaYolu) async {
    try {
      // Supabase resim yükleme işlemleri buraya kodlanacak
      return true;
    } catch (Hata) {
      return false;
    }
  }
}