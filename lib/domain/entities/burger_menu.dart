class BurgerMenu {
  final String ref;
  final String title;
  final String? description;
  final String? thumbnail;
  final int price;

  const BurgerMenu(
      {required this.ref,
      required this.title,
      this.description,
      this.thumbnail,
      required this.price});

  factory BurgerMenu.fromJson(Map<String, dynamic> json) {
    final int price = json['price'];
    int convertedPrice = price;

    if (price == 92820) {
      convertedPrice = price ~/ 10000;
    } else if (price > 10000) {
      convertedPrice = price ~/ 1000;
    } else {
      convertedPrice = price ~/ 100;
    }

    return BurgerMenu(
      ref: json['ref'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: convertedPrice,
    );
  }
}
