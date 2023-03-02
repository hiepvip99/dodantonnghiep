import 'package:getx_1/test_get/model/order.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/responsitory/order_responsitory.dart';

class OrderController extends GetxController {
  var order = Order().obs;
  var orderList = <Order>[].obs;
  final OrderResponsitory _responsitory = OrderResponsitory();

  void updateId(int id) => order.value = order.value..id = id;
  void updateOrderDate(String orderDate) =>
      order.value = order.value..orderDate = DateTime.parse(orderDate);
  void updateIdCustomer(int idCustomer) =>
      order.value = order.value..idCustomer = idCustomer;
  void updateIdOrderDetails(List<int> idOrderDetails) =>
      order.value = order.value..idOrderDetails = idOrderDetails;
  void updateIdOrderStatus(int idOrderStatus) =>
      order.value = order.value..idOrderStatus = idOrderStatus;
  void updateTotal(int total) => order.value = order.value..total = total;
  void updateUsername(String paymentMethods) =>
      order.value = order.value..paymentMethods = paymentMethods;

  void addOrder(Order s) => orderList.add(s);
  void removeOrder(Order s) => orderList.remove(s);
  void updateOrder(int index, Order s) => orderList[index] = s;

  void updateOrderElement(Order s) {
    orderList[orderList.indexWhere((p0) => p0.id == s.id)] = s;
  }

  /// Get order from api
  Future<void> initOrderList() async {
    orderList.value = await _responsitory.getOrderAll();
    // print('Load data:  ' + orderList.value[0].orderDate!);
  }

  void initOrder(Order a) {
    order.value = a;
  }

  /// add order to api nodejs
  Future<dynamic> searchOrder(String keyword) async {
    // print('${data.id} ${data.orderDate}');
    orderList.value = await _responsitory.getOrderFromKeyword(keyword);
  }

  /// add order to api nodejs
  Future<dynamic> saveOrderAdd(Order data) async {
    // print('${data.id} ${data.orderDate}');
    var response = await _responsitory.addOrder(data);
    await initOrderList();
    return response;
  }

  /// edit order to api nodejs
  Future<dynamic> saveOrderEdit(Order data) async {
    // print('${data.id} ${data.orderDate}');
    var response = await _responsitory.updateOrder(data);
    // await initOrderList();
    return response;
  }

  /// delete order api nodejs
  Future<dynamic> deleteOrder(Order data) async {
    // print('${data.id} ${data.orderDate}');
    var response = await _responsitory.deleteOrder(data);
    // removeOrder(data);
    return response;
  }

  /// Sort order

  void sortListById(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.id!.compareTo(b.id!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.id!.compareTo(a.id!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }

  void sortListByOrderDate(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.orderDate!.compareTo(b.orderDate!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.orderDate!.compareTo(a.orderDate!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }

  void sortListByIdCustomer(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.idCustomer!.compareTo(b.idCustomer!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.idCustomer!.compareTo(a.idCustomer!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }

  // void sortListByIdOrderDetails(bool ascending) {
  //   if (ascending) {
  //     orderList.value = orderList.toList()
  //       ..sort(
  //         (a, b) => a.idOrderDetails!.compareTo(b.idOrderDetails!),
  //       );
  //     // debugPrint(orderList.value[0].id!.toString());
  //   } else {
  //     orderList.value = orderList.toList()
  //       ..sort(
  //         (a, b) => b.idOrderDetails!.compareTo(a.idOrderDetails!),
  //       );
  //     // debugPrint(orderList.value[0].id!.toString());
  //   }
  // }

  void sortListByIdOrderStatus(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.idOrderStatus!.compareTo(b.idOrderStatus!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.idOrderStatus!.compareTo(a.idOrderStatus!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }

  void sortListByTotal(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.total!.compareTo(b.total!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.total!.compareTo(a.total!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }

  void sortListByPaymentMethods(bool ascending) {
    if (ascending) {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => a.paymentMethods!.compareTo(b.paymentMethods!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    } else {
      orderList.value = orderList.toList()
        ..sort(
          (a, b) => b.paymentMethods!.compareTo(a.paymentMethods!),
        );
      // debugPrint(orderList.value[0].id!.toString());
    }
  }
}
