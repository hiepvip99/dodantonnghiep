import 'package:getx_1/test_get/model/staff.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/responsitory/staff_responsitory.dart';

class StaffController extends GetxController {
  var staff = Staff().obs;
  var staffList = <Staff>[].obs;
  final StaffResponsitory _responsitory = StaffResponsitory();

  void updateId(int id) => staff.value = staff.value..id = id;
  void updateName(String name) => staff.value = staff.value..name = name;
  void updateIdAddress(String address) =>
      staff.value = staff.value..address = address;
  void updatePhoneNumber(int phoneNumber) =>
      staff.value = staff.value..phoneNumber = phoneNumber;
  void updateIdBrithOfDate(DateTime brithOfDate) =>
      staff.value = staff.value..brithOfDate = brithOfDate;
  void updatePosition(String position) =>
      staff.value = staff.value..position = position;
  void updateIdBasicSalary(int basicSalary) =>
      staff.value = staff.value..basicSalary = basicSalary;
  void updateStartWorkDate(DateTime startWorkDate) =>
      staff.value = staff.value..startWorkDate = startWorkDate;
  void updateIdImage(int idImage) =>
      staff.value = staff.value..idImage = idImage;

  void addStaff(Staff s) => staffList.add(s);
  void removeStaff(Staff s) => staffList.remove(s);
  void updateStaff(int index, Staff s) => staffList[index] = s;

  void updateStaffElement(Staff s) {
    staffList[staffList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get staff from api
  Future<void> initStaffList() async {
    staffList.value = await _responsitory.getStaffAll();
    // print('Load data:  ' + staffList.value[0].name!);
  }

  void initStaff(Staff a) {
    staff.value = a;
  }

  /// add staff to api nodejs
  Future<dynamic> searchStaff(String keyword) async {
    // print('${data.id} ${data.name}');
    staffList.value = await _responsitory.getStaffFromKeyword(keyword);
  }

  /// add staff to api nodejs
  Future<dynamic> saveStaffAdd(Staff data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.addStaff(data);
    await initStaffList();
    return response;
  }

  /// edit staff to api nodejs
  Future<dynamic> saveStaffEdit(Staff data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.updateStaff(data);
    // await initStaffList();
    return response;
  }

  /// delete staff api nodejs
  Future<dynamic> deleteStaff(Staff data) async {
    // print('${data.id} ${data.name}');
    var response = await _responsitory.deleteStaff(data);
    // removeStaff(data);
    return response;
  }

  /// Sort staff

  void sortListById(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByUserName(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.name!.compareTo(a.name!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByIdAddress(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.address!.compareTo(b.address!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.address!.compareTo(a.address!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByPhoneNumber(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.phoneNumber!.compareTo(b.phoneNumber!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.phoneNumber!.compareTo(a.phoneNumber!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByIdBrithOfDate(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.brithOfDate!.compareTo(b.brithOfDate!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.brithOfDate!.compareTo(a.brithOfDate!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByIdBasicSalary(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.basicSalary!.compareTo(b.basicSalary!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.basicSalary!.compareTo(a.basicSalary!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByStartWorkDate(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.startWorkDate!.compareTo(b.startWorkDate!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.startWorkDate!.compareTo(a.startWorkDate!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }

  void sortListByPosition(bool ascending) {
    if (ascending) {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => a.position!.compareTo(b.position!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    } else {
      staffList.value = staffList.toList()
        ..sort(
          (a, b) => b.position!.compareTo(a.position!),
        );
      // debugPrint(staffList.value[0].id!.toString());
    }
  }
}
