import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/controller/order_controller.dart';
import 'package:getx_1/test_get/model/order.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_1/test_get/components/input_text_custom.dart';

class AddEditOrder extends StatelessWidget {
  AddEditOrder({super.key, required this.order, required this.controller});

  final Order? order;
  final _formKey = GlobalKey<FormBuilderState>();
  final OrderController controller;

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
          heightFactor: 0.75,
          widthFactor: 0.75,
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
                            order == null
                                ? const Text('Thêm Tài Khoản')
                                : const Text('Sửa Tài Khoản'),
                            const SizedBox(
                              height: 10,
                            ),
                            order == null
                                ? const SizedBox()
                                : Text('ID: ${order!.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextCustom(
                                      enabled: order != null ? false : true,
                                      label: 'Ngày đặt',
                                      textdata: order != null
                                          ? order!.orderDate.toString()
                                          : null,
                                      name: 'order_date'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_customer',
                                    label: 'Id Khách Hàng',
                                    textdata: order != null
                                        ? order!.idCustomer.toString()
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
                                      name: 'id_order_details',
                                      textdata: order != null
                                          ? order!.idOrderDetails!
                                              .map((e) => e.toString())
                                              .join(',')
                                          : null,
                                      label: 'Id chi tiết'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'id_order_status',
                                    label: 'Trạng thái ĐH',
                                    textdata: order != null
                                        ? order!.idOrderStatus!.toString()
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
                                      name: 'total',
                                      textdata: order != null
                                          ? order!.total!.toString()
                                          : null,
                                      label: 'Tổng tiền'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: InputTextCustom(
                                    enabled: true,
                                    name: 'payment_methods',
                                    label: 'Phương thức thanh toán',
                                    textdata: order != null
                                        ? order!.paymentMethods!.toString()
                                        : null,
                                  ),
                                ),
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
                                      Order a = Order.fromJson(formData!);

                                      // ignore: prefer_typing_uninitialized_variables
                                      var response;
                                      if (order == null) {
                                        response =
                                            await controller.saveOrderAdd(a);
                                      } else {
                                        a.id = order!.id;
                                        response =
                                            await controller.saveOrderEdit(a);
                                        controller.updateOrderElement(a);
                                      }

                                      if (response is bool) {
                                        if (order == null) {
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
