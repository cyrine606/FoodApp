class Item {
  final String name;
  final String image;
  Item({this.name, this.image});
}
List<Item> loadItems (){
  var fi = <Item>[
    Item(image:"android/images2/it.jpg",name:"Pizza"),
    Item(image:"android/images2/img4.jpg",name:"Steak"),
    Item(image:"android/images2/ital.jpg",name:"Pasta"),
    Item(image:"android/images2/ita.jpg",name:"Hamburger"),
    Item(image:"android/images2/tu.jpg",name:"Ojja"),
    Item(image:"android/images2/chines.jpg",name:"Sushi"),
    Item(image:"android/images2/chine.jpg",name:"Nouille"),
    Item(image:"android/images2/tun.jpg",name:"Couscous"),
    Item(name: "PastaCosi", image: "android/images2/re.jpg"),
    Item(name: "L\'Ardoise", image: "android/images2/resta.jpg"),
    Item(name: "Miam\'s", image: "android/images2/res.jpg"),
    Item(name: "Farmers", image: "android/images2/rest.jpg"),
  ];
}