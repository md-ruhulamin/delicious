import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String image;
  final String category;
  //bool isFavorite=true;

  Product(
      {
      // required  this.isFavorite,
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.rating,
      required this.image,
      required this.category});

  // Factory constructor to create a Product instance from a Firestore document
  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
        id: id,
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        price: (map['price'] ?? 0.0).toDouble(),
        rating: (map['rating'] ?? 0.0).toDouble(),
        image: map['image'] ?? '',
        category: map['category'] ?? 'Food'
        //    isFavorite:map['isFavorite'] ?? false,
        );
  }
  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
        id: doc.id,
        image: data['image'],
        name: data['name'],
        description: data['description'],
        rating: data['rating'].toDouble(),
        price: data['price'].toDouble(),
        category: data['category']
        // isFavorite: false,
        );
  }
}
