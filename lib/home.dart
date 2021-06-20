import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                constraints: BoxConstraints.expand(
                  height: 400,
                ),
                // child: Image.asset('assests/night.png',
                //   fit: BoxFit.cover,),
                child: Image(
                  image: NetworkImage('https://www.ohsd.net/cms/lib/WA01919452/Centricity/Page/5501/news.jpg'),
                ),
              ),
              SizedBox(height: 16,),
              RaisedButton(onPressed: (){
                Navigator.pushNamed(context,'/loading');
              },
                color: Colors.grey[850],
                child: Text("Click For Latest News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                  ),),
              )
            ],
          )
      ),
    );
  }
}


