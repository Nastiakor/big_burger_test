import 'package:flutter/material.dart';
import 'package:useradgents_exercise/data/api/service/burger_api_service.dart';
import 'package:useradgents_exercise/domain/entities/burger_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:useradgents_exercise/presentation/pages/burger_detail_page.dart';
import 'package:useradgents_exercise/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<BurgerMenu>> futureBurgerMenu;
  final burgerApiService = BurgerApiService();

  @override
  void initState() {
    super.initState();
    futureBurgerMenu = burgerApiService.fetchBurgerMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          'Your favourite burger',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        color: const Color(0xFF000000),
        child: FutureBuilder<List<BurgerMenu>>(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerDetailPage(
                            burgerMenu: burgerMenu,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.network(
                              burgerMenu.thumbnail ?? '',
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // returns the image loaded
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                                    'images/big_salad.jpg'); // replacement image if error
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              burgerMenu.title,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  itemPrice.format(burgerMenu.price),
                                  style: const TextStyle(color: Colors.white),
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
              return const Center(
                child: Text("Failed to load data"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
