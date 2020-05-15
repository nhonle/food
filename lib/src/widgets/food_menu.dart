import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/widgets/food_list.dart';
import 'package:flutter_foody/src/resources/utils.dart';
import 'package:flutter_foody/src/model/food_model.dart';

class FoodMenus extends StatefulWidget {
  FoodMenus({Key key, this.foodDataList, this.contentViewHeight}) : super(key : key);
  final List<FoodModel> foodDataList;
  final double contentViewHeight;

  @override
  _FoodMenusState createState() => _FoodMenusState();
}

class _FoodMenusState extends State<FoodMenus> {
  @override
  Widget build(BuildContext context) {
    final foodMenuHeight = AppTheme.sizeFoodMenuPage(widget.contentViewHeight) < 200.0 ? 200.0 : AppTheme.sizeFoodMenuPage(widget.contentViewHeight);
    const tabHeight = 80.0;
    final itemsHeight = foodMenuHeight - tabHeight;

    return Container(
      height: foodMenuHeight,
      width: AppTheme.fullWidth(context),
      color: Colors.white,
      child: DefaultTabController(length: 5, 
      child: Column(
        children: <Widget>[
          Container(
            height: tabHeight, 
            width: AppTheme.fullWidth(context),
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.red[100].withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 40,
                      offset: Offset(3, 6), // changes position of shadow
                    ),
            ]),
            child:TabBar(tabs: [
                Container(
                  width: AppTheme.fullWidth(context)/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                   ),
                   child: Tab(
                     icon: Image(image:AssetImage("images/icons/viewall.png"),
                     color:  Colors.red, width: 24.0,fit: BoxFit.fill,),
                   )
                  ),
                  Container(
                  width: AppTheme.fullWidth(context)/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                   ),
                   child: Tab(
                     icon: Image(image:AssetImage("images/icons/food.png"),
                     color:  Colors.red, width: 24.0,fit: BoxFit.fill,),)
                  ),
                  Container(
                  width: AppTheme.fullWidth(context)/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                   ),
                   child: Tab(
                     icon: Image(image:AssetImage("images/icons/drink.png"),
                     color:  Colors.red, width: 24.0,fit: BoxFit.fill,),)
                  ), 
                   Container(
                  width: AppTheme.fullWidth(context)/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                   ),
                   child: Tab(
                     icon: Image(image:AssetImage("images/icons/cake.png"),
                     color:  Colors.red, width: 24.0,fit: BoxFit.fill,),)
                  ), 
                  Container(
                  width: AppTheme.fullWidth(context)/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                   ),
                   child: Tab(
                     icon: Image(image:AssetImage("images/icons/vege.png"),
                     color:  Colors.red, width: 24.0,fit: BoxFit.fill,),)
                  ),  
            ]),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0,top: 5.0),
            width: AppTheme.fullWidth(context),
            height: itemsHeight,
            color: Colors.white,
            child: TabBarView(children: <Widget>[
              FoodsList(foodDataList: FoodModel.getListFoodWith(TabFoodItem.viewall,widget.foodDataList)),
              FoodsList(foodDataList: FoodModel.getListFoodWith(TabFoodItem.food,widget.foodDataList)),
              FoodsList(foodDataList: FoodModel.getListFoodWith(TabFoodItem.drink,widget.foodDataList)),
              FoodsList(foodDataList: FoodModel.getListFoodWith(TabFoodItem.cake,widget.foodDataList)),
              FoodsList(foodDataList: FoodModel.getListFoodWith(TabFoodItem.vege,widget.foodDataList)),
            ],),
          )
        ],
      )
    ));
  }
}