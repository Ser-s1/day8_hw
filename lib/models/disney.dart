class Disney {
  int? id;
  String? name;
  String? imageUrl;
  String? info;
  double? price;
  int? stock;
  

  Disney({this.id,this.imageUrl,this.name,this.info,this.price,this.stock});



  factory Disney.fromJson(Map<String,dynamic> json){
    return Disney(
      id: json["id"] ?? 0,
      imageUrl: json["thumbnail"] ?? "",
      name: json["title"] ?? "",
      price: json["price"] ?? 0,
      info: json["description"] ?? "",
      stock: json["stock"] ?? 0,
    );
  }
}