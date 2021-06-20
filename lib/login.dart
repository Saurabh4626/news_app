import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email'
      ),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return 'Please enter a valid email address';
        }
        return null;
      },
      onChanged: (String value){
        _email =value;
      },
    );
  }
  Widget _buildPassword(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password'
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty){
          return 'Password is required';
        }
        return null;
      },
      onChanged: (String value){
        _password =value;
      },
    );
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                _buildEmail(),
                _buildPassword(),
                SizedBox(height: 30,),
                Row(
                  children: [
                    RaisedButton(onPressed: () async{
                      try{
                        print(_password);
                        FirebaseUser user=(await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
                        if(user != null){
                          Navigator.pushNamed(context, '/');
                        }
                      }
                      catch(e){
                        print(e);
                      }
                    },
                      color: Colors.grey[850],
                      child: Text("Login",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(width: 120,),
                    RaisedButton(onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                      // Navigator.
                      color: Colors.grey[850],
                      child: Text("Signup",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),

          ),
        )
    );
  }
}
