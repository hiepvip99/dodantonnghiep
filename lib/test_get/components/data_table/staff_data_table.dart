import 'package:flutter/material.dart';
import 'package:getx_1/test_get/model/staff.dart';
import 'package:getx_1/test_get/controller/staff_controller.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/screen/admin/page/staff/add_edit_staff.dart';

class StaffDataTableSource extends DataTableSource {
  StaffDataTableSource({
    required this.staffList,
    required this.controller,
  });

  List<Staff> staffList;
  final StaffController controller;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: staffList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: staffList[index].name,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: staffList[index].address,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: staffList[index].phoneNumber,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value:
            '${staffList[index].brithOfDate!.day}-${staffList[index].brithOfDate!.month}-${staffList[index].brithOfDate!.year}',
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: staffList[index].idImage,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: staffList[index].position,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: staffList[index].basicSalary,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value:
            '${staffList[index].startWorkDate!.day}-${staffList[index].startWorkDate!.month}-${staffList[index].startWorkDate!.year}',
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa nhân viên',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditStaff(
                    controller: controller,
                    staff: staffList[index],
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                )),
          ),
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Xóa nhân viên',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response =
                      await controller.deleteStaff(staffList[index]);
                  if (response is bool) {
                    controller.removeStaff(staffList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa nhân viên thành công',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      colorText: Colors.white,
                      '',
                      'Ui xời không có lỗi gì cả',
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                    );
                  } else {
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      '',
                      colorText: Colors.white,
                      '',
                      titleText: Column(
                        children: [
                          const Text(
                            'Lỗi',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            '$response',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                    );
                  }
                },
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                  ),
                )),
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => staffList.length;

  @override
  int get selectedRowCount => 0;
}
