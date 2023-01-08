//This File Creates a list of food Item using the Map Function.
import 'package:flutter/material.dart';

class MyFlutterListe extends StatefulWidget {
  const MyFlutterListe({Key? key}) : super(key: key);

  @override
  State<MyFlutterListe> createState() => _MyFlutterListeState();
}

class _MyFlutterListeState extends State<MyFlutterListe> {
  List<String> foodItems = [
    "Vegetables",
    "Carrots",
    "Fish",
    "Chicken",
    "Ginger",
    "Spoons",
    "Pots",
    "Rice",
    "Beans",
    "Onions",
    "Goat-Meat",
    "Plantain",
    "Yams",
    "Salt",
    "Maggi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SHOPPING CART"),
          centerTitle: true,
        ),
        body: Column(
          //foodItems.map returns an iterable!
            children: foodItems.map((foodItemParameter) {
              return Text(foodItemParameter);
            }).toList()
          //the map function cycles through a list of data and for each item in that list, It performs a function,for each funcion that it runs, it returns a value!
          //the foodItemParameter, represents each item in my list.
          //the above code means for each function, take a a foodItemParameter of type string and return a text widget into the map iterable
          //.toList() converts our iterable into a list of text Widget.
        ));
  }
}
