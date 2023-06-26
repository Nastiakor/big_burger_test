import 'package:flutter/material.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class BurgerDetailPage extends StatefulWidget {
  final BurgerMenu burgerMenu;

  const BurgerDetailPage({Key? key, required this.burgerMenu})
      : super(key: key);

  @override
  State<BurgerDetailPage> createState() => _BurgerDetailPageState();
}

class _BurgerDetailPageState extends State<BurgerDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.network(
                    widget.burgerMenu.thumbnail ?? '',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Could not load image');
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  widget.burgerMenu.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.burgerMenu.description ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Ref: ${widget.burgerMenu.ref}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.burgerMenu.priceInEuros.toStringAsFixed(2)} €',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Colors.white,
                      style: IconButton.styleFrom(),
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      quantity.toString(),
                    ),
                    IconButton(
                        color: Colors.white,
                        style: IconButton.styleFrom(),
                        icon: Icon(Icons.add_circle),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        }),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: true)
                        .addItem(widget.burgerMenu);
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                    "Total: ${getTotalPrice(widget.burgerMenu.priceInEuros, quantity)} €"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double getTotalPrice(itemsPrice, itemsQuantity) {
  double result = itemsPrice * itemsQuantity;
  String stringParse = result.toStringAsFixed(2);
  double totalPrice = double.parse(stringParse);
  return totalPrice;
}
