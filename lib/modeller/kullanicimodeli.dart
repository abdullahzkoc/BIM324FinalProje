class KullaniciModeli {
  int? Id;
  String Ad;
  String Soyad;
  String Eposta;
  String ProfilResmiUrl;

  KullaniciModeli({
    this.Id, 
    required this.Ad, 
    required this.Soyad, 
    required this.Eposta, 
    required this.ProfilResmiUrl
  });

  Map<String, dynamic> HaritayaCevir() {
    return {
      'id': Id,
      'ad': Ad,
      'soyad': Soyad,
      'eposta': Eposta,
      'profil_resmi_url': ProfilResmiUrl,
    };
  }

  factory KullaniciModeli.HaritadanOlustur(Map<String, dynamic> Harita) {
    return KullaniciModeli(
      Id: Harita['id'],
      Ad: Harita['ad'],
      Soyad: Harita['soyad'],
      Eposta: Harita['eposta'],
      ProfilResmiUrl: Harita['profil_resmi_url'],
    );
  }
}