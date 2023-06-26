import 'package:flutter/material.dart';
import 'package:useradgents_exercise/data/api/service/burger_api_service.dart';
import 'package:useradgents_exercise/domain/entities/menu_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<MenuItem>> futureBurgerMenu;
  final BurgerApiService apiService = BurgerApiService();

  @override
  void initState() {
    super.initState();
    futureBurgerMenu = apiService.fetchBurgerMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your favourite burger',
        ),
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: futureBurgerMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final burgerMenus = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: burgerMenus.length,
              itemBuilder: (context, index) {
                final burgerMenu = burgerMenus[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/product-details',
                      arguments: burgerMenu,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            burgerMenu.thumbnail ?? '',
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // returns the image loaded
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  'images/image_na.png'); // replacement image if error
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            burgerMenu.title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${burgerMenu.priceInEuros.toStringAsFixed(2)} €',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Failed to load data"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureBurgerMenu = apiService.fetchBurgerMenu();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
