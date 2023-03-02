import 'package:flutter/material.dart';
import 'package:getx_1/test_get/model/product.dart';
import 'package:getx_1/test_get/controller/product_controller.dart';
import 'package:getx_1/test_get/components/custom_data_cell.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/screen/admin/page/product/add_edit_product.dart';

class ProductDataTableSource extends DataTableSource {
  ProductDataTableSource({
    required this.productList,
    required this.controller,
  });

  List<Product> productList;
  final ProductController controller;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomDataCell(
        // width: 20,
        value: productList[index].id,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: productList[index].name,
      )),
      DataCell(CustomDataCell(
        // width: 200,
        value: productList[index].idCategory,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: productList[index].price,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: productList[index].idQuantity,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: productList[index].idImage,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: productList[index].idManufacturer,
      )),
      DataCell(CustomDataCell(
        // width: 50,
        value: productList[index].idSupplier,
      )),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            waitDuration: const Duration(seconds: 1),
            message: 'Sửa sản phẩm',
            child: InkWell(
                splashColor: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  await Get.dialog(AddEditProduct(
                    controller: controller,
                    product: productList[index],
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
            message: 'Xóa sản phẩm',
            child: InkWell(
                splashColor: Colors.red[100],
                onTap: () async {
                  Get.closeAllSnackbars();
                  final response =
                      await controller.deleteProduct(productList[index]);
                  if (response is bool) {
                    controller.removeProduct(productList[index]);
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Row(
                        children: const [
                          Text(
                            'Đã xóa sản phẩm thành công',
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
  int get rowCount => productList.length;

  @override
  int get selectedRowCount => 0;
}
