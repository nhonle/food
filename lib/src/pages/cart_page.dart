import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
  
}

class _CartPage extends State<CartPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(
        child: Text("Cart Page"),
      )
      ),
    );
  }
}