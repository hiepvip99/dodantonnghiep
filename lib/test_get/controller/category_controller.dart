import 'package:get/get.dart';
import 'package:getx_1/test_get/model/category.dart';
import 'package:getx_1/test_get/responsitory/category_responsitory.dart';

class CategoryController extends GetxController {
  var category = MyCategory().obs;
  var categoryList = <MyCategory>[].obs;
  final CategoryResponsitory _responsitory = CategoryResponsitory();

  void updateId(int id) => category.value = category.value..id = id;
  void updateName(String name) => category.value = category.value..name = name;

  void addCategory(MyCategory s) => categoryList.add(s);
  void removeCategory(MyCategory s) => categoryList.remove(s);
  void updateCategory(int index, MyCategory s) => categoryList[index] = s;

  void updateCategoryElement(MyCategory s) {
    categoryList[categoryList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get category from api
  Future<void> initCategoryList() async {
    categoryList.value = await _responsitory.getCategoryAll();
    // print('Load data:  ' + categoryList.value[0].name!);
  }

  void initCategory(MyCategory a) {
    category.value = a;
  }

  /// add category to api nodejs
  Future<dynamic> searchCategory(String keyword) async {
    // print('${data.id} ${data.name}');
    categoryList.value = await _responsitory.getCategoryFromKeyword(keyword);
  }

  /// add account to api nodejs
  Future<dynamic> saveCategoryAdd(MyCategory data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.addCategory(data);
    await initCategoryList();
    return response;
  }

  /// edit account to api nodejs
  Future<dynamic> saveCategoryEdit(MyCategory data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateCategory(data);
    // await initcategoryList();
    return response;
  }

  /// delete account api nodejs
  Future<dynamic> deleteCategory(MyCategory data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteCategory(data);
    // removeAccount(data);
    return response;
  }

  /// Sort Category
  void sortListById(bool ascending) {
    if (ascending) {
      categoryList.value = categoryList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(categoryList.value[0].id!.toString());
    } else {
      categoryList.value = categoryList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(categoryList.value[0].id!.toString());
    }
  }

  void sortListByName(bool ascending) {
    if (ascending) {
      categoryList.value = categoryList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(categoryList.value[0].id!.toString());
    } else {
      categoryList.value = categoryList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(categoryList.value[0].id!.toString());
    }
  }
}
