import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';
import 'package:useradgents_exercise/main.dart';

class BurgerDetailPage extends StatelessWidget {
  final BurgerMenu burgerMenu;

  const BurgerDetailPage({Key? key, required this.burgerMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF000000),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 100),
                Text(
                  burgerMenu.title,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 30),
                Text(
                  burgerMenu.description ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 30),
                Text(
                  'Ref: ${burgerMenu.ref}',
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 30),
                Text(
                  'Price: ${itemPrice.format(burgerMenu.price)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
