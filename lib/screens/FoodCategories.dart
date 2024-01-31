import 'package:flutter/material.dart';
import 'package:food/components/FoodCategory.dart';
import 'package:food/screens/detail.dart';
class FoodCategories extends StatefulWidget {
  final  String image;
  final String name;
  FoodCategories({@required this.image, @required this.name});
  @override
  _FoodCategoriesState createState() => _FoodCategoriesState(name: name, image: image);
}

class _FoodCategoriesState extends State<FoodCategories> {
  final  String image;
  final String name;
  _FoodCategoriesState({@required this.image, @required this.name});
  List<foodCategory> italianCategory = [
    foodCategory(image: "android/images2/it.jpg",name: "Pizza", price: "25",place: "PastaCosi",star: "4.3",description: "Red sauce pizza topped with sausage,pepperoni, onions, green peppers, and mozzarella cheese",),
    foodCategory(image: "android/images2/ita.jpg",name: "Risottos", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ital.jpg",name: "Pasta", price: "15",place: "PastaCosi",star: "4.3",description: "Linguine tossed with smoked bacon, diced tomatoes, light cream sauce, and parmigiano-reggiano",),
    foodCategory(image: "android/images2/mexi.jpg",name: "Plat", price: "15",place: "PastaCosi",star: "4.3",description: "On a fresh baked bun, half pound of angus beef topped with sauteed mushrooms, swiss cheese, lettuce and tomato",),
  ];
  List<foodCategory> chineseCategory = [
    foodCategory(image: "android/images2/chi.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chin.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chine.jpg",name: "Nouille2", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/chines.jpg",name: "Sushi", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> indianCategory = [
    foodCategory(image: "android/images2/in.jpg",name: "Nouille", price: "25",place: "Foodie",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/ind.jpg",name: "Riz", price: "15",place: "Foodie",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/indi.jpg",name: "Nouille2", price: "15",place: "Foodie",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> tunisianCategory = [
    foodCategory(image: "android/images2/tu.jpg",name: "Ojja", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tun.jpg",name: "Couscous", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tuni.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/tunis.jpg",name: "Fricassé", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
  ];
  List<foodCategory> mexicanCategory = [
    foodCategory(image: "android/images2/me.jpg",name: "Nouille", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/mex.jpg",name: "Riz", price: "15",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/mexi.jpg",name: "Plat", price: "15",place: "PastaCosi",star: "4.3",description: "On a fresh baked bun, half pound of angus beef topped with sauteed mushrooms, swiss cheese, lettuce and tomato",),
  ];
  List<foodCategory> americanCategory = [
    foodCategory(image: "android/images2/english.jpg",name: "Hamburger", price: "25",place: "PastaCosi",star: "4.3",description: "le Lorem est un texte de composition",),
    foodCategory(image: "android/images2/american.jpg",name: "Hotdogs", price: "15",place: "PastaCosi",star: "4.3",description: "On a fresh baked baquette, ribeye steak, onions, green peppers, and shredded mozzarella",),
    foodCategory(image: "android/images2/am.jpg",name: "Plat", price: "15",place: "PastaCosi",star: "4.3",description: "On a fresh baked bun, half pound of angus beef topped with sauteed mushrooms, swiss cheese, lettuce and tomato",),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body : Container(
          height :MediaQuery.of(context).size.height,
          width :MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 230,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 230,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      height: 230.0,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160, top:130,),
                      child: Text(name, style: TextStyle(color: Colors.white,
                        fontSize: 26,
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:18.0, top: 20.0),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white,size: 27,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 450,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: ((){
                    if (this.name == "Indian"){
                      return indianCategory.length;
                    }else if (this.name == "Chinese"){
                      return chineseCategory.length;
                    }else if (this.name == "Italian"){
                      return italianCategory.length;
                    }else if (this.name == "Mexican"){
                      return mexicanCategory.length;
                    }else if (this.name == "Tunisian"){
                      return tunisianCategory.length;
                    }else if (this.name == "American"){
                      return americanCategory.length;
                    }
                  }()),
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5,left:3,right:3, top:5),
                      child: Container(
                        width: 380,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 380,
                            height: 120,
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
                                          if (this.name == "Indian"){
                                            return indianCategory[index].name;
                                          }else if (this.name == "Chinese"){
                                            return chineseCategory[index].name;
                                          }else if (this.name == "Italian"){
                                            return italianCategory[index].name;
                                          }else if (this.name == "Mexican"){
                                            return mexicanCategory[index].name;
                                          }else if (this.name == "Tunisian"){
                                            return tunisianCategory[index].name;;
                                          }else if (this.name == "American"){
                                            return americanCategory[index].name;
                                          }
                                        }()),
                                        image: ((){
                                          if (this.name == "Indian"){
                                            return indianCategory[index].image;
                                          }else if (this.name == "Chinese"){
                                            return chineseCategory[index].image;
                                          }else if (this.name == "Italian"){
                                            return italianCategory[index].image;
                                          }else if (this.name == "Mexican"){
                                            return mexicanCategory[index].image;
                                          }else if (this.name == "Tunisian"){
                                            return tunisianCategory[index].image;;
                                          }else if (this.name == "American"){
                                            return americanCategory[index].image;
                                          }
                                        }()),
                                        price: ((){
                                          if (this.name == "Indian"){
                                            return indianCategory[index].price;
                                          }else if (this.name == "Chinese"){
                                            return chineseCategory[index].price;
                                          }else if (this.name == "Italian"){
                                            return italianCategory[index].price;
                                          }else if (this.name == "Mexican"){
                                            return mexicanCategory[index].price;
                                          }else if (this.name == "Tunisian"){
                                            return tunisianCategory[index].price;
                                          }else if (this.name == "American"){
                                            return americanCategory[index].price;
                                          }
                                        }()),
                                        description: ((){
                                          if (this.name == "Indian"){
                                            return indianCategory[index].description;
                                          }else if (this.name == "Chinese"){
                                            return chineseCategory[index].description;
                                          }else if (this.name == "Italian"){
                                            return italianCategory[index].description;
                                          }else if (this.name == "Mexican"){
                                            return mexicanCategory[index].description;
                                          }else if (this.name == "Tunisian"){
                                            return tunisianCategory[index].description;
                                          }else if (this.name == "American"){
                                            return americanCategory[index].description;
                                          }
                                        }())
                                    ),),);
                              },
                              child: Card(
                                child: Material(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        width: 140,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(((){
                                              if (this.name == "Indian"){
                                                return indianCategory[index].image;
                                              }else if (this.name == "Chinese"){
                                                return chineseCategory[index].image;
                                              }else if (this.name == "Italian"){
                                                return italianCategory[index].image;
                                              }else if (this.name == "Mexican"){
                                                return mexicanCategory[index].image;
                                              }else if (this.name == "Tunisian"){
                                                return tunisianCategory[index].image;;
                                              }else if (this.name == "American"){
                                                return americanCategory[index].image;
                                              }
                                            }())),
                                            fit: BoxFit.cover,

                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 220,
                                          height: 120,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 170,
                                                height: 120,
                                                child: ListTile(
                                                  title:
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 22.0),
                                                    child: Text(((){
                                                      if (this.name == "Indian"){
                                                        return indianCategory[index].name;
                                                      }else if (this.name == "Chinese"){
                                                        return chineseCategory[index].name;
                                                      }else if (this.name == "Italian"){
                                                        return italianCategory[index].name;
                                                      }else if (this.name == "Mexican"){
                                                        return mexicanCategory[index].name;
                                                      }else if (this.name == "Tunisian"){
                                                        return tunisianCategory[index].name;;
                                                      }else if (this.name == "American"){
                                                        return americanCategory[index].name;
                                                      }
                                                    }()), style: TextStyle(color: Colors.black, fontSize: 18,decoration: TextDecoration.none),),
                                                  ),
                                                  subtitle:  Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Text("From  ", style: TextStyle(color: Colors.grey, fontSize: 14),),
                                                          Text(((){
                                                            if (this.name == "Indian"){
                                                              return indianCategory[index].place;
                                                            }else if (this.name == "Chinese"){
                                                              return chineseCategory[index].place;
                                                            }else if (this.name == "Italian"){
                                                              return italianCategory[index].place;
                                                            }else if (this.name == "Mexican"){
                                                              return mexicanCategory[index].place;
                                                            }else if (this.name == "Tunisian"){
                                                              return tunisianCategory[index].place;;
                                                            }else if (this.name == "American"){
                                                              return americanCategory[index].place;
                                                            }
                                                          }()), style: TextStyle(color: Colors.deepOrange, fontSize: 14),),

                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:6.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(((){
                                                              if (this.name == "Indian"){
                                                                return indianCategory[index].star;
                                                              }else if (this.name == "Chinese"){
                                                                return chineseCategory[index].star;
                                                              }else if (this.name == "Italian"){
                                                                return italianCategory[index].star;
                                                              }else if (this.name == "Mexican"){
                                                                return mexicanCategory[index].star;
                                                              }else if (this.name == "Tunisian"){
                                                                return tunisianCategory[index].star;;
                                                              }else if (this.name == "American"){
                                                                return americanCategory[index].star;
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
                                                  ),

                                                ),
                                              ),
                                              Container(
                                                height: 120,
                                                width: 50,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 22.0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Like(),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0),
                                                        child: Text(((){
                                                          if (this.name == "Indian"){
                                                            return "\$"+indianCategory[index].price;
                                                          }else if (this.name == "Chinese"){
                                                            return "\$"+chineseCategory[index].price;
                                                          }else if (this.name == "Italian"){
                                                            return "\$"+italianCategory[index].price;
                                                          }else if (this.name == "Mexican"){
                                                            return "\$"+mexicanCategory[index].price;
                                                          }else if (this.name == "Tunisian"){
                                                            return "\$"+tunisianCategory[index].price;;
                                                          }else if (this.name == "American"){
                                                            return "\$"+americanCategory[index].price;
                                                          }
                                                        }()),style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),),],),
                                ),
                              ),
                            ),),
                        ),



                      ),);},),),
            ],
          ),
        ),
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