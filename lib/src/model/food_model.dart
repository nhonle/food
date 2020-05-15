import 'dart:convert';
import 'package:flutter_foody/src/resources/utils.dart';

enum FoodType {
  none,
  food,
  drink,
  cake,
  vege
}

class FoodModel {
  String name;
  int type;
  double rating;
  double goodReviews; 
  String price;
  bool isfavourite;
  String image;
  String address;
  String description;
  String foodTypeString;
  
  FoodModel({
    this.name,
    this.type,
    this.rating,
    this.goodReviews,
    this.price,
    this.isfavourite,
    this.image,
    this.address,
    this.description,
    this.foodTypeString,
  });

  FoodModel copyWith({
    String name,
    double type,
    double rating,
    double goodReviews, 
    String price,
    bool isfavourite,
    String image,
    String address,
    String description,
    String foodTypeString,
  }) => FoodModel(
    name: name ?? this.name,
    type: type ?? this.type,
    rating: rating ?? this.rating,
    goodReviews: goodReviews ?? this.goodReviews,
    price: price ?? this.price,
    isfavourite: isfavourite ?? this.isfavourite,
    image: image ?? this.image,
    address: address ?? this.address,
    description: description ?? this.description,
    foodTypeString: foodTypeString ?? this.foodTypeString,
  );

  static String convertFoodTypeToString(int type)
  {
    if(type == FoodType.food.index) return "Food";
    if(type == FoodType.drink.index) return "Drink";
    if(type == FoodType.cake.index) return "Cake";
    if(type == FoodType.vege.index) return "Vege";
    return "";
  }
  
  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"].toInt(),
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    goodReviews: json["goodReviews"] == null ? null : json["goodReviews"].toDouble(),
    price: json["price"] == null ? null : json["price"],
    isfavourite: json["isfavourite"] == null ? null : json["isfavourite"],
    image: json["image"] == null ? null : json["image"],
    address: json["address"] == null ? null : json["address"],
    description: json["description"] == null ? null : json["description"],
    foodTypeString: json["type"] == null ? null : convertFoodTypeToString(json["type"].toInt()),
  );

  factory FoodModel.fromRawJson(String str) => FoodModel.fromJson(json.decode(str));


  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "rating": rating == null ? null : rating,
    "goodReviews": goodReviews == null ? null : goodReviews,
    "price": price == null ? null : price,
    "isfavourite": isfavourite == null ? null : isfavourite,
    "image": image == null ? null : image,
    "address": address == null ? null : address,
    "description": description == null ? null : description,
  };

  String toRawJson() => json.encode(toJson());

   //Get Best Food 
  static List<FoodModel> getBestFoodList(List<FoodModel> foodData) {
    foodData.sort((b,a) => a.rating.compareTo(b.rating));
    if(foodData.length <= 10)
    {
      return foodData;
    }

    List<FoodModel> bestFoodList = [];
    for(int i = 0 ; i < foodData.length; i++)
    {
      if(i > 10) // Limit 10
      {
        break;  
      }
      bestFoodList.add(foodData[i]);
    }
    return bestFoodList;
  }

  static List<FoodModel> getListFoodWith(TabFoodItem itemSelected, List<FoodModel> foodData)
  {
    if(itemSelected == TabFoodItem.viewall) 
    {
      return foodData;
    }
      List<FoodModel> data = [];
      for(int i = 0; i < foodData.length; i ++) 
      {
        if(itemSelected == TabFoodItem.food && foodData[i].type == FoodType.food.index)
        {
            data.add(foodData[i]);
            continue; 
        }
        if(itemSelected == TabFoodItem.drink && foodData[i].type == FoodType.drink.index)
        {
            data.add(foodData[i]);
            continue; 
        }
        if(itemSelected == TabFoodItem.cake && foodData[i].type == FoodType.cake.index)
        {
            data.add(foodData[i]);
            continue; 
        }
        if(itemSelected == TabFoodItem.vege && foodData[i].type == FoodType.vege.index)
        {
            data.add(foodData[i]);
            continue; 
        }
      }
      return data;
  }
}


