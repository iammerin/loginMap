import 'package:flutter/material.dart';
import 'package:loginmap/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login demo",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor:  Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState()=> _MainPageState();
}

class _MainPageState extends State<MainPage>{
  SharedPreferences sharedPreferences;
  @override
  // ignore: must_call_super
  void initState(){
    checkLoginStatus();
}

  checkLoginStatus() async {
  sharedPreferences = await SharedPreferences.getInstance();
  if(sharedPreferences.getString("token")== null ) {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Demo", style: TextStyle(color: Colors.white70),),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (
                  Route<dynamic> route) => false);
            },
            child: Text("Log out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page"),),
      drawer: Drawer(),
    );
  }
}