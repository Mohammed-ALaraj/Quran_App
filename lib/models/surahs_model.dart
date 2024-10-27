
class Surahs{
  int? surahNumber;
  String? surahName;
  int? numberOfAyahs;

  Surahs.fromJson(Map<String,dynamic> json){
    surahNumber = json['number'];
    surahName = json['name'];
    numberOfAyahs = json['numberOfAyahs'];
  }



  // getIndexes()async{
  //   NetworkHelper networkHelper = NetworkHelper('http://api.alquran.cloud/v1/surah');
  //   Map<String,dynamic>? data = await networkHelper.getBody();
  //   if(data!=null){
  //     List<Map<String,dynamic>> surah = data["data"];
  //   }
  // }


}