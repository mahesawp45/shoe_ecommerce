import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class Product {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  int? categoriesId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Gallery>? gallery;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.tags,
      this.categoriesId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.gallery});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    categoriesId = json['categories_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['galleries'] != null) {
      // gallery!.add(Gallery.fromJson(v));
      gallery = <Gallery>[];
      json['galleries'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
      // gallery = json['galleries'].map((v) => Gallery.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['tags'] = tags;
    data['categories_id'] = categoriesId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
