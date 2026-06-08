class SporModeli {
  String Id;
  String SporAdi;
  String Aciklama;
  String ResimUrl; // Supabase'den gelecek

  SporModeli({
    required this.Id, 
    required this.SporAdi, 
    required this.Aciklama, 
    required this.ResimUrl
  });
}