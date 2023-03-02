// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:getx_1/test_get/screen/admin/page/manufacturer/add_edit_manufacturer.dart';
import 'package:getx_1/test_get/controller/manufacturer_controller.dart';
import 'package:getx_1/test_get/model/manufacturer.dart';

class ManufacturerDataTable extends DataTableSource {
  List<Manufacturer> manufacturerList;
  final ManufacturerController controller;
  ManufacturerDataTable({
    required this.manufacturerList,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: manufacturerList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: manufacturerList[index].name,
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa nhà sản xuất',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditManufacturer(
                    controller: controller,
                    manufacturer: manufacturerList[index],
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
            message: 'Xóa nhà sản xuất',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response = await controller
                      .deleteManufacturer(manufacturerList[index]);
                  if (response is bool) {
                    controller.removeManufacturer(manufacturerList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa nhà sản xuất thành công',
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
  int get rowCount => manufacturerList.length;

  @override
  int get selectedRowCount => 0;
}
