import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screens/detail.dart';
class Cart extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String star;
  final String description;

  Cart(
      {@required this.image, @required this.name, @required this.price, this.star, @required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 210,
            width: 220,
            child: Card(
              child: Hero(
                tag: name,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetails(name: name, image: image, price: price, description: description,),),
                      );
                    },
                    child: GridTile(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 140,
                              width: 220,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(15.0),
                                    topRight: const Radius.circular(15.0)
                                ),
                                image: DecorationImage(
                                  image: new AssetImage(image),
                                  fit: BoxFit.fill,
                                ),
                              ),),
                            Container(
                              height: 70,
                              width: 220,
                              color: Colors.white30,
                              child: ListTile(
                                title: Text(name, style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.red,),),
                                subtitle: Row(
                                  children: <Widget>[
                                    Text("4.3 "),
                                    Icon(Icons.star, color: Colors.red, size: 15,),
                                    Icon(Icons.star, color: Colors.red,size: 15,),
                                    Icon(Icons.star, color: Colors.red,size: 15,),
                                    Icon(Icons.star, color: Colors.grey,size: 15,),
                                    Icon(Icons.star, color: Colors.grey,size: 15,),
                                  ],
                                ),
                                trailing: Text("\$"+price, style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16.0),
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
          ),
        ),
      ),
    );
  }}
