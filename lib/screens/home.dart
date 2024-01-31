import 'package:flutter/material.dart';
import 'package:food/components/Cards.dart';
import 'package:food/components/horizontalList.dart';
import 'package:food/provider/userProvider.dart';
import 'package:food/screens/Orders.dart';
import 'package:food/screens/ShoppingCart.dart';
import 'package:food/screens/login.dart';
import 'package:food/screens/seeProducts.dart';
import 'package:food/screens/seeRestaurants.dart';
import '../components/RestaurantCategories.dart';
import 'List-Data.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email;
  String name;
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          title: Text("FoodApp", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          )),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
            }),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Cyrine"),
                accountEmail: Text("cyrine@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage:  AssetImage("android/images2/profil.jpg"),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
                },
                child: ListTile(
                  leading: Icon(Icons.list),
                  title: Text("My Orders"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
                },
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Cart"),
                ),
              ),
              InkWell(
                onTap: () {
                  //user.signOut();
                },
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Log Out"),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: 650,
              height: 55,
              child:  Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 15,left:15),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40,
                        child: InkWell(
                          onTap:(){
                            showSearch(context:context,delegate: ItemsSearch());
                          },
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(padding: EdgeInsets.only(left: 10), child: Icon(Icons.search, color: Colors.deepOrange,),),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(25.7),
                              ),
                              hintText: "      Find Food and Restaurants",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "please enter some text";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),),),),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 7,),
            Container(
              height: 35,
              width: 430,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 35,
                    child: Center(
                      child: Text("Search by",
                        style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 20,),),
                    ),
                  ),
                  Container(
                    height: 35,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("Products",
                            style: TextStyle(color: Colors.deepOrange, fontSize: 19,),),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.filter_list, color: Colors.deepOrange,size: 20,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 5,),
            HorizontalList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Featured",
                    style: TextStyle(color: Colors.grey, fontSize: 19,),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SeeProducts()));
                    },
                    child: Text("See all",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 15, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Cards(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Popular Restaurants",
                    style: TextStyle(color: Colors.grey, fontSize: 19,),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SeeRestaurants()));
                    },
                    child: Text("See all",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 15, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            RestaurantCategories(),
          ],
        ),
      ),
    );
  }
}

class ItemsSearch extends SearchDelegate<Item>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){ query=""; })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ close(context, null); });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty?loadItems():loadItems().where((p) => p.name.startsWith(query)).toList();
    return mylist.isEmpty?Text("No Results Found...", style: TextStyle(color: Colors.grey,fontSize: 15),):ListView.builder(
        itemBuilder: (context, index){
          final Item listItem = mylist[index];
          return Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new AssetImage(listItem.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(height: 100, child: Text(listItem.name, style: TextStyle(color: Colors.black54,fontSize: 15),)),

                  ],
                ),
              ),
              Divider(),
            ],
          );
        }
    );
  }

}