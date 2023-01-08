import 'package:flutter/material.dart';
import 'package:shoppers/cart_dialog.dart';
import 'package:shoppers/models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyFlutterList(),
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  State<MyFlutterList> createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  List<Cart> cartList = [
    Cart("Beans", "grain", "10000.00"),
    Cart("Carrot", "fruit", "1800.00"),
  ];

  @override
  Widget build(BuildContext context) {
    void addCartData(Cart carte) {
      setState(() {
        cartList.add(carte);
      });
    }

    void showCartDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: AddCartDialog(addCart: addCartData),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            );
          });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showCartDialog,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("SHOPPING CART",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    title: Text(cartList[index].foodItem,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text(cartList[index].category,
                        style: const TextStyle(
                          fontSize: 17,
                        )),
                    trailing: Text(cartList[index].amount,
                        style: const TextStyle(
                          fontSize: 21,
                        )),
                  ),
                );
              },
              itemCount: cartList.length),
        ));
  }
}
