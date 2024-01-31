import 'dart:ui';
import 'package:flutter/material.dart';
import './category.dart';
import '../screens/FoodCategories.dart';
class HorizontalList extends StatelessWidget {
  List<Category> categories = [
    Category(name: "Italian", image: "android/images2/italian.jpg"),
    Category(name: "Indian", image: "android/images2/indian.jpg"),
    Category(name: "Mexican", image: "android/images2/mexican.jpg"),
    Category(name: "Tunisian", image: "android/images2/tunisian.jpg"),
    Category(name: "Chinese", image: "android/images2/chinese.jpg"),
    Category(name: "American", image: "android/images2/americann.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        width: double.infinity,
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodCategories(image: categories[index].image, name: categories[index].name )));
                },
                child: Container(
                  height: 100,
                  //width: 150,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                            child: Container(
                              width: 150.0,
                              height: 95.0,
                              decoration: new BoxDecoration(
                                image: DecorationImage(
                                  image: new AssetImage(
                                    categories[index].image,),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Container(
                            width: 150.0,
                            height: 95.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45, top:30,),
                        child: Text( categories[index].name, style: TextStyle(color: Colors.white,
                            fontSize: 25
                        ),),
                      ),
                    ],
                  ),
                ),
              );
            })
    );
  }
}
