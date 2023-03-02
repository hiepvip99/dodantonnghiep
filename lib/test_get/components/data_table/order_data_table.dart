import 'package:flutter/material.dart';
import 'package:getx_1/test_get/controller/order_controller.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/model/order.dart';
import 'package:getx_1/test_get/screen/admin/page/order/add_edit_order.dart';

class OrderDataTableSource extends DataTableSource {
  OrderDataTableSource({
    required this.orderList,
    required this.controller,
  });

  List<Order> orderList;
  final OrderController controller;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: orderList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value:
            '${orderList[index].orderDate!.day}-${orderList[index].orderDate!.month}-${orderList[index].orderDate!.year}',
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: orderList[index].idCustomer,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: orderList[index].idOrderDetails,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: orderList[index].idOrderStatus,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: orderList[index].total,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: orderList[index].paymentMethods,
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa đơn hàng',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditOrder(
                    controller: controller,
                    order: orderList[index],
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
            message: 'Xóa đơn hàng',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response =
                      await controller.deleteOrder(orderList[index]);
                  if (response is bool) {
                    controller.removeOrder(orderList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa đơn hàng thành công',
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
  int get rowCount => orderList.length;

  @override
  int get selectedRowCount => 0;
}
