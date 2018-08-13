import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();

    });

  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty
          && _passwordController.text.isNotEmpty) {

        _welcomeString = _userController.text;
      }
      else
        _welcomeString = "Error";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),


      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: new Container(
        alignment: Alignment.topCenter,
        //changed Column to ListView for overflow error
        child: new ListView(
          children: <Widget>[
            //image/profile
            //use Tab in assets:
            new Image.asset(
              'images/ParkEtitle.png',
              fit: BoxFit.fill,
              //color: Colors.white,
            ),

            //form
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: 'Username', icon: new Icon(Icons.person)),
                  ),

                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock),
                    ),
                    obscureText: true, //to hide password
                  ),


                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Center(
                    child: new Row(
                      children: <Widget>[


                        //Login Button
                        new Container(
                          margin: const EdgeInsets.only(left: 40.0),
                          child: new RaisedButton(
                            onPressed: () => _showWelcome(),
                            color: Colors.deepPurple,
                            child: new Text(
                              "Login",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        //clear button
                        new Container(
                          margin: const EdgeInsets.only(left: 100.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.deepPurple,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),

            new Padding(padding: new EdgeInsets.all(25.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome, $_welcomeString",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
