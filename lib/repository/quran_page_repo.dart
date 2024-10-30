
import 'package:quran_app/Network/network_helper.dart';
import 'package:quran_app/models/ayah_model.dart';

class QuranPageRepo {

  static getPage(int pageNumber)async{
    Map<String, dynamic>? response  = await NetworkHelper("https://api.alquran.cloud/v1/page/$pageNumber/quran-uthmani").getBody();
    if(response!=null){
      Map<String,dynamic> data = response["data"];
      List ayahs = data["ayahs"]??[];
      // return ayahs.map((ayah) => Ayah.fromJson(ayah)).toList();
      return List.generate(ayahs.length, (index) => Ayah.fromJson(ayahs[index]),growable: true);
    }
    return [];
  }
}