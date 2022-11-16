class PostFavoritesModel {
  bool? status;
  String? message;
  PostFavoritesData? data;

  PostFavoritesModel({this.status, this.message, this.data});

  PostFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? PostFavoritesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PostFavoritesData {
  int? id;
  FavoriteProduct? product;

  PostFavoritesData({this.id, this.product});

  PostFavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null
        ? FavoriteProduct.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class FavoriteProduct {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  FavoriteProduct(
      {this.id, this.price, this.oldPrice, this.discount, this.image});

  FavoriteProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    return data;
  }
}
