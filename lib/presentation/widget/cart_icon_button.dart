import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';

class CartIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  CartIconButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
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
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                Provider.of<CartProvider>(context)
                    .totalItemsCount
                    .toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
