import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'data.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final String url='http://newsapi.org/v2/top-headlines?country=in&apiKey=1894c6e316a540b7a2e872e91a5579f4';
  List data;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  //function to get json data
  Future<String> getJsonData() async{
    var response =await http.get(
      Uri.encodeFull(url),
        headers: {
          "Accept": "application/json"
        }
    );
    // print(response.body);
    setState(() {
      var convertDataToJson=jsonDecode(response.body);
      data = convertDataToJson['articles'];
    });
    return 'Success';
  }
  Void fullNews(int index){
    Navigator.pushNamed(context,'/fullnews',arguments: {
      'description':data[index]['description'],
      'urlToImage':data[index]['urlToImage'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Latest News',),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                fullNews(index);
              },
              title: Text(data[index]['title'],
              overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(
                backgroundImage:(data[index]['urlToImage'] == null) ? null :  NetworkImage(data[index]['urlToImage']),
              ),
            ),
          );
    },
        itemCount: data== null ? 0 : data.length,
      ),



    );
  }

}



