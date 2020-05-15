import 'package:flutter/material.dart';
import 'package:flutter_foody/src/pages/home_page.dart';
import 'package:flutter_foody/src/theme/light_color.dart';
import 'package:flutter_foody/src/theme/text_styles.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/pages/favorite_page.dart';
import 'package:flutter_foody/src/pages/cart_page.dart';
import 'package:flutter_foody/src/pages/account_page.dart';

class ControllerPage extends StatefulWidget {
  @override
  _ControllerPage createState() => _ControllerPage();
}

class _ControllerPage extends State<ControllerPage>
{
  double contentHeight = 0;
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  } 

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
        onPageChanged: (index) {
        _pageChanged(index);
      },
      children: <Widget>[
        HomePage(contentViewHeight: contentHeight,),
        FavoritePage(),
        CartPage(),
        AccountPage(),
      ],
    );
  }
 
    
  Widget _buildBottomBar() 
  {
    return SizedBox(
      height: AppTheme.sizeBottomTabbar() + AppTheme.paddingBottomHeight(context),
      child:BottomNavigationBar(
        
        backgroundColor: LightColor.tabBgColor,
        type: BottomNavigationBarType.fixed,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Account"),
          )],
        currentIndex: bottomSelectedIndex,
        selectedItemColor: LightColor.tabItemColorSelected,
        unselectedItemColor:LightColor.tabItemColorNormal,
        selectedFontSize: FontSizes.body,
        onTap: _pageChanged,
    ));
  }

  @override
  Widget build(BuildContext context) {
    contentHeight = AppTheme.fullHeight(context) - (AppTheme.paddingBottomHeight(context)  + AppTheme.paddingTopHeight(context) + AppTheme.appBarHeight(context) + AppTheme.sizeBottomTabbar());
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}