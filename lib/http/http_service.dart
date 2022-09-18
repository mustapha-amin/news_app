import 'dart:convert';
import 'dart:io';

import '/models/articles_model.dart';
import 'package:http/http.dart';

class HttpService {
  //  url = "https://newsapi.org/v2/everything?q=tesla&from=2022-08-15&sortBy=publishedAt&apiKey=d2b3e7c223474595b47f35e8dce19e7d";
  static const baseUrl = "newsapi.org";
  static const endPointUrl = "/v2/top-headlines";
  static const queryParams = {
    'country': 'us',
    'apiKey': 'd2b3e7c223474595b47f35e8dce19e7d'
  };

  static Future<List<Article>> getArticles() async {
    final uri = Uri.https(baseUrl, endPointUrl, queryParams);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> jsonArticles = json['articles'];
      List<Article> articles =
          jsonArticles.map((dynamic item) => Article.fromJson(item)).toList();
      print(json);
      return articles;
    } else {
      throw ("Can't get articles");
    }
  }
}
