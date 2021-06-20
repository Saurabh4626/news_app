import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;
  final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name'
      ),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String value){
        _name =value;
      },
    );
  }

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
      onSaved: (String value){
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
      onSaved: (String value){
        _password =value;
      },
    );
  }
  Widget _buildURL(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Url'
      ),
      keyboardType: TextInputType.url,
      validator: (String value){
        if(value.isEmpty){
          return 'Url is required';
        }
        return null;
      },
      onSaved: (String value){
        _url =value;
      },
    );
  }
  Widget _buildPhoneNumber(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Phone Number'
      ),
      validator: (String value){
        if(value.isEmpty){
          return 'Phone Number is required';
        }
        return null;
      },
      onSaved: (String value){
        _phoneNumber =value;
      },
    );
  }
  Widget _buildCalories(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Calories'
      ),
      validator: (String value){
        int calories= int.tryParse(value);
        if(calories == null || calories <=0){
          return 'Calories must be greater than 0';
        }
        return null;
      },
      onSaved: (String value){
        _calories =value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                // _buildURL(),
                _buildPhoneNumber(),
                // _buildCalories(),
                SizedBox(height: 10),
                Row(
                  children: [SizedBox(width: 30,),
                              RaisedButton(onPressed: (){
                                if(! _formkey.currentState.validate()){
                                return;
                                }
                                _formkey.currentState.save();
                                print(_name);
                                // Navigator.pushNamed(context,'/login');
                              },
                              color: Colors.grey[850],
                                child: Text("Submit",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                ),
                              ),
                              SizedBox(width: 120,),
                              RaisedButton(onPressed: (){
                                Navigator.pushNamed(context,'/login');
                              },
                                color: Colors.grey[850],
                              child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              ),

                            ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
