import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/components/SoppingCartCategory.dart';
import 'package:food/screens/Orders.dart';
import 'package:food/screens/detail.dart';
class ShoppingCart extends StatefulWidget {
  final String image;
  final String name;
  final int ind;
  final String price;
  final String description;

  ShoppingCart({  this.image ,  this.name,   this.ind, this.price, this.description});
  @override
  _ShoppingCartState createState() => _ShoppingCartState(name: name, image: image, price: price, ind: ind,description:description,);
}

class _ShoppingCartState extends State<ShoppingCart> {
  final String image;
  final String name;
  final int ind;
  final String price;
  final String description;
  _ShoppingCartState({ this.image, this.name, this.ind, this.price, this.description});
  List<ShoppingCartCategory> fCategory = [
    ShoppingCartCategory(image:"android/images2/ital.jpg",name:"Pasta",price:"60", index:1,description: "le Lorem est un texte de composition",),
    ShoppingCartCategory(image:"android/images2/english.jpg",name:"Hamburger",price:"80", index:3,description: "le Lorem est un texte de composition",),
  ];
  @override
  Widget build(BuildContext context) {
    if (image!=null && name!=null && ind!=null && price!=null && description!=null){
      fCategory.add(ShoppingCartCategory(image: this.image,name:this.name,index:this.ind,price: this.price,description:this.description,));
    }
    CardDetails(length: fCategory.length);
    var total = ((){
      int s=0;
      String total;
      for(int i =0; i<fCategory.length;i++){
        s = s + (int.parse(fCategory[i].price)*fCategory[i].index);
      }
      total = s.toString();
      return (total);
    }());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Shopping Cart", style: TextStyle( color: Colors.black, fontSize: 20),),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right:8.0, bottom: 15.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text("  Total:  ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 23),),
                    Text("\$"+total, style: TextStyle(color: Colors.deepOrange, fontSize: 23, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Container(
                        width: 135,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepOrangeAccent,
                          elevation: 0.0,
                          child: MaterialButton(
                            minWidth: 100,
                            onPressed: (){
                              _showDialog (total,((){
                                var str ='';
                                for(int i =0; i<fCategory.length;i++){
                                  str = str +fCategory[i].name +', ';
                                }
                                return str;
                              }()),description, context);
                            },
                            child: Text("Check Out", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
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
        body:
        Center(
          child: Container(
            width: 400,
            child:  ListView.builder(
                itemCount: fCategory.length,
                itemBuilder: (_,index)
                {
                  return Container( child: Padding(
                    padding: const EdgeInsets.only(bottom: 5,left:3,right:3, top:5),
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
                          child: Card(
                            child: Hero(
                              tag: fCategory[index].name,
                              child: Material(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 140,
                                        //height: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(fCategory[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            width: 220,
                                            height: 120,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 170,
                                                  child: ListTile(
                                                    title: Text(fCategory[index].name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                                    subtitle: Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 90, top:8.0),
                                                          child: Text("\$"+fCategory[index].price, style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.left,),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        Row(
                                                          children: <Widget>[
                                                            Text("Quantity:  ", style: TextStyle(color: Colors.grey, fontSize: 17),),
                                                            Text(fCategory[index].index.toString(), style: TextStyle(color: Colors.deepOrange, fontSize: 17),),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    //trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,size: 30,), onPressed: (){}),
                                                  ),
                                                ),
                                                Container(
                                                    width: 50,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 15.0,bottom: 10),
                                                      child: IconButton(icon: Icon(Icons.delete, color: Colors.red,size: 30,), onPressed: (){}),
                                                    )),
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
                        ),),
                    ),),


                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
void _showDialog (total,name,description, context){
  showDialog (
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("you will be charged \$" + total + " upon Delivery!"),
          actions: <Widget>[
            new FlatButton(
                color: Colors.deepOrange,
                child: new Text("Accept", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  final now = new DateTime.now().toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Orders(name: name,price: total,date: now,),),);
                }),
            new FlatButton(
              color: Colors.deepPurpleAccent,
              child: new Text("Reject", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },),
          ],
        );
      }
  );

}