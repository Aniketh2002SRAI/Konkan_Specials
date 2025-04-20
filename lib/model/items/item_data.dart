class ItemData {
  final String name;
  final int price;
  final String image_url;
  final String description;

  final int stock_quantity;
  final String category_id;
  final String id;
  final bool spotlight;

  ItemData({
    required this.name,
    required this.price,
    required this.image_url,
    required this.description,
    required this.category_id,
    required this.id,
    required this.stock_quantity,
    required this.spotlight,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image_url': image_url,
      'description': description,
      'stock_quantity': stock_quantity,
      'category_id': category_id,
      'id': id,
      'spotlight': spotlight,
    };
  }

  factory ItemData.fromJson(Map<String, dynamic> json) {
    print("json $json");
    return ItemData(
      name: json['name'] as String,
      price: json['price'] as int,
      image_url: json['image_url'] as String,
      description: json['description'] as String,
      stock_quantity: json['stock_quantity'] as int,
      category_id: json['category_id'] as String,
      id: json['id'] as String,
      spotlight: json['spotlight'] as bool,
    );
  }
}
