import 'package:flutter/material.dart';
import 'package:food/components/RestaurantCategory.dart';
import 'package:food/screens/RestaurantDetails.dart';
class SeeRestaurants extends StatefulWidget {
  @override
  _SeeRestaurantsState createState() => _SeeRestaurantsState();
}

class _SeeRestaurantsState extends State<SeeRestaurants> {
  List<RestaurantCategory> restaurants = [
    RestaurantCategory(name: "PastaCosi", image: "android/images2/re.jpg", star: "4.3", price: "\$70",content: "restaurant highly recommended"),
    RestaurantCategory(name: "L\'Ardoise", image: "android/images2/resta.jpg", star: "4.3", price: "\$50",content: "restaurant highly recommended"),
    RestaurantCategory(name: "Miam\'s", image: "android/images2/res.jpg", star: "4.3", price: "\$30",content: "restaurant highly recommended"),
    RestaurantCategory(name: "Farmers", image: "android/images2/rest.jpg", star: "4.3", price: "\$60",content: "restaurant highly recommended"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: Text("Restaurants", style: TextStyle( color: Colors.black, fontSize: 20),),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 12.0,right: 15.0),
              child: GridView.count(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 2,
                children: List.generate (restaurants.length, (index){
                  return Container(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        width: 220,
                        child: Card(
                          child: Hero(
                            tag: restaurants[index].name,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetails(name: restaurants[index].name, image: restaurants[index].image, price: restaurants[index].price, star: restaurants[index].star,),),
                                  );
                                },
                                child: GridTile(
                                  footer: Container(
                                    height: 60,
                                    width: 220,
                                    color: Colors.white70,
                                    child: ListTile(
                                      title: Text(restaurants[index].name, style: TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.red,),),
                                      subtitle: Row(
                                        children: <Widget>[
                                          Text(restaurants[index].star),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4.0),
                                            child: Icon(Icons.star, color: Colors.red, size: 15,),
                                          ),
                                        ],
                                      ),
                                      trailing: Text(restaurants[index].price, style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    height: 70,
                                    width: 220,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(15.0),
                                          topRight: const Radius.circular(15.0)
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage(restaurants[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),),

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

              ),
            )));}}