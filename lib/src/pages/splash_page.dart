import 'package:flutter/material.dart';
// import 'package:flutter_foody/src/pages/home_page.dart';
import 'package:flutter_foody/src/pages/controller_page.dart';
class SplashPage extends StatefulWidget 
{
  SplashPage({Key key}) : super(key:key);
  
  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> 
{
  @override
  void initState()
  {
    Future.delayed(Duration(seconds:2)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ControllerPage()));
    });   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.red,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
               width: 200.0,
               height: 200.0,
               child: Center(
                 child: Text("Foody", style: new TextStyle(fontSize: 18.0,color: Colors.red,fontWeight: FontWeight.bold),), 
               ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(200.0))
              ),
          ),
          ),
        ],
      ),
    );
  }
}