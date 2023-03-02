import 'package:get/get.dart';
import 'package:getx_1/test_get/model/manufacturer.dart';
import 'package:getx_1/test_get/responsitory/manufacturer_responsitory.dart';

class ManufacturerController extends GetxController {
  var manufacturer = Manufacturer().obs;
  var manufacturerList = <Manufacturer>[].obs;
  final ManufacturerResponsitory _responsitory = ManufacturerResponsitory();

  void updateId(int id) => manufacturer.value = manufacturer.value..id = id;
  void updateName(String name) =>
      manufacturer.value = manufacturer.value..name = name;

  void addManufacturer(Manufacturer s) => manufacturerList.add(s);
  void removeManufacturer(Manufacturer s) => manufacturerList.remove(s);
  void updateManufacturer(int index, Manufacturer s) =>
      manufacturerList[index] = s;

  void updateManufacturerElement(Manufacturer s) {
    manufacturerList[manufacturerList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get manufacturer from api
  Future<void> initManufacturerList() async {
    manufacturerList.value = await _responsitory.getManufacturerAll();
    // print('Load data:  ' + manufacturerList.value[0].name!);
  }

  void initManufacturer(Manufacturer a) {
    manufacturer.value = a;
  }

  /// add manufacturer to api nodejs
  Future<dynamic> searchManufacturer(String keyword) async {
    // print('${data.id} ${data.name}');
    manufacturerList.value =
        await _responsitory.getManufacturerFromKeyword(keyword);
  }

  /// add account to api nodejs
  Future<dynamic> saveManufacturerAdd(Manufacturer data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.addManufacturer(data);
    await initManufacturerList();
    return response;
  }

  /// edit account to api nodejs
  Future<dynamic> saveManufacturerEdit(Manufacturer data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateManufacturer(data);
    // await initmanufacturerList();
    return response;
  }

  /// delete account api nodejs
  Future<dynamic> deleteManufacturer(Manufacturer data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteManufacturer(data);
    // removeAccount(data);
    return response;
  }

  /// Sort Manufacturer
  void sortListById(bool ascending) {
    if (ascending) {
      manufacturerList.value = manufacturerList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(manufacturerList.value[0].id!.toString());
    } else {
      manufacturerList.value = manufacturerList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(manufacturerList.value[0].id!.toString());
    }
  }

  void sortListByName(bool ascending) {
    if (ascending) {
      manufacturerList.value = manufacturerList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(manufacturerList.value[0].id!.toString());
    } else {
      manufacturerList.value = manufacturerList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(manufacturerList.value[0].id!.toString());
    }
  }
}
