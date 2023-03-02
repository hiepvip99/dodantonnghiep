class Product {
  int? id;
  String? name;
  int? idCategory;
  int? price;
  String? idQuantity;
  List<int>? idImage;
  int? idManufacturer;
  int? idSupplier;

  Product(
      {this.id,
      this.name,
      this.idCategory,
      this.price,
      this.idQuantity,
      this.idImage,
      this.idManufacturer,
      this.idSupplier});

  Product.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    name = json['name'];
    idCategory = int.tryParse(json['id_category'].toString());
    price = int.tryParse(json['price'].toString());
    idQuantity = json['id_quantity'];
    idImage = (json['id_image'] as String)
        .split(',')
        .map((e) => int.parse(e))
        .toList();
    idManufacturer = int.tryParse(json['id_manufacturer'].toString());
    idSupplier = int.tryParse(json['id_supplier'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['id_category'] = idCategory;
    data['price'] = price;
    data['id_quantity'] = idQuantity;
    data['id_image'] = idImage!.join(',');
    data['id_manufacturer'] = idManufacturer;
    data['id_supplier'] = idSupplier;
    return data;
  }
}
