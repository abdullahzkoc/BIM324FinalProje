import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServisi {
  static Future<void> TemaKaydet(bool KoyuTemaMi) async {
    final Tercihler = await SharedPreferences.getInstance();
    await Tercihler.setBool('koyu_tema', KoyuTemaMi);
  }

  static Future<bool> TemaGetir() async {
    final Tercihler = await SharedPreferences.getInstance();
    // Varsayılan olarak açık tema (false) döndürür
    return Tercihler.getBool('koyu_tema') ?? false; 
  }
}