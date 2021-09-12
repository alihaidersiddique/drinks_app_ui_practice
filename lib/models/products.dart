import 'dart:convert';

class Drinks {
  final int id;
  final String name;
  final String quantity;
  final double price;
  final String image;

  Drinks({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  static List<Drinks> data = [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  factory Drinks.fromMap(Map<String, dynamic> map) {
    return Drinks(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Drinks.fromJson(String source) => Drinks.fromMap(json.decode(source));
}
