import 'package:flutter/material.dart';
import 'package:flutter_foody/src/model/food_model.dart';
import 'package:flutter_foody/src/theme/light_color.dart';
import 'package:flutter_foody/src/theme/text_styles.dart';
import 'package:flutter_foody/src/theme/theme.dart';
import 'package:flutter_foody/src/widgets/rating_start.dart';

class DetailPage extends StatefulWidget
{
  DetailPage({Key key, this.foodData}):super(key:key);
  final FoodModel foodData;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> 
{
  FoodModel data;
  @override
  void initState() {
    data = widget.foodData;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.local_grocery_store,size: 28.0,), onPressed: (){
          })
        ],
      ),
      body: SafeArea(
        child: Stack(
        children: <Widget>[
          Image(image: AssetImage(data.image),width: AppTheme.fullWidth(context),height: AppTheme.fullHeight(context)*0.4, fit: BoxFit.fill,),
          Positioned(
            top: 20.0,
            right: 12.0,
            child:  IconButton(icon:Icon(Icons.favorite, color: data.isfavourite ? LightColor.iconColorRed.withAlpha(200): LightColor.none, size: 32.0),
            onPressed: (){
              setState(() {
                data.isfavourite = !data.isfavourite;
              });
            },)
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(245),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        width: AppTheme.fullWidth(context),
                        child: Text(data.name,style: TextStyles.titleNormal,),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),  
                        child: Text(data.address, 
                          style: TextStyles.bodySm.copyWith(color: Colors.black),
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0), 
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RatingStar(
                              rating: data.rating,
                              iconSize: 24.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text((data.goodReviews > 100 ? "100+" : data.goodReviews.toString()) + " Good Review", style: TextStyles.bodySm.copyWith(color: Colors.orange),),
                          ),
                        ]),
                      ),
                      Container(padding: EdgeInsets.only(bottom: 8.0),
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.monetization_on,size: 24.0, color: LightColor.yellow),
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(data.price, style: TextStyles.title.copyWith(color: Colors.red),),
                              ),
                          ],),
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0), 
                        child: Stack(
                          children: <Widget>[
                          Align(alignment: Alignment.centerLeft,
                            child:Container(
                              width: 80.0,
                              height: 40.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.fastfood,size: 24.0, color: LightColor.iconColorRed),
                                  Container(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(data.foodTypeString, style: TextStyles.bodySm.copyWith(color: Colors.black),),
                                  ),
                              ],),
                            )
                          ),
                          Align(alignment: Alignment.center, 
                          child:Container(
                              width: 150.0,
                              height: 40.0,
                              child: RaisedButton.icon(
                                color: Colors.red,
                                icon: Icon(Icons.local_grocery_store, color: Colors.white),
                                label: Text("Add To Bag", style: TextStyles.body.copyWith(color: Colors.white),),
                                onPressed: (){
                                }
                              )
                            ),
                          )
                        ]),
                      ),  
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.description, color: LightColor.iconColorRed,),
                                Text("Food Details", style: TextStyles.title,),
                              ],
                            )
                          ),
                          Text(data.description,
                            style:TextStyles.bodySm ,
                          ),
                        ],
                      ), 
                      ///
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0.5, 1.5), // changes position of shadow
                              ),
                           ],
                        ),
                        width: AppTheme.fullWidth(context),
                        margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                        child: Card(
                          color: Color.fromARGB(255, 249, 247, 215),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.call_to_action, color:LightColor.iconColorBlue ,size: 32.0,),
                                title: Text("Nhập CONOWGIAO, giảm 15k trên phí vận chuyển, thanh toán AirPay",
                                style: TextStyles.bodySm.copyWith(),),
                              ),
                              Divider(color: Colors.grey, indent: 70.0, endIndent: 10.0,),
                              ListTile(
                                leading: Icon(Icons.call_to_action, color:LightColor.iconColorRed ,size: 32.0,),
                                title: Text("Giảm trực tiếp 20% trên giá món. Nhập mã ưu đãi để được giảm nhiều hơn",
                                style: TextStyles.bodySm.copyWith(),),
                              ),
                              Divider(color: Colors.grey, indent: 70.0, endIndent: 10.0,),
                              ListTile(
                                leading: Icon(Icons.call_to_action, color:LightColor.iconColorBlue ,size: 32.0,),
                                title: Text("Freeship tới 5km: Nhập mã FREESHIP",
                                style: TextStyles.bodySm.copyWith(),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ///
                      Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton.icon(
                              onPressed: (){
                              }, 
                              icon: Icon(Icons.call),label: Text("Call", style: TextStyles.bodySm,),
                            ),
                            RaisedButton.icon(
                              onPressed: (){
                              }, 
                              icon: Icon(Icons.mail),label: Text("Email",style: TextStyles.bodySm),
                            ),
                            RaisedButton.icon(
                              onPressed: (){
                              }, 
                              icon: Icon(Icons.comment),label: Text("Comment",style: TextStyles.bodySm),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            );
          },
        ),
        ],
      )),
    );
  }
}