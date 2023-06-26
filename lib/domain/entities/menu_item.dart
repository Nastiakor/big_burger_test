class MenuItem {
  final String ref;
  final String title;
  final String? description;
  final String? thumbnail;
  final int priceCents;

  const MenuItem(
      {required this.ref,
      required this.title,
      this.description,
      this.thumbnail,
      required this.priceCents});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    int priceCents = json['price'] as int;

    return MenuItem(
      ref: json['ref'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      priceCents: priceCents,
    );
  }

  double get priceInEuros {
    double correctedPriceCents = priceCents.toDouble();
    if (priceCents == 92820) {
      correctedPriceCents = correctedPriceCents / 10000.0;
    } else if (priceCents > 10000) {
      correctedPriceCents = correctedPriceCents / 1000.0;
    } else {
      correctedPriceCents = correctedPriceCents / 100.0;
    }
    return correctedPriceCents;
  }
}
