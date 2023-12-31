import 'dart:convert';

import 'package:projectnews/interfaces/article_interfaces.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleInterface> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=97a2a82b43fc457081f8b36087930252";

    Uri uri = Uri.parse(url); // Konversi string URL menjadi objek Uri
    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          String author = element['author'] ?? "Unknown Author";
          String content = element['content'] ?? "the content not uploaded";
          ArticleInterface articleInterface = ArticleInterface(
              title: element['title'],
              author: author,
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: content);
          news.add(articleInterface);
        }
      });
      print(news);
    }
  }
}
