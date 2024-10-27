import 'package:quran_app/Network/network_helper.dart';
import 'package:quran_app/models/surahs_model.dart';

class SurahsRepo {
  NetworkHelper networkHelper = NetworkHelper("https://api.alquran.cloud/v1/quran/ar.asad");

  Future<List<Surahs>> getSurahs() async {
    Map<String, dynamic>? body = await networkHelper.getBody();
    if(body!=null){
    var surahsList = body["data"]["surahs"] as List;
    return surahsList.map((surah) => Surahs.fromJson(surah)).toList();
    }
    return [];
  }
}
