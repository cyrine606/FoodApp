import 'package:flutter/material.dart';
import 'package:food/screens/RestaurantDetails.dart';
import './RestaurantCategory.dart';
class RestaurantCategories extends StatefulWidget {
  @override
  _RestaurantCategoriesState createState() => _RestaurantCategoriesState();
}

class _RestaurantCategoriesState extends State<RestaurantCategories> {
  List<RestaurantCategory> Rcategories = [
    RestaurantCategory(name: "PastaCosi", image: "android/images2/re.jpg", star: "4.3", price: "70",content: "restaurant highly recommended"),
    RestaurantCategory(name: "L\'Ardoise", image: "android/images2/resta.jpg", star: "4.3", price: "50",content: "restaurant highly recommended"),
    RestaurantCategory(name: "Miam\'s", image: "android/images2/res.jpg", star: "4.3", price: "30",content: "restaurant highly recommended"),
    RestaurantCategory(name: "Farmers", image: "android/images2/rest.jpg", star: "4.3", price: "60",content: "restaurant highly recommended"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 880,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Rcategories.length,
        itemBuilder: (_,index){
          return  Container(
            width: 390,
            height: 220,
            child: Card(
              child: Hero(
                tag: Rcategories[index].name,
                child: Material(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RestaurantDetails (image: Rcategories[index].image, name: Rcategories[index].name,price: Rcategories[index].price,star: Rcategories[index].star )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 390,
                        height: 220,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:BorderRadius.circular(20.0),
                              child: Container(
                                height: 220,
                                width: 390,
                                decoration: new BoxDecoration(
                                  image: DecorationImage(
                                    image: new AssetImage(Rcategories[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:BorderRadius.circular(20.0),
                              child: Container(
                                height: 220,
                                width: 390,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 320,
                              child: ClipRRect(
                                borderRadius:BorderRadius.circular(10.0),
                                child: Container(
                                  color: Colors.white,
                                  height: 25,
                                  width: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Text(Rcategories[index].star, style: TextStyle(color: Colors.black, fontSize: 13,),),
                                          Icon(Icons.star, size: 16,color: Colors.deepOrange,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),),

                            Positioned (
                              top: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      new Text (Rcategories[index].name, style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child: new Text ('AVG meal price: \$ ${Rcategories[index].price}', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20,)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

