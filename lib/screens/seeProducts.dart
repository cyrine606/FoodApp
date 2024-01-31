import 'package:flutter/material.dart';
import 'package:food/components/FoodCategory.dart';
import 'package:food/screens/detail.dart';
class SeeProducts extends StatefulWidget {
  @override
  _SeeProductsState createState() => _SeeProductsState();
}

class _SeeProductsState extends State<SeeProducts> {
  List<foodCategory> products = [
    foodCategory(image:"android/images2/it.jpg",name:"Pizza",price:"50", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/img4.jpg",name:"Steak",price:"70", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/ital.jpg",name:"Pasta",price:"60", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/ita.jpg",name:"Hamburger",price:"80", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/tu.jpg",name:"Ojja",price:"80", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/chines.jpg",name:"Sushi",price:"80", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/chine.jpg",name:"Nouille",price:"80", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
    foodCategory(image:"android/images2/tun.jpg",name:"Couscous",price:"80", star:"3",description: "le Lorem est un texte de composition",place: "Foodie"),
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
              title: Text("Products", style: TextStyle( color: Colors.black, fontSize: 20),),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 15, left: 12),
              child: GridView.count(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 2,
                children: List.generate (products.length, (index){
                  return Container(
                    height :MediaQuery.of(context).size.height,
                    width :MediaQuery.of(context).size.width,
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: 70,
                        width: 240,
                        child: Card(
                          child: Hero(
                            tag: products[index].name,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetails(name: products[index].name, image: products[index].image, price: products[index].price, description: products[index].description,),),
                                  );
                                },
                                child: GridTile(
                                  footer: Container(
                                    height: 60,
                                    width: 240,
                                    color: Colors.white70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      Text(products[index].name, style: TextStyle(
                                                          fontWeight: FontWeight.bold, color: Colors.red,fontSize: 16.0),),
                                                      SizedBox(width: 10,),
                                                      Text(products[index].star.toString()),
                                                      Icon(Icons.star, color: Colors.red, size: 13,),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text("From",style: TextStyle(fontSize: 14.0,color: Colors.black,),),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:5.0),
                                                      child: Text(products[index].place,style: TextStyle(color: Colors.black,
                                                          fontWeight: FontWeight.bold, fontSize: 16.0),),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        new Text("\$"+products[index].price, style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16.0),
                                        ),],
                                    ),
                                  ),
                                  child:
                                  Container(
                                    height: 70,
                                    width: 240,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(15.0),
                                          topRight: const Radius.circular(15.0)
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage(products[index].image),
                                        fit: BoxFit.fill,
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