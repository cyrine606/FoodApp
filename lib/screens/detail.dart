//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screens/ShoppingCart.dart';
class CardDetails extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  final int length;
  CardDetails({ this.name,  this.image,  this.price,  this.description,this.length});
  @override
  _CardDetailsState createState() => _CardDetailsState(name: name, image: image, price: price, description:description,length:length);
}

class _CardDetailsState extends State<CardDetails> {
  int _index = 0;
  final String image;
  final String name;
  final String price;
  final String description;
  final int length;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _CardDetailsState({ this.name,  this.image,  this.price, this.description,this.length});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:  IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80,),
              Container(
                height: 220,
                width: 220,
                child: CircleAvatar(
                  backgroundImage: AssetImage(this.image),
                ),
              ),
              SizedBox(height: 20,),
              Text(this.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),),
              SizedBox(height: 10,),
              Text("\$"+ this.price, style: TextStyle(color: Colors.black, fontSize: 22),),
              SizedBox(height: 10,),
              Text("Description", style: TextStyle( color: Colors.black, fontSize: 18),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: Text(this.description,
                  style: TextStyle(color: Colors.grey, fontSize: 15),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 30,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 1,
                      onPressed: () {
                        minus();
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Removed from Cart'),
                              duration: Duration(seconds: 3),
                            ));
                      },
                      child: new Icon(Icons.remove, color: Colors.black,),
                      backgroundColor: Colors.white,),
                    new ClipRRect (
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child:  RaisedButton(
                          onPressed: (){
                            if ((_index==0) && (length == 0)){
                                  (context) {
                                showDialog (
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 300,
                                        width: 200,
                                        child: AlertDialog(
                                          title: new Text("Your Shopping Cart is Empty!",textAlign: TextAlign.center,),
                                          actions: <Widget>[
                                            new FlatButton(
                                              color: Colors.grey,
                                              child: new Text("Close", style: TextStyle(color: Colors.white),),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },),
                                          ],
                                        ),
                                      );
                                    }
                                );

                              };
                            }else if ((_index==0) && (length != 0)){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
                            }
                            else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart(name: name, image: image,price: price, description: description,ind: _index,)));
                            }
                          },
                          child: new Text('Add $_index to Cart', style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                          ),), color: Colors.deepOrange,
                        ),
                      ),),
                    FloatingActionButton(
                      heroTag: 2,
                      onPressed: () {
                        add();
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Added to Cart'),
                              duration: Duration(seconds: 3),
                            ));
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                      backgroundColor: Colors.white,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void add (){
    setState(() {
      _index++;
    });
  }
  void minus (){
    setState(() {
      if (_index!=0) {
        _index--;
      }
    });
  }
}

