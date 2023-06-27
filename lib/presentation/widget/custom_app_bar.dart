import 'package:flutter/material.dart';
import 'package:useradgents_exercise/presentation/widget/cart_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showCartIcon;
  final bool showImage;
  final bool isOnHomePage;

  CustomAppBar(
      {this.title,
      this.showCartIcon = true,
      this.showImage = true,
      this.isOnHomePage = false});

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            child: Image.asset(
              'images/app_icon.png',
              width: 40,
            ),
            onTap: isOnHomePage
                ? null // if yes, deactivate onTap
                : () {
                    Navigator.pushNamed(context, '/');
                  },
          ),
          Expanded(
            child: Center(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      actions: showCartIcon
          ? [
              CartIconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ]
          : null,
    );
  }
}
