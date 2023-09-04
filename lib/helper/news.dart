// ignore_for_file: unused_local_variable, unnecessary_null_comparison, empty_statements
import 'dart:convert';
import 'package:untitled2/models/article_model.dart';

import 'article_model.dart';
import 'package:http/http.dart' as http;


class News{
  List<ArticleModel> news =[];
  Future<void> getNews()async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=733dcabd420d474391d22638a111b3d4";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);


    if (jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if (element['description'] != null && element['urlToImage'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        };
      });
    }
  }
}

class CategoryNews{
  List<ArticleModel> news =[];
  Future<void> getNews(String category)async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=733dcabd420d474391d22638a111b3d4#";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);


    if (jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if (element['description']!= null && element['urlToImage']!= null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        };
      });
    }
  }
}