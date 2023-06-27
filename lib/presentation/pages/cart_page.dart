import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:useradgents_exercise/domain/entities/cart_item.dart';
import 'package:useradgents_exercise/presentation/widget/custom_app_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // access to the articles in the cart via CartProvider
    List<CartItem> cartItems = Provider.of<CartProvider>(context).items;

    // total price calculation
    double totalAmount = Provider.of<CartProvider>(context).totalPrice;

    return Scaffold(
      appBar: CustomAppBar(title: 'Cart', showCartIcon: true, showImage: true, isOnHomePage: false),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 60,
                    child: Image.network(
                      cartItems[index].menuItem.thumbnail ?? '',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('images/image_na.png');
                      },
                    ),
                  ),
                  title: Text(cartItems[index].menuItem.title,
                      style: Theme.of(context).textTheme.bodyMedium),
                  subtitle: Text(
                      '${cartItems[index].quantity} x ${cartItems[index].menuItem.priceInEuros.toStringAsFixed(2)} €',
                      style: Theme.of(context).textTheme.labelMedium),
                  trailing: Text(
                      'Subtotal: ${(cartItems[index].quantity * cartItems[index].menuItem.priceInEuros).toStringAsFixed(2)} €',
                      style: Theme.of(context).textTheme.labelMedium),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: ${totalAmount.toStringAsFixed(2)} €',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
