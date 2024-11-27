class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
}
