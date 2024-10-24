

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{
  final String uri;
  NetworkHelper(this.uri);

  Future<Map<String, dynamic>?> getData()async{
    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    return null;
  }
}