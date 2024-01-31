import 'package:flutter/material.dart';
import 'package:food/components/FoodCategory.dart';
import 'package:food/components/Maps.dart';
import 'package:food/screens/detail.dart';
class RestaurantDetails extends StatefulWidget {
  final  String image;
  final String name;
  final String price;
  final String star;
  RestaurantDetails({@required this.image, @required this.name,@required this.price,@required this.star});
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState(name:name, image:image,price: price,star: star);
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  final  String image;
  final String name;
  final String price;
  final String star;
  _RestaurantDetailsState({@required this.image, @required this.name,@required this.price,@required this.star});
  List<foodCategory> res1 = [
    foodCategory(image: "android/images2/it.jpg",name: "Pizza", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ita.jpg",name: "Risottos", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ital.jpg",name: "Pasta", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chi.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chin.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> res2 = [
    foodCategory(image: "android/images2/chi.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chin.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chine.jpg",name: "Nouille2", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chines.jpg",name: "Sushi", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> res3 = [
    foodCategory(image: "android/images2/in.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ind.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/indi.jpg",name: "Nouille2", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ita.jpg",name: "Risottos", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ital.jpg",name: "Pasta", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> res4 = [
    foodCategory(image: "android/images2/me.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/mex.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/mexi.jpg",name: "Plat", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ind.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> res5 = [
    foodCategory(image: "android/images2/tu.jpg",name: "Ojja", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tun.jpg",name: "Couscous", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tuni.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tunis.jpg",name: "Fricassé", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> res6 = [
    foodCategory(image: "android/images2/english.jpg",name: "Hamburger", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/american.jpg",name: "Hotdogs", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/am.jpg",name: "Plat", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tu.jpg",name: "Ojja", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tun.jpg",name: "Couscous", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body : Container(
          height :MediaQuery.of(context).size.height,
          width :MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 220,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(25.0),
                            bottomRight: const Radius.circular(25.0)),
                        image: DecorationImage(
                          image: new AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ClipRRect(borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(25.0),bottomRight: const Radius.circular(25.0)),
                      child: Container(
                        height: 220.0,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150, top:80,),
                      child: Text(name, style: TextStyle(color: Colors.white,
                        fontSize: 26,fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150, top:110,),
                      child: Text("AVG price " +"\$"+ price, style: TextStyle(color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                    Positioned(
                      top: 150,
                      left: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Colors.white,
                          height: 28,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Text(star, style: TextStyle(color: Colors.black, fontSize: 14,),),
                                  Icon(Icons.star, size: 16,color: Colors.deepOrange,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),),

                    Padding(
                      padding: const EdgeInsets.only(left:18.0, top: 20.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white,size: 27,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                    //height :MediaQuery.of(context).size.height,
                    width: 400,
                    height:450,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      itemCount: ((){
                        if (this.name == "PastaCosi"){
                          return res1.length;
                        }else if (this.name == "L\'Ardoise"){
                          return res2.length;
                        }else if (this.name == "Miam\'s"){
                          return res3.length;
                        }else if (this.name == "Farmers"){
                          return res4.length;
                        }
                      }()),
                      itemBuilder: (_,index){
                        return Container(
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5,left:3,right:3, top:5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 380,
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: Offset(1,1),
                                    )],
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                        CardDetails(
                                            name: ((){
                                              if (this.name == "PastaCosi"){
                                                return res1[index].name;
                                              }else if (this.name == "L\'Ardoise"){
                                                return res2[index].name;
                                              }else if (this.name == "Miam\'s"){
                                                return res3[index].name;
                                              }else if (this.name == "Farmers") {
                                                return res4[index].name;
                                              }
                                            }()),
                                            image: ((){
                                              if (this.name == "PastaCosi"){
                                                return res1[index].image;
                                              }else if (this.name == "L\'Ardoise"){
                                                return res2[index].image;
                                              }else if (this.name == "Miam\'s"){
                                                return res3[index].image;
                                              }else if (this.name == "Farmers"){
                                                return res4[index].image;
                                              }
                                            }()),
                                            price: ((){
                                              if (this.name == "PastaCosi"){
                                                return "\$"+res1[index].price;
                                              }else if (this.name == "L\'Ardoise"){
                                                return "\$"+res2[index].price;
                                              }else if (this.name == "Miam\'s"){
                                                return "\$"+res3[index].price;
                                              }else if (this.name == "Farmers"){
                                                return "\$"+res4[index].price;
                                              }
                                            }()),
                                            description: ((){
                                              if (this.name == "PastaCosi"){
                                                return res1[index].description;
                                              }else if (this.name == "L\'Ardoise"){
                                                return res2[index].description;
                                              }else if (this.name == "Miam\'s"){
                                                return res3[index].description;
                                              }else if (this.name == "Farmers"){
                                                return res4[index].description;
                                              }
                                            }())),),);
                                  },
                                  child: Card(
                                    child: Material(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 140,
                                            height: 120,
                                            decoration: new BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(((){
                                                  if (this.name == "PastaCosi"){
                                                    return res1[index].image;
                                                  }else if (this.name == "L\'Ardoise"){
                                                    return res2[index].image;
                                                  }else if (this.name == "Miam\'s"){
                                                    return res3[index].image;
                                                  }else if (this.name == "Farmers"){
                                                    return res4[index].image;
                                                  }
                                                }())),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 220,
                                            height: 120,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 170,
                                                    height: 120,
                                                    child: ListTile(
                                                      title:
                                                      Text(((){
                                                        if (this.name == "PastaCosi"){
                                                          return res1[index].name;
                                                        }else if (this.name == "L\'Ardoise"){
                                                          return res2[index].name;
                                                        }else if (this.name == "Miam\'s"){
                                                          return res3[index].name;
                                                        }else if (this.name == "Farmers") {
                                                          return res4[index].name;
                                                        }
                                                      }()), style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                                                      subtitle:  Padding(
                                                        padding: const EdgeInsets.only(top:15.0),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Row(
                                                              children: <Widget>[
                                                                Text("From  ", style: TextStyle(color: Colors.grey, fontSize: 14),),
                                                                Text(((){
                                                                  if (this.name == "PastaCosi"){
                                                                    return res1[index].place;
                                                                  }else if (this.name == "L\'Ardoise"){
                                                                    return res2[index].place;
                                                                  }else if (this.name == "Miam\'s"){
                                                                    return res3[index].place;
                                                                  }else if (this.name == "Farmers"){
                                                                    return res4[index].place;
                                                                  }
                                                                }()), style: TextStyle(color: Colors.deepOrange, fontSize: 14),),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top:6.0),
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Text(((){
                                                                    if (this.name == "PastaCosi"){
                                                                      return res1[index].star;
                                                                    }else if (this.name == "L\'Ardoise"){
                                                                      return res2[index].star;
                                                                    }else if (this.name == "Miam\'s"){
                                                                      return res3[index].star;
                                                                    }else if (this.name == "Farmers"){
                                                                      return res4[index].star;
                                                                    }
                                                                  }())),
                                                                  Icon(Icons.star, color: Colors.red, size: 13,),
                                                                  Icon(Icons.star, color: Colors.red,size: 13,),
                                                                  Icon(Icons.star, color: Colors.red,size: 13,),
                                                                  Icon(Icons.star, color: Colors.grey,size: 13,),
                                                                  Icon(Icons.star, color: Colors.grey,size: 13,),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),),

                                                    ),),
                                                  new  Container(
                                                    height: 120,
                                                    width: 50,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Like(),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 15.0),
                                                          child: Text (((){
                                                            if (this.name == "PastaCosi"){
                                                              return "\$"+res1[index].price;
                                                            }else if (this.name == "L\'Ardoise"){
                                                              return "\$"+res2[index].price;
                                                            }else if (this.name == "Miam\'s"){
                                                              return "\$"+res3[index].price;
                                                            }else if (this.name == "Farmers"){
                                                              return "\$"+res4[index].price;
                                                            }
                                                          }()),style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),),
                                          ),

                                        ],),
                                    ),
                                  ),
                                ),),
                            ),
                          ),);},),),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        child: Icon(Icons.location_on, size: 30,),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),),
      ),);
  }
}

class Like extends StatefulWidget {
  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  IconButton(icon: liked?Icon(Icons.favorite, color: Colors.red,):Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){
        setState((){
          this.liked = !liked;
        });
      }),
    );
  }
}

