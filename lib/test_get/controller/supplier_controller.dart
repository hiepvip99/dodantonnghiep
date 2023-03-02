import 'package:get/get.dart';
import 'package:getx_1/test_get/model/supplier.dart';
import 'package:getx_1/test_get/responsitory/supplier_responsitory.dart';

class SupplierController extends GetxController {
  var supplier = Supplier().obs;
  var supplierList = <Supplier>[].obs;
  final SupplierResponsitory _responsitory = SupplierResponsitory();

  void updateId(int id) => supplier.value = supplier.value..id = id;
  void updateName(String name) => supplier.value = supplier.value..name = name;

  void addSupplier(Supplier s) => supplierList.add(s);
  void removeSupplier(Supplier s) => supplierList.remove(s);
  void updateSupplier(int index, Supplier s) => supplierList[index] = s;

  void updateSupplierElement(Supplier s) {
    supplierList[supplierList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get supplier from api
  Future<void> initSupplierList() async {
    supplierList.value = await _responsitory.getSupplierAll();
    // print('Load data:  ' + supplierList.value[0].name!);
  }

  void initSupplier(Supplier a) {
    supplier.value = a;
  }

  /// add supplier to api nodejs
  Future<dynamic> searchSupplier(String keyword) async {
    // print('${data.id} ${data.name}');
    supplierList.value = await _responsitory.getSupplierFromKeyword(keyword);
  }

  /// add account to api nodejs
  Future<dynamic> saveSupplierAdd(Supplier data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.addSupplier(data);
    await initSupplierList();
    return response;
  }

  /// edit account to api nodejs
  Future<dynamic> saveSupplierEdit(Supplier data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateSupplier(data);
    // await initsupplierList();
    return response;
  }

  /// delete account api nodejs
  Future<dynamic> deleteSupplier(Supplier data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteSupplier(data);
    // removeAccount(data);
    return response;
  }

  /// Sort Supplier
  void sortListById(bool ascending) {
    if (ascending) {
      supplierList.value = supplierList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(supplierList.value[0].id!.toString());
    } else {
      supplierList.value = supplierList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(supplierList.value[0].id!.toString());
    }
  }

  void sortListByName(bool ascending) {
    if (ascending) {
      supplierList.value = supplierList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(supplierList.value[0].id!.toString());
    } else {
      supplierList.value = supplierList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(supplierList.value[0].id!.toString());
    }
  }
}
