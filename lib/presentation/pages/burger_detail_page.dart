import 'package:flutter/material.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';

class BurgerDetailPage extends StatelessWidget {
  final BurgerMenu burgerMenu;

  const BurgerDetailPage({Key? key, required this.burgerMenu})
      : super(key: key);

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
                  width: 300,
                  child: Image.network(
                    burgerMenu.thumbnail ?? '',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Could not load image');
                    },
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  burgerMenu.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 30),
                Text(
                  burgerMenu.description ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 30),
                Text(
                  'Ref: ${burgerMenu.ref}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 30),
                Text(
                  '${burgerMenu.priceInEuros.toStringAsFixed(2)} €',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
