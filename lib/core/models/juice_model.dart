import 'dart:io';

class JuiceModel {
  final int? id;
  final DateTime? createdAt;
  final String name;
  final String description;
  final int price;
  String? imageUrl;
  final File? image;

  JuiceModel({
    this.id,
    this.createdAt,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.image,
  });

  factory JuiceModel.fromJson(Map<String, dynamic> json) {
    return JuiceModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
    };
  }
}
