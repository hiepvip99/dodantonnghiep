import 'package:getx_1/test_get/model/product.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/responsitory/product_responsitory.dart';

class ProductController extends GetxController {
  var product = Product().obs;
  var productList = <Product>[].obs;
  final ProductResponsitory _responsitory = ProductResponsitory();

  void updateId(int id) => product.value = product.value..id = id;
  void updateName(String name) => product.value = product.value..name = name;
  void updateIdCategory(int idCategory) =>
      product.value = product.value..idCategory = idCategory;
  void updatePrice(int price) => product.value = product.value..price = price;
  void updateIdQuantity(String idQuantity) =>
      product.value = product.value..idQuantity = idQuantity;
  void updateIdImage(List<int> idImage) =>
      product.value = product.value..idImage = idImage;
  void updateIdManufacturer(int idManufacturer) =>
      product.value = product.value..idManufacturer = idManufacturer;
  void updateIdSupplier(int idSupplier) =>
      product.value = product.value..idSupplier = idSupplier;

  void addProduct(Product s) => productList.add(s);
  void removeProduct(Product s) => productList.remove(s);
  void updateProduct(int index, Product s) => productList[index] = s;

  void updateProductElement(Product s) {
    productList[productList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get product from api
  Future<void> initProductList() async {
    productList.value = await _responsitory.getProductAll();
    // print('Load data:  ' + productList.value[0].name!);
  }

  void initProduct(Product a) {
    product.value = a;
  }

  /// add product to api nodejs
  Future<dynamic> searchProduct(String keyword) async {
    // print('${data.id} ${data.name}');
    productList.value = await _responsitory.getProductFromKeyword(keyword);
  }

  /// add product to api nodejs
  Future<dynamic> saveProductAdd(Product data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.addProduct(data);
    await initProductList();
    return response;
  }

  /// edit product to api nodejs
  Future<dynamic> saveProductEdit(Product data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateProduct(data);
    // await initProductList();
    return response;
  }

  /// delete product api nodejs
  Future<dynamic> deleteProduct(Product data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteProduct(data);
    // removeProduct(data);
    return response;
  }

  /// Sort product

  void sortListById(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByUserName(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByIdCategory(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.idCategory!.compareTo(b.idCategory!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.idCategory!.compareTo(a.idCategory!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByPrice(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.price!.compareTo(b.price!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.price!.compareTo(a.price!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByIdQuantity(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.idQuantity!.compareTo(b.idQuantity!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.idQuantity!.compareTo(a.idQuantity!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByIdManufacturer(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.idManufacturer!.compareTo(b.idManufacturer!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.idManufacturer!.compareTo(a.idManufacturer!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }

  void sortListByIdSupplier(bool ascending) {
    if (ascending) {
      productList.value = productList.toList()
        ..sort(
          (a, b) => a.idSupplier!.compareTo(b.idSupplier!),
        );
      // debugPrint(productList.value[0].id!.toString());
    } else {
      productList.value = productList.toList()
        ..sort(
          (a, b) => b.idSupplier!.compareTo(a.idSupplier!),
        );
      // debugPrint(productList.value[0].id!.toString());
    }
  }
}
