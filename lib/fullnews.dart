import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fullnews extends StatefulWidget {
  @override
  _FullnewsState createState() => _FullnewsState();
}

class _FullnewsState extends State<Fullnews> {
  Map description={};
  @override
  Widget build(BuildContext context) {
   description = ModalRoute.of(context).settings.arguments;
   var image;
   if ((description['urlToImage'] == null)) {
     image = null;
   } else {
     image = description['urlToImage'];
   }
   // print(description);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(20,50, 20,0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 130,
            ),
            SizedBox(height: 20,),
            Card(
              child: Text(
                  description['description'],
                style: TextStyle(
                  fontSize: 23,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
