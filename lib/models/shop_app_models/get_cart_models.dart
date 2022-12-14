class GetCartModels {
  bool? status;
  late Data data;

  GetCartModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late List<CartItems> cartItems;
  int? subTotal;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems.add(CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_items'] = cartItems.map((v) => v.toJson()).toList();
    data['sub_total'] = subTotal;
    data['total'] = total;
    return data;
  }
}

class CartItems {
  int? id;
  int? quantity;
  late Product product;

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['product'] = product.toJson();
    return data;
  }
}

class Product {
  late int id;
  late int price;
  late int oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}
