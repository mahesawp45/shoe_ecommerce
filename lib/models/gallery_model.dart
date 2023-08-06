// ignore_for_file: public_member_api_docs, sort_constructors_first
class Gallery {
  int? id;
  int? productsId;
  String? url;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Gallery(
      {this.id,
      this.productsId,
      this.url,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsId = json['products_id'];
    url = json['url'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['products_id'] = productsId;
    data['url'] = url;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Gallery(id: $id, productsId: $productsId, url: $url, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Gallery other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productsId == productsId &&
        other.url == url &&
        other.deletedAt == deletedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productsId.hashCode ^
        url.hashCode ^
        deletedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
