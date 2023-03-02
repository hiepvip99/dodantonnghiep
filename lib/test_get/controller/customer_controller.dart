import 'package:getx_1/test_get/model/customer.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/responsitory/customer_responsitory.dart';

class CustomerController extends GetxController {
  var customer = Customer().obs;
  var customerList = <Customer>[].obs;
  final CustomerResponsitory _responsitory = CustomerResponsitory();

  void updateId(int id) => customer.value = customer.value..id = id;
  void updateName(String name) => customer.value = customer.value..name = name;
  void updateIdAccount(int idAccount) =>
      customer.value = customer.value..idAccount = idAccount;
  void updatePhoneNumber(int phoneNumber) =>
      customer.value = customer.value..phoneNumber = phoneNumber;
  void updateDateOfBirth(DateTime dateOfBirth) =>
      customer.value = customer.value..dateOfBirth = dateOfBirth;
  void updateEmail(String email) =>
      customer.value = customer.value..email = email;
  void updateIdImage(int idImage) =>
      customer.value = customer.value..idImage = idImage;

  void addCustomer(Customer s) => customerList.add(s);
  void removeCustomer(Customer s) => customerList.remove(s);
  void updateCustomer(int index, Customer s) => customerList[index] = s;

  void updateCustomerElement(Customer s) {
    customerList[customerList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get customer from api
  Future<void> initCustomerList() async {
    customerList.value = await _responsitory.getCustomerAll();
    // print('Load data:  ' + customerList.value[0].name!);
  }

  void initCustomer(Customer a) {
    customer.value = a;
  }

  /// add customer to api nodejs
  Future<dynamic> searchCustomer(String keyword) async {
    // print('${data.id} ${data.name}');
    customerList.value = await _responsitory.getCustomerFromKeyword(keyword);
  }

  /// add customer to api nodejs
  Future<dynamic> saveCustomerAdd(Customer data) async {
    print('${data.id} ${data.dateOfBirth}');
    var response = await _responsitory.addCustomer(data);
    await initCustomerList();
    return response;
  }

  /// edit customer to api nodejs
  Future<dynamic> saveCustomerEdit(Customer data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateCustomer(data);
    // await initCustomerList();
    return response;
  }

  /// delete customer api nodejs
  Future<dynamic> deleteCustomer(Customer data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteCustomer(data);
    // removeCustomer(data);
    return response;
  }

  /// Sort customer

  void sortListById(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByName(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByIdAccount(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.idAccount!.compareTo(b.idAccount!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.idAccount!.compareTo(a.idAccount!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByPhoneNumber(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.phoneNumber!.compareTo(b.phoneNumber!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.phoneNumber!.compareTo(a.phoneNumber!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByDateOfBirth(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.dateOfBirth!.compareTo(b.dateOfBirth!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.dateOfBirth!.compareTo(a.dateOfBirth!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByEmail(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.email!.compareTo(b.email!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.email!.compareTo(a.email!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }

  void sortListByIdImage(bool ascending) {
    if (ascending) {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => a.idImage!.compareTo(b.idImage!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    } else {
      customerList.value = customerList.toList()
        ..sort(
          (a, b) => b.idImage!.compareTo(a.idImage!),
        );
      // debugPrint(customerList.value[0].id!.toString());
    }
  }
}
