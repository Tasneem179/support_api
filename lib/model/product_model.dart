class ProductModel{
  final String title;
  final String description;
  final int price;
  final String image;

  ProductModel({required this.title, required this.description,required this.image,required this.price});
  factory ProductModel.fromJson(Map<String, dynamic>json)
  {
    return ProductModel(
        title: json["title"],
        description: json["description"],
        image: json["images"][0],
       price: json["price"]
    );
  }
}