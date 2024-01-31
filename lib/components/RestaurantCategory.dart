import 'package:flutter/material.dart';
class RestaurantCategory  {
  final String name;
  final String image;
  final String content;
  final String price;
  final String star;
  RestaurantCategory({@required this.name, @required this.image, @required this.price, this.content, this.star});
}
