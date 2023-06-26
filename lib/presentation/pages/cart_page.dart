import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:useradgents_exercise/domain/entities/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // access to the articles in the cart via CartProvider
    List<CartItem> cartItems = Provider.of<CartProvider>(context).items;

    // total price calculation
    double totalAmount = Provider.of<CartProvider>(context).totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                      cartItems[index].burgerMenu.thumbnail ?? ''),
                  title: Text(cartItems[index].burgerMenu.title),
                  subtitle: Text(
                      '${cartItems[index].quantity} x ${cartItems[index].burgerMenu.priceInEuros.toStringAsFixed(2)} €'),
                  trailing: Text(
                      'Subtotal: ${(cartItems[index].quantity * cartItems[index].burgerMenu.priceInEuros).toStringAsFixed(2)} €'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Total: $totalAmount €', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
