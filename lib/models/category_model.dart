import 'package:shamo/models/product_model.dart';

class Category {
  int? id;
  String? name;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Product>? products;

  Category(
      {this.id,
      this.name,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
