import 'package:flutter/material.dart';
import 'package:useradgents_exercise/domain/entities/menu_item.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class BurgerDetailPage extends StatefulWidget {
  final MenuItem menuItem;

  const BurgerDetailPage({Key? key, required this.menuItem}) : super(key: key);

  @override
  State<BurgerDetailPage> createState() => _BurgerDetailPageState();
}

class _BurgerDetailPageState extends State<BurgerDetailPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burgers'),
        actions: <Widget>[
          IconButton(
            icon: Stack(alignment: Alignment.topRight, children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              // circle containing the number if items
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    Provider.of<CartProvider>(context).items.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Image.network(
                  widget.menuItem.thumbnail ?? '',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('images/image_na.png');
                  },
                ),
              ),
              const SizedBox(height: 25),
              Text(
                widget.menuItem.title,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                widget.menuItem.description ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Ref: ${widget.menuItem.ref}',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                '${widget.menuItem.priceInEuros.toStringAsFixed(2)} €',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    style: Theme.of(context).iconButtonTheme.style,
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      if (quantity >= 1) {
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
                      style: Theme.of(context).iconButtonTheme.style,
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
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addItem(widget.menuItem, quantity);

                  // show a SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Done!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                  "Total: ${getTotalPrice(widget.menuItem.priceInEuros, quantity).toStringAsFixed(2)} €"),
            ],
          ),
        ),
      ),
    );
  }
}

double getTotalPrice(double itemsPrice, int itemsQuantity) {
  double result = itemsPrice * itemsQuantity;
  return result;
}
