import 'package:flutter/material.dart';
import './Card.dart';
import 'customText.dart';
// ignore: must_be_immutable
class Cards extends StatelessWidget {
  List<Cart> categoriesCard = [
    Cart(image:"android/images2/it.jpg",name:"Pizza",price:"50", star:"3",description: "le Lorem est un texte de composition",),
    Cart(image:"android/images2/img4.jpg",name:"Steak",price:"70", star:"3",description: "le Lorem est un texte de composition",),
    Cart(image:"android/images2/ital.jpg",name:"Pasta",price:"60", star:"3",description: "le Lorem est un texte de composition",),
    Cart(image:"android/images2/english.jpg",name:"Hamburger",price:"80", star:"3",description: "le Lorem est un texte de composition",),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        itemCount: categoriesCard.length,
        scrollDirection: Axis.horizontal,
        // ignore: missing_return
        itemBuilder: (_,index) {
          return Cart(
            image: this.categoriesCard[index].image,
            name: categoriesCard[index].name,
            price: categoriesCard[index].price,
            star: categoriesCard[index].star,
            description: categoriesCard[index].description,
          );
        },
      ),
    );
  }
}
