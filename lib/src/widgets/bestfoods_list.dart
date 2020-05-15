import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/light_color.dart';
import 'package:flutter_foody/src/theme/text_styles.dart';
import 'package:flutter_foody/src/theme/extention.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/widgets/rating_start.dart';
import 'package:flutter_foody/src/model/food_model.dart';
import 'package:flutter_foody/src/pages/detail_page.dart';
import 'package:flutter_foody/src/animation/change_page_anim.dart';

class BestFoodsTitles extends StatefulWidget {
  BestFoodsTitles({Key key, this.foodDataList}) : super(key : key);
  final List<FoodModel> foodDataList;

  @override
  _BestFoodsTitlesState createState() => _BestFoodsTitlesState();
}

class _BestFoodsTitlesState extends State<BestFoodsTitles> {

  @override
  Widget build(BuildContext context) {
    final double titleHeight = AppTheme.sizeBestFoodsTitlesPage() - 150.0;
    final double listHeight = AppTheme.sizeBestFoodsTitlesPage() - titleHeight;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: titleHeight,
            child: Row(
             children: <Widget>[
               Icon(Icons.assignment, size: 26.0, color: LightColor.iconColorRed,),
               Text(" The product of the month",style: TextStyles.titleNormal.copyWith(),),
             ], 
            ),
          ),
          Container(
            height: listHeight,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children:_buildListTiles(), 
             ), 
          ).p(5),
        ],
    );
  }

  List<Widget> _buildListTiles()
  {
    List<FoodModel> bestFoodList = FoodModel.getBestFoodList(widget.foodDataList);
    const double itemWidth = 150.0;
    const double itemHeight = 150.0;
    List <Container> containers = new List<Container>.generate(bestFoodList.length, 
    (int index) {
      final FoodModel data = bestFoodList[index];
      return Container(
        width: itemWidth,
        height: itemHeight,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 1.0),
                  height: 100,
                  width: 149,
                 child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage(data.image),
                        fit: BoxFit.fill,),
                    ],
                 ), 
                ),
                Container(
                  height: 50,
                  width: itemWidth,
                  decoration: BoxDecoration(
                   color: Colors.red.withOpacity(.8),
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 2.5),
                        height: 15.0,
                        child: Text(data.name,
                        style: TextStyles.titleItem,),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2.5),
                        height: 15.0,
                        child: Text(data.description,
                        style: TextStyles.bodyItem,),
                      ),
                      Container(
                        height: 1.0,
                        color: Colors.grey,                     
                      ).p(1.5),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RatingStar(
                              rating: data.rating,
                              iconSize: 14.0,
                          ),
                          Icon(Icons.fastfood,size: 14.0, color: Colors.white,),
                          Container(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(data.foodTypeString, style: TextStyles.bodyItem.copyWith(color: Colors.white),),
                          ) 
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ],  
        ).ripple((){
          Navigator.push(context, SlideRightRoute(page: DetailPage(foodData: data,)));  
        }),
      );
    });
    return containers;
  }
}




  