import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
  
}

class _AccountPage extends State<AccountPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(
        child: Text("Account Page"),
      )
      ),
    );
  }
}