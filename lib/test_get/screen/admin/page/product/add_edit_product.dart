import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/product_controller.dart';
import 'package:getx_1/test_get/model/product.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';

class AddEditProduct extends StatelessWidget {
  AddEditProduct({super.key, required this.product, required this.controller});

  final Product? product;
  final _formKey = GlobalKey<FormBuilderState>();
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: false);
        return false;
      },
      child: GestureDetector(
        onTap: () async {
          Get.back(result: false);
        },
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            product == null
                                ? const Text('Thêm Tài Khoản')
                                : const Text('Sửa Tài Khoản'),
                            const SizedBox(
                              height: 10,
                            ),
                            product == null
                                ? const SizedBox()
                                : Text('ID: ${product!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: product != null ? false : true,
                                      label: 'Tên sản phẩm',
                                      textdata: product != null
                                          ? product!.name.toString()
                                          : null,
                                      name: 'name'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_category',
                                    label: 'Id Danh muc',
                                    textdata: product != null
                                        ? product!.idCategory.toString()
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: true,
                                      name: 'price',
                                      textdata: product != null
                                          ? product!.price!.toString()
                                          : null,
                                      label: 'Giá'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_quantity',
                                    label: 'Id Số Lượng',
                                    textdata: product != null
                                        ? product!.idQuantity!.toString()
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: true,
                                      name: 'id_image',
                                      textdata: product != null
                                          ? product!.idImage!.toString()
                                          : null,
                                      label: 'Id ảnh'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_manufacturer',
                                    label: 'Id Nhà sản xuất',
                                    textdata: product != null
                                        ? product!.idManufacturer!.toString()
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_supplier',
                                    label: 'Id Nhà cung ứng',
                                    textdata: product != null
                                        ? product!.idSupplier!.toString()
                                        : null,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.closeAllSnackbars();
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      final formData =
                                          _formKey.currentState?.value;
                                      // print(_formKey.currentState?.value.toString());
                                      Product a = Product.fromJson(formData!);

                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (product == null) {
                                        response =
                                            await controller.saveProductAdd(a);
                                      } else {
                                        a.id = product!.id;
                                        response =
                                            await controller.saveProductEdit(a);
                                        controller.updateProductElement(a);
                                      }

                                      if (response is bool) {
                                        if (product == null) {
                                          Get.back(result: true);
                                          Get.snackbar(
                                            snackPosition: SnackPosition.BOTTOM,
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã thêm đơn hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            colorText: Colors.white,
                                            'Đã thêm đơn hàng thành công',
                                            'Ui xời không có lỗi gì cả',
                                            backgroundColor: Colors.blueAccent
                                                .withOpacity(0.5),
                                          );
                                        } else {
                                          Get.back(result: false);
                                          Get.snackbar(
                                            titleText: Row(
                                              children: const [
                                                Text(
                                                  'Đã sửa đơn hàng thành công',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )
                                              ],
                                            ),
                                            snackPosition: SnackPosition.BOTTOM,
                                            'Đã sửa đơn hàng thành công',
                                            'Ui xời không có lỗi gì cả',
                                            colorText: Colors.white,
                                            backgroundColor: Colors.blueAccent
                                                .withOpacity(0.5),
                                          );
                                        }
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
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: Colors.blueAccent
                                              .withOpacity(0.5),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text('Lưu'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
