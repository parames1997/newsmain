import 'dart:convert';

import 'package:http/http.dart' as http;

class Newsapi{
  Future<Newsapi> getNews()async
  {
    var client=http.Client();
    // ignore: avoid_init_to_null
    var news=null;
        try{

    var response= await client.get(Uri.parse('https://saurav.tech/NewsAPI/top-headlines/category/health/in.json'));
    if(response.statusCode==200){
      var jsonString=response.body;
      var jsonMap=json.decode(jsonString);
      news =Newsapi.fromJson(jsonMap);
    }
  }catch (Exception){
    return news;
  }

    return news;
  }

  static fromJson(jsonMap) {}
}


