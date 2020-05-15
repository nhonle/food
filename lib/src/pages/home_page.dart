import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/light_color.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/widgets/bestfoods_list.dart';
import 'package:flutter_foody/src/model/food_model.dart';
import 'package:flutter_foody/src/model/data.dart';
import 'package:flutter_foody/src/widgets/food_menu.dart';

class HomePage extends StatefulWidget 
{
  HomePage({Key key, this.contentViewHeight}):super(key:key);
  final double contentViewHeight;
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> 
{
  List<FoodModel> foodDataList;
  @override
  void initState() {
    foodDataList = foodMapList.map((x) => FoodModel.fromJson(x)).toList();
    super.initState();
  }

  Widget _buildAppBar()
  {
    final txtSearchController = TextEditingController();
    final TextField tfSearch = new TextField(
      controller: txtSearchController,
      autocorrect: false,
      decoration: new InputDecoration(
        fillColor: Colors.white,
        prefixIcon: new Icon(Icons.search),
        hintText: 'Find places, item, adress..',
        suffixText: "HCM City",
        counterText: txtSearchController.text,
        suffixIcon: IconButton(icon: Icon(Icons.clear_all), 
          onPressed:() {
            txtSearchController.clear();
          }
        )
      ),
      keyboardType: TextInputType.text,
    );

    return AppBar(
        title: Container(
          height: AppTheme.appBarHeight(context) * 0.65,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: tfSearch,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: LightColor.background,
      appBar: _buildAppBar(),
      body: SafeArea
      (child:Container(
        child:  CustomScrollView(
          slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              BestFoodsTitles(foodDataList: foodDataList),
              FoodMenus(foodDataList: foodDataList,contentViewHeight: widget.contentViewHeight,),
              ]
            ),
          ),
        ],
        ),
      ),
    ));
  }
}