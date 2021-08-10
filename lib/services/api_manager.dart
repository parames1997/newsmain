import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsmain/model/model.dart';

// ignore: camel_case_types
class API_Manager {
  Future<News> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      final response = await client.get(Uri.parse('https://saurav.tech/NewsAPI/top-headlines/category/health/in.json'));
      if (response.statusCode == 200) {
        print("------------------------------");
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = News.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
      
    }

    return newsModel;
    
  }
}
