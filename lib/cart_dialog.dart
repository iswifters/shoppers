import 'package:flutter/material.dart';
import 'package:shoppers/models/cart.dart';

class AddCartDialog extends StatefulWidget {
  final Function(Cart) addCart;

  const AddCartDialog({
    Key? key,
    required this.addCart,
  }) : super(key: key);

  @override
  State<AddCartDialog> createState() => _AddCartDialogState();
}

class _AddCartDialogState extends State<AddCartDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        height: 350,
        width: 400,
        child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Cart It!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.pinkAccent,
                  ),
                ),
                buildTextfield("Food Item", itemController),
                buildTextfield("Category", catController),
                buildTextfield("Amount", amountController),
                const SizedBox(
                  height: 7.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    final cartInfo = Cart(itemController.text, catController.text,
                        amountController.text);
                    widget.addCart(cartInfo);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add Food"),
                ),
              ],
            )));
  }

  var itemController = TextEditingController();
  var catController = TextEditingController();
  var amountController = TextEditingController();

  Widget buildTextfield(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            )),
        controller: controller,
      ),
    );
  }
}
