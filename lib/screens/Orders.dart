import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/components/OrderCategory.dart';
import 'package:food/screens/home.dart';
class Orders extends StatefulWidget {
  final String name;
  final String price;
  final String date;
  Orders({this.name,this.price,this.date});
  @override
  _OrdersState createState() => _OrdersState(name: name,price:price,date: date);
}

class _OrdersState extends State<Orders> {
  final String name;
  final String price;
  final String date;
  _OrdersState({this.name,this.price,this.date});
  List<OrderCategory> Ocategories = [
    OrderCategory(name: "Burger", price: "20",date: "2020-05-17 10:44:38.203"),
    OrderCategory(name: "Pasta", price: "50",date: "2020-05-17 10:44:38.203"),
  ];
  @override
  Widget build(BuildContext context) {
    if (date!=null && name!=null  && price!=null){
      Ocategories.add(OrderCategory(date: this.date,name:this.name,price: this.price,));
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.close , size: 25, color: Colors.black,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
            },
          ),
          title: Text("Orders", style: TextStyle( color: Colors.black, fontSize: 20),),
        ),
        body: Container(
          child:
          Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Ocategories.length,
                itemBuilder: (_,index){
                  return Container(
                    height: 80,
                    child: Card(
                      child: Material(
                        child: Container(
                          height: 130,
                          child: ListTile(
                            leading: Text("\$"+Ocategories[index].price, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            title: Text(Ocategories[index].name, style: TextStyle(color: Colors.black, fontSize: 16,),),
                            subtitle: Text(Ocategories[index].date, style: TextStyle(color: Colors.grey, fontSize: 15),),
                            trailing: Text("complete", style: TextStyle(color: Colors.green, fontSize: 18),),
                          ),
                        ),),
                    ),
                  );
                }),
          ),

        ),
      ),);
  }
}

