import 'package:flutter/material.dart';
import 'package:getx_1/test_get/model/customer.dart';
import 'package:getx_1/test_get/controller/customer_controller.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/screen/admin/page/customer/add_edit_customer.dart';

class CustomerDataTableSource extends DataTableSource {
  CustomerDataTableSource({
    required this.customerList,
    required this.controller,
  });

  List<Customer> customerList;
  final CustomerController controller;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: customerList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: customerList[index].name,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: customerList[index].idAccount,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: customerList[index].phoneNumber,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value:
            '${customerList[index].dateOfBirth!.day}-${customerList[index].dateOfBirth!.month}-${customerList[index].dateOfBirth!.year}',
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: customerList[index].email,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: customerList[index].idImage,
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa khách hàng',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditCustomer(
                    controller: controller,
                    customer: customerList[index],
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
            message: 'Xóa khách hàng',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response =
                      await controller.deleteCustomer(customerList[index]);
                  if (response is bool) {
                    controller.removeCustomer(customerList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa khách hàng thành công',
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
  int get rowCount => customerList.length;

  @override
  int get selectedRowCount => 0;
}
