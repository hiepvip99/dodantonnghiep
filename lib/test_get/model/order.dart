class Order {
  int? id;
  DateTime? orderDate;
  int? idCustomer;
  List<int>? idOrderDetails;
  int? idOrderStatus;
  int? total;
  String? paymentMethods;

  Order(
      {this.id,
      this.orderDate,
      this.idCustomer,
      this.idOrderDetails,
      this.idOrderStatus,
      this.total,
      this.paymentMethods});

  Order.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    print('${json['order_date'].toString()}');
    orderDate = DateTime.parse(json['order_date'].toString());
    idCustomer = int.tryParse(json['id_customer'].toString());
    idOrderDetails = (json['id_order_details'] as String)
        .split(',')
        .map((e) => int.parse(e))
        .toList();
    idOrderStatus = int.tryParse(json['id_order_status'].toString());
    total = int.tryParse(json['total'].toString());
    paymentMethods = json['payment_methods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_date'] = orderDate!.toIso8601String();
    data['id_customer'] = idCustomer;
    data['id_order_details'] = idOrderDetails!.join(',');
    data['id_order_status'] = idOrderStatus;
    data['total'] = total;
    data['payment_methods'] = paymentMethods;
    return data;
  }
}
