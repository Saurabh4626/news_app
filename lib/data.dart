import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
// class Data{
//   String title;//url to assests of image
//   var article;//this is location url for api endpoint
//       Map<String, dynamic> x;
//       List<dynamic> data;
//       Future<List> getNews() async {
//       var response = await http.get(
//       Uri.encodeFull("http://newsapi.org/v2/top-headlines?country=in&apiKey=1894c6e316a540b7a2e872e91a5579f4"),
//       headers: {
//       "Accept": "application/json"
//       }
//       );
//       Map<String, dynamic> x = json.decode(response.body);
//       // print(x);
//       var article=x['articles'];
//       print(article);
//       // author1=x['articles'][0]['author'];
//
//       }
// }
class Data{
    String title;
    String author;
    Data(this.author,this.title);
    Data.fromJson(Map<String,dynamic> json){
        title=json['title'];
        author=json['author'];
    }
}