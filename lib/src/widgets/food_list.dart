import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/theme/extention.dart';
import 'package:flutter_foody/src/theme/text_styles.dart';
import 'package:flutter_foody/src/widgets/rating_start.dart';
import 'package:flutter_foody/src/model/food_model.dart';
import 'package:flutter_foody/src/pages/detail_page.dart';
import 'package:flutter_foody/src/animation/change_page_anim.dart';

class FoodsList extends StatefulWidget {
  FoodsList({Key key, this.foodDataList}) : super(key : key);
  final List<FoodModel> foodDataList;

  @override
  _FoodsListState createState() => _FoodsListState();
} 

class _FoodsListState extends State<FoodsList> 
{
  List<Widget> _buildItems() {
    List<Container> containers = new List<Container>.generate(widget.foodDataList.length, 
    (int index) {
      final data = widget.foodDataList[index];
        return Container(
          margin: EdgeInsets.only(bottom: 1.0),
          width: AppTheme.fullWidth(context),
          height: 90.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(image: AssetImage(data.image),width: 150.0,fit: BoxFit.fitWidth,),
              ],),
              Column(
               children: <Widget>[
                 Container(
                   width: AppTheme.fullWidth(context) - 150.0,
                   height: 70.0,
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 14.0,
                        margin: EdgeInsets.only(bottom: 2.0),
                        child: Text(data.name, style: TextStyles.titleItem,),
                      ),
                      Container(
                        height: 30.0,
                        child: Text(data.description, style: TextStyles.bodyItem,),
                      ),
                      Container(
                        height: 14.0,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.near_me, color: Colors.blue, size: 18.0,),
                            Container(
                              width: AppTheme.fullWidth(context) - 150.0 - 28,
                              child:Text(data.address, style: TextStyles.bodyItem),
                            )
                          ],
                        ),
                      ),
                    ],                     
                   ).p(5.0),
                 ),
                 Container(
                   width: AppTheme.fullWidth(context) - 150.0,
                   height: 20.0,
                   decoration: BoxDecoration(
                   color: Colors.red.withOpacity(.8),
                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                  ),
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5.0, right: 10.0),
                            child:RatingStar(
                              rating: data.rating,
                              iconSize: 14.0,
                          )),
                          Icon(Icons.fastfood,size: 14.0, color: Colors.white,),
                          Container(
                            padding: EdgeInsets.only(left:2.0, right: 8.0),
                            child: Text(data.foodTypeString, style: TextStyles.bodyItem.copyWith(color: Colors.white),),
                          ) 
                    ]),
                 ),
               ], 
              )
            ], 
          ).ripple((){
            Navigator.push(context, SlideRightRoute(page: DetailPage(foodData: data,)));
          }),
        );
    });

    return containers;
  } 

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: _buildItems(),
    );
  }
}